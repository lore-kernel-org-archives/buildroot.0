From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 12 Mar 2007 00:08:55 +0100
Subject: [Buildroot] BSP Patch Resend (forgotten?)
Message-ID: <45F48C07.9090908@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author:    Ulf Samuelsson
Date:    2007-02-08

Log:
    Here is my suggestion for supporting different BSP's
    in the same buildroot structure
    Updated according to suggestions.
    BR2_BOARDNAME cannot be empty,since it is used to define directory
names.
    I don't think it should be defined by the targtets, since you may
want to build
    several different boards, using the same target

    Add BINARIES_DIR directory,
    where resulting binaries can be stored
    Typically this directory contains a subdirectory for each BSP.

    Add TARGET_BUILD_DIR directory, where BSP for different
    boards can be built without destroying results of previous builds.
    Typically each BSP would build in a subdirectory of TARGET_BUILD_DIR


Modified:
    Config.in
    Makefile
    package/Makefile.in

Changeset
    Config.in
    Makefile
    package/Makefile.in

diff -purN buildroot-0rig/Config.in buildroot-atmel/Config.in
--- buildroot-0rig/Config.in    2007-02-08 22:17:40.000000000 +0100
+++ buildroot-atmel/Config.in    2007-02-08 22:35:48.000000000 +0100
@@ -6,6 +6,21 @@ config BR2_HAVE_DOT_CONFIG
     bool
     default y

+menu "Board"
+
+config BR2_BOARDNAME
+    string "Boardname"
+    default "uclibc"
+    help
+      The boardname is used to define subdirectories
+      * where the Board Support Packages are built
+        (Linux,Root fs Bootmonitor,Utilities etc.)
+      * where the resulting binaries are stored.
+      Older target may still build in the build_<arch>
+      and store binaries in the top directory.
+
+endmenu
+
 choice
     prompt "Target Architecture"
     default BR2_i386
diff -purN buildroot-0rig/Makefile buildroot-atmel/Makefile
--- buildroot-0rig/Makefile    2007-02-08 22:17:40.000000000 +0100
+++ buildroot-atmel/Makefile    2007-02-08 22:29:14.000000000 +0100
@@ -79,12 +79,15 @@ TARGETS_CLEAN:=$(patsubst %,%-clean,$(TA
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))

-world: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) $(TARGETS)
+world: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+    $(TARGET_BUILD_DIR) $(BINARIES_DIR) $(TARGETS)
+
 dirs: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR)

 .PHONY: all world dirs clean dirclean distclean source $(TARGETS) \
     $(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
-    $(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) $(STAGING_DIR)
+    $(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) $(STAGING_DIR) \
+    $(TARGET_BUILD_DIR) $(BINARIES_DIR)

 #############################################################
 #
@@ -92,7 +95,8 @@ dirs: $(DL_DIR) $(BUILD_DIR) $(STAGING_D
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR):
+$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) \
+$(TARGET_BUILD_DIR) $(BINARIES_DIR):
     @mkdir -p $@

 $(STAGING_DIR):
diff -purN buildroot-0rig/package/Makefile.in
buildroot-atmel/package/Makefile.in
--- buildroot-0rig/package/Makefile.in    2007-02-08 22:17:40.000000000
+0100
+++ buildroot-atmel/package/Makefile.in    2007-02-08 22:31:52.000000000
+0100
@@ -71,6 +71,8 @@ TOOLCHAIN_EXTERNAL_PREFIX:=$(strip $(sub
 TOOLCHAIN_EXTERNAL_PATH:=$(strip $(subst ",,
$(BR2_TOOLCHAIN_EXTERNAL_PATH)))
 #"))
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
+TARGET_BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)target_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)/$(BR2_BOARDNAME)
+BINARIES_DIR:=$(BASE_DIR)/binaries/$(BR2_BOARDNAME)
 TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 IMAGE:=$(BASE_DIR)/rootfs.$(TOOLCHAIN_EXTERNAL_PREFIX)
 REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)

-- Best Regards, Ulf Samuelsson

