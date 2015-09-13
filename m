From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Sep 2015 22:50:00 +0200
Subject: [Buildroot] [git commit] package/valgrind: disable for static-only
	builds
Message-ID: <20150913205032.EF1BB81D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1cb27b6049c4ebf0a82ace4606a93bbd46612834
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/3b6/3b6f253f30afaee428ea0fc559be210dcec61dae
http://autobuild.buildroot.net/results/60e/60e5a49360e2ee9482b4d548789f874a6502c429
http://autobuild.buildroot.net/results/5cc/5ccc2e48fa4deb90ab214c82e8921ec494555457
http://autobuild.buildroot.net/results/452/4524184b407bb6f9b55f8f85c8e0b475ff105420

Valgrind ordinarily works by preloading a shared object to replace malloc,
free and friends. Some combinations of toolchain/libc allow this to build
with -static, but others complain.

Since it makes little sense to try to build this on a static-only system,
this patch disables it on static platforms entirely.

[Peter: move comment to top of file to fix menuconfig indentation]
Signed-off-by: Brendan Heading <brendanheading@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/valgrind/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 8da007b..21b2608 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -1,9 +1,13 @@
+comment "valgrind needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_VALGRIND
 	bool "valgrind"
 	depends on BR2_ARM_CPU_ARMV7A || BR2_i386 || \
 		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
 		   BR2_x86_64
+	depends on !BR2_STATIC_LIBS
 	help
 	  Tool for debugging and profiling Linux programs.
 
