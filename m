From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 23:20:53 +0100
Subject: [Buildroot] [git commit] gcc: allow the selection of upstream GCC
 7.x for ARC
Message-ID: <20171201205340.D0F9580E11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b09586c4c3560cb3b0607d91a4a50df6c9d9d775
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream gcc now has support for ARC, as of 7.x, with 7.2 being
usable, so let's allow its selection.

GCC from Synopsys GitHub still has a lot of fixes and improvements
most of which will be a part of the next upstream release but let's
see how it goes and if we see vanilla GCC doesn't require way too many
back-ported patches we'll be able to get rid of Synopsys GitHub here
at all.

As of today the only really required back-port is the one for non-uClibc
libc.

Back-ported from upstream master with help of:
-------------------->8--------------------
git format-patch 927c0132251f -1 -- . ':!gcc/ChangeLog' ':!libgcc/ChangeLog'
-------------------->8--------------------

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...re-script-to-allow-non-uclibc-based-tripl.patch | 51 ++++++++++++++++++++++
 package/gcc/Config.in.host                         |  1 -
 package/gcc/gcc.mk                                 |  2 +-
 3 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/package/gcc/7.2.0/0893-ARC-Configure-script-to-allow-non-uclibc-based-tripl.patch b/package/gcc/7.2.0/0893-ARC-Configure-script-to-allow-non-uclibc-based-tripl.patch
new file mode 100644
index 0000000..4f97c2f
--- /dev/null
+++ b/package/gcc/7.2.0/0893-ARC-Configure-script-to-allow-non-uclibc-based-tripl.patch
@@ -0,0 +1,51 @@
+From 927c0132251f1cd3452b96ebd75f1b06bc53e4ec Mon Sep 17 00:00:00 2001
+From: claziss <claziss@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 10 Jul 2017 13:55:26 +0000
+Subject: [PATCH] [ARC] Configure script to allow non uclibc based triplets
+
+gcc/
+2017-07-10  Vineet Gupta <vgupta@synopsys.com>
+
+        * config.gcc: Remove uclibc from arc target spec.
+
+libgcc/
+2017-07-10  Vineet Gupta <vgupta@synopsys.com>
+
+        * config.host: Remove uclibc from arc target spec.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 250097 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ gcc/config.gcc     | 2 +-
+ libgcc/config.host | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config.gcc b/gcc/config.gcc
+index 1b47457..933a451 100644
+--- a/gcc/config.gcc
++++ b/gcc/config.gcc
+@@ -1044,7 +1044,7 @@ arc*-*-elf*)
+ 	big*)	tm_file="arc/big.h ${tm_file}"
+ 	esac
+ 	;;
+-arc*-*-linux-uclibc*)
++arc*-*-linux*)
+ 	tm_file="arc/arc-arch.h dbxelf.h elfos.h gnu-user.h linux.h linux-android.h glibc-stdint.h arc/linux.h ${tm_file}"
+ 	tmake_file="${tmake_file} arc/t-arc"
+ 	extra_gcc_objs="driver-arc.o"
+diff --git a/libgcc/config.host b/libgcc/config.host
+index 989ac71..a5ab453 100644
+--- a/libgcc/config.host
++++ b/libgcc/config.host
+@@ -383,7 +383,7 @@ arc*-*-elf*)
+ 	extra_parts="crti.o crtn.o crtend.o crtbegin.o crtendS.o crtbeginS.o"
+ 	extra_parts="$extra_parts crttls.o"
+ 	;;
+-arc*-*-linux-uclibc*)
++arc*-*-linux*)
+ 	tmake_file="${tmake_file} t-slibgcc-libgcc t-slibgcc-nolc-override arc/t-arc-uClibc arc/t-arc"
+ 	extra_parts="$extra_parts crti.o crtn.o"
+ 	extra_parts="$extra_parts crttls.o"
+-- 
+2.10.2
+
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 74c1b2f..70cce0a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -58,7 +58,6 @@ config BR2_GCC_VERSION_6_X
 config BR2_GCC_VERSION_7_X
 	bool "gcc 7.x"
 	# Broken or unsupported architectures
-	depends on !BR2_arc
 	depends on !BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 1112003..27fc1e9 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -10,7 +10,7 @@
 
 GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 
-ifeq ($(BR2_arc),y)
+ifeq ($(BR2_GCC_VERSION_ARC),y)
 GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else ifeq ($(BR2_or1k),y)
