From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 12 Sep 2014 17:50:11 +0200
Subject: [Buildroot] [PATCH 12/12] libffi and python: need threads support
In-Reply-To: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
Message-ID: <1410537011-29662-13-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libffi depends on pthreads.

Python depends on libffi (it can provide a builtin libffi, but also depends on
pthreads). Thus this patch also disable Python support if toolchain is compiled
w/o treads support.

Fixes http://sysmic.org/~jezz/results/204099dd:

../src/closures.c:119:21: fatal error: pthread.h: No such file or directory

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/libffi/Config.in | 4 ++++
 package/python/Config.in | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

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
index a0c78c6..85438a4 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -3,15 +3,17 @@ config BR2_PACKAGE_PYTHON
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
 
 	  http://www.python.org/
 
-comment "python needs a toolchain w/ wchar"
+comment "python needs a toolchain w/ wchar and threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_PYTHON
 
-- 
2.1.0
