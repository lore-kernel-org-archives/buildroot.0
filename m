From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Sun, 18 Oct 2009 16:05:45 +0200
Subject: [Buildroot] [PATCH] Add sysstat tools
In-Reply-To: <1255118149.2236.3.camel@coalu.atr>
References: <1255096083.22093.0.camel@coalu.atr>
	<1255118149.2236.3.camel@coalu.atr>
Message-ID: <1255874745.19306.8.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping ?

Maybe I should add some informations about this package.

The sysstat package provides a great tool named sar, which gives
informations about cpu consumption in user/system context, as well as
number of page faults per seconds, or number of blocks read from
devices, etc...
It's a good tool to tune performances on a system/cpu with software
managed TLB (sh, mips or ppc).


Le vendredi 09 octobre 2009 ? 21:55 +0200, Lionel Landwerlin a ?crit :
> Well... I mixed some patch with another and ...
> 
> Here the good one :
> 
> --
> 
> Add sysstat tools
> 
> Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
> ---
>  package/Config.in                                  |    1 +
>  package/sysstat/Config.in                          |    7 +++
>  .../sysstat-9.0.5-Add-install-strip-rule.patch     |   54 ++++++++++++++++++++
>  package/sysstat/sysstat.mk                         |   24 +++++++++
>  4 files changed, 86 insertions(+), 0 deletions(-)
>  create mode 100644 package/sysstat/Config.in
>  create mode 100644 package/sysstat/sysstat-9.0.5-Add-install-strip-rule.patch
>  create mode 100644 package/sysstat/sysstat.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index c78fd31..13c845e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -270,6 +270,7 @@ if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
>  source "package/sfdisk/Config.in"
>  endif
>  source "package/smartmontools/Config.in"
> +source "package/sysstat/Config.in"
>  if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
>  # mdev
>  source "package/udev/Config.in"
> diff --git a/package/sysstat/Config.in b/package/sysstat/Config.in
> new file mode 100644
> index 0000000..71bafc7
> --- /dev/null
> +++ b/package/sysstat/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_SYSSTAT
> +	bool "sysstat"
> +	help
> +	  System performance tools for the Linux operating system...
> +
> +	  http://pagesperso-orange.fr/sebastien.godard/
> +	  ftp://ibiblio.org/pub/Linux/system/status/
> diff --git a/package/sysstat/sysstat-9.0.5-Add-install-strip-rule.patch b/package/sysstat/sysstat-9.0.5-Add-install-strip-rule.patch
> new file mode 100644
> index 0000000..afe335f
> --- /dev/null
> +++ b/package/sysstat/sysstat-9.0.5-Add-install-strip-rule.patch
> @@ -0,0 +1,54 @@
> +From ca95fbc6f26ab4601fe4e99ca530c9bf3b5df5aa Mon Sep 17 00:00:00 2001
> +From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
> +Date: Fri, 9 Oct 2009 00:01:47 +0200
> +Subject: [PATCH] Add install-strip rule
> +
> +Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
> +---
> + Makefile.in |   23 ++++++++++++++++++++++-
> + 1 files changed, 22 insertions(+), 1 deletions(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index a54446b..6f1a0a8 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -81,7 +81,7 @@ ifndef ZIP
> + ZIP = @ZIP@
> + endif
> + 
> +-# Settings 
> ++# Settings
> + NLS = @NLS@
> + ifeq ($(NLS),y)
> + REQUIRE_NLS = -DUSE_NLS -DPACKAGE=\"$(PACKAGE)\" -DLOCALEDIR=\"$(NLS_DIR)\"
> +@@ -309,6 +309,27 @@ ifdef REQUIRE_NLS
> + 	$(INSTALL_DATA) nls/zh_TW.gmo $(DESTDIR)$(NLS_DIR)/zh_TW/LC_MESSAGES/$(PACKAGE).mo
> + endif
> + 
> ++install-strip: all sa1 sa2 contrib/isag/isag
> ++	mkdir -p $(DESTDIR)$(SA_LIB_DIR)
> ++	mkdir -p $(DESTDIR)$(SA_DIR)
> ++ifeq ($(CLEAN_SA_DIR),y)
> ++	find $(DESTDIR)$(SA_DIR) \( -name 'sar??' -o -name 'sa??' -o -name 'sar??.gz' -o -name 'sa??.gz' \) \
> ++		-exec rm -f {} \;
> ++	-rmdir --ignore-fail-on-non-empty $(DESTDIR)$(SA_DIR)/[0-9]?????
> ++endif
> ++	mkdir -p $(DESTDIR)$(BIN_DIR)
> ++	mkdir -p $(DESTDIR)$(SYSCONFIG_DIR)
> ++	$(INSTALL_BIN) sa1 $(DESTDIR)$(SA_LIB_DIR)
> ++	$(INSTALL_BIN) sa2 $(DESTDIR)$(SA_LIB_DIR)
> ++	$(INSTALL_BIN) sadc $(DESTDIR)$(SA_LIB_DIR)
> ++	$(INSTALL_BIN) sar $(DESTDIR)$(BIN_DIR)
> ++	$(INSTALL_BIN) sadf $(DESTDIR)$(BIN_DIR)
> ++	$(INSTALL_BIN) iostat $(DESTDIR)$(BIN_DIR)
> ++	$(INSTALL_BIN) mpstat $(DESTDIR)$(BIN_DIR)
> ++	$(INSTALL_BIN) pidstat $(DESTDIR)$(BIN_DIR)
> ++	$(INSTALL_DATA) sysstat.ioconf $(DESTDIR)$(SYSCONFIG_DIR)
> ++	$(INSTALL_DATA) sysstat.sysconfig $(DESTDIR)$(SYSCONFIG_DIR)/sysstat
> ++
> + install_base: all sa1 sa2 sysstat.sysconfig install_man install_nls \
> + 	contrib/isag/isag
> + 	mkdir -p $(DESTDIR)$(SA_LIB_DIR)
> +-- 
> +1.6.4.3
> +
> diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
> new file mode 100644
> index 0000000..cd8919f
> --- /dev/null
> +++ b/package/sysstat/sysstat.mk
> @@ -0,0 +1,24 @@
> +#############################################################
> +#
> +# sysstat
> +#
> +#############################################################
> +
> +SYSSTAT_VERSION = 9.0.5
> +SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
> +SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard/
> +SYSSTAT_AUTORECONF = NO
> +SYSSTAT_LIBTOOL_PATCH = NO
> +SYSSTAT_INSTALL_STAGING = YES
> +SYSSTAT_INSTALL_TARGET = YES
> +
> +SYSSTAT_DEPENDENCIES = uclibc
> +
> +# Should --disable-man-group ... WTF ?
> +SYSSTAT_CONF_OPT = --enable-man-group
> +
> +EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) \
> +			INSTALL_ISAG=n \
> +			INSTALL_DOC=n
> +
> +$(eval $(call AUTOTARGETS,package,sysstat))
