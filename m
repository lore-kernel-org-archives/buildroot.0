From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 23:26:00 +0200
Subject: [Buildroot] [PATCH 1/4] package/emlog: bump version
Message-ID: <1465161963-32681-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://github.com/nicupavel/emlog/commit/576a6c0fcf76dfeff48124b2f5fc0b4207d88ca1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/emlog/0001-Fix-access-to-the-dentry.patch | 57 -----------------------
 package/emlog/emlog.hash                          |  2 +-
 package/emlog/emlog.mk                            |  2 +-
 3 files changed, 2 insertions(+), 59 deletions(-)
 delete mode 100644 package/emlog/0001-Fix-access-to-the-dentry.patch

diff --git a/package/emlog/0001-Fix-access-to-the-dentry.patch b/package/emlog/0001-Fix-access-to-the-dentry.patch
deleted file mode 100644
index 07dd5ec..0000000
--- a/package/emlog/0001-Fix-access-to-the-dentry.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 33d34a10fdc01c5716aebdb93c34fdfd7557adc0 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 22 Dec 2015 17:39:35 +0100
-Subject: [PATCH] Fix access to the dentry
-
-Since Linux 2.6.20, the dentry pointer is no longer stored in
-file->f_dentry, but in file->f_path.dentry. Until Linux 3.19, there
-was a compatibility macro which made the change transparent, but this
-macro has now been removed.
-
-Since we probably don't care about compatibility with kernels older
-than 2.6.20, this commit takes the simple approach of using
-file->f_path.dentry. This will work with any kernel >= 2.6.20.
-
-Submitted upstream at https://github.com/nicupavel/emlog/pull/3.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- emlog.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/emlog.c b/emlog.c
-index 41a67e2..1ef3d80 100644
---- a/emlog.c
-+++ b/emlog.c
-@@ -292,8 +292,8 @@ static ssize_t emlog_read(struct file *file, char __user *buffer,      /* The bu
-     struct emlog_info *einfo;
- 
-     /* get the metadata about this emlog */
--    if ((einfo = get_einfo(file->f_dentry->d_inode)) == NULL) {
--        pr_err("can not fetch einfo for inode %ld.\n", (long)(file->f_dentry->d_inode->i_ino));
-+    if ((einfo = get_einfo(file->f_path.dentry->d_inode)) == NULL) {
-+        pr_err("can not fetch einfo for inode %ld.\n", (long)(file->f_path.dentry->d_inode->i_ino));
-         return -EIO;
-     }
- 
-@@ -368,7 +368,7 @@ static ssize_t emlog_write(struct file *file,
-     struct emlog_info *einfo;
- 
-     /* get the metadata about this emlog */
--    if ((einfo = get_einfo(file->f_dentry->d_inode)) == NULL)
-+    if ((einfo = get_einfo(file->f_path.dentry->d_inode)) == NULL)
-         return -EIO;
- 
-     /* if the message is longer than the buffer, just take the beginning
-@@ -403,7 +403,7 @@ static unsigned int emlog_poll(struct file *file, struct poll_table_struct * wai
-     struct emlog_info *einfo;
- 
-     /* get the metadata about this emlog */
--    if ((einfo = get_einfo(file->f_dentry->d_inode)) == NULL)
-+    if ((einfo = get_einfo(file->f_path.dentry->d_inode)) == NULL)
-         return -EIO;
- 
-     poll_wait(file, EMLOG_READQ(einfo), wait);
--- 
-2.6.4
-
diff --git a/package/emlog/emlog.hash b/package/emlog/emlog.hash
index 625fb01..e946917 100644
--- a/package/emlog/emlog.hash
+++ b/package/emlog/emlog.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9bab81e75ef2a1b1b7024a397308356a52463d8ac4b42682ed5a134d46387d1f  emlog-bd32494ad757c3d37469877aaf99ced3ee6ca3f8.tar.gz
+sha256 0d82f06301b8486c54e5e36f304d5a83c2347c23b93c1344eacb0b5b3044485a  emlog-576a6c0fcf76dfeff48124b2f5fc0b4207d88ca1.tar.gz
diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
index f79b1cf..bf0bcf7 100644
--- a/package/emlog/emlog.mk
+++ b/package/emlog/emlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EMLOG_VERSION = bd32494ad757c3d37469877aaf99ced3ee6ca3f8
+EMLOG_VERSION = 576a6c0fcf76dfeff48124b2f5fc0b4207d88ca1
 EMLOG_SITE = $(call github,nicupavel,emlog,$(EMLOG_VERSION))
 EMLOG_LICENSE = GPLv2
 EMLOG_LICENSE_FILES = COPYING
-- 
2.8.1
