From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  8 Apr 2019 14:50:06 -0400
Subject: [Buildroot] [PATCH] package/libselinux: bump version to 2.9
In-Reply-To: <20190408185013.71465-1-aduskett@gmail.com>
References: <20190408185013.71465-1-aduskett@gmail.com>
Message-ID: <20190408185013.71465-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
 - Remove upstream patch
 - Add PYTHON=$(LIBSELINUX_PYLIBVER) to LIBSELINUX_MAKE_OPTS
 - Add PYTHON=$(HOST_LIBSELINUX_PYLIBVER) to HOST_LIBSELINUX_MAKE_OPTS

The python changes are necessary because libselinux python tools now defaults
to python3.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 ...-break-around-__atomic_-with-GCC-4.7.patch | 70 -------------------
 package/libselinux/libselinux.hash            |  2 +-
 package/libselinux/libselinux.mk              |  6 +-
 3 files changed, 5 insertions(+), 73 deletions(-)
 delete mode 100644 package/libselinux/0003-Fix-build-break-around-__atomic_-with-GCC-4.7.patch

diff --git a/package/libselinux/0003-Fix-build-break-around-__atomic_-with-GCC-4.7.patch b/package/libselinux/0003-Fix-build-break-around-__atomic_-with-GCC-4.7.patch
deleted file mode 100644
index 88e3a79332..0000000000
--- a/package/libselinux/0003-Fix-build-break-around-__atomic_-with-GCC-4.7.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From abe76789f8e7ce61b357f693eaed5b28feab5ce2 Mon Sep 17 00:00:00 2001
-From: Hollis Blanchard <hollis_blanchard@mentor.com>
-Date: Mon, 13 Aug 2018 12:11:33 -0700
-Subject: [PATCH] Fix build break around __atomic_*() with GCC<4.7
-
-The __atomic_* GCC primitives were introduced in GCC 4.7, but Red Hat
-Enterprise Linux 6.x (for example) provides GCC 4.4. Tweak the current code to
-use the (most conservative) __sync_synchronize() primitive provided by those
-older GCC versions.
-
-(Really, no __atomic or __sync operations are needed here at all, since POSIX
-4.12 "Memory Synchronization" says pthread_mutex_lock() and
-pthread_mutex_unlock() "synchronize memory with respect to other threads"...)
-
-Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
----
- src/label_file.h | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/src/label_file.h b/src/label_file.h
-index 2fa85474..47859baf 100644
---- a/src/label_file.h
-+++ b/src/label_file.h
-@@ -351,8 +351,14 @@ static inline int compile_regex(struct saved_data *data, struct spec *spec,
- 	 * init_routine does not take a parameter, it's not possible
- 	 * to use, so we generate the same effect with atomics and a
- 	 * mutex */
-+#ifdef __ATOMIC_RELAXED
- 	regex_compiled =
- 		__atomic_load_n(&spec->regex_compiled, __ATOMIC_ACQUIRE);
-+#else
-+	/* GCC <4.7 */
-+	__sync_synchronize();
-+	regex_compiled = spec->regex_compiled;
-+#endif
- 	if (regex_compiled) {
- 		return 0; /* already done */
- 	}
-@@ -360,8 +366,14 @@ static inline int compile_regex(struct saved_data *data, struct spec *spec,
- 	__pthread_mutex_lock(&spec->regex_lock);
- 	/* Check if another thread compiled the regex while we waited
- 	 * on the mutex */
-+#ifdef __ATOMIC_RELAXED
- 	regex_compiled =
- 		__atomic_load_n(&spec->regex_compiled, __ATOMIC_ACQUIRE);
-+#else
-+	/* GCC <4.7 */
-+	__sync_synchronize();
-+	regex_compiled = spec->regex_compiled;
-+#endif
- 	if (regex_compiled) {
- 		__pthread_mutex_unlock(&spec->regex_lock);
- 		return 0;
-@@ -404,7 +416,13 @@ static inline int compile_regex(struct saved_data *data, struct spec *spec,
- 	}
- 
- 	/* Done. */
-+#ifdef __ATOMIC_RELAXED
- 	__atomic_store_n(&spec->regex_compiled, true, __ATOMIC_RELEASE);
-+#else
-+	/* GCC <4.7 */
-+	spec->regex_compiled = true;
-+	__sync_synchronize();
-+#endif
- 	__pthread_mutex_unlock(&spec->regex_lock);
- 	return 0;
- }
--- 
-2.13.0
-
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index fb8e350434..ed61ea8bd2 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 31db96ec7643ce10912b3c3f98506a08a9116dcfe151855fd349c3fda96187e1 libselinux-2.8.tar.gz
+sha256 1bccc8873e449587d9a2b2cf253de9b89a8291b9fbc7c59393ca9e5f5f4d2693 libselinux-2.9.tar.gz
 
 # Hash for license file
 sha256 86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364 LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index b09634740a..977f9e2e8b 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 2.8
-LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
+LIBSELINUX_VERSION = 2.9
+LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
 
@@ -37,6 +37,7 @@ LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 endif
 
 LIBSELINUX_MAKE_OPTS += \
+	PYTHON=$(LIBSELINUX_PYLIBVER) \
 	PYINC="$(LIBSELINUX_PYINC)" \
 	PYSITEDIR=$(TARGET_DIR)/usr/lib/$(LIBSELINUX_PYLIBVER)/site-packages \
 	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
@@ -88,6 +89,7 @@ endif
 
 HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
+	PYTHON=$(HOST_LIBSELINUX_PYLIBVER) \
 	PREFIX=$(HOST_DIR) \
 	SHLIBDIR=$(HOST_DIR)/lib \
 	LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread" \
-- 
2.20.1
