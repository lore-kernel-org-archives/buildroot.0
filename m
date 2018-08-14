From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Aug 2018 22:34:20 +0200
Subject: [Buildroot] [PATCH v2,2/2] boost: thread needs chrono
In-Reply-To: <20180814203420.10964-1-fontaine.fabrice@gmail.com>
References: <20180814203420.10964-1-fontaine.fabrice@gmail.com>
Message-ID: <20180814203420.10964-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

chrono is selected by thread (see libs/thread/build/Jamfile.v2):

rule usage-requirements ( properties * )
{
[...]
result += <library>/boost/chrono//boost_chrono ;
}

So add this select for BR2_PACKAGE_BOOST_THREAD and remove it from
BR2_PACKAGE_BOOST_COROUTINE, BR2_PACKAGE_BOOST_LOG,
BR2_PACKAGE_TYPE_ERASURE and BR2_PACKAGE_BOOST_WAVE

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Split patch in two and move select of chrono from locale to thread

 package/boost/Config.in | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 69fd6158ca..b3f5f6aea6 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -101,7 +101,6 @@ config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
-	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
@@ -206,7 +205,6 @@ config BR2_PACKAGE_BOOST_LOG
 	# log module
 	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
 	select BR2_PACKAGE_BOOST_ATOMIC
-	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
@@ -315,6 +313,7 @@ config BR2_PACKAGE_BOOST_TEST
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
 	select BR2_PACKAGE_BOOST_ATOMIC if BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Portable C++ multi-threading. C++11, C++14.
@@ -328,7 +327,6 @@ config BR2_PACKAGE_BOOST_TIMER
 
 config BR2_PACKAGE_BOOST_TYPE_ERASURE
 	bool "boost-type_erasure"
-	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
@@ -339,7 +337,6 @@ config BR2_PACKAGE_BOOST_WAVE
 	# limitation of assembler for coldfire
 	# error: Tried to convert PC relative branch to absolute jump
 	depends on !BR2_m68k_cf
-	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
-- 
2.14.1
