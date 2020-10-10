From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:39:16 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/mesa3d: drop r100
 dependency on _HAS_ATOMIC
Message-ID: <20201010203757.10AB17FD9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e6c492f5e77eed3e5fabf8334cd52c70a9373d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

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
(cherry picked from commit 0b029cac1bcacc957407e6437ffd371171f0607a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
