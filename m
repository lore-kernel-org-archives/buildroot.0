From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:39:48 +0100
Subject: [Buildroot] [git commit] package/mesa3d: fix circular dependency in
 Kconfig
Message-ID: <20200211223134.01CD68DB62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=274d586060ec240ad9a1424a21101765a5f8cff3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the r300 driver was introduced in c5ae77c97 (package/mesa3d: add
support for gallium r300 driver), a last-minute fix was introduced by
Yann, to properly propagate the dependency of a selected symbol.

However, this ended up causing a spurious circular dependency that does
not really exists, but that Kconfig is not smart enough to detect is in
fact OK.

Fixing this is pretty non-obvious, but we have an easy way out: the
dependency is about libdrm's radeon driver requirement for a toolchain
that has the sync4 family of primitives, which is always a given for an
x86 toolchain. As the radeon r300 driver is x86-only, this dependency is
forcefully fulfilled.

So, we drop the propagated dependency, and replace it by a fat comment.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index ff39652508..dbfc59bad5 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -169,7 +169,11 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300
 	bool "Gallium Radeon R300 driver"
 	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC # libdrm's radeon
+	# lbdrm's radeon option depends on LIBDRM_HAS_ATOMIC. Propagating
+	# that dependency here causes a circular dependency that Kconfig
+	# can't see is just spurious. However, that dependency is about
+	# the toolchain having sync4 primitives, which is always a given
+	# for x86.
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_RADEON
 	help
