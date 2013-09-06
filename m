From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 06 Sep 2013 21:02:37 +0800
Subject: [Buildroot] [PATCH RFC] uclibc: Don't build shared library if
	!HAVE_SHARED
Message-ID: <1378472557.19947.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current setting unconditionally build shared library.
This result in build error when HAVE_SHARED is not set.
Fix it to build shared library only when HAVE_SHARED=y.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
I was thinking to unset HAVE_SHARED if BR2_PREFER_STATIC_LIB=y.
So I can avoid the "grep" in UCLIBC_BUILD_SHARED_LIBS.

However, I feel that when BR2_PREFER_STATIC_LIB is not set, it does not means
HAVE_SHARED is always true.
Comments?

 package/uclibc/uclibc.mk | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index a25bfee..85bf10c 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -458,6 +458,15 @@ endef
 
 UCLIBC_POST_PATCH_HOOKS += UCLIBC_SETUP_DOT_CONFIG
 
+define UCLIBC_BUILD_SHARED_LIBS
+	if grep -q HAVE_SHARED=y $(@D)/.config; then \
+		$(TARGET_CROSS)gcc -nostdlib -nostartfiles -shared \
+			-x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so; \
+		$(TARGET_CROSS)gcc -nostdlib -nostartfiles -shared \
+			-x c /dev/null -o $(STAGING_DIR)/usr/lib/libm.so; \
+	fi
+endef
+
 define UCLIBC_CONFIGURE_CMDS
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
@@ -466,10 +475,7 @@ define UCLIBC_CONFIGURE_CMDS
 		RUNTIME_PREFIX=$(STAGING_DIR) \
 		headers startfiles \
 		install_headers install_startfiles
-	$(TARGET_CROSS)gcc -nostdlib \
-		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so
-	$(TARGET_CROSS)gcc -nostdlib \
-		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libm.so
+	$(UCLIBC_BUILD_SHARED_LIBS)
 endef
 
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
-- 
1.8.1.2
