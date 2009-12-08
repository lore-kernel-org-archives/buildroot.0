From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 8 Dec 2009 09:53:37 +0100
Subject: [Buildroot] [git commit master] Add fuse-sshfs package
Message-ID: <20091208090657.6ECB0774A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b92bcae699b13c7d7d781dc76b42086ee8d51c5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use select for library dependencies]
Signed-off-by: Daniel Mack <daniel@caiaq.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    3 ++-
 package/Config.in       |    1 +
 package/sshfs/Config.in |   18 ++++++++++++++++++
 package/sshfs/sshfs.mk  |   16 ++++++++++++++++
 4 files changed, 37 insertions(+), 1 deletions(-)
 create mode 100644 package/sshfs/Config.in
 create mode 100644 package/sshfs/sshfs.mk

diff --git a/CHANGES b/CHANGES
index fcacd5b..45697f3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,8 @@
 	New packages: tcpreplay, hostapd
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
-	directfb, iw, libfuse, libpcap, lighttpd, mesa, pcre, usbutils
+	directfb, iw, libfuse, libpcap, lighttpd, mesa, pcre, sshfs,
+	usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/Config.in b/package/Config.in
index ba0f96d..6adf913 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -266,6 +266,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sfdisk/Config.in"
 endif
 source "package/smartmontools/Config.in"
+source "package/sshfs/Config.in"
 source "package/sysstat/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 # mdev
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
new file mode 100644
index 0000000..12d98f6
--- /dev/null
+++ b/package/sshfs/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_SSHFS
+	bool "sshfs (FUSE)"
+	select BR2_PACKAGE_LIBFUSE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GETTEXT
+	select BR2_PACKAGE_LIBINTL
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_OPENSSH
+	help
+	  FUSE makes it possible to implement a filesystem in a userspace
+	  program. Features include: simple yet comprehensive API, secure
+	  mounting by non-root users, support for 2.4 and 2.6 Linux
+	  kernels, multi-threaded operation. etc...
+
+	  http://fuse.sourceforge.net/sshfs.html
+
+comment "sshfs requires a toolchain with LARGEFILE support"
+        depends on !BR2_LARGEFILE
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
new file mode 100644
index 0000000..4acc293
--- /dev/null
+++ b/package/sshfs/sshfs.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# sshfs
+#
+#############################################################
+
+SSHFS_VERSION:=2.2
+SSHFS_SOURCE:=sshfs-fuse-$(SSHFS_VERSION).tar.gz
+SSHFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/$(SSHFS_VERSION)/sshfs-fuse
+SSHFS_AUTORECONF:=NO
+SSHFS_INSTALL_STAGING:=NO
+SSHFS_INSTALL_TARGET:=YES
+
+SSHFS_DEPENDENCIES = libglib2 libfuse
+
+$(eval $(call AUTOTARGETS,package,sshfs))
-- 
1.6.3.3
