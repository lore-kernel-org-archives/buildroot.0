From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Sep 2020 14:29:32 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/libcamera:
 Prevent builds on m68k
Message-ID: <20200905123344.E78D38028C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d68375b9cc872cade39b01f3dd14c5fa2e3ec65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

The ControlValue structure is currently defined with a 16-bit hole
(causing unaligned access to the numElements_ field, though that's a
separate topic).

This structure has a static assertion to ensure that its size does not
change without due care, as it forms part of our ABI and is used in
Serialisation between the pipeline handlers and IPA components.

The m68k architecture is the only target which fails this assertion,
which is likely because it can pack the structure more efficiently,
producing a different binary size.

This is likely an area we will tackle before stabilising our ABI, but
until then, disable m68k builds as libcamera is not expected to be
supported on this target.

Fixes;
  - http://autobuild.buildroot.net/results/9dce26e94299a2c61bba60cbc7803926e2f85e29/

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
[yann.morin.1998 at free.fr, suggestions from Thomas:
  - introduce BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
  - propagate that to the comment
  - add autobuilder reference
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 66526e3518e01a3fe16dede165c7890d194b7816)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 960d78b82e..39741e4412 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -1,5 +1,12 @@
+config BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
+	bool
+	default y
+	# Invalid packing size of ControlValue struct on m68k
+	depends on BR2_m68k
+
 menuconfig BR2_PACKAGE_LIBCAMERA
 	bool "libcamera"
+	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
@@ -64,5 +71,6 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC
 endif # BR2_PACKAGE_LIBCAMERA
 
 comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 5"
+	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
