From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Jul 2013 09:52:09 -0300
Subject: [Buildroot] [PATCH 3/9] uclibc: make target utils optional
In-Reply-To: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1374324735-2286-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are broken for blackfin unfortunately so they're disabled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/Config.in | 11 +++++++++++
 package/uclibc/uclibc.mk | 16 +++++++++++-----
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index f9c4956..32289bb 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -129,6 +129,17 @@ config BR2_PTHREAD_DEBUG
 	help
 	  Build the thread library with debugging enabled.
 
+config BR2_UCLIBC_INSTALL_UTILS
+	bool "Compile and install uClibc utilities"
+	depends on !BR2_bfin
+	default y
+	help
+	  Enabling this option will compile and install the getconf,
+	  ldconfig and ldd uClibc utilities for the target.
+
+	  You can save ~32 KiB in target space by disabling them since
+	  they're normally not needed.
+
 config BR2_UCLIBC_INSTALL_TEST_SUITE
 	bool "Compile and install uClibc tests"
 	select BR2_PACKAGE_MAKE
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index cf53280..4a37fa0 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -451,6 +451,16 @@ define UCLIBC_INSTALL_TEST_SUITE
 endef
 endif
 
+ifeq ($(BR2_UCLIBC_INSTALL_UTILS),y)
+define UCLIBC_INSTALL_UTILS_TARGET
+	$(MAKE1) -C $(@D) \
+		CC="$(TARGET_CC)" CPP="$(TARGET_CPP)" LD="$(TARGET_LD)" \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
+		PREFIX=$(TARGET_DIR) \
+		utils install_utils
+endef
+endif
+
 define UCLIBC_INSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) \
 		$(UCLIBC_MAKE_FLAGS) \
@@ -458,11 +468,7 @@ define UCLIBC_INSTALL_TARGET_CMDS
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		install_runtime
-	$(MAKE1) -C $(@D) \
-		CC="$(TARGET_CC)" CPP="$(TARGET_CPP)" LD="$(TARGET_LD)" \
-		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX=$(TARGET_DIR) \
-		utils install_utils
+	$(UCLIBC_INSTALL_UTILS_TARGET)
 	$(UCLIBC_INSTALL_TEST_SUITE)
 endef
 
-- 
1.8.1.5
