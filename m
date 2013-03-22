From: Sonic Zhang <sonic.adi@gmail.com>
Date: Fri, 22 Mar 2013 17:01:42 +0800
Subject: [Buildroot] [PATCH v3 2/2] buildroot: target: Add Blackfin
	architecture support.
In-Reply-To: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
References: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1363942902-6045-2-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

v3-changes:
- Put space around variable assignments.

v2-changes:
- Create arch makefile.

v1-changes:
- Create blackfin makefile.
- Add blackfin target ABI options.
- Add blackfin cpu options and shared library installation options.
- Add blackfin cpu revision options and mcpu link flags
- Add blackfin FLAT specific makefile flags.
- Add shared library installation options and makefile targets to
install shared libraries into rootfs image.
- Copy extra blackfin toolchain FDPIC shared libraries to target fs

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 Makefile              |    2 +
 arch/Config.in.bfin   |  117 +++++++++++++++++++++++++++++++++++++++++++++++++
 arch/Makefile.in      |    5 ++
 arch/Makefile.in.bfin |   50 +++++++++++++++++++++
 4 files changed, 174 insertions(+), 0 deletions(-)
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
index 0b137ae..0750b86 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -7,10 +7,127 @@ config BR2_BFIN_FDPIC
 config BR2_BFIN_FLAT
 	bool "FLAT"
 	select BR2_PREFER_STATIC_LIB
+config BR2_BFIN_FLAT_SEP_DATA
+	bool "FLAT (Separate data)"
+	select BR2_PREFER_STATIC_LIB
+config BR2_BFIN_SHARED_FLAT
+	bool "Shared FLAT"
+	select BR2_PREFER_STATIC_LIB
+endchoice
+
+choice
+	prompt "Target CPU"
+	depends on BR2_bfin
+	default BR2_bf609
+	help
+	  Specify target CPU
+config BR2_bf606
+	bool "bf606"
+config BR2_bf607
+	bool "bf607"
+config BR2_bf608
+	bool "bf608"
+config BR2_bf609
+	bool "bf609"
+config BR2_bf512
+	bool "bf512"
+config BR2_bf514
+	bool "bf514"
+config BR2_bf516
+	bool "bf516"
+config BR2_bf518
+	bool "bf518"
+config BR2_bf522
+	bool "bf522"
+config BR2_bf523
+	bool "bf523"
+config BR2_bf524
+	bool "bf524"
+config BR2_bf525
+	bool "bf525"
+config BR2_bf526
+	bool "bf526"
+config BR2_bf527
+	bool "bf527"
+config BR2_bf531
+	bool "bf531"
+config BR2_bf532
+	bool "bf532"
+config BR2_bf533
+	bool "bf533"
+config BR2_bf534
+	bool "bf534"
+config BR2_bf536
+	bool "bf536"
+config BR2_bf537
+	bool "bf537"
+config BR2_bf538
+	bool "bf538"
+config BR2_bf539
+	bool "bf539"
+config BR2_bf542
+	bool "bf542"
+config BR2_bf544
+	bool "bf544"
+config BR2_bf547
+	bool "bf547"
+config BR2_bf548
+	bool "bf548"
+config BR2_bf549
+	bool "bf549"
+config BR2_bf561
+	bool "bf561"
 endchoice
 
+config BR2_TARGET_CPU_REVISION
+	string "Target CPU revision"
+
+config BR2_BFIN_INSTALL_ELF_SHARED
+	depends on BR2_bfin && !BR2_BFIN_FDPIC
+	bool "Install ELF shared libraries"
+	default y
+
+config BR2_BFIN_INSTALL_FLAT_SHARED
+	depends on BR2_bfin
+	bool "Install FLAT shared libraries" if !BR2_BFIN_SHARED_FLAT
+	default y
+
 config BR2_ARCH
 	default "bfin"
 
 config BR2_ENDIAN
         default "LITTLE"
