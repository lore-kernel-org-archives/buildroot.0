From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Fri, 14 Mar 2014 23:21:33 +0100
Subject: [Buildroot] [PATCH 2/2] fetchmail: New package
In-Reply-To: <1394835693-32232-1-git-send-email-berndkuhls@hotmail.com>
References: <1394835693-32232-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP1875387C9CEE20843356896D9700@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/Config.in              |    1 +
 package/fetchmail/Config.in    |   12 ++++++++++++
 package/fetchmail/fetchmail.mk |   23 +++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/fetchmail/Config.in
 create mode 100644 package/fetchmail/fetchmail.mk

diff --git a/package/Config.in b/package/Config.in
index 70d7023..51d1e24 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -841,6 +841,7 @@ source "package/sound-theme-freedesktop/Config.in"
 endmenu
 
 menu "Mail"
+source "package/fetchmail/Config.in"
 source "package/heirloom-mailx/Config.in"
 source "package/libesmtp/Config.in"
 source "package/msmtp/Config.in"
diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
new file mode 100644
index 0000000..3419821
--- /dev/null
+++ b/package/fetchmail/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FETCHMAIL
+	bool "fetchmail"
+	select BR2_PACKAGE_CA_CERTIFICATES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	depends on BR2_USE_MMU # fork()
+	help
+	  Fetchmail - the mail-retrieval daemon
+	  Client daemon to move mail from POP and IMAP to your local computer
+
+	  http://sourceforge.net/projects/fetchmail/
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
new file mode 100644
index 0000000..61e86a9
--- /dev/null
+++ b/package/fetchmail/fetchmail.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# fetchmail
+#
+################################################################################
+
+FETCHMAIL_VERSION_MAJOR = 6.3
+FETCHMAIL_VERSION_MINOR = 26
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).$(FETCHMAIL_VERSION_MINOR)
+FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
+FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)/
+FETCHMAIL_LICENSE = GPLv2; some exceptions are mentioned in COPYING
+FETCHMAIL_LICENSE_FILES = COPYING
+
+FETCHMAIL_CONF_OPT = \
+	--with-ssl=$(STAGING_DIR)/usr
+
+FETCHMAIL_DEPENDENCIES = \
+	ca-certificates \
+	openssl \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+
+$(eval $(autotools-package))
-- 
1.7.10.4
