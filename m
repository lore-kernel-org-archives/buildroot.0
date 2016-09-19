From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2016 19:29:02 +0200
Subject: [Buildroot] [git commit] linux: use INSTALL_MOD_STRIP=1 to strip
	modules
Message-ID: <20160919173222.A99E17FF85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10c4d27aef4dca01572cfc8146cbfd194a1a85e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We used to do a special handling of Linux kernel modules when stripping
target binaries because there's some special precious data in modules
that we must keep for them to properly operate. This is for example true
for stack unwinding data etc.

It turned out there're cases when our existing "strip --strip-unneeded"
doesn't work well. For example this removes .debug_frame section used by
Linux on ARC for stack unwinding, refer to [1] and [2] for more details.

Now Linux kernel may strip modules as a part of "modules_install" target
if INSTALL_MOD_STRIP=1 is passed in command line. And so we'll do
allowing kernel decide how to strip modules in the best way.

Still note as of today Linux kernel strips modules uniformly for all
arches with "strip" command, so this commit alone doesn't solve
mentioned problem but it opens a possibility to add later a patch to the
kernel which will strip modules for ARC differently - and that's our
plan for mainline kernel.

[1] https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/86
[2] http://lists.busybox.net/pipermail/buildroot/2016-September/172161.html

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Daniel Mentz <danielmentz@google.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile            | 3 ---
 linux/linux.mk      | 4 ++++
 package/Makefile.in | 3 ---
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 92feff3..5e4daef 100644
--- a/Makefile
+++ b/Makefile
@@ -631,9 +631,6 @@ endif
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
 	$(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
-	if test -d $(TARGET_DIR)/lib/modules; then \
-		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' -print0 | \
-		xargs -0 -r $(KSTRIPCMD); fi
 
 # See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
 # besides the one in which crash occurred; or SIGTRAP kills my program when
diff --git a/linux/linux.mk b/linux/linux.mk
index 6e41a92..5cbb5e5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -384,6 +384,10 @@ define LINUX_INSTALL_IMAGES_CMDS
 	$(call LINUX_INSTALL_DTB,$(BINARIES_DIR))
 endef
 
+ifeq ($(BR2_STRIP_strip),y)
+LINUX_MAKE_FLAGS += INSTALL_MOD_STRIP=1
+endif
+
 define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
 	# Install modules and remove symbolic links pointing to build
diff --git a/package/Makefile.in b/package/Makefile.in
index afd5d3a..83c9a89 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -203,16 +203,13 @@ TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_STRIP_DEBUG := --strip-debug
-STRIP_STRIP_UNNEEDED := --strip-unneeded
 STRIP_STRIP_ALL := --strip-all
 TARGET_STRIP = $(TARGET_CROSS)strip
 STRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
-KSTRIPCMD = $(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
 endif
 ifeq ($(BR2_STRIP_none),y)
 TARGET_STRIP = true
 STRIPCMD = $(TARGET_STRIP)
-KSTRIPCMD = $(TARGET_STRIP)
 endif
 INSTALL := $(shell which install || type -p install)
 FLEX := $(shell which flex || type -p flex)
