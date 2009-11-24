From: Daniel Mack <daniel@caiaq.de>
Date: Tue, 24 Nov 2009 17:29:09 +0100
Subject: [Buildroot] [PATCH] Add fuse-sshfs package
In-Reply-To: <87fx83dh7z.fsf@macbook.be.48ers.dk>
References: <87fx83dh7z.fsf@macbook.be.48ers.dk>
Message-ID: <1259080149-15678-1-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 package/Config.in       |    1 +
 package/sshfs/Config.in |   12 ++++++++++++
 package/sshfs/sshfs.mk  |   16 ++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 package/sshfs/Config.in
 create mode 100644 package/sshfs/sshfs.mk

diff --git a/package/Config.in b/package/Config.in
index 84492a8..47163d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -265,6 +265,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sfdisk/Config.in"
 endif
 source "package/smartmontools/Config.in"
+source "package/sshfs/Config.in"
 source "package/sysstat/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 # mdev
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
new file mode 100644
index 0000000..b56dd3e
--- /dev/null
+++ b/package/sshfs/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SSHFS
+	bool "sshfs (FUSE)"
+	depends on BR2_PACKAGE_LIBFUSE
+	depends on BR2_PACKAGE_LIBGLIB2
+	depends on BR2_PACKAGE_OPENSSH
+	help
+	  FUSE makes it possible to implement a filesystem in a userspace
+	  program. Features include: simple yet comprehensive API, secure
+	  mounting by non-root users, support for 2.4 and 2.6 Linux
+	  kernels, multi-threaded operation. etc...
+
+	  http://fuse.sourceforge.net/sshfs.html
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
1.6.5.2
