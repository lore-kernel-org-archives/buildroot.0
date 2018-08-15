From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 22:15:44 +0200
Subject: [Buildroot] [git commit] boost: thread needs chrono
Message-ID: <20180815200853.528638D3F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6607d6656319e8801ba2c9d5e74a54ad6e2900ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 035a450d12..b7991ae367 100644
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
@@ -314,6 +312,7 @@ config BR2_PACKAGE_BOOST_TEST
 
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
+	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Portable C++ multi-threading. C++11, C++14.
@@ -327,7 +326,6 @@ config BR2_PACKAGE_BOOST_TIMER
 
 config BR2_PACKAGE_BOOST_TYPE_ERASURE
 	bool "boost-type_erasure"
-	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
@@ -338,7 +336,6 @@ config BR2_PACKAGE_BOOST_WAVE
 	# limitation of assembler for coldfire
 	# error: Tried to convert PC relative branch to absolute jump
 	depends on !BR2_m68k_cf
-	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
