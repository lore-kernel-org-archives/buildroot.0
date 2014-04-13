From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Apr 2014 11:36:03 +0200
Subject: [Buildroot] [PATCH 2/2] mutt: Add options for imap/pop3 support,
	enable optional iconv/OpenSSL support
In-Reply-To: <1397381763-15489-1-git-send-email-bernd.kuhls@t-online.de>
References: <1397381763-15489-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1397381763-15489-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mutt/Config.in |   16 +++++++++++++++-
 package/mutt/mutt.mk   |   33 ++++++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/package/mutt/Config.in b/package/mutt/Config.in
index 430eeb8..372c137 100644
--- a/package/mutt/Config.in
+++ b/package/mutt/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_MUTT
+menuconfig BR2_PACKAGE_MUTT
 	bool "mutt"
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
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
index 5aa18eb..0644276 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -9,7 +9,38 @@ MUTT_SITE = http://downloads.sourceforge.net/project/mutt/mutt
 MUTT_LICENSE = GPLv2+
 MUTT_LICENSE_FILES = GPL
 MUTT_DEPENDENCIES = ncurses
-MUTT_CONF_OPT = --disable-iconv --disable-smtp
+MUTT_CONF_OPT = --disable-smtp
 MUTT_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+MUTT_DEPENDENCIES += libiconv
+MUTT_CONF_OPT += --enable-iconv
+else
+MUTT_CONF_OPT += --disable-iconv
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
+ifeq ($(findstring xy,x$(BR2_PACKAGE_MUTT_IMAP)$(BR2_PACKAGE_MUTT_POP3)),xy)
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
-- 
1.7.10.4
