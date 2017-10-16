From: Anisse Astier <anisse@astier.eu>
Date: Mon, 16 Oct 2017 18:20:01 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <20171011105809.2bf05267@windsurf.lan>
References: <20171011105809.2bf05267@windsurf.lan>
Message-ID: <1508170801-31062-1-git-send-email-anisse@astier.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This includes a new support script that helps parsing *_CMDS recipes,
ensuring everything is forwarded.

See also: http://repo.or.cz/buildroot-gz.git/commitdiff/833e8fa7c7437931f1356b5b03a6b3810a3db586
Latest discussion: http://lists.busybox.net/pipermail/buildroot/2017-October/204159.html

Signed-off-by: Anisse Astier <anisse@astier.eu>
---

This is a proof of concept and does not log everything yet, but should work.


 package/pkg-generic.mk             | 54 ++++++++++++++++++++--------------
 support/scripts/recipe-forward-log | 59 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 22 deletions(-)
 create mode 100755 support/scripts/recipe-forward-log

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index cca94ba..335e2be 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -137,6 +137,8 @@ endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_user
 endif
 
+exportvar = $(eval export $(1))
+
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
@@ -166,12 +168,13 @@ $(BUILD_DIR)/%/.stamp_actual_downloaded:
 $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call step_start,extract)
 	@$(call MESSAGE,"Extracting")
-	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
+	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
 	$(Q)mkdir -p $(@D)
-	$($(PKG)_EXTRACT_CMDS)
+	@$(call exportvar,$(PKG)_EXTRACT_CMDS)
+	$(TOPDIR)/support/scripts/recipe-forward-log "$($(PKG)_LOGFILE)" "$$$(PKG)_EXTRACT_CMDS"
 # some packages have messed up permissions inside
 	$(Q)chmod -R +rw $(@D)
-	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
+	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
 	@$(call step_end,extract)
 	$(Q)touch $@
 
@@ -223,9 +226,10 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 $(BUILD_DIR)/%/.stamp_configured:
 	@$(call step_start,configure)
 	@$(call MESSAGE,"Configuring")
-	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
-	$($(PKG)_CONFIGURE_CMDS)
-	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
+	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
+	@$(call exportvar,$(PKG)_CONFIGURE_CMDS)
+	$(TOPDIR)/support/scripts/recipe-forward-log "$($(PKG)_LOGFILE)" "$$$(PKG)_CONFIGURE_CMDS"
+	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
 	@$(call step_end,configure)
 	$(Q)touch $@
 
@@ -233,9 +237,10 @@ $(BUILD_DIR)/%/.stamp_configured:
 $(BUILD_DIR)/%/.stamp_built::
 	@$(call step_start,build)
 	@$(call MESSAGE,"Building")
-	$(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook))$(sep))
-	+$($(PKG)_BUILD_CMDS)
-	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
+	$(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
+	@$(call exportvar,$(PKG)_BUILD_CMDS)
+	+$(TOPDIR)/support/scripts/recipe-forward-log "$($(PKG)_LOGFILE)" "$$$(PKG)_BUILD_CMDS"
+	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
 	@$(call step_end,build)
 	$(Q)touch $@
 
@@ -243,9 +248,10 @@ $(BUILD_DIR)/%/.stamp_built::
 $(BUILD_DIR)/%/.stamp_host_installed:
 	@$(call step_start,install-host)
 	@$(call MESSAGE,"Installing to host directory")
-	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
-	+$($(PKG)_INSTALL_CMDS)
-	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
+	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
+	@$(call exportvar,$(PKG)_INSTALL_CMDS)
+	+$(TOPDIR)/support/scripts/recipe-forward-log "$($(PKG)_LOGFILE)" "$$$(PKG)_INSTALL_CMDS"
+	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
 	@$(call step_end,install-host)
 	$(Q)touch $@
 
@@ -272,9 +278,10 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call step_start,install-staging)
 	@$(call MESSAGE,"Installing to staging directory")
