From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 20 Sep 2007 19:28:00 +0200
Subject: [Buildroot] RFC: Should not use of locale force build of gettext,
	libintl?
Message-ID: <1190309280.15810.7.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Geeting some errors when I enable LOCALE.
This fixes it for me, but I am still not sure if this is
the right thing to do.
Comments? 


Index: toolchain/uClibc/uclibc.mk
===================================================================
--- toolchain/uClibc/uclibc.mk  (revision 19903)
+++ toolchain/uClibc/uclibc.mk  (arbetskopia)
@@ -264,9 +264,11 @@
 ifeq ($(BR2_ENABLE_LOCALE),y)
        $(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y
\nUCLIBC_PREGENERATED_LOCALE_DATA=y
\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=y\nUCLIBC_HAS_XLOCALE=y
\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
        $(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g'
$(UCLIBC_DIR)/.oldconfig
+       $(SED)
's,.*UCLIBC_HAS_GETTEXT_AWARENESS.*,UCLIBC_HAS_GETTEXT_AWARENESS=y,g'
$(UCLIBC_DIR)/.oldconfig
 else
        $(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g'
$(UCLIBC_DIR)/.oldconfig
        $(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g'
$(UCLIBC_DIR)/.oldconfig
+       $(SED)
's,.*UCLIBC_HAS_GETTEXT_AWARENESS.*,UCLIBC_HAS_GETTEXT_AWARENESS=n,g'
$(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_USE_WCHAR),y)
        $(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g'
$(UCLIBC_DIR)/.oldconfig
Index: toolchain/uClibc/Config.in
===================================================================
--- toolchain/uClibc/Config.in  (revision 19903)
+++ toolchain/uClibc/Config.in  (arbetskopia)
@@ -51,6 +51,8 @@
 config BR2_ENABLE_LOCALE
        bool "Enable locale/gettext/i18n support?"
        default n
+       select BR2_PACKAGE_GETTEXT
+       select BR2_PACKAGE_LIBINTL
        help
            Enable locale/gettext/i18n support?


Best Regards
Ulf Samuelsson
