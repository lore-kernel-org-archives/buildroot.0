From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Jan 2020 22:12:35 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/boost: propagate
 boost-thread dependency on a toolchain without bug 64735
Message-ID: <20200107210624.CF26583252@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd1a170eb4351c0a59aa87615404c20567c1433e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Commit d7e49f5f42881f8781e7a8add6e0114af0bd9511 does not fully propagate
the dependency on a toolchain without bug 64735 to reverse dependencies
of boost-thread

Fixes:
 - http://autobuild.buildroot.org/results/2b0ca8ce4df7496dcc7d078fae2114d75bd0a455

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e45825446054617a70bee145a91e0b74068bec71)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/Config.in | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index a053b776fd..121650b8bc 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -101,7 +101,7 @@ comment "boost-contract needs a toolchain w/ NPTL"
 config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context, boost-thread
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_SYSTEM
@@ -189,6 +189,7 @@ config BR2_PACKAGE_BOOST_LOCALE
 	# https://svn.boost.org/trac/boost/ticket/9685 for more
 	# details.
 	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
+	depends on !(BR2_TOOLCHAIN_HAS_GCC_BUG_64735 && BR2_PACKAGE_ICU) # boost-thread
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD if BR2_PACKAGE_ICU
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -199,6 +200,10 @@ comment "boost-locale needs a toolchain w/ dynamic library"
 	depends on BR2_PACKAGE_ICU
 	depends on BR2_STATIC_LIBS
 
+comment "boost-locale needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_ICU
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -327,16 +332,21 @@ config BR2_PACKAGE_BOOST_TIMER
 
 config BR2_PACKAGE_BOOST_TYPE_ERASURE
 	bool "boost-type_erasure"
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Runtime polymorphism based on concepts.
 
+comment "boost-type_erasure needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_BOOST_WAVE
 	bool "boost-wave"
 	# limitation of assembler for coldfire
 	# error: Tried to convert PC relative branch to absolute jump
 	depends on !BR2_m68k_cf
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
@@ -347,4 +357,7 @@ config BR2_PACKAGE_BOOST_WAVE
 	  preprocessor functionality packed behind an easy to use
 	  iterator interface.
 
+comment "boost-wave needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 endif
