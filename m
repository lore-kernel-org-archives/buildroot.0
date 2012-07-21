From: Richard Braun <rbraun@sceen.net>
Date: Sat, 21 Jul 2012 17:27:18 +0200
Subject: [Buildroot] [PATCH] curlftpfs: new package
Message-ID: <1342884438-5325-1-git-send-email-rbraun@sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Richard Braun <rbraun@sceen.net>
---
 package/Config.in              |    1 +
 package/curlftpfs/Config.in    |   17 +++++++++++++++++
 package/curlftpfs/curlftpfs.mk |   14 ++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 package/curlftpfs/Config.in
 create mode 100644 package/curlftpfs/curlftpfs.mk

diff --git a/package/Config.in b/package/Config.in
index f664b8e..edcf55c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -169,6 +169,7 @@ menu "Hardware handling"
 source "package/acpid/Config.in"
 source "package/cdrkit/Config.in"
 source "package/cramfs/Config.in"
+source "package/curlftpfs/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dbus-python/Config.in"
diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
new file mode 100644
index 0000000..23c7547
--- /dev/null
+++ b/package/curlftpfs/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_CURLFTPFS
+	bool "curlftpfs (FUSE)"
+	select BR2_PACKAGE_LIBFUSE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBCURL
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR # glib2
+	help
+	  CurlFtpFS is a filesystem for accessing FTP hosts based on FUSE
+	  and libcurl.
+
+comment "curlftpfs requires a toolchain with LARGEFILE and WCHAR support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/curlftpfs/curlftpfs.mk b/package/curlftpfs/curlftpfs.mk
new file mode 100644
index 0000000..9e77eb0
--- /dev/null
+++ b/package/curlftpfs/curlftpfs.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# curlftpfs
+#
+#############################################################
+
+CURLFTPFS_VERSION = 0.9.2
+CURLFTPFS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/curlftpfs/$(CURLFTPFS_VERSION)
+CURLFTPFS_DEPENDENCIES = \
+	libglib2 libfuse openssl libcurl \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
+	$(if $(BR2_ENABLE_LOCALE),,libiconv)
+
+$(eval $(autotools-package))
-- 
1.7.2.5
