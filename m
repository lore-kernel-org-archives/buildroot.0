From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Dec 2009 18:41:15 +0100
Subject: [Buildroot] [git commit master] kernel-headers: make snapshot
	option more user friendly
Message-ID: <20091206174304.BAC2377787@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=79c9a433ed0baaf568aa8b27c692001798905742
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #751.

Make kernel headers snapshot more user friendly by making it more obvious
that it's about using a local kernel snapshot, and error out with a sensible
error message if the option is enabled but no linux-2.6.tar.bz2 is present
in DL_DIR, rather than trying to fetch it from kernel.org.

Furthermore fix the bug where it tried to use linux-2.6..tar.bz2 instead of
linux-2.6.tar.bz2.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    1 +
 toolchain/kernel-headers/Config.in                 |    2 +-
 .../kernel-headers/kernel-headers-new.makefile     |    3 ++-
 toolchain/kernel-headers/kernel-headers.mk         |    3 +++
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 13ba876..04c677b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,6 +4,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#751: Kernel 2.6 snapshot fetch fail
 	#753: Bump lighttpd package to 1.4.25
 	#761: Add binutils 2.20 to toolchain options
 
diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 2677409..df0f9c8 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -47,7 +47,7 @@ choice
 		bool "Linux 2.6 (manually specified version)"
 
 	config BR2_KERNEL_HEADERS_SNAP
-		bool "Linux 2.6 snapshot"
+		bool "Local Linux snapshot (linux-2.6.tar.bz2)"
 endchoice
 
 config BR2_KERNEL_HEADERS_RT
diff --git a/toolchain/kernel-headers/kernel-headers-new.makefile b/toolchain/kernel-headers/kernel-headers-new.makefile
index 29deaae..d0a3f2a 100644
--- a/toolchain/kernel-headers/kernel-headers-new.makefile
+++ b/toolchain/kernel-headers/kernel-headers-new.makefile
@@ -13,9 +13,10 @@ EXTRAVERSION:=$(word 4, $(LNXVER))
 LOCALVERSION:=
 
 # should contain prepended dot
+SUBLEVEL:=$(if $(SUBLEVEL),.$(SUBLEVEL),)
 EXTRAVERSION:=$(if $(EXTRAVERSION),.$(EXTRAVERSION),)
 
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL)$(SUBLEVEL)$(EXTRAVERSION)
 LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 1f637f9..8046ef4 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -24,6 +24,9 @@ KERNEL_ARCH:=$(shell $(SHELL) -c "echo \"$(ARCH)\" | sed -e \"s/-.*//\" \
 include toolchain/kernel-headers/kernel-headers-new.makefile
 
 $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
+ifeq ($(BR2_KERNEL_HEADERS_SNAP),y)
+	$(error No local $@ found, cannot continue. Are you sure you wanted to enable BR2_KERNEL_HEADERS_SNAP?)
+endif
 	$(call DOWNLOAD,$(LINUX_HEADERS_SITE),$(LINUX_HEADERS_SOURCE))
 
 kernel-headers: $(LINUX_HEADERS_DIR)/.configured
-- 
1.6.3.3
