From: Sonic Zhang <sonic.adi@gmail.com>
Date: Fri, 29 Mar 2013 17:50:42 +0800
Subject: [Buildroot] [PATCH v2 6/7] arch: Introduce blackfin-specific
	Makefile
In-Reply-To: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1364550643-11793-6-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

v2-changes:
- Remove useless Macro __uClinux__

v1-changes:
- Create arch makefile.
- Create blackfin makefile.
- Add FDPIC and FLAT library options and makefile targets to install
libraries for different binary formats into the same rootfs image.
- update the TARGET_EXCEPTIONS variable in support/scripts/graph-depends for
new custom targets

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 Makefile                      |    2 ++
 arch/Config.in.bfin           |   21 +++++++++++++++++++++
 arch/Makefile.in              |    5 +++++
 arch/Makefile.in.bfin         |   22 ++++++++++++++++++++++
 support/scripts/graph-depends |    2 ++
 5 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 arch/Makefile.in
 create mode 100644 arch/Makefile.in.bfin

diff --git a/Makefile b/Makefile
index 7f0822f..c2f43a4 100644
--- a/Makefile
+++ b/Makefile
@@ -329,6 +329,8 @@ ifneq ($(PACKAGE_OVERRIDE_FILE),)
 -include $(PACKAGE_OVERRIDE_FILE)
 endif
 
+include arch/Makefile.in
+
 include package/*/*.mk
 
 include boot/common.mk
diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 021f5fe..038da4a 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -62,6 +62,27 @@ config BR2_bf561
 	bool "bf561"
 endchoice
 
+config BR2_BFIN_INSTALL_FDPIC_SHARED
+	depends on BR2_bfin && !BR2_BINFMT_FDPIC
+	bool "Install FDPIC shared libraries"
+	default y
+	help
+	  Blackfin Linux kernel supports running both FDPIC and FLAT applications
+	  concurrently if the binary format specific libraries installed properly.
+	  This option allow developer to install FDPIC libraries into a buildroot
+	  rootfs image built with binary format macro other than BR2_BINFMT_FDPIC.
+
+config BR2_BFIN_INSTALL_FLAT_SHARED
+	depends on BR2_bfin && !BR2_BINFMT_FLAT_SHARED
+	bool "Install FLAT shared libraries"
+	default y
+	help
+	  Blackfin Linux kernel supports running both FDPIC and FLAT applications
+	  concurrently if the binary format specific libraries installed properly.
+	  This option allow developer to install FLAT libraries into a buildroot
+	  rootfs image built with binary format macro other than
+	  BR2_BINFMT_FLAT_SHARED.
+
 config BR2_ARCH
 	default "bfin"
 
diff --git a/arch/Makefile.in b/arch/Makefile.in
new file mode 100644
index 0000000..d791118
--- /dev/null
+++ b/arch/Makefile.in
@@ -0,0 +1,5 @@
+# The architecture specific Makefile.in.$ARCH should be included only
+# when the arch macro is selected.
+ifeq ($(BR2_bfin),y)
+include arch/Makefile.in.bfin
+endif
diff --git a/arch/Makefile.in.bfin b/arch/Makefile.in.bfin
new file mode 100644
index 0000000..9089bc5
--- /dev/null
+++ b/arch/Makefile.in.bfin
@@ -0,0 +1,22 @@
+TARGETS_BFIN-$(BR2_BFIN_INSTALL_FDPIC_SHARED) += target-shared-libs-fdpic
+TARGETS_BFIN-$(BR2_BFIN_INSTALL_FLAT_SHARED) += target-shared-libs-flat
+TARGETS += $(TARGETS_BFIN-y)
+
+CROSS_COMPILE_SHARED_FDPIC ?= bfin-linux-uclibc-
+target-shared-libs-fdpic:
+	set -e; \
+	t=`$(CROSS_COMPILE_SHARED_FDPIC)gcc $(CPUFLAGS) -print-file-name=libc.a`; \
+	t=`dirname $$t`/../..; \
+	for i in $$t/lib/*so*; do \
+		i=`readlink -f "$$i"`; \
+		soname=`$(CROSS_COMPILE_SHARED_FDPIC)readelf -d "$$i" | sed -n '/(SONAME)/s:.*[[]\(.*\)[]].*:\1:p'`; \
+		$(INSTALL) -D $$i $(TARGET_DIR)/lib/$$soname; \
+	done
+
+CROSS_COMPILE_SHARED_FLAT ?= bfin-uclinux-
+target-shared-libs-flat:
+	set -e; \
+	t=`$(CROSS_COMPILE_SHARED_FLAT)gcc $(CPUFLAGS) -mid-shared-library -print-file-name=libc`; \
+	if [ -f $$t -a ! -h $$t ] ; then \
+		$(INSTALL) -D $$t $(TARGET_DIR)/lib/lib1.so; \
+	fi
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 1163d79..227d085 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -168,6 +168,8 @@ TARGET_EXCEPTIONS = [
     "erase-fakeroots",
     "target-generic-hostname",
     "target-root-passwd",
+    "target-shared-libs-fdpic",
+    "target-shared-libs-flat",
 ]
 
 # In full mode, start with the result of get_targets() to get the main
-- 
1.7.0.4
