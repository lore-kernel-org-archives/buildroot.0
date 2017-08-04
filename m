From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  4 Aug 2017 14:55:13 -0400
Subject: [Buildroot] [PATCH 02/10] add openssl as a dependency to certain
	packages
In-Reply-To: <20170804185521.12320-1-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
Message-ID: <20170804185521.12320-3-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following packages only work with OpenSSL.  In anticipation for the next
patch, these packages must explicitly rely on OpenSSL in thier Config.in
files.

The reason for each package is as follows:

luvi:
  Uses TS_RESP_CTX_set_time_cb which is removed from LibreSSL.
  This is the only package that currently uses this API in
  BuildRoot.

nodejs:
  Bundles it's own OpenSSL variant, which is tightly intigrated
  with node.  There is a ongoing effort to make the SSL library
  agnostic.  Gentoo has provided a patch to make NodeJS work with
  LibreSSL, but I haven't been able to test it.

python-cryptography:
  Newer versions compile against LibreSSL, however there
  are some issues running the latest version when
  cross compiling.

rauc:
   Rauc uses smc exclusively, which LibreSSL does not support.

stunnel:
  The author of stunnel has on two occasions said he will now
  allow Stunnel to be compiled against LibreSSL.
Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/luvi/Config.in                | 5 +++--
 package/nodejs/Config.in              | 6 +++++-
 package/python-cryptography/Config.in | 5 ++++-
 package/rauc/Config.in                | 5 ++++-
 package/stunnel/Config.in             | 5 ++++-
 5 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/package/luvi/Config.in b/package/luvi/Config.in
index c9fd41739..c8921c320 100644
--- a/package/luvi/Config.in
+++ b/package/luvi/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LUVI
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_PACKAGE_LUAJIT
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	depends on BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LUV
 	help
@@ -29,5 +30,5 @@ comment "luvi needs a toolchain w/ NPTL, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
-comment "luvi needs LuaJIT"
-	depends on !BR2_PACKAGE_LUAJIT
+comment "luvi needs LuaJIT and OpenSSL"
+	depends on !BR2_PACKAGE_LUAJIT || BR2_PACKAGE_LIBRESSL
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 345fe1047..921f3c609 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -13,6 +13,9 @@ comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.8, wch
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR
 
+comment "nodejs needs OpenSSL"
+	depends on !BR2_PACKAGE_OPENSSL
+
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
@@ -21,6 +24,7 @@ config BR2_PACKAGE_NODEJS
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_OPENSSL
 	# uses fork()
 	depends on BR2_USE_MMU
 	# uses dlopen(). On ARMv5, we could technically support static
@@ -39,7 +43,7 @@ if BR2_PACKAGE_NODEJS
 
 config BR2_PACKAGE_NODEJS_NPM
 	bool "NPM for the target"
-	select BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_OPENSSL
 	help
 	  NPM is the package manager for the Node JavaScript platform.
 	  Note that enabling NPM on the target also selects OpenSSL for the
diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
index 9827cf82b..19389d1bc 100644
--- a/package/python-cryptography/Config.in
+++ b/package/python-cryptography/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	bool "python-cryptography"
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
-	select BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_PYASN # runtime
@@ -21,3 +21,6 @@ config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 
 comment "python-cryptography needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
+	
+comment "python-cryptography needs OpenSSL"
+	depends on !BR2_PACKAGE_OPENSSL
diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 6433b827d..7fe4b9b7c 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -3,8 +3,8 @@ config BR2_PACKAGE_RAUC
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_DBUS # run-time dependency
 	help
 	  RAUC is the Robust Auto-Update Controller developed by
@@ -35,3 +35,6 @@ endif
 comment "rauc needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
+
+comment "rauc needs OpenSSL"
+	depends on !BR2_PACKAGE_OPENSSL
diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
index e4a956770..e9bc48f6c 100644
--- a/package/stunnel/Config.in
+++ b/package/stunnel/Config.in
@@ -1,9 +1,12 @@
 config BR2_PACKAGE_STUNNEL
 	bool "stunnel"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_OPENSSL
 	help
 	  Stunnel is a program that wraps any TCP connection with an SSL
 	  connection.
 
 	  http://www.stunnel.org/
+
+comment "stunnel needs OpenSSL"
+	depends on !BR2_PACKAGE_OPENSSL
-- 
2.13.3
