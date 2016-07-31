From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jul 2016 20:19:40 +0200
Subject: [Buildroot] [git commit] grub2: fix build with BR2_STRIP_none
Message-ID: <20160731183025.2C1E7802F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc174b7057495ebb31393ae27f3ceeefdc490022
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

grub2 assumes the strip command will generate output and the output should
always be stripped - so, just use the $(TARGET_CROSS)strip to make sure that
the build succeeds regardless of the buildroot strip configuration.

Signed-off-by: Charles Hardin <ckhardin@exablox.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub2/grub2.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 112a401..dc4e51e 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -45,6 +45,9 @@ endif
 # the confusion, it also uses NM, OBJCOPY and STRIP to build the
 # bootloader itself; none of these are used to build the native
 # tools.
+#
+# NOTE: TARGET_STRIP is overridden by BR2_STRIP_none, so always
+# use the cross compile variant to ensure grub2 builds
 
 GRUB2_CONF_ENV = \
 	$(HOST_CONFIGURE_OPTS) \
@@ -55,7 +58,7 @@ GRUB2_CONF_ENV = \
 	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
 	NM="$(TARGET_NM)" \
 	OBJCOPY="$(TARGET_OBJCOPY)" \
-	STRIP="$(TARGET_STRIP)"
+	STRIP="$(TARGET_CROSS)strip"
 
 GRUB2_CONF_OPTS = \
 	--target=$(GRUB2_TARGET) \
