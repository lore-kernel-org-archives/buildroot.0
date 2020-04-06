From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 Apr 2020 16:21:57 +0200
Subject: [Buildroot] [PATCH 2/4] package/qemu: disable vnc optional support
 for the host variant
In-Reply-To: <20200406142159.592563-1-romain.naour@gmail.com>
References: <20200406142159.592563-1-romain.naour@gmail.com>
Message-ID: <20200406142159.592563-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
 
-- 
2.25.1
