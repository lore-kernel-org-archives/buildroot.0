From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 18 Nov 2016 10:10:13 +0100
Subject: [Buildroot] [PATCH v2 04/15] fs/tar: make results reproducible
In-Reply-To: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479460224-6119-5-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to make tar images reproducible, we use --sort flag. However,
this flags is available only from tar 1.28. So we also bump necessary
host-tar version.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 fs/tar/tar.mk                          | 2 +-
 support/dependencies/check-host-tar.sh | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 11c69c5..5a1b263 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -7,7 +7,7 @@
 TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
 define ROOTFS_TAR_CMD
-	tar $(TAR_OPTS) -cf $@ --numeric-owner -C $(TARGET_DIR) .
+	tar $(TAR_OPTS) -cf $@ --sort=name --numeric-owner -C $(TARGET_DIR) .
 endef
 
 $(eval $(call ROOTFS_TARGET,tar))
diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index 932d3c4..cef6d82 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -26,10 +26,9 @@ if [ ! -z "${version_bsd}" ] ; then
   minor=0
 fi
 
-# Minimal version = 1.17 (previous versions do not correctly unpack archives
-# containing hard-links if the --strip-components option is used).
+# Minimal version = 1.28 (previous versions do not does not support --sort=name)
 major_min=1
-minor_min=17
+minor_min=28
 if [ $major -gt $major_min ]; then
 	echo $tar
 else
-- 
1.9.1