+
+config BR2_GCC_TARGET_CPU
+	default bf606		if BR2_bf606
+	default bf607		if BR2_bf607
+	default bf608		if BR2_bf608
+	default bf609		if BR2_bf609
+	default bf512		if BR2_bf512
+	default bf514		if BR2_bf514
+	default bf516		if BR2_bf516
+	default bf518		if BR2_bf518
+	default bf522		if BR2_bf522
+	default bf523		if BR2_bf523
+	default bf524		if BR2_bf524
+	default bf525		if BR2_bf525
+	default bf526		if BR2_bf526
+	default bf527		if BR2_bf527
+	default bf531		if BR2_bf531
+	default bf532		if BR2_bf532
+	default bf533		if BR2_bf533
+	default bf534		if BR2_bf534
+	default bf536		if BR2_bf536
+	default bf537		if BR2_bf537
+	default bf538		if BR2_bf538
+	default bf539		if BR2_bf539
+	default bf542		if BR2_bf542
+	default bf544		if BR2_bf544
+	default bf547		if BR2_bf547
+	default bf548		if BR2_bf548
+	default bf549		if BR2_bf549
+	default bf561		if BR2_bf561
+
+config BR2_TARGET_ABI_FLAT
+	default n		if BR2_BFIN_FDPIC
+	default y
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
index 0000000..e16532a
--- /dev/null
+++ b/arch/Makefile.in.bfin
@@ -0,0 +1,50 @@
+TARGETS-y =
+TARGETS-$(BR2_BFIN_INSTALL_ELF_SHARED) += romfs.shared.libs.elf
+TARGETS-$(BR2_BFIN_INSTALL_FLAT_SHARED) += romfs.shared.libs.flat
+TARGETS += $(TARGETS-y)
+
+ifeq ($(BR2_BFIN_FDPIC),y)
+USR_LIB_EXTERNAL_LIBS += libgfortran.so libgomp.so libmudflap.so libmudflapth.so libobjc.so
+endif
+
+CROSS_COMPILE_SHARED_ELF ?= bfin-linux-uclibc-
+romfs.shared.libs.elf:
+	set -e; \
+	t=`$(CROSS_COMPILE_SHARED_ELF)gcc $(CPUFLAGS) -print-file-name=libc.a`; \
+	t=`dirname $$t`/../..; \
+	for i in $$t/lib/*so*; do \
+		i=`readlink -f "$$i"`; \
+		soname=`$(CROSS_COMPILE_SHARED_ELF)readelf -d "$$i" | sed -n '/(SONAME)/s:.*[[]\(.*\)[]].*:\1:p'`; \
+		$(INSTALL) -D $$i $(TARGET_DIR)/lib/$$soname; \
+	done
+
+CROSS_COMPILE_SHARED_FLAT ?= bfin-uclinux-
+romfs.shared.libs.flat:
+	set -e; \
+	t=`$(CROSS_COMPILE_SHARED_FLAT)gcc $(CPUFLAGS) -mid-shared-library -print-file-name=libc`; \
+	if [ -f $$t -a ! -h $$t ] ; then \
+		$(INSTALL) -D $$t $(TARGET_DIR)/lib/lib1.so; \
+	fi
+
+ifeq ($(BR2_TARGET_CPU_REVISION),)
+TARGET_CPU = -mcpu=$(BR2_GCC_TARGET_CPU)
+else
+TARGET_CPU = -mcpu=$(BR2_GCC_TARGET_CPU)-$(BR2_TARGET_CPU_REVISION)
+endif
+TARGET_CFLAGS += $(call qstrip,$(TARGET_CPU))
+
+ifneq ($(BR2_USE_MMU), y)
+TARGET_CFLAGS += -D__uClinux__
+endif
+
+ifeq ($(BR2_BFIN_FLAT_SEP_DATA),y)
+TARGET_LDFLAGS += -msep-data
+TARGET_CFLAGS += -msep-data
+TARGET_CXXFLAGS += -msep-data
+endif
+
+ifeq ($(BR2_BFIN_SHARED_FLAT), y)
+TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
+TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
+TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
+endif
-- 
1.7.0.4
