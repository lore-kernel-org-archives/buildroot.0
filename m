From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Feb 2020 10:12:38 +0100
Subject: [Buildroot] [git commit] package/mesa3d: fix iris driver depends
 and selects
Message-ID: <20200209090520.132518D6FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3268650a67982b7273cf592e029777f0c214c024
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iris is inherently an x86-only driver, and it hard codes gcc options
specific to x86m like -msse2, causing build breakage on other
architectures.

iris also does not use kmsro, but the select was accidentally added when
iris was introduced.

Fix both by adding the missing dependency to x86, and by removing the
select to kmsro.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr:
  - ad dependency to x86
  - reword commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 94e3f2cb9e..3d72c60d1f 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -115,8 +115,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
+	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
-	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	help
 	  Mesa driver for iris-based Intel GPUs.
 
