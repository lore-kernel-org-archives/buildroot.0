From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:36 +0200
Subject: [Buildroot] [PATCH 27/30] package/qemu: add option to install tools
	on the target
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <acf5c6485ba3f0e908980222495dc7260b5e1323.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Usually, tools on the target are not needed, so they are disabled
by default. Add an option to install them on the target.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 6 ++++++
 package/qemu/qemu.mk   | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 2f9d032..27eb654 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -66,6 +66,12 @@ config QEMU_HAS_EMULS
     def_bool y
     depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER || BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
 
+config BR2_PACKAGE_QEMU_TOOLS_ON_TARGET
+	bool "Install tools on target"
+	help
+	  Say 'y' here to also install QEMU tools (qemu-{img,io,nbd}) on the
+	  target.
+
 if QEMU_HAS_EMULS
 
 comment "Frontends"
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b808c96..5d2b03f 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -256,6 +256,12 @@ else
 QEMU_OPTS += --disable-seccomp
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_TOOLS_ON_TARGET),y)
+QEMU_OPTS += --enable-tools
+else
+QEMU_OPTS += --disable-tools
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_BLOBS),)
 QEMU_OPTS += --disable-blobs
 endif
@@ -344,7 +350,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-smartcard-nss             \
 	        --disable-strip                     \
 	        --disable-sparse                    \
-	        --disable-tools                     \
 	        $(QEMU_OPTS)                        \
 	)
 endef
-- 
1.9.1
