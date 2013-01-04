From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jan 2013 12:54:47 +0100
Subject: [Buildroot] [PATCH] packages: add tzdata
In-Reply-To: <1357300124-7011-1-git-send-email-rbraun@sceen.net>
References: <1357300124-7011-1-git-send-email-rbraun@sceen.net>
Message-ID: <20130104125447.04031e67@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Braun,

On Fri,  4 Jan 2013 12:48:44 +0100, Richard Braun wrote:
> The time zone database can be used by glibc (and potentially other
> applications) to offset UTC time and translate it according to
> additional rules, such as zone boundaries and daylight-saving time.
> 
> Signed-off-by: Richard Braun <rbraun@sceen.net>
> ---
>  package/Config.in                      |    1 +
>  package/tzdata/Config.in               |    8 +++++++
>  package/tzdata/tzdata.mk               |   37 ++++++++++++++++++++++++++++++++
>  package/zic/zic-fix-dependencies.patch |   25 +++++++++++++++++++++
>  package/zic/zic.mk                     |   26 ++++++++++++++++++++++

Please split in two patches. One for zic, one for tzdata.

>  5 files changed, 97 insertions(+), 0 deletions(-)
>  create mode 100644 package/tzdata/Config.in
>  create mode 100644 package/tzdata/tzdata.mk
>  create mode 100644 package/zic/zic-fix-dependencies.patch
>  create mode 100644 package/zic/zic.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 2cbadf4..99bb724 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -540,6 +540,7 @@ source "package/protobuf/Config.in"
>  source "package/schifra/Config.in"
>  source "package/startup-notification/Config.in"
>  source "package/liblog4c-localtime/Config.in"
> +source "package/tzdata/Config.in"
>  endmenu
>  
>  menu "Text and terminal handling"
> diff --git a/package/tzdata/Config.in b/package/tzdata/Config.in
> new file mode 100644
> index 0000000..cd4f818
> --- /dev/null
> +++ b/package/tzdata/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_TZDATA
> +	bool "tzdata"

depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc

> +	help
> +	  Time zone database
> +
> +	  http://www.iana.org/time-zones/repository/tz-link.html
> +
> +	  Note that uClibc doesn't support this database.
> diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> new file mode 100644
> index 0000000..5995c24
> --- /dev/null
> +++ b/package/tzdata/tzdata.mk
> @@ -0,0 +1,37 @@
> +#############################################################
> +#
> +# tzdata
> +#
> +#############################################################
> +
> +TZDATA_VERSION = 2012j
> +TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
> +TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
> +TZDATA_DEPENDENCIES = host-zic
> +TZDATA_LICENSE = Public domain
> +
> +TZDATA_ZIC = $(HOST_DIR)/usr/sbin/zic
> +TZDATA_ZONELIST = africa antarctica asia australasia backward etcetera \
> +			europe factory northamerica pacificnew southamerica

How about making it possible to configure which time zone data gets
installed? From what I remember, the entire size of the tzdata database
was quite large. Could be something like:

choice
	prompt "Time zone selection"

config BR2_PACKAGE_TZDATA_ALL
	bool "all"

config BR2_PACKAGE_TZDATA_LIST
	bool "List"

config BR2_PACKAGE_TZDATA_FILELIST
	bool "List in file"

endchoice

> +define TZDATA_EXTRACT_CMDS
> +	gzip -d -c $(DL_DIR)/$(TZDATA_SOURCE) \
> +		| $(TAR) --strip-components=0 -C $(@D) -xf -
> +endef

A short comment above to explain that the need to override the extract
step is the strip-components=0 would be useful.

> +define TZDATA_BUILD_CMDS
> +	(cd $(@D); \
> +		for zone in $(TZDATA_ZONELIST); do \
> +			$(TZDATA_ZIC) -d _output -y yearistype.sh $$zone; \
> +			$(TZDATA_ZIC) -d _output/posix -y yearistype.sh $$zone; \
> +			$(TZDATA_ZIC) -d _output/right -L leapseconds -y yearistype.sh $$zone; \
> +		done; \
> +	)
> +endef
> +
> +define TZDATA_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo
> +	cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/zic/zic-fix-dependencies.patch b/package/zic/zic-fix-dependencies.patch
> new file mode 100644
> index 0000000..e67c5eb
> --- /dev/null
> +++ b/package/zic/zic-fix-dependencies.patch
> @@ -0,0 +1,25 @@
> +From 087046dc38cfa4fa429317cc5db4c9bfaaaedc64 Mon Sep 17 00:00:00 2001
> +From: Richard Braun <rbraun@sceen.net>
> +Date: Fri, 4 Jan 2013 10:57:24 +0100
> +Subject: [PATCH] fix zic dependencies
> +
> +---

A better patch description is needed.

> + Makefile |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index d76a81e..30df7dc 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -349,7 +349,7 @@ version.h:
> + zdump:		$(TZDOBJS)
> + 		$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(TZDOBJS) $(LDLIBS)
> + 
> +-zic:		$(TZCOBJS) yearistype
> ++zic:		$(TZCOBJS)
> + 		$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(TZCOBJS) $(LDLIBS)
> + 
> + yearistype:	yearistype.sh
> +-- 
> +1.7.2.5
> +
> diff --git a/package/zic/zic.mk b/package/zic/zic.mk
> new file mode 100644
> index 0000000..d2d5c7d
> --- /dev/null
> +++ b/package/zic/zic.mk
> @@ -0,0 +1,26 @@
> +#############################################################
> +#
> +# zic
> +#
> +#############################################################
> +
> +ZIC_VERSION = 2012j
> +ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
> +ZIC_SITE = http://www.iana.org/time-zones/repository/releases
> +ZIC_LICENSE = Public domain
> +
> +define HOST_ZIC_EXTRACT_CMDS
> +	gzip -d -c $(DL_DIR)/$(ZIC_SOURCE) \
> +		| $(TAR) --strip-components=0 -C $(@D) -xf -
> +endef
> +
> +define HOST_ZIC_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) zic
> +endef
> +
> +define HOST_ZIC_INSTALL_CMDS
> +	mkdir -p $(HOST_DIR)/usr/sbin
> +	install -D -m 755 $(@D)/zic $(HOST_DIR)/usr/sbin/zic
> +endef
> +
> +$(eval $(host-generic-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
