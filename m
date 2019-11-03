From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun,  3 Nov 2019 12:12:58 -0300
Subject: [Buildroot] [PATCH RFC 2/2] package/qemu: search for host-dtc
 (libfdt) headers at the right place
In-Reply-To: <20191103151258.11047-1-unixmania@gmail.com>
References: <20191103151258.11047-1-unixmania@gmail.com>
Message-ID: <20191103151258.11047-3-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The libfdt headers are installed at $(HOST_DIR)/include/libfdt now, to
prevent conflicts with the kernel dtc code. Pass that path to the qemu
configure script, otherwise it uses its bundled copy of libfdt.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/qemu/qemu.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a91f9d3eeb..1a5c642726 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -246,9 +246,12 @@ endif
 endif
 HOST_QEMU_SYS_ARCH ?= $(HOST_QEMU_ARCH)
 
+HOST_QEMU_CFLAGS = $(HOST_CFLAGS)
+
 ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
 HOST_QEMU_TARGETS += $(HOST_QEMU_SYS_ARCH)-softmmu
 HOST_QEMU_OPTS += --enable-system --enable-fdt
+HOST_QEMU_CFLAGS += -I$(HOST_DIR)/include/libfdt
 HOST_QEMU_DEPENDENCIES += host-dtc
 else
 HOST_QEMU_OPTS += --disable-system
@@ -297,7 +300,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--interp-prefix=$(STAGING_DIR) \
 		--cc="$(HOSTCC)" \
 		--host-cc="$(HOSTCC)" \
-		--extra-cflags="$(HOST_CFLAGS)" \
+		--extra-cflags="$(HOST_QEMU_CFLAGS)" \
 		--extra-ldflags="$(HOST_LDFLAGS)" \
 		$(HOST_QEMU_OPTS)
 endef
-- 
2.18.1
