From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 17:00:50 +0200
Subject: [Buildroot] [git commit] package/libfastjson: can use threads
	instead of atomics
Message-ID: <20160715150124.302CC7FC6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c10b7c07a49673ff0d67b5c90daa6dd14ed3de4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When atomic intrisics are missing, libfastjson falls back to using
pthread mutexes to manage atomicity. Of course, this is much less
efficient than atomics, but it does the job.

Propagate the new dependency to rsyslog, the sole user of libfastjson.

Note: rsyslog already depends on threads for itself, but we believe it
is better to have the exact same dependency propagated.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfastjson/Config.in | 4 ++--
 package/rsyslog/Config.in     | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libfastjson/Config.in b/package/libfastjson/Config.in
index 5a94113..fbc9b1d 100644
--- a/package/libfastjson/Config.in
+++ b/package/libfastjson/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBFASTJSON
 	bool "libfastjson"
-	# uses __sync_val_compare_and_swap_4
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	# uses the __sync_*_4 intrisics, or pthreads to emulate atomicity
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Libfastjson - A fast json library for C
 
diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index 65291de..b3c146d 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -7,7 +7,9 @@ config BR2_PACKAGE_RSYSLOG
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # modules
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libfastjson
+	# Propagate the exact same dependency from libfastjson,
+	# even though rsyslog already depends on threads for itself:
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Rsyslog is a powerful and flexible syslog implementation
@@ -18,4 +20,4 @@ comment "rsyslog needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
\ No newline at end of file
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
