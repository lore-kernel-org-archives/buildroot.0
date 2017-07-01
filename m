From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Jul 2017 14:51:21 +0200
Subject: [Buildroot] [PATCH 3/3] core: change the stipr command from a
	choice to a boolean
In-Reply-To: <cover.1498913468.git.yann.morin.1998@free.fr>
References: <cover.1498913468.git.yann.morin.1998@free.fr>
Message-ID: <02528111029d67c8e42a098a1f836806e05c4a49.1498913468.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Curently, we have a choice to select between stripping and not
stripping. This is legacy code from back when we had a third option,
sstrip (super-strip).

Since we removed sstrip, stripping or not stripping is now just a
boolean rather than a choice.

Make it so.

We make BR2_STRIP_Strip default to 'y' to keep the current behaviour of
defaulting to stripping.

Move BR2_STIP_none to legacy, and instruct the user to review the new
setting.

Drop any reference to BR2_STRIP_none in comments.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in              | 13 ++-----------
 Config.in.legacy       |  8 ++++++++
 boot/grub2/grub2.mk    |  2 +-
 package/kexec/kexec.mk |  2 +-
 4 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/Config.in b/Config.in
index 86e10bbe15..72ceadfde6 100644
--- a/Config.in
+++ b/Config.in
@@ -414,13 +414,10 @@ config BR2_DEBUG_3
 endchoice
 endif
 
-choice
-	prompt "strip command for binaries on target"
-	default BR2_STRIP_strip
-
 config BR2_STRIP_strip
-	bool "strip"
+	bool "strip target binaries"
 	depends on !BR2_PACKAGE_HOST_ELF2FLT
+	default y
 	help
 	  Binaries and libraries in the target filesystem will be
 	  stripped using the normal 'strip' command. This allows to save
@@ -428,12 +425,6 @@ config BR2_STRIP_strip
 	  on the target are needed for native debugging, but not when
 	  remote debugging is used.
 
-config BR2_STRIP_none
-	bool "none"
-	help
-	  Do not strip binaries and libraries in the target filesystem.
-endchoice
-
 config BR2_STRIP_EXCLUDE_FILES
 	string "executables that should not be stripped"
 	depends on BR2_STRIP_strip
diff --git a/Config.in.legacy b/Config.in.legacy
index ec28da3a2a..453c5eb8b8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.08"
 
+config BR2_STRIP_none
+	bool "Strip command 'none' has been removed"
+	select BR2_LEGACY
+	help
+	  The strip command choice has been changed into a single
+	  boolean option. Please check that the new setting is
+	  correct (in the "Build options" sub-menu)
+
 config BR2_PACKAGE_BEECRYPT_CPP
 	bool "C++ support removed in beecrypt"
 	select BR2_LEGACY
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index dc019835ab..aa3f4dd8cb 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -46,7 +46,7 @@ endif
 # bootloader itself; none of these are used to build the native
 # tools.
 #
-# NOTE: TARGET_STRIP is overridden by BR2_STRIP_none, so always
+# NOTE: TARGET_STRIP is overridden by !BR2_STRIP_strip, so always
 # use the cross compile variant to ensure grub2 builds
 
 GRUB2_CONF_ENV = \
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 7564103bfc..dd67eab0ca 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -10,7 +10,7 @@ KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
 KEXEC_LICENSE_FILES = COPYING
 
-# Makefile expects $STRIP -o to work, so needed for BR2_STRIP_none
+# Makefile expects $STRIP -o to work, so needed for !BR2_STRIP_strip
 KEXEC_MAKE_OPTS = STRIP="$(TARGET_CROSS)strip"
 
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
-- 
2.11.0
