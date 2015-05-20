From: kaszak at gmail.com <kaszak@gmail.com>
Date: Wed, 20 May 2015 10:45:27 +0200
Subject: [Buildroot] [PATCH] Handle defconfig as .config in .gitignore and
	distclean.
Message-ID: <555c49ac.0a64b40a.3499.ffffb3f0@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Karoly Kasza <kaszak@gmail.com>

After using "make safedefconfig", a defconfig file appears which is an
extract of the .config file. When running git, it incorrectly detects it as a
source code change, while make distclean forgets to remove it.

This patch adds /defconfig to .gitignore and to the distclean Makefile target.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 .gitignore |    1 +
 Makefile   |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index bb02d9f..66f5ac1 100644
--- a/.gitignore
+++ b/.gitignore
@@ -5,6 +5,7 @@
 /.config.old
 /..config.tmp
 /.config
+/defconfig
 *.depend
 *.o
 /*.patch
diff --git a/Makefile b/Makefile
index 5c4293b..bc890dd 100644
--- a/Makefile
+++ b/Makefile
@@ -814,7 +814,7 @@ endif
 ifeq ($(O),output)
 	rm -rf $(O)
 endif
-	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
+	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/defconfig $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
 		$(CONFIG_DIR)/.auto.deps
 
 help:
-- 
1.7.10.4
