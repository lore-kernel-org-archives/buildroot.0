From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 21:20:57 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/qemu: disable vnc
 optional support for the host variant
Message-ID: <20200510191329.150E99131F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1df0dd3cb01fb79c24617b66ffa36c986162a5c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The vnc support is enabled by default and the build system
will try to detect automatically some external libraries
installed on the host for vnc-png, vnc-jpeg and vnc-sasl.

$ ldd output/host/bin/qemu-system-aarch64
	[...]
	libpng16.so.16 => /lib64/libpng16.so.16
or
	libpng16.so.16 => output/host/lib/libpng16.so.16
if host-libpng is built before host-qemu.

Disable explicitely thoses options to improve the build
reproducibility.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ece36b9a46583315fe0d607099e16949ed6c2b0b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 3c3b098a5b..b8904ffe18 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -304,6 +304,9 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--extra-ldflags="$(HOST_LDFLAGS)" \
 		--python=$(HOST_DIR)/bin/python3 \
 		--disable-libssh \
+		--disable-vnc-jpeg \
+		--disable-vnc-png \
+		--disable-vnc-sasl \
 		$(HOST_QEMU_OPTS)
 endef
 
