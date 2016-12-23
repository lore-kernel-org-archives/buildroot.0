From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Dec 2016 14:36:38 +0100
Subject: [Buildroot] [git commit] xfsprogs: disable on musl
Message-ID: <20161223133717.8CCED80AC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ecc6da3b1ac245f017a7dd5b85cc778af09297dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Despite a recent bump, xfsprogs still doesn't build on musl. It's been
failing for a long long time, so let's disable it in this configuration.

Fixes:

  http://autobuild.buildroot.net/results/c6cd42da1abe2936872da1f9db093ffc72be3c15/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xfsprogs/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 6e1a935..a82663f 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -1,11 +1,12 @@
-comment "xfsprogs needs a toolchain w/ wchar"
+comment "xfsprogs needs a glibc or uClibc toolchain w/ wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # util-linux
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
