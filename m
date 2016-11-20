From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Nov 2016 23:33:59 +0100
Subject: [Buildroot] [PATCH] libuv: needs NPTL
Message-ID: <20161120223359.20613-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/b81/b81583dea1bdf3777b2f2736c84fef90aa10f30b/
http://autobuild.buildroot.net/results/93f/93f1c4dcaa9a20ec62c547b839cd334ed1b5fbe4/
http://autobuild.buildroot.net/results/030/030ef0a9bd51a2c52d6026e0c1e383a9bdae3c4f/
http://autobuild.buildroot.net/results/fff/fff2098f707d9827ec5e1fd38fe742dd2b695ead/

libuv uses pthread_barrier_* functions, which aren't available with
linuxthreads.  Notice that libuv contains a local prototype for these
functions, so libuv is able to build and the error only triggers when
applications try to link against it.

Also propagate this dependency to the reverse deps of libuv.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/Config.in  | 6 +++---
 package/luv/Config.in    | 6 +++---
 package/luvi/Config.in   | 6 +++---
 package/moarvm/Config.in | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/libuv/Config.in b/package/libuv/Config.in
index 26cb97e..93fbd56 100644
--- a/package/libuv/Config.in
+++ b/package/libuv/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBUV
 	bool "libuv"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_barrier_*
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	help
@@ -9,6 +9,6 @@ config BR2_PACKAGE_LIBUV
 
 	  https://github.com/libuv/libuv
 
-comment "libuv needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "libuv needs a toolchain w/ NPTL, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
diff --git a/package/luv/Config.in b/package/luv/Config.in
index 787d162..b085baf 100644
--- a/package/luv/Config.in
+++ b/package/luv/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LUV
 	bool "luv"
 	select BR2_PACKAGE_LIBUV
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_USE_MMU # libuv
 	depends on !BR2_STATIC_LIBS # libuv
 	help
@@ -9,6 +9,6 @@ config BR2_PACKAGE_LUV
 
 	  https://github.com/luvit/luv
 
-comment "luv needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "luv needs a toolchain w/ NPTL, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
diff --git a/package/luvi/Config.in b/package/luvi/Config.in
index 2f01f5c..18317f4 100644
--- a/package/luvi/Config.in
+++ b/package/luvi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUVI
 	bool "luvi"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_USE_MMU # libuv
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_PACKAGE_LUAJIT
@@ -22,8 +22,8 @@ config BR2_PACKAGE_LUVI
 
 	  https://github.com/luvit/luvi
 
-comment "luvi needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "luvi needs a toolchain w/ NPTL, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 
 comment "luvi needs LuaJIT"
diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index 3e0a104..69d9a3e 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MOARVM
 	bool "moarvm"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_USE_MMU # libuv
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # libatomic_ops
@@ -15,8 +15,8 @@ config BR2_PACKAGE_MOARVM
 
 	  http://moarvm.com
 
-comment "moarvm needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "moarvm needs a toolchain w/ NPTL, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	depends on !BR2_sparc64 && !BR2_sparc
-- 
2.10.2
