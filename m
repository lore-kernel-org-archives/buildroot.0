From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 20:18:06 +0200
Subject: [Buildroot] [git commit] package/qemu: disable libssh for the host
 variant
Message-ID: <20200406180603.A118B8C9F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c4a80c7c406f2311f06c5d3eb250127c7cdb956
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no host-libssh in Buildroot, avoid qemu build system
to find libssh from the host.

Under certain circumstances (host distribution, openssl version), the
qemu-system binary fail to start:

host/bin/qemu-system-aarch64: symbol lookup error: /lib64/libssh.so.4: undefined symbol: EVP_KDF_ctrl, version OPENSSL_1_1_1b

$ ldd output/host/bin/qemu-system-aarch64
	[...]
	libssh.so.4 => /lib64/libssh.so.4

Explicitely disable libssh for the host variant.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b2249ed4ee..3c3b098a5b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -303,6 +303,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--extra-cflags="$(HOST_QEMU_CFLAGS)" \
 		--extra-ldflags="$(HOST_LDFLAGS)" \
 		--python=$(HOST_DIR)/bin/python3 \
+		--disable-libssh \
 		$(HOST_QEMU_OPTS)
 endef
 
