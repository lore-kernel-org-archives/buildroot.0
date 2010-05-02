From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sun, 2 May 2010 09:41:29 +0200
Subject: [Buildroot] [git commit master] busybox: pass EXTRA_LDFLAGS for
	external toolchains
Message-ID: <20100502074440.D1AA78A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=532e1fb5d3571591c3602387d5971830b708f83e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1321

[Peter: Rework patch to make it apply to git]
Signed-off-by: Grant Edwards <grant.b.edwards@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    1 +
 package/busybox/busybox.mk |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4eccaf0..46b9757 100644
--- a/CHANGES
+++ b/CHANGES
@@ -47,6 +47,7 @@
 	#1219: kernel headers not correctly installed into toolchain/staging
 	#1273: BR2_INET_IPV6 does not enable IPv6 in pppd
 	#1303: Add librsync package
+	#1321: Busybox link fails due to lack of --sysroot option
 	#1327: mtd-utils compile failure due to lack of --sysroot in CFLAGS
 	#1345: Bump pppd to 2.4.5 and convert to Makefile.autotools.in
 	#1369: cannot build radvd (flex problem)
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 05a6d94..668861d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -107,12 +107,14 @@ endif
 $(BUSYBOX_DIR)/busybox: $(BUSYBOX_DIR)/.config
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
+		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		ARCH=$(KERNEL_ARCH) -C $(BUSYBOX_DIR)
 
 $(TARGET_DIR)/bin/busybox: $(BUSYBOX_DIR)/busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX_FULLINSTALL),y)
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
+		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		ARCH=$(KERNEL_ARCH) -C $(BUSYBOX_DIR) install
 else
 	install -D -m 0755 $(BUSYBOX_DIR)/busybox $(TARGET_DIR)/bin/busybox
-- 
1.6.3.3
