From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 11:42:50 +0200
Subject: [Buildroot] [git commit] libselinux: add patch to fix build with
 gcc < 4.7
Message-ID: <20180816093602.672DB86357@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6288409642d8368104f916bd264d2cb042942dfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch from Hollis Blanchard on libselinux to fix
build on host machines that have gcc < 4.7.

Fixes:

  http://autobuild.buildroot.net/results/a82bb0c0b22ff24263ad7a7d165b21c0df7b3b1d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...d-break-around-__atomic_-with-GCC-4.7.patch.txt | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/package/libselinux/0004-Fix-build-break-around-__atomic_-with-GCC-4.7.patch.txt b/package/libselinux/0004-Fix-build-break-around-__atomic_-with-GCC-4.7.patch.txt
new file mode 100644
index 0000000000..85bd064066
--- /dev/null
+++ b/package/libselinux/0004-Fix-build-break-around-__atomic_-with-GCC-4.7.patch.txt
@@ -0,0 +1,70 @@
+From abe76789f8e7ce61b357f693eaed5b28feab5ce2 Mon Sep 17 00:00:00 2001
+From: Hollis Blanchard <hollis_blanchard@mentor.com>
+Date: Mon, 13 Aug 2018 12:11:33 -0700
+Subject: [PATCH] Fix build break around __atomic_*() with GCC<4.7
+
+The __atomic_* GCC primitives were introduced in GCC 4.7, but Red Hat
+Enterprise Linux 6.x (for example) provides GCC 4.4. Tweak the current code to
+use the (most conservative) __sync_synchronize() primitive provided by those
+older GCC versions.
+
+(Really, no __atomic or __sync operations are needed here at all, since POSIX
+4.12 "Memory Synchronization" says pthread_mutex_lock() and
+pthread_mutex_unlock() "synchronize memory with respect to other threads"...)
+
+Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
+---
+ libselinux/src/label_file.h | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/libselinux/src/label_file.h b/libselinux/src/label_file.h
+index 2fa85474..47859baf 100644
+--- a/libselinux/src/label_file.h
++++ b/libselinux/src/label_file.h
+@@ -351,8 +351,14 @@ static inline int compile_regex(struct saved_data *data, struct spec *spec,
+ 	 * init_routine does not take a parameter, it's not possible
+ 	 * to use, so we generate the same effect with atomics and a
+ 	 * mutex */
++#ifdef __ATOMIC_RELAXED
+ 	regex_compiled =
+ 		__atomic_load_n(&spec->regex_compiled, __ATOMIC_ACQUIRE);
++#else
++	/* GCC <4.7 */
++	__sync_synchronize();
++	regex_compiled = spec->regex_compiled;
++#endif
+ 	if (regex_compiled) {
+ 		return 0; /* already done */
+ 	}
+@@ -360,8 +366,14 @@ static inline int compile_regex(struct saved_data *data, struct spec *spec,
+ 	__pthread_mutex_lock(&spec->regex_lock);
+ 	/* Check if another thread compiled the regex while we waited
+ 	 * on the mutex */
++#ifdef __ATOMIC_RELAXED
+ 	regex_compiled =
+ 		__atomic_load_n(&spec->regex_compiled, __ATOMIC_ACQUIRE);
++#else
++	/* GCC <4.7 */
++	__sync_synchronize();
++	regex_compiled = spec->regex_compiled;
++#endif
+ 	if (regex_compiled) {
+ 		__pthread_mutex_unlock(&spec->regex_lock);
+ 		return 0;
+@@ -404,7 +416,13 @@ static inline int compile_regex(struct saved_data *data, struct spec *spec,
+ 	}
+ 
+ 	/* Done. */
++#ifdef __ATOMIC_RELAXED
+ 	__atomic_store_n(&spec->regex_compiled, true, __ATOMIC_RELEASE);
++#else
++	/* GCC <4.7 */
++	spec->regex_compiled = true;
++	__sync_synchronize();
++#endif
+ 	__pthread_mutex_unlock(&spec->regex_lock);
+ 	return 0;
+ }
+-- 
+2.13.0
+
