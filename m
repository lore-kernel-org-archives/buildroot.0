From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 15:59:02 -0500
Subject: [Buildroot] [PATCH v3] toolchain: expose
 BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS for all toolchain types
Message-ID: <20191027205902.56911-1-matthew.weber@rockwellcollins.com>
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

Changes
v2 -> v3
 - Fixed external toolchain needing a suffix with wildcard. (Was missed
   because the interal toolchain wants just the library name).
[Arnout
 - Updated help text on BR2_TOOLCHAIN_EXTRA_LIBS to give an example
[Peter
 - Added !BR2_STATIC_LIBS dependency

v1 -> v2
[Thomas P
 - Added Config.in.legacy logic for BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
---
 Config.in.legacy                                   | 11 +++++++++++
 package/gcc/gcc-final/gcc-final.mk                 |  2 ++
 toolchain/Config.in                                | 14 ++++++++++++++
 .../toolchain-external/pkg-toolchain-external.mk   |  2 +-
 .../toolchain-external-custom/Config.in.options    |  8 --------
 5 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d4f3d04062..b3086300e6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,17 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
+	string "toolchain-external extra libs option has been renamed"
+	help
+	  The option BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS has
+	  been renamed to BR2_TOOLCHAIN_EXTRA_LIBS.
+
+config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS_WRAP
+	bool
+	default y if BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS != ""
+	select BR2_LEGACY
+
 config BR2_PACKAGE_PYTHON_PYSNMP_APPS
 	bool "python-pysnmp-apps was removed"
 	select BR2_LEGACY
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
index c9aa95985f..a6442bbd97 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -221,6 +221,20 @@ config BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST
 
 	  Note: the full set of gconv libs are ~8MiB (on ARM).
 
+config BR2_TOOLCHAIN_EXTRA_LIBS
+	string "Extra toolchain libraries to be copied to target"
+	default BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS if BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS != "" # legacy
+	depends on !BR2_STATIC_LIBS
+	help
+	  If your toolchain provides extra libraries that need to be
+	  copied to the target filesystem, enter them here, separated
+	  by spaces. The library should not include a suffix or any
+	  type of pre/post wildcard.
+
+	  Examples where this can be useful is for adding debug libraries
+	  to the target like the GCC libsanitizer.
+	  e.g. "libasan liblsan libtsan libubsan"
+
 # This boolean is true if the toolchain provides a built-in full
 # featured gettext implementation (glibc), and false if only a stub
 # gettext implementation is provided (uclibc, musl)
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 5147da0104..4bae2ff412 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -156,7 +156,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_DLANG),y)
 TOOLCHAIN_EXTERNAL_LIBS += libgdruntime.so* libgphobos.so*
 endif
 
-TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
+TOOLCHAIN_EXTERNAL_LIBS += $(addsuffix .so*,$(call qstrip,$(BR2_TOOLCHAIN_EXTRA_LIBS)))
 
 
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