-	$(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
-	+$($(PKG)_INSTALL_STAGING_CMDS)
-	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
+	$(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
+	@$(call exportvar,$(PKG)_INSTALL_STAGING_CMDS)
+	+$(TOPDIR)/support/scripts/recipe-forward-log "$($(PKG)_LOGFILE)" "$$$(PKG)_INSTALL_STAGING_CMDS"
+	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(call MESSAGE,"Fixing package configuration files") ;\
 			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
@@ -303,10 +310,11 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call step_start,install-image)
-	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
+	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
 	@$(call MESSAGE,"Installing to images directory")
-	+$($(PKG)_INSTALL_IMAGES_CMDS)
-	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
+	@$(call exportvar,$(PKG)_INSTALL_IMAGES_CMDS)
+	+$(TOPDIR)/support/scripts/recipe-forward-log "$($(PKG)_LOGFILE)" "$$$(PKG)_INSTALL_IMAGES_CMDS"
+	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
 	@$(call step_end,install-image)
 	$(Q)touch $@
 
@@ -314,13 +322,14 @@ $(BUILD_DIR)/%/.stamp_images_installed:
 $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call step_start,install-target)
 	@$(call MESSAGE,"Installing to target")
-	$(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
-	+$($(PKG)_INSTALL_TARGET_CMDS)
+	$(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
+	@$(call exportvar,$(PKG)_INSTALL_TARGET_CMDS)
+	+$(TOPDIR)/support/scripts/recipe-forward-log "$($(PKG)_LOGFILE)" "$$$(PKG)_INSTALL_TARGET_CMDS"
 	$(if $(BR2_INIT_SYSTEMD),\
 		$($(PKG)_INSTALL_INIT_SYSTEMD))
 	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
 		$($(PKG)_INSTALL_INIT_SYSV))
-	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
+	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
 	fi
@@ -443,6 +452,7 @@ $(2)_BASE_NAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
 $(2)_RAW_BASE_NAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
 $(2)_DL_DIR	=  $$(DL_DIR)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
+$(2)_LOGFILE	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME).log
 
 ifndef $(2)_SUBDIR
  ifdef $(3)_SUBDIR
@@ -589,7 +599,7 @@ $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
-	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
+	$$(if $$($(2)_SOURCE),	$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
 	$$(TAR) --strip-components=$$($(2)_STRIP_COMPONENTS) \
 		-C $$($(2)_DIR) \
 		$$(foreach x,$$($(2)_EXCLUDES),--exclude='$$(x)' ) \
diff --git a/support/scripts/recipe-forward-log b/support/scripts/recipe-forward-log
new file mode 100755
index 0000000..8240d74
--- /dev/null
+++ b/support/scripts/recipe-forward-log
@@ -0,0 +1,59 @@
+#!/usr/bin/env python3
+
+import sys
+import subprocess
+
+
+DEBUG = False
+
+if len(sys.argv) < 2:
+    print("usage: %s <log-file> <make-recipe>" % (sys.argv[0]))
+    sys.exit(-1)
+
+
+def dprint(*pargs):
+    if DEBUG:
+        print(*pargs)
+
+log_file = sys.argv[1]
+
+args = sys.argv[2:]
+
+dprint("args: %s" % (args))
+if len(args) == 1 and len(args[0]) == 0:
+    sys.exit(0)  # only one empty argument, supported use case
+
+for arg in args:
+    for line in arg.splitlines():
+        dprint("line: %s" % (line))
+        if line[0] != '\t':
+            print("Recipe line does not start with tab, aborting: %s" % (line))
+            sys.exit(-1)
+        line = line[1:]  # remove initial tab
+        if len(line) == 0:
+            continue  # empty lines are tolerated
+        print_command = True
+        stop_on_err = True
+        while True:
+            if line[0] == '@':
+                dprint("silent mode")
+                print_command = False
+                line = line[1:]
+            elif line[0] == '-':
+                dprint("ignore err mode")
+                stop_on_err = False
+                line = line[1:]
+            elif line[0] == '+':  # ignore
+                dprint("jobserver MAKEFLAGS mode")
+                line = line[1:]
+            else:  # no more matching initial recipe character
+                break
+        if print_command:
+            print(line)
+        proc = subprocess.Popen(line, shell=True, stdout=subprocess.PIPE,
+                                stderr=subprocess.STDOUT)
+        tee = subprocess.call(["tee", "-a", log_file], stdin=proc.stdout,
+                              stdout=sys.stdout)
+        ret = proc.wait()
+        if ret != 0 and stop_on_err:
+            sys.exit(ret)
-- 
2.7.5
