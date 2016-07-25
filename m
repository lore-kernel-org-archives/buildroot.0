From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 22:07:05 +0200
Subject: [Buildroot] [git commit] grub2: add patch to fix build with recent
	gcc versions
Message-ID: <20160725200922.E97E8818ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4770c4ef83f89fc3348fd6df636b0e4adac05d16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit backports a patch from upstream grub2 that fixes a build
issue occuring at least with recent gcc versions:

gettext/gettext.c:37:36: error: storage size of 'main_context' isn't known
 static struct grub_gettext_context main_context, secondary_context;

Fixes bug #8991.

Bug reproduced with:

BR2_x86_64=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_GCC_VERSION_6_X=y
BR2_TARGET_GRUB2=y
BR2_TARGET_GRUB2_X86_64_EFI=y
BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop terminal"

and verified fixed after adding this patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ettext-gettext.c-main_context-secondary_c.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/boot/grub2/0002-grub-core-gettext-gettext.c-main_context-secondary_c.patch b/boot/grub2/0002-grub-core-gettext-gettext.c-main_context-secondary_c.patch
new file mode 100644
index 0000000..94be092
--- /dev/null
+++ b/boot/grub2/0002-grub-core-gettext-gettext.c-main_context-secondary_c.patch
@@ -0,0 +1,39 @@
+From f30c692c1f9ef0e93bee2b408a24baa017f1ca9d Mon Sep 17 00:00:00 2001
+From: Vladimir Serbinenko <phcoder@gmail.com>
+Date: Thu, 7 Nov 2013 01:01:47 +0100
+Subject: [PATCH] 	* grub-core/gettext/gettext.c (main_context),
+ (secondary_context): 	Define after defining type and not before.
+
+[Thomas: backport from upstream commit
+f30c692c1f9ef0e93bee2b408a24baa017f1ca9d, and remove ChangeLog
+modifications to avoid conflicts.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ grub-core/gettext/gettext.c | 4 ++--
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index df73570..4880cef 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -34,8 +34,6 @@ GRUB_MOD_LICENSE ("GPLv3+");
+    http://www.gnu.org/software/autoconf/manual/gettext/MO-Files.html .
+ */
+ 
+-static struct grub_gettext_context main_context, secondary_context;
+-
+ static const char *(*grub_gettext_original) (const char *s);
+ 
+ struct grub_gettext_msg
+@@ -69,6 +67,8 @@ struct grub_gettext_context
+   struct grub_gettext_msg *grub_gettext_msg_list;
+ };
+ 
++static struct grub_gettext_context main_context, secondary_context;
++
+ #define MO_MAGIC_NUMBER 		0x950412de
+ 
+ static grub_err_t
+-- 
+2.7.4
+
