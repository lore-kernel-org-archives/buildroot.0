From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 08:49:46 -0500
Subject: [Buildroot] [PATCH] toolchain: expose
 BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS for all toolchain types
Message-ID: <20191027134946.11701-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch extends the "copy extra GCC libraries to target" feature to
also work for internal toolchains. The variable has been renamed to be
BR2_TOOLCHAIN_EXTRA_LIBS and the configuration option moved under the
generic toolchain package. For external toolchains, the step that does
the copy is still in the copy_toolchain_lib_root() helper which copies
from the sysroot to the target.  For the internal toolchain, the host
gcc-final package does a post install hook to copy the libraries from
the toolchain build folders to both the sysroot and target(!static).

Examples where this can be useful is for adding debug libraries to the
target like the GCC libsanitizer (libasan/liblsan/...).

Cc: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Note: this generic extra library copy is proposed as an alternative to
http://patchwork.ozlabs.org/patch/1110787/
---
 package/gcc/gcc-final/gcc-final.mk                   |  2 ++
 toolchain/Config.in                                  | 12 ++++++++++++
 .../toolchain-external/pkg-toolchain-external.mk     |  2 +-
 .../toolchain-external-custom/Config.in.options      |  8 --------
 4 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 30fb87856c..24d034b720 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -187,6 +187,8 @@ ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
 HOST_GCC_FINAL_USR_LIBS += libgomp
 endif
 
+HOST_GCC_FINAL_USR_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_LIBS))
+
 ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
 define HOST_GCC_FINAL_INSTALL_STATIC_LIBS
 	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index c9aa95985f..29289d22a6 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -221,6 +221,18 @@ config BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST
 
 	  Note: the full set of gconv libs are ~8MiB (on ARM).
 
+config BR2_TOOLCHAIN_EXTRA_LIBS
+	string "Extra toolchain libraries to be copied to target"
+	help
+	  If your toolchain provides extra libraries that need to be
+	  copied to the target filesystem, enter them here, separated
+	  by spaces.
+
+	  NOTE: The library name should not include a suffix or wildcard.
+
+	  Examples where this can be useful is for adding debug libraries
+	  to the target like the GCC libsanitizer (libasan/liblsan/...).
+
 # This boolean is true if the toolchain provides a built-in full
 # featured gettext implementation (glibc), and false if only a stub
 # gettext implementation is provided (uclibc, musl)
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 5147da0104..e339773a96 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -156,7 +156,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_DLANG),y)
 TOOLCHAIN_EXTERNAL_LIBS += libgdruntime.so* libgphobos.so*
 endif
 
-TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
+TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_LIBS))
 
 
 #
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index a36747f490..fd95f8201b 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -438,12 +438,4 @@ config BR2_TOOLCHAIN_EXTERNAL_OPENMP
 	  support. If you don't know, leave the default value,
 	  Buildroot will tell you if it's correct or not.
 
-config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
-	string "Extra toolchain libraries to be copied to target"
-	help
-	  If your external toolchain provides extra libraries that
-	  need to be copied to the target filesystem, enter them
-	  here, separated by spaces. They will be copied to the
-	  target's /lib directory.
-
 endif
-- 
2.17.1
