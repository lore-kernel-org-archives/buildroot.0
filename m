From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 22 Aug 2011 16:58:59 +0200
Subject: [Buildroot] [PATCH] build: add option to exclude executables from
	being stripped
Message-ID: <1314025139-7087-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometimes it may be desirable to keep debug symbols for
some binaries and libraries on the target. This commit
introduces the config option BR2_STRIP_EXCLUDES which is
interpreted as a list of such binaries and libraries.
It is passed to the find command in the target-finalize step.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 Config.in |    8 ++++++++
 Makefile  |    6 +++++-
 2 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index 2fce9d7..f6d10d7 100644
--- a/Config.in
+++ b/Config.in
@@ -243,6 +243,14 @@ config BR2_STRIP_none
 	  none    do not strip (only for debugging!)
 endchoice
 
+config BR2_STRIP_EXCLUDES
+	string "executables that should not be stripped"
+	depends on !BR2_STRIP_none
+	default ""
+	help
+	  You may specify a list of binaries and libraries here that
+	  should not be stripped on the target.
+
 choice
 	prompt "gcc optimization level"
 	default BR2_OPTIMIZE_S
diff --git a/Makefile b/Makefile
index 24f0cb2..138ecd1 100644
--- a/Makefile
+++ b/Makefile
@@ -286,6 +286,9 @@ HOSTCC  := $(CCACHE) $(HOSTCC)
 HOSTCXX := $(CCACHE) $(HOSTCXX)
 endif
 
+# executables that should not be stripped in target-finalize
+DONT_STRIP:=$(patsubst %,-not -name '%',$(call qstrip,$(BR2_STRIP_EXCLUDES)))
+
 include toolchain/Makefile.in
 include package/Makefile.in
 
@@ -447,7 +450,8 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 endif
-	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so*' | \
+	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so*' \
+		$(DONT_STRIP) | \
 		xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
 		xargs -r $(KSTRIPCMD) || true
-- 
1.7.4.1
