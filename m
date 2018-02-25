From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 22:40:17 +0100
Subject: [Buildroot] [git commit] uboot: use local fdt headers
Message-ID: <20180225214110.79DDA881DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=baae5156ce37e8b2775f04710f7d1c8e97e4114c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After commit b8c3e941731d ("package/dtc: qemu system build need libfdt")
changed the dtc install target from 'install-bin' to 'install', uboot
compilation failures occurred because libfdt related headers were now
suddenly taken from output/host/include rather than from the uboot sources
itself.

Commit 3a6573ccee26 ("uboot: use local libfdt.h") solved this by patching
one specific uboot source file, tools/fdtgrep.c, to replace '<...>'-style
includes by '"..."'-style includes.

However, depending on the uboot version, this may not be enough: there may
be other references to fdt header files. In particular taking into account
that it is not uncommon to have vendor-provided uboot trees which have
custom changes.

The root of the problem is that the uboot.mk file passes the host compiler
as follows:
	UBOOT_MAKE_OPTS += \
		...
		HOSTCC="$(HOSTCC) $(HOST_CFLAGS)" \
		...
where HOST_CFLAGS contains the string '-I$(HOST_DIR)/include'
The uboot makefiles then use constructs of the form:
	$(CC) $(CPPFLAGS) $(CFLAGS) .....
where CPPFLAGS may contain -I references pointing to local directories.

On the expanded compiler command-line, Buildroot's '-I$(HOST_DIR)/include'
is thus present _before_ any -I to local directories, and thus takes
precedence.  And that becomes a problem for header files present both
locally as in the Buildroot host directory, which is the case for libfdt.

To fix this problem without having to patch u-boot sources, use '-idirafter'
rather than '-I' to pass the Buildroot host include directory. '-idirafter'
is basically the same thing, but adds the specified directory at the end
of the include precedence chain, rather than at the beginning.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d2f241cd8b..977f44cad8 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -131,7 +131,7 @@ endif
 UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	ARCH=$(UBOOT_ARCH) \
-	HOSTCC="$(HOSTCC) $(HOST_CFLAGS)" \
+	HOSTCC="$(HOSTCC) $(subst -I/,-idirafter /,$(subst -I /,-idirafter /,$(HOST_CFLAGS)))" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
