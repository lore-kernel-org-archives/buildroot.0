From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Sep 2014 11:50:03 +0200
Subject: [Buildroot] [PATCH 5/5] uclibc: two-stage gcc simplifications
In-Reply-To: <1410688203-28621-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1410688203-28621-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1410688203-28621-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After switching to a two stage gcc solution, there is no longer a need
to do weird things in the uclibc build. We can greatly simplify
UCLIBC_CONFIGURE_CMDS to only do the configuration, and let the
existing UCLIBC_BUILD_CMDS do the build. Note that we have to build
the headers before starting the C library build, otherwise there is a
build failure (probably a uClibc bug).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 31ff47b..5933973 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -433,20 +433,6 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_STRIP_CONFIG)
 endef
 
-define UCLIBC_CONFIGURE_CMDS
-	$(MAKE1) -C $(UCLIBC_DIR) \
-		$(UCLIBC_MAKE_FLAGS) \
-		PREFIX=$(STAGING_DIR) \
-		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=$(STAGING_DIR) \
-		headers startfiles \
-		install_headers install_startfiles
-	$(TARGET_CROSS)gcc -nostdlib \
-		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so
-	$(TARGET_CROSS)gcc -nostdlib \
-		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libm.so
-endef
-
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
 define UCLIBC_BUILD_TEST_SUITE
 	$(MAKE1) -C $(@D)/test \
@@ -471,12 +457,8 @@ else
 endif
 
 define UCLIBC_BUILD_CMDS
-	$(UCLIBC_MAKE) -C $(@D) \
-		$(UCLIBC_MAKE_FLAGS) \
-		PREFIX= \
-		DEVEL_PREFIX=/ \
-		RUNTIME_PREFIX=/ \
-		all
+	$(UCLIBC_MAKE) -C $(@D) $(UCLIBC_MAKE_FLAGS) headers
+	$(UCLIBC_MAKE) -C $(@D) $(UCLIBC_MAKE_FLAGS)
 	$(MAKE) -C $(@D)/utils \
 		PREFIX=$(HOST_DIR) \
 		HOSTCC="$(HOSTCC)" hostutils
-- 
2.0.0
