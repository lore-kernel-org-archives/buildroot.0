From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 23:26:06 +0200
Subject: [Buildroot] [git commit] grub2: force -fno-stack-protector in
 CPPFLAGS
Message-ID: <20180419212908.0D1FE88844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=523b27afa941bc0a78f7b2eae8e97329c112782d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 2a27294e9ade6130a12ced9a1f152c51431a870e ("grub2: force
-fno-stack-protector in CFLAGS"), a fix was made to the grub2 package
to make it build properly even when SSP support is enabled.

However, commit 20a4583ebf7fe97ea22a1ea11621dd44a8114ca5 ("security
hardening: add RELFO, FORTIFY options") reworked how SSP options are
passed, and they are now passed in CPPFLAGS instead of CFLAGS, making
the fix introduced by 2a27294e9ade6130a12ced9a1f152c51431a870e no
longer operating.

This commit will force no-stack-protector in CPPFLAGS instead of
CFLAGS.

Fixes bug #10961.

Signed-off-by: Tarek El-Sherbiny <tarek_el-sherbiny@waters.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/grub2/grub2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 492cddf1a5..35aea41287 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -53,8 +53,8 @@ GRUB2_CONF_ENV = \
 	$(HOST_CONFIGURE_OPTS) \
 	CPP="$(HOSTCC) -E" \
 	TARGET_CC="$(TARGET_CC)" \
-	TARGET_CFLAGS="$(TARGET_CFLAGS) -fno-stack-protector" \
-	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
+	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
+	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -fno-stack-protector" \
 	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
 	NM="$(TARGET_NM)" \
 	OBJCOPY="$(TARGET_OBJCOPY)" \
