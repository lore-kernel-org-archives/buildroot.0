From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 20:18:10 +0200
Subject: [Buildroot] [git commit] package/qemu: disable bzip2 for the host
 variant
Message-ID: <20200406180603.B257D8C9F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=743fceb2ed05ab055c1e83e4f1a5ebc893160727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bzip2 support is needed for reading bzip2-compressed dmg images.

But the host-bzip2 is missing from host qemu package dependency,
so the qemu build system will try to detect automatically the
external libbzip2 libraries installed on the host.

$ ldd output/host/bin/qemu-system-aarch64
	[...]
	libbz2.so.1 => /lib64/libbz2.so.1
or
	libbz2.so.1.0 => output/host/lib/libbz2.so.1.0
if host-bzip2 is built before host-qemu.

Disable explicitely bzip2 options to improve the build
reproducibility.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b8904ffe18..06841a56d0 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -303,6 +303,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--extra-cflags="$(HOST_QEMU_CFLAGS)" \
 		--extra-ldflags="$(HOST_LDFLAGS)" \
 		--python=$(HOST_DIR)/bin/python3 \
+		--disable-bzip2 \
 		--disable-libssh \
 		--disable-vnc-jpeg \
 		--disable-vnc-png \
