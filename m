From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:11:40 +0200
Subject: [Buildroot] [git commit] uclibc: make target utils optional
Message-ID: <20130727141206.204DE9AC10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1f24b9dc1ecc42c8f747430b94e42d6e6826b83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are broken for blackfin unfortunately so they're disabled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in |   11 +++++++++++
 package/uclibc/uclibc.mk |   16 +++++++++++-----
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 17176f6..92e04e9 100644
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
 
