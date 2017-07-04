From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 14:22:58 +0200
Subject: [Buildroot] [git commit] icu: propagate host gcc dependency to
	reverse dependencies
Message-ID: <20170704122032.07AF981EBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7af50fddfd94468bb54b6d0ecf7edd1b016f9058
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/821/821eae7add252e3711ed069a2d292a04427fa43b/

Commit 87f43c3403 (package/icu: needs host gcc >= 4.8) added a new toolchain
dependency to icu, but didn't propagate it to the reverse dependencies of
icu.

Some of these have been fixed in later commits, but not all.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cppcms/Config.in               | 5 +++--
 package/midori/Config.in               | 8 +++++---
 package/python-mwscrape2slob/Config.in | 4 +++-
 package/python-slob/Config.in          | 4 +++-
 package/webkitgtk/Config.in            | 4 +++-
 5 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index f02b283..d7b7fa8 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -27,15 +27,16 @@ if BR2_PACKAGE_CPPCMS
 config BR2_PACKAGE_CPPCMS_ICU
 	bool "enable icu support"
 	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Using ICU allows advanced localization features into CppCMS,
 	  in another hand ICU is heavier than iconv.
 
-comment "icu support needs a toolchain w/ gcc >= 4.8"
+comment "icu support needs a toolchain w/ gcc >= 4.8, host gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 endif
 
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 840d689..4d30c83 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,13 +1,15 @@
-comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 4.9"
+comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 4.9, host gcc >= 4.8"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 || \
+		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_MIDORI
 	bool "midori"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, gcr, gnupg2
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # webkitgtk -> icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # webkitgtk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
diff --git a/package/python-mwscrape2slob/Config.in b/package/python-mwscrape2slob/Config.in
index dc2b2ae..7856a2c 100644
--- a/package/python-mwscrape2slob/Config.in
+++ b/package/python-mwscrape2slob/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
 	bool "python-mwscrape2slob"
 	depends on !BR2_BINFMT_FLAT # python-slob -> python-pyicu -> icu
 	depends on BR2_INSTALL_LIBSTDCPP # python-slob -> python-pyicu -> icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # python-slob -> python-pyicu -> icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # python-slob -> python-pyicu -> icu
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_COUCHDB # runtime
@@ -15,7 +16,8 @@ config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
 
 	  https://github.com/itkach/mwscrape2slob
 
-comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 4.8"
+comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 4.8, host gcc >= 4.8"
 	depends on BR2_PACKAGE_PYTHON3 && !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_HOST_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/python-slob/Config.in b/package/python-slob/Config.in
index a8b6e45..6f83808 100644
--- a/package/python-slob/Config.in
+++ b/package/python-slob/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_SLOB
 	bool "python-slob"
 	depends on !BR2_BINFMT_FLAT # python-pyicu -> icu
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyicu -> icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # python-pyicu -> icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # python-pyicu -> icu
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PYICU # runtime
@@ -13,7 +14,8 @@ config BR2_PACKAGE_PYTHON_SLOB
 
 	  https://github.com/itkach/slob
 
-comment "python-slob needs a toolchain w/ C++, gcc >= 4.8"
+comment "python-slob needs a toolchain w/ C++, gcc >= 4.8, host gcc >= 4.8"
 	depends on BR2_PACKAGE_PYTHON3 && !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_HOST_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 0e53d06..0754fe5 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -10,16 +10,18 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
-comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 4.9"
+comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 4.9, host gcc >= 4.8"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_HOST_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_WEBKITGTK
 	bool "webkitgtk"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_LIBGTK3