Any chance of having this patch reviewed again after fixing the previous
comments?


Author:	Ulf Samuelsson
Date:	2007-02-08

Log:
	Here is my suggestion for supporting different BSP's
	in the same buildroot structure
	Updated according to suggestions.
	BR2_BOARDNAME cannot be empty,since it is used to define directory names.
	It shoudl not be defined by the targtets, since you may want to build
	several different boards, using the same target

	Add BINARIES_DIR directory,
	where resulting binaries can be stored
	Typically this directory contains a subdirectory for each BSP.

	Add TARGET_BUILD_DIR directory, where BSP for different
	boards can be built without destroying results of previous builds.
	Typically each BSP would build in a subdirectory of TARGET_BUILD_DIR


Modified:
	Config.in
	Makefile
	package/Makefile.in

Changeset
	Config.in
	Makefile
	package/Makefile.in

diff -purN buildroot-0rig/Config.in buildroot-atmel/Config.in
--- buildroot-0rig/Config.in	2007-02-08 22:17:40.000000000 +0100
+++ buildroot-atmel/Config.in	2007-02-08 22:35:48.000000000 +0100
@@ -6,6 +6,21 @@ config BR2_HAVE_DOT_CONFIG
 	bool
 	default y

+menu "Board"
+
+config BR2_BOARDNAME
+	string "Boardname"
+	default "uclibc"
+	help
+	  The boardname is used to define subdirectories
+	  * where the Board Support Packages are built
+	    (Linux,Root fs Bootmonitor,Utilities etc.)
+	  * where the resulting binaries are stored.
+	  Older target may still build in the build_<arch>
+	  and store binaries in the top directory.
+
+endmenu
+
 choice
 	prompt "Target Architecture"
 	default BR2_i386
diff -purN buildroot-0rig/Makefile buildroot-atmel/Makefile
--- buildroot-0rig/Makefile	2007-02-08 22:17:40.000000000 +0100
+++ buildroot-atmel/Makefile	2007-02-08 22:29:14.000000000 +0100
@@ -79,12 +79,15 @@ TARGETS_CLEAN:=$(patsubst %,%-clean,$(TA
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))

-world: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) $(TARGETS)
+world: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+	$(TARGET_BUILD_DIR) $(BINARIES_DIR) $(TARGETS)
+
 dirs: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR)

 .PHONY: all world dirs clean dirclean distclean source $(TARGETS) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
-	$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) $(STAGING_DIR)
+	$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) $(STAGING_DIR) \
+	$(TARGET_BUILD_DIR) $(BINARIES_DIR)

 #############################################################
 #
@@ -92,7 +95,8 @@ dirs: $(DL_DIR) $(BUILD_DIR) $(STAGING_D
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR):
+$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) \
+$(TARGET_BUILD_DIR) $(BINARIES_DIR):
 	@mkdir -p $@

 $(STAGING_DIR):
diff -purN buildroot-0rig/package/Makefile.in
buildroot-atmel/package/Makefile.in
--- buildroot-0rig/package/Makefile.in	2007-02-08 22:17:40.000000000 +0100
+++ buildroot-atmel/package/Makefile.in	2007-02-08 22:31:52.000000000 +0100
@@ -71,6 +71,8 @@ TOOLCHAIN_EXTERNAL_PREFIX:=$(strip $(sub
 TOOLCHAIN_EXTERNAL_PATH:=$(strip $(subst ",,
$(BR2_TOOLCHAIN_EXTERNAL_PATH)))
 #"))
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
+TARGET_BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)target_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)/$(BR2_BOARDNAME)
+BINARIES_DIR:=$(BASE_DIR)/binaries/$(BR2_BOARDNAME)
 TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 IMAGE:=$(BASE_DIR)/rootfs.$(TOOLCHAIN_EXTERNAL_PREFIX)
 REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)

-- 
Best Regards,
Ulf Samuelsson
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ulf.vcf
Type: text/x-vcard
Size: 301 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070312/bd27b444/attachment.vcf 
