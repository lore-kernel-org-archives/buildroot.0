From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 23:34:29 +0100
Subject: [Buildroot] [git commit] package/nodejs: bump to version 5.5.0
Message-ID: <20160208084431.2585C81849@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=976380ce27f682f735ae3d3dc78e3a8d58e81a28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches from 5.3.0 have been copied over with the following exceptions:
 - Removed 0005-Fix-crash-in-GetInterfaceAddresses.patch as this has
   been applied upstream
 - Renamed 0006-Fix-support-for-uClibc-ng.patch to
   0005-Fix-support-for-uClibc-ng.patch

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0005-Fix-crash-in-GetInterfaceAddresses.patch  | 37 ----------------------
 ...01-Remove-dependency-on-Python-bz2-module.patch |  0
 .../0002-gyp-force-link-command-to-use-CXX.patch   |  0
 ...hon-variable-instead-of-hardcoding-Python.patch |  0
 .../0004-Fix-va_list-not-declared.patch            |  0
 .../0005-Fix-support-for-uClibc-ng.patch}          |  0
 package/nodejs/Config.in                           |  6 ++--
 package/nodejs/nodejs.hash                         |  4 +--
 8 files changed, 5 insertions(+), 42 deletions(-)

diff --git a/package/nodejs/5.3.0/0005-Fix-crash-in-GetInterfaceAddresses.patch b/package/nodejs/5.3.0/0005-Fix-crash-in-GetInterfaceAddresses.patch
deleted file mode 100644
index d964290..0000000
--- a/package/nodejs/5.3.0/0005-Fix-crash-in-GetInterfaceAddresses.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 839bd9d147b2c85fe70196c86dbdbed504762caf Mon Sep 17 00:00:00 2001
-From: "Bark, Martin" <martin.bark@te.com>
-Date: Mon, 14 Dec 2015 13:27:51 +0000
-Subject: [PATCH 1/2] Fix crash in GetInterfaceAddresses
-
-If uv_interface_addresses() returns UV_ENOSYS then interfaces and count are
-uninitialised. This can cause a segmentation fault inside
-GetInterfaceAddresses when it tries to use the invalid interfaces[]. Fix
-the issue by returning from GetInterfaceAddresses on the UV_ENOSYS error.
-
-This issue was observed when using uCLibc-ng version 1.0.9 because
-uv_interface_addresses() in deps/uv/src/unix/linux-core.c incorrectly
-undefines HAVE_IFADDRS_H.
-
-Submitted upstream, see https://github.com/nodejs/node/pull/4272
-
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- src/node_os.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/node_os.cc b/src/node_os.cc
-index a100090..92f53a9 100644
---- a/src/node_os.cc
-+++ b/src/node_os.cc
-@@ -200,7 +200,7 @@ static void GetInterfaceAddresses(const FunctionCallbackInfo<Value>& args) {
-   ret = Object::New(env->isolate());
- 
-   if (err == UV_ENOSYS) {
--    args.GetReturnValue().Set(ret);
-+    return args.GetReturnValue().Set(ret);
-   } else if (err) {
-     return env->ThrowUVException(err, "uv_interface_addresses");
-   }
--- 
-2.6.2
-
diff --git a/package/nodejs/5.3.0/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/5.5.0/0001-Remove-dependency-on-Python-bz2-module.patch
similarity index 100%
rename from package/nodejs/5.3.0/0001-Remove-dependency-on-Python-bz2-module.patch
rename to package/nodejs/5.5.0/0001-Remove-dependency-on-Python-bz2-module.patch
diff --git a/package/nodejs/5.3.0/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/5.5.0/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/5.3.0/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/5.5.0/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/5.3.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/5.5.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
similarity index 100%
rename from package/nodejs/5.3.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
rename to package/nodejs/5.5.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
diff --git a/package/nodejs/5.3.0/0004-Fix-va_list-not-declared.patch b/package/nodejs/5.5.0/0004-Fix-va_list-not-declared.patch
similarity index 100%
rename from package/nodejs/5.3.0/0004-Fix-va_list-not-declared.patch
rename to package/nodejs/5.5.0/0004-Fix-va_list-not-declared.patch
diff --git a/package/nodejs/5.3.0/0006-Fix-support-for-uClibc-ng.patch b/package/nodejs/5.5.0/0005-Fix-support-for-uClibc-ng.patch
similarity index 100%
rename from package/nodejs/5.3.0/0006-Fix-support-for-uClibc-ng.patch
rename to package/nodejs/5.5.0/0005-Fix-support-for-uClibc-ng.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 3dfccac..4385646 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -46,13 +46,13 @@ config BR2_PACKAGE_NODEJS_0_10_X
 	bool "v0.10.41"
 
 config BR2_PACKAGE_NODEJS_5_X
-	bool "v5.3.0"
+	bool "v5.5.0"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_USE_WCHAR
 
-comment "v5.3.0 needs a toolchain w/ gcc >= 4.8, wchar"
+comment "v5.5.0 needs a toolchain w/ gcc >= 4.8, wchar"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
@@ -62,7 +62,7 @@ endchoice
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "0.10.41"	if BR2_PACKAGE_NODEJS_0_10_X
-	default "5.3.0"		if BR2_PACKAGE_NODEJS_5_X
+	default "5.5.0"		if BR2_PACKAGE_NODEJS_5_X
 
 menu "Module Selection"
 
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index dc56efa..e65f14a 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.41/SHASUMS256.txt
 sha256	79f694e2a5c42543b75d0c69f6860499d7593136d0f6b59e7163b9e66fb2c995  node-v0.10.41.tar.gz
 
-# From upstream URL: http://nodejs.org/dist/v5.3.0/SHASUMS256.txt
-sha256  e5115ee78c31ac3af0f2b3553aa84fff2f49ae59bd6e01e11d78ce86c544569e  node-v5.3.0.tar.xz
+# From upstream URL: http://nodejs.org/dist/v5.5.0/SHASUMS256.txt
+sha256  9c46b4dc9548e43826f71f6571f56e39783c456b9516045b496ea73321731e22  node-v5.5.0.tar.xz
