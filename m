From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Mar 2012 14:20:18 +0100
Subject: [Buildroot] [git commit] libatomic_ops: make it available only on
	supported architectures
Message-ID: <20120320132248.2AC20953F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68d2124d332a722422d59988183c20d7b254d0af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libatomic_ops build fails on architectures such as MIPS or SuperH that
are not supported. So we make it possible to select the libatomic_ops
package only for the architectures that are known to be supported.

[Peter: add armeb as supported arch]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libatomic_ops/Config.in |    1 +
 package/libdrm/Config.in        |    5 ++++-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index b9f14d1..3d5d0a8 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_LIBATOMIC_OPS
 	bool "libatomic_ops"
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_x86_64
 	help
 	  Atomic operations library
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index d68f9d5..f3dab9a 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -8,7 +8,10 @@ config BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XPROTO_DRI2PROTO
 	select BR2_PACKAGE_PTHREAD_STUBS
-	select BR2_PACKAGE_LIBATOMIC_OPS if BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
+	# libatomic_ops is only available on a subset of the supported
+	# architectures, and we make the assumption that the intel
+	# driver can only be used on x86 and x86_64 machines.
+	select BR2_PACKAGE_LIBATOMIC_OPS if (BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL && (BR2_i386 || BR2_x86_64))
 	help
 	  Direct Rendering Manager
 
