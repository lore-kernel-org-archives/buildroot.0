From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Apr 2014 00:35:46 +0200
Subject: [Buildroot] [git commit] libunwind: needs set/getcontext,
	which only got added to uClibc post-0.9.33
Message-ID: <20140406223628.9F5BC9C550@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2848a3009e71987f9d3ff0cfe5a9f791ac05f3c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/3e8/3e8670ab1454118baf1e4a5ca632d45963ba3781/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libunwind/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 9b55826..1e0e192 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBUNWIND
 	bool "libunwind"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) # {g,s}etcontext
 	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
 		BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64
 	help
@@ -8,7 +9,8 @@ config BR2_PACKAGE_LIBUNWIND
 
 	  http://www.nongnu.org/libunwind/index.html
 
-comment "libunwind needs a toolchain w/ threads"
+comment "libunwind needs a uclibc snapshot or (e)glibc toolchain w/ threads"
 	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
 		BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC)
