From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 11 Dec 2018 15:19:39 +0200
Subject: [Buildroot] [PATCH] libssh: workaround -Werror=strict-overflow
 build failures
Message-ID: <7d6e364ac220c937573e1d4d7717a72cc240f81b.1544534379.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch that disables -Werror=strict-overflow to fix the build with
some versions of gcc.

Fixes:
http://autobuild.buildroot.net/results/414/41490ebb181762d14c565effb0155db7ac1e0db0/
http://autobuild.buildroot.net/results/3a6/3a6395fd85f434ff855d602949166d5cec725c7e/
http://autobuild.buildroot.net/results/224/22422145e7fc9a8ab4e766b174a916e599845f1c/

Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-Disable-Werror-strict-overflow.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libssh/0001-Disable-Werror-strict-overflow.patch

diff --git a/package/libssh/0001-Disable-Werror-strict-overflow.patch b/package/libssh/0001-Disable-Werror-strict-overflow.patch
new file mode 100644
index 000000000000..8870fbf6d12c
--- /dev/null
+++ b/package/libssh/0001-Disable-Werror-strict-overflow.patch
@@ -0,0 +1,34 @@
+From 0ab36988ff211eac2559546f87585ef5a3a14527 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 11 Dec 2018 15:04:29 +0200
+Subject: [PATCH] Disable -Werror=strict-overflow
+
+This options causes build failures with gcc 5 and 6.
+
+The issue reported upstream:
+
+  https://www.libssh.org/archive/libssh/2018-12/0000004.html
+
+Patch CompilerChecks.cmake for that, since there is no way to override
+the C flags in the cmake or make commands.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: not upstreamable; issue reported upstream
+---
+ CompilerChecks.cmake | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CompilerChecks.cmake b/CompilerChecks.cmake
+index 4d5ef0279c26..da70f4f38d37 100644
+--- a/CompilerChecks.cmake
++++ b/CompilerChecks.cmake
+@@ -99,4 +99,5 @@ if (OSX)
+     add_c_compiler_flag("-Wno-deprecated-declarations" SUPPORTED_COMPILER_FLAGS)
+ endif()
+ 
++add_c_compiler_flag("-Wno-error=strict-overflow" SUPPORTED_COMPILER_FLAGS)
+ set(DEFAULT_C_COMPILE_FLAGS ${SUPPORTED_COMPILER_FLAGS} CACHE INTERNAL "Default C Compiler Flags" FORCE)
+-- 
+2.19.2
+
-- 
2.19.2
