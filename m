From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Mon, 19 Feb 2018 16:56:31 +0100
Subject: [Buildroot] [PATCH master 1/2] uboot: use local fdt headers
In-Reply-To: <20180219155632.30086-1-thomas.de_schampheleire@nokia.com>
References: <20180219155632.30086-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180219155632.30086-2-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---

Note: it is to be discussed whether we want to change $(HOST_CFLAGS)
globally to use -idirafter rather than -I. It may be risky.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
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
-- 
2.13.6
