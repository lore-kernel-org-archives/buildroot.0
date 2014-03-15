From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 21:18:31 +0100
Subject: [Buildroot] [git commit] fetchmail: New package
Message-ID: <20140315202727.A34E29BFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8528884479a210618b1cd2b99b79358a474904d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |    1 +
 package/fetchmail/Config.in    |   12 ++++++++++++
 package/fetchmail/fetchmail.mk |   23 +++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

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
index 0000000..d891760
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
