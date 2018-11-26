From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 20:59:33 +0100
Subject: [Buildroot] [git commit] boot/grub2: add option to install tools
Message-ID: <20181202071559.B6A83803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d9566b7b7a6d34a37e88426e483e8ceb8568c8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to install grub2 support tools to the target.

In the context of Buildroot, some useful target tools provided are
grub2-editenv, grub2-reboot, which provide means to manage the grub2,
environment, boot order, and others.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/grub2/Config.in           | 9 +++++++++
 boot/grub2/grub2.mk            | 5 +++++
 support/scripts/check-bin-arch | 4 ++++
 3 files changed, 18 insertions(+)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 9a61b3b633..e33d24f62f 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -76,6 +76,15 @@ config BR2_TARGET_GRUB2_BUILTIN_CONFIG
 	  device and other configuration parameters, but however menu
 	  entries cannot be described in this embedded configuration.
 
+config BR2_TARGET_GRUB2_INSTALL_TOOLS
+	bool "install tools"
+	help
+	  Install support tools to interact with GNU GRUB Multiboot
+	  boot loader.
+
+	  This will also install the Grub 2 loadable modules to the
+	  target.
+
 endif # BR2_TARGET_GRUB2
 
 comment "grub2 needs a toolchain w/ wchar"
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 1b366d0407..bb678ef5de 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -12,7 +12,12 @@ GRUB2_LICENSE_FILES = COPYING
 GRUB2_DEPENDENCIES = host-bison host-flex host-grub2
 HOST_GRUB2_DEPENDENCIES = host-bison host-flex
 GRUB2_INSTALL_IMAGES = YES
+
+ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
+GRUB2_INSTALL_TARGET = YES
+else
 GRUB2_INSTALL_TARGET = NO
+endif
 
 GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
 GRUB2_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index 7f97696735..66b8d89932 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -20,6 +20,10 @@ declare -a IGNORES=(
 	# pru-software-support) legitimately install ELF binaries that
 	# are not for the target architecture
 	"/usr/share"
+
+	# Skip files in /lib/grub, since it is possible to have it
+	# for a different architecture (e.g. i386 grub on x86_64).
+	"/lib/grub"
 )
 
 while getopts p:l:r:a:i: OPT ; do
