From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Oct 2014 16:06:22 -0300
Subject: [Buildroot] [PATCH] slang: disable termcap
Message-ID: <1412622382-11624-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't have/do it and sometimes it misdetects. Fixes:
http://autobuild.buildroot.net/results/ec9/ec9f1d7680aa50357d9a6646cef610dcaa1e8041/

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/slang/slang.hash | 2 ++
 package/slang/slang.mk   | 6 ++++++
 2 files changed, 8 insertions(+)
 create mode 100644 package/slang/slang.hash

diff --git a/package/slang/slang.hash b/package/slang/slang.hash
new file mode 100644
index 0000000..000ac11
--- /dev/null
+++ b/package/slang/slang.hash
@@ -0,0 +1,2 @@
+# From http://www.jedsoft.org/releases/slang/
+sha1	c3270b58a58e6cbfd47f0a6e3d2194dd9e7c7d14	slang-2.3.0.tar.gz
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 6962e77..15b65b3 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -11,6 +11,12 @@ SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
 SLANG_MAKE = $(MAKE1)
 
+# Racy and we don't have/do libtermcap
+define SLANG_DISABLE_TERMCAP
+	$(SED) '/^TERMCAP=/s:=.*:=:' $(@D)/configure
+endef
+SLANG_POST_PATCH_HOOKS += SLANG_DISABLE_TERMCAP
+
 # Absolute path hell, sigh...
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 	SLANG_CONF_OPTS += --with-png=$(STAGING_DIR)/usr
-- 
2.0.4
