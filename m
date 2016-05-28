From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 19:46:47 +0200
Subject: [Buildroot] [git commit] core/pkg-kconfig: pass host
	PKG_CONFIG_PATH env var
Message-ID: <20160528174846.D6291819C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02302d21536b9c19cd87733f4eb1bd62065416bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is basically the same change as in 0515fe45661b6d320f8d2071df2
("Makefile: pass host PKG_CONFIG_PATH at "make menuconfig" time"). That
commit made sure to pass host PKG_CONFIG_PATH when invoking Buildroot's
own menuconfig program. This change ensures that the same is true for
third party menuconfig programs (i.e. Linux, uClibc and Busybox).

This unbreaks "make {linux,uclibc}-menuconfig" for host platforms which
rely on PKG_CONFIG_PATH to find .pc files (e.g. NixOS). (When Busybox
updates to a more recent Kconfig snapshot, one that uses pkg-config to
find ncurses, "make busybox-menuconfig" will also start working.)

Tested on Ubuntu and NixOS:

  $ make qemu_arm_versatile_defconfig
  $ make linux-menuconfig
  $ make

Signed-off-by: Bj??rn Forsman <bjorn.forsman@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 40d2f88..b0f5178 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -143,7 +143,8 @@ endif
 # nconfig, gconfig, xconfig).
 # So we simply remove our PATH and PKG_CONFIG_* variables.
 $(2)_CONFIGURATOR_MAKE_ENV = \
-	$$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV))
+	$$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV)) \
+	PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)"
 
 # Configuration editors (menuconfig, ...)
 #
