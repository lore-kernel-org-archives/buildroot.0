From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2011 21:49:21 +0200
Subject: [Buildroot] [PATCH 1 of 3] GENTARGETS: add support for scp://
In-Reply-To: <8549a902c5c7070219ec.1316587332@localhost6.localdomain6>
References: <patchbomb.1316587331@localhost6.localdomain6>
 <8549a902c5c7070219ec.1316587332@localhost6.localdomain6>
Message-ID: <20110922214921.1ae4ee6f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Sep 2011 08:42:12 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> This patch adds support for scp:// both for use in the package Makefiles, as for
> the BR2_PRIMARY_SITE variable.

I'm ok with the principle. Some implementation comments below.

> +define DOWNLOAD_SCP
> +	test -e $(DL_DIR)/$(2) || \
> +	$(SCP) $(call stripurischeme,$(call qstrip,$(1)))/$(2) $(DL_DIR)
> +endef
> +
> +define SOURCE_CHECK_SCP
> +	$(SSH) $(call stripurischeme,`echo "$(call qstrip,$(1))" | cut -d/ -f1`) ls /`echo "$(call qstrip,$(1))/$(2)" | cut -d/ -f2-` > /dev/null
> +endef

Ouch, this looks ugly. I guess you can use "test -f" instead of using
ls. Maybe something like:

scphost=$(firstword $(subst /, ,$(call stripurischeme,$(1))))
scpfile=$(patsubst $(call scphost,$(1))/%,/%/$(2),$(call stripurischeme,$(1)))

define SOURCE_CHECK_SCP
	$(SSH) $(call scphost,$(1),$(2)) test -f $(call scpfile,$(1),$(2))
endef

Maybe it's possible to do better and/or to make those scphost/scpfile
macros a bit more generic. But the general comment is :

 * Try to use make functions instead of shell functions when possible.
   Every shell function requires a fork+exec and is very costly
   compared to make functions. In the past, we had a single shell
   function call for every package, and this was causing a 5-10 seconds
   startup delay for the build process.

 * Try to split in several small macros, whose name allows to
   understand what it is doing.

> +define SHOW_EXTERNAL_DEPS_SCP
> +	echo "$($(PKG)_SITE) [scp: $($(PKG)_DL_VERSION)]"
> +endef

As per a recent discussion with Peter, external-deps shouldn't show the
URL of the tarball of the package, but rather simply the tarball name,
as found in the $(DL_DIR). I know this is not consistent with the
current GIT/SVN/BZR helpers, but I have sent patches to fix this.

>  define DOWNLOAD_WGET
>  	test -e $(DL_DIR)/$(2) || \
>  	$(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
> @@ -186,13 +207,17 @@
>  
>  define DOWNLOAD
>  	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
> -		$(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
> +		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
> +			scp) $(call $(DL_MODE)_SCP,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
> +			*) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
> +		esac ; \

It would be good to update the BR2_PRIMARY_SITE help text to mention
which URL types are possible.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
