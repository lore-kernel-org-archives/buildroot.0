From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 17:58:55 +0100
Subject: [Buildroot] [git commit] emlog: new package
Message-ID: <20151222165921.0C82082302@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c95124b96214a58a2eaf7fe28f9b9c6dd5771f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - update to the latest github version, which has a number of
   fixes/improvements compared to the latest tag.
 - add a patch to fix the build of the kernel module with recent
   kernel versions (>= 3.19).
 - use $(INSTALL) -D with a full destination path.
 - rewrap Config.in help text, lines were too long.]

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                 |  1 +
 package/emlog/0001-Fix-access-to-the-dentry.patch | 57 +++++++++++++++++++++++
 package/emlog/Config.in                           | 17 +++++++
 package/emlog/emlog.hash                          |  2 +
 package/emlog/emlog.mk                            | 23 +++++++++
 5 files changed, 100 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7a52f67..a61da08 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1534,6 +1534,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/debianutils/Config.in"
 endif
 	source "package/dsp-tools/Config.in"
+	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/htop/Config.in"
diff --git a/package/emlog/0001-Fix-access-to-the-dentry.patch b/package/emlog/0001-Fix-access-to-the-dentry.patch
new file mode 100644
index 0000000..07dd5ec
--- /dev/null
+++ b/package/emlog/0001-Fix-access-to-the-dentry.patch
@@ -0,0 +1,57 @@
+From 33d34a10fdc01c5716aebdb93c34fdfd7557adc0 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 22 Dec 2015 17:39:35 +0100
+Subject: [PATCH] Fix access to the dentry
+
+Since Linux 2.6.20, the dentry pointer is no longer stored in
+file->f_dentry, but in file->f_path.dentry. Until Linux 3.19, there
+was a compatibility macro which made the change transparent, but this
+macro has now been removed.
+
+Since we probably don't care about compatibility with kernels older
+than 2.6.20, this commit takes the simple approach of using
+file->f_path.dentry. This will work with any kernel >= 2.6.20.
+
+Submitted upstream at https://github.com/nicupavel/emlog/pull/3.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ emlog.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/emlog.c b/emlog.c
+index 41a67e2..1ef3d80 100644
+--- a/emlog.c
++++ b/emlog.c
+@@ -292,8 +292,8 @@ static ssize_t emlog_read(struct file *file, char __user *buffer,      /* The bu
+     struct emlog_info *einfo;
+ 
+     /* get the metadata about this emlog */
+-    if ((einfo = get_einfo(file->f_dentry->d_inode)) == NULL) {
+-        pr_err("can not fetch einfo for inode %ld.\n", (long)(file->f_dentry->d_inode->i_ino));
++    if ((einfo = get_einfo(file->f_path.dentry->d_inode)) == NULL) {
++        pr_err("can not fetch einfo for inode %ld.\n", (long)(file->f_path.dentry->d_inode->i_ino));
+         return -EIO;
+     }
+ 
+@@ -368,7 +368,7 @@ static ssize_t emlog_write(struct file *file,
+     struct emlog_info *einfo;
+ 
+     /* get the metadata about this emlog */
+-    if ((einfo = get_einfo(file->f_dentry->d_inode)) == NULL)
++    if ((einfo = get_einfo(file->f_path.dentry->d_inode)) == NULL)
+         return -EIO;
+ 
+     /* if the message is longer than the buffer, just take the beginning
+@@ -403,7 +403,7 @@ static unsigned int emlog_poll(struct file *file, struct poll_table_struct * wai
+     struct emlog_info *einfo;
+ 
+     /* get the metadata about this emlog */
+-    if ((einfo = get_einfo(file->f_dentry->d_inode)) == NULL)
++    if ((einfo = get_einfo(file->f_path.dentry->d_inode)) == NULL)
+         return -EIO;
+ 
+     poll_wait(file, EMLOG_READQ(einfo), wait);
+-- 
+2.6.4
+
diff --git a/package/emlog/Config.in b/package/emlog/Config.in
new file mode 100644
index 0000000..77d0ca3
--- /dev/null
+++ b/package/emlog/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_EMLOG
+	bool "emlog"
+	depends on BR2_LINUX_KERNEL
+	help
+	  emlog is a Linux kernel module that makes it easy to access
+	  the most recent (and only the most recent) output from a
+	  process. It works just like "tail -f" on a log file, except
+	  that the storage required never grows. This can be useful in
+	  embedded systems where there isn't enough memory or disk
+	  space for keeping complete log files, but the most recent
+	  debugging messages are sometimes needed (e.g., after an
+	  error is observed).
+
+	  https://github.com/nicupavel/emlog
+
+comment "emlog needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/emlog/emlog.hash b/package/emlog/emlog.hash
new file mode 100644
index 0000000..625fb01
--- /dev/null
+++ b/package/emlog/emlog.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9bab81e75ef2a1b1b7024a397308356a52463d8ac4b42682ed5a134d46387d1f  emlog-bd32494ad757c3d37469877aaf99ced3ee6ca3f8.tar.gz
diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
new file mode 100644
index 0000000..cf11961
--- /dev/null
+++ b/package/emlog/emlog.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# emlog
+#
+################################################################################
+
+EMLOG_VERSION = bd32494ad757c3d37469877aaf99ced3ee6ca3f8
+EMLOG_SITE = $(call github,nicupavel,emlog,$(EMLOG_VERSION))
+EMLOG_DEPENDENCIES = linux
+EMLOG_LICENSE = GPLv2
+EMLOG_LICENSE_FILES = COPYING
+
+define EMLOG_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) nbcat
+endef
+
+# make install tries to strip, so install manually.
+define EMLOG_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/nbcat $(TARGET_DIR)/usr/bin/nbcat
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
