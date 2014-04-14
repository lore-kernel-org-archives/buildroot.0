From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 23:35:47 +0200
Subject: [Buildroot] [git commit] mutt: Add options for imap/pop3 support,
	enable optional iconv/OpenSSL support
Message-ID: <20140414213619.5ADEB9BEAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fcd010a2db771c259224ad1d025fb4c5a9baf3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: keep a normal 'config' instead of 'menuconfig' for mutt.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mutt/Config.in |   14 ++++++++++++++
 package/mutt/mutt.mk   |   31 ++++++++++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletions(-)

diff --git a/package/mutt/Config.in b/package/mutt/Config.in
index 430eeb8..d85c1a7 100644
--- a/package/mutt/Config.in
+++ b/package/mutt/Config.in
@@ -8,6 +8,20 @@ config BR2_PACKAGE_MUTT
 
 	  http://www.mutt.org/
 
+if BR2_PACKAGE_MUTT
+
+config BR2_PACKAGE_MUTT_IMAP
+	bool "imap"
+	help
+	  IMAP support
+
+config BR2_PACKAGE_MUTT_POP3
+	bool "pop3"
+	help
+	  POP3 support
+
+endif # BR2_PACKAGE_MUTT
+
 comment "mutt needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 5aa18eb..633b2af 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -9,7 +9,36 @@ MUTT_SITE = http://downloads.sourceforge.net/project/mutt/mutt
 MUTT_LICENSE = GPLv2+
 MUTT_LICENSE_FILES = GPL
 MUTT_DEPENDENCIES = ncurses
-MUTT_CONF_OPT = --disable-iconv --disable-smtp
+MUTT_CONF_OPT = --disable-smtp
 MUTT_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+MUTT_DEPENDENCIES += libiconv
+MUTT_CONF_OPT += --enable-iconv
+endif
+
+ifeq ($(BR2_PACKAGE_MUTT_IMAP),y)
+MUTT_CONF_OPT += --enable-imap
+else
+MUTT_CONF_OPT += --disable-imap
+endif
+
+ifeq ($(BR2_PACKAGE_MUTT_POP3),y)
+MUTT_CONF_OPT += --enable-pop
+else
+MUTT_CONF_OPT += --disable-pop
+endif
+
+# SSL support is only used by imap or pop3 module
+ifneq ($(BR2_PACKAGET_MUTT_IMAP)$(BR2_PACKAGE_MUTT_POP3),)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MUTT_DEPENDENCIES += openssl
+MUTT_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr
+else
+MUTT_CONF_OPT += --without-ssl
+endif
+else
+MUTT_CONF_OPT += --without-ssl
+endif
+
 $(eval $(autotools-package))
