From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Oct 2020 23:01:28 +0200
Subject: [Buildroot] [git commit] package/mesa3d: drop r100 dependency on
 _HAS_ATOMIC
Message-ID: <20201006205232.9EA258EB92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b029cac1bcacc957407e6437ffd371171f0607a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This partially reverts commit a3aac6d84713db7e6d2683eabf965eae21ce48bf,
just dropping the atomic dependency.

That dependency would introduce a "recursive dependency" chain in
Kconfig.

However, r100 is only available on i386 and x86-64, and they both have
sync4, which means libdrm's HAS_ATOMICS is always 'y' when r100 is
available.

So, like we did in 00c1a8c34f7 (package/mesa3d: propagate missing
libdrm-freedreno deps), we just add a fat comment that explains why the
dependency is not propagated.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 5b9fbc64cc..ebfc422bf2 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -372,7 +372,11 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	bool "DRI radeon r100 driver"
 	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
+	# libdrm's radeon option depends on LIBDRM_HAS_ATOMIC. Propagating
+	# that dependency here causes a circular dependency that Kconfig
+	# can't see is just spurious. However, that dependency is about
+	# the toolchain having sync4 primitives, which is always a given
+	# for i386 and x86_64.
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_RADEON
 	help
