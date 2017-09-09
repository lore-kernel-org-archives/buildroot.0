From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat,  9 Sep 2017 08:05:36 -0300
Subject: [Buildroot] [PATCH] stella: fix build without threads support
Message-ID: <1504955136-10831-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build error when building using toolchain without threads support:

src/common/tv_filters/AtariNTSC.hxx:172:16: error: 'thread' is not a member of 'std'
     unique_ptr<std::thread[]> myThreads;
                     ^~~

Since version 5.0.2, Stella needs a toolchain with threads support.

Fixes:
http://autobuild.buildroot.net/results/bd30388ee24294158d0a373764408c8c846853d4
http://autobuild.buildroot.net/results/ad1571cecfc697650b436c147b5f3a1b4326091d
http://autobuild.buildroot.net/results/10b73362358f3af45534a0cd096672dd1460a7d0

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/stella/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/stella/Config.in b/package/stella/Config.in
index 959169726f37..639b9e4ae787 100644
--- a/package/stella/Config.in
+++ b/package/stella/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_STELLA
 	bool "stella"
 	depends on !BR2_STATIC_LIBS # sdl2
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_LIBPNG
@@ -11,6 +12,7 @@ config BR2_PACKAGE_STELLA
 
 	  https://stella-emu.github.io/
 
-comment "stella needs a toolchain w/ dynamic library, C++, gcc >= 4.9"
+comment "stella needs a toolchain w/ dynamic library, C++, threads, gcc >= 4.9"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
1.9.1
