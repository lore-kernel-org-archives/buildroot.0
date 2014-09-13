From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Sep 2014 09:40:48 +0200
Subject: [Buildroot] [git commit] libffi and python: need threads support
Message-ID: <20140913074255.C430F9D68A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77cf5b5a71aa54039f4dbc509a1c7cb40aa04934
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libffi depends on pthreads.

Python depends on libffi (it can provide a builtin libffi, but also depends on
pthreads). Thus this patch also disable Python support if toolchain is compiled
w/o treads support.

Fixes http://sysmic.org/~jezz/results/204099dd:

../src/closures.c:119:21: fatal error: pthread.h: No such file or directory

[Peter: fix comment dependencies, add python3]
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libffi/Config.in  |    4 ++++
 package/python/Config.in  |    5 +++--
 package/python3/Config.in |    5 +++--
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/libffi/Config.in b/package/libffi/Config.in
index 7211f8f..6edf570 100644
--- a/package/libffi/Config.in
+++ b/package/libffi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBFFI
 	bool "libffi"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The libffi library provides a portable, high level
 	  programming interface to various calling conventions. This
@@ -7,3 +8,6 @@ config BR2_PACKAGE_LIBFFI
 	  interface description at run-time.
 
 	  http://sourceware.org/libffi/
+
+comment "libffi needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python/Config.in b/package/python/Config.in
index a0c78c6..8b27630 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -3,15 +3,16 @@ config BR2_PACKAGE_PYTHON
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
 
 	  http://www.python.org/
 
-comment "python needs a toolchain w/ wchar"
+comment "python needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_PYTHON
 
diff --git a/package/python3/Config.in b/package/python3/Config.in
index 3e193c8..375390f 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -4,15 +4,16 @@ config BR2_PACKAGE_PYTHON3
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
 
 	  http://www.python.org/
 
-comment "python3 needs a toolchain w/ wchar"
+comment "python3 needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_PYTHON3
 
