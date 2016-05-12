From: Charles Hardin <ckhardin@exablox.com>
Date: Thu, 12 May 2016 11:04:10 -0700
Subject: [Buildroot] [FYI] if BR2_STRIP_none=y then grub2 doesn't build
Message-ID: <1F75FA56-B481-497A-8922-9A856A3EC5E8@exablox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tracked this down to the TARGET_STRIP getting set to ?true? but grub2 expects
the STRIP command to actually generate output.

if test x = xyes; then   true  -o kernel.img.bin kernel.exec;    -felf64 -nr:_grub_mod_init:grub_mod_init -nr:_grub_mod_fini:grub_mod_fini -ed2022 -wd1106 -nu -nd kernel.img.bin kernel.img; else true  -R .rel.dyn -R .reginfo -R .note -R .comment -R .note.gnu.gold-version --strip-unneeded -K start -R .note -R .comment -R .note.gnu.gold-version  -o kernel.img kernel.exec; fi
if test x = xyes; then   true  -o kernel.img.bin kernel.exec;    -felf64 -nr:_grub_mod_init:grub_mod_init -nr:_grub_mod_fini:grub_mod_fini -ed2022 -wd1106 -nu -nd kernel.img.bin kernel.img; else true  -R .rel.dyn -R .reginfo -R .note -R .comment -R .note.gnu.gold-version --strip-unneeded -K start -R .note -R .comment -R .note.gnu.gold-version  -o kernel.img kernel.exec; fi

You can see the ?true? not doing anything to make the kernel.img

So, this diff makes grub2 build and work regardless of BR2_STRIP_none - but,
this pattern isn?t used anywhere else so it is unclear if it is appropriate.

I?ll toss a patch over the fence in a bit.

Regards,
Charles

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 88a46f4..9cc800c 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -55,7 +55,7 @@ GRUB2_CONF_ENV = \
        TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
        NM="$(TARGET_NM)" \
        OBJCOPY="$(TARGET_OBJCOPY)" \
-       STRIP="$(TARGET_STRIP)"
+       STRIP="$(TARGET_CROSS)strip"
 
 GRUB2_CONF_OPTS = \
        --target=$(GRUB2_TARGET) \

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160512/924161d6/attachment.html>
