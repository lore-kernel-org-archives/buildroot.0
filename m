From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  3 Jul 2017 23:58:02 +0200
Subject: [Buildroot] [PATCH 1/2] gcc: gcc-final: install libsanitizer if
	available
Message-ID: <20170703215803.6233-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gcc builds libsanitizer (lib{a,l,t,u}san) for
-fsanitize={address,thread,leak,undefined} if the needed dependencies are
available:

- Glibc
- C++ support
- A supported architecture (see libsanitizer/configure.tgt)

So install these into target + staging if available to support -fsanitize.

Notice that this grows the target fs with close to 2MB on architectures
where all variants are supported. From a x86-64 build:

ls -lahS target/lib/lib?san.so.?.0.0
-rwxr-xr-x 1 peko peko 950K Jul  3 23:51 target/lib/libasan.so.3.0.0
-rwxr-xr-x 1 peko peko 719K Jul  3 23:51 target/lib/libtsan.so.0.0.0
-rwxr-xr-x 1 peko peko 229K Jul  3 23:51 target/lib/liblsan.so.0.0.0

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc-final/gcc-final.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index e8d2e18fe5..b9ea628ae9 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -147,6 +147,15 @@ endef
 
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBATOMIC
 
+define HOST_GCC_FINAL_INSTALL_LIBSANITIZER
+	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/lib?san* \
+		$(STAGING_DIR)/lib/
+	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/lib?san* \
+		$(TARGET_DIR)/lib/
+endef
+
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBSANITIZER
+
 # Handle the installation of libraries in /usr/lib
 HOST_GCC_FINAL_USR_LIBS =
 
-- 
2.11.0
