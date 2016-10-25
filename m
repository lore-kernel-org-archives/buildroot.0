From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 00:09:44 +0200
Subject: [Buildroot] [PATCH 1/1] tzdata: Improve right/posix installation
In-Reply-To: <20161025214826.17275-1-mylene.josserand@free-electrons.com>
References: <20161025214826.17275-1-mylene.josserand@free-electrons.com>
Message-ID: <20161026000944.52cc951a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 23:48:26 +0200, Myl?ne Josserand wrote:
> Improve the right/posix timezone installation by creating new options
> to choose between these two versions. As one version is necessary, the
> default one is posix.
> Now, the user can install both versions or one of both. It reduces the
> image size when only one version is needed.
> 
> Signed-off-by: Myl?ne Josserand <mylene.josserand@free-electrons.com>

Thanks Myl?ne for your patch. It would be good to explain in the commit
log why you are proposing this change.

> diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> index de7d1be..d1ed21c 100644
> --- a/package/tzdata/tzdata.mk
> +++ b/package/tzdata/tzdata.mk
> @@ -32,10 +32,20 @@ TZDATA_EXTRACT_CMDS =
>  define TZDATA_INSTALL_TARGET_CMDS
>  	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/zoneinfo
>  	cp -a $(HOST_DIR)/usr/share/zoneinfo/* $(TARGET_DIR)/usr/share/zoneinfo
> -	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
> -	for zone in posix/*; do                 \
> -	    ln -sfn "$${zone}" "$${zone##*/}";  \
> -	done
> +	cd $(TARGET_DIR)/usr/share/zoneinfo;     \
> +	if [ -n "$(BR2_TARGET_TZ_POSIX)" ]; then \
> +		for zone in posix/*; do \
> +			ln -sfn "$${zone}" "$${zone##*/}"; \
> +		done \
> +	fi;
> +	# If "right" is the only version enabled
> +	cd $(TARGET_DIR)/usr/share/zoneinfo; \
> +	if [ -n "$(BR2_TARGET_TZ_RIGHT)" ] && [ -z "$(BR2_TARGET_TZ_POSIX)" ]; then \
> +		for zone in right/*; do \
> +			ln -sfn "$${zone}" "$${zone##*/}"; \
> +		done \
> +	fi;

It's a bit late now, so I'm not sure what's going on here. But for
sure, I'd like this to be handled using make conditionals and not shell
conditionals.

> +
>  	if [ -n "$(TZDATA_LOCALTIME)" ]; then                           \
>  	    if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/$(TZDATA_LOCALTIME) ]; then \
>  	        printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
> @@ -51,8 +61,12 @@ endef
>  define HOST_TZDATA_BUILD_CMDS
>  	(cd $(@D); \
>  		for zone in $(TZDATA_ZONELIST); do \
> -			$(ZIC) -d _output/posix -y yearistype.sh $$zone || exit 1; \
> -			$(ZIC) -d _output/right -L leapseconds -y yearistype.sh $$zone || exit 1; \
> +			if [ -n "$(BR2_TARGET_TZ_POSIX)" ]; then \
> +				$(ZIC) -d _output/posix -y yearistype.sh $$zone || exit 1; \
> +			fi; \
> +			if [ -n "$(BR2_TARGET_TZ_RIGHT)" ]; then \
> +				$(ZIC) -d _output/right -L leapseconds -y yearistype.sh $$zone || exit 1; \
> +			fi; \
>  		done; \

Ditto here, we need to use more the make language and less the shell
language.

Perhaps:

ifeq ($(BR2_TARGET_TZ_POSIX),y)
define HOST_TZDATA_BUILD_TZ_POSIX
	cd $(@D) ; \
	$(foreach zone,$(TZDATA_ZONELIST),\
		$(ZIC) -d output/posix -y yearistype.sh $(zone)
	)
endef
endif

ifeq ($(BR2_TARGET_TZ_RIGHT),y)
define HOST_TZDATA_BUILD_TZ_RIGHT
	cd $(@D) ; \
	$(foreach zone,$(TZDATA_ZONELIST),\
		$(ZIC) -d output/right -L leapseconds -y yearistype.sh $(zone)
	)
endef
endif

define HOST_TZDATA_BUILD_CMDS
	$(HOST_TZDATA_BUILD_TZ_POSIX)
	$(HOST_TZDATA_BUILD_TZ_RIGHT)
endef

>  	)
>  endef
> diff --git a/system/Config.in b/system/Config.in
> index f9a3bda..dcc9f6b 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -429,6 +429,7 @@ config BR2_TARGET_TZ_INFO
>  	select BR2_PACKAGE_TZDATA if BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_TZDATA if BR2_TOOLCHAIN_USES_MUSL
>  	select BR2_PACKAGE_TZ if BR2_TOOLCHAIN_USES_UCLIBC
> +	select BR2_TARGET_TZ_POSIX if ! BR2_TARGET_TZ_RIGHT

No space after !

>  	help
>  	  Say 'y' here to install timezone info.
>  
> @@ -461,6 +462,20 @@ config BR2_TARGET_LOCALTIME
>  	  If empty, no local time will be set, and the dates will be
>  	  expressed in UTC.
>  
> +config BR2_TARGET_TZ_POSIX
> +	tristate "Install the Posix timezone"

Don't use tristate, there is no meaning in Buildroot for an option to
be enabled as a module.

Also, you want to have:

	default y

in order to preserve the existing behavior.

> +	help
> +	  The time zone can be provided by two versions : a posix and a right version.
> +	  The "posix" version is based on the Coordinated Universal Time (UTC).
> +	  This is the default one.

Lines are too long, they should be wrapper at 72 characters. Also, I
think a better wording would be:

	  Each time zone is provided in two versions: a "posix" version
	  and a "right" version. This option enables the installation
	  of the "posix" version of all time zone data. The "posix"
	  version is based on the Coordinated Universal Time (UTC), and
	  does not take leap seconds into account.

> +
> +config BR2_TARGET_TZ_RIGHT
> +	tristate "Install the Right timezone"

Same comments as above: use bool, and add "default y".

> +	help
> +	  The time zone can be provided by two versions : a posix and a right version.
> +	  The "right" version is based on the International Atomic Time (TAI) and
> +	  includes the leap seconds.

Similar rework of the help text would be useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
