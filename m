From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 16:47:02 +0200
Subject: [Buildroot] [PATCH 3/5] infra: Add automatic install of init scripts
In-Reply-To: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1413643624-14757-4-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of copy pasting the install code over all our packages, you may
now define variables to specify where to take the init script files.
Each file will be installed in the default folder of the relevant init
system.

For systemd, instead of installing the files into
$(TARGET_DIR)/etc/systemd/system, the file are now installed in
$(TARGET_DIR)/lib/systemd/system which appears to be the right things to
do.

If you have specific operations to perform in order to install your init
scripts or any other file relevant to the init system (tmpfiles for
systemd), you can still define the usual FOO_INSTALL_INIT_SYSTEMD for
your specific actions.

Also add the documentation explaining the mechanism.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/manual/adding-packages-generic.txt | 17 +++++++++++++++++
 package/pkg-generic.mk                  | 26 ++++++++++++++++++++++----
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 67a7453..a0e51f2 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -368,6 +368,23 @@ information is (assuming the package name is +libfoo+) :
   FLAT binary format is only 4k bytes. If the application consumes more stack,
   append the required number here.
 
+* +LIBFOO_INIT_SYSV_FILES+ and +LIBFOO_INIT_SYSTEMD_FILES+ are
+  a space-separated list of init scripts path. Respectively, for
+  the systemV-like init systems (busybox, sysvinit, etc.) and for
+  systemd.
+  Theses init scripts files will only be installed when the relevant
+  init system is installed (i.e. if systemd is selected as the init
+  system in the configuration, only +LIBFOO_INIT_SYSTEMD_FILES+ will be
+  installed).
+  Each scripts will be installed in the default folder of the relevant
+  init system.
+  Note: This doesn't forbid you from defining +LIBFOO_INSTALL_INIT_SYSV+ and
+  +LIBFOO_INSTALL_INIT_SYSTEMD+ if you need to perform specific actions.
+  Theses variables are optionnal.
+  Examples: +
+    +LIBFOO_INSTALL_INIT_SYSV=package/libfoo/S99libfoo +
+    +LIBFOO_INSTALL_INIT_SYSV=$(@D)/S99libfoo +
+
 The recommended way to define these variables is to use the following
 syntax:
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 259ee02..1d90ae9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -229,10 +229,27 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call MESSAGE,"Installing to target")
 	$(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_TARGET_CMDS)
-	$(if $(BR2_INIT_SYSTEMD),\
-		$($(PKG)_INSTALL_INIT_SYSTEMD))
-	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
-		$($(PKG)_INSTALL_INIT_SYSV))
+ifeq ($(BR2_INIT_SYSTEMD),y)
+	$(Q)if test -n "$($(PKG)_INIT_SYSTEMD_FILES)" ; then \
+		mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants ; \
+		for s in $($(PKG)_INIT_SYSTEMD_FILES); do \
+			f=$$(basename $${s}); \
+			$(INSTALL) -D -m 644 $${s} $(TARGET_DIR)/lib/systemd/system/$${f} ; \
+			ln -fs /lib/systemd/system/$${f} \
+				$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$${f} ; \
+		done ; \
+	fi
+	$($(PKG)_INSTALL_INIT_SYSTEMD)
+endif
+ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),y)
+	$(Q)if test -n "$($(PKG)_INIT_SYSV_FILES)" ; then \
+		for s in $($(PKG)_INIT_SYSV_FILES); do \
+			   f=$$(basename $${s}) ; \
+			   $(INSTALL) -D -m 0755 $${s} $(TARGET_DIR)/etc/init.d/$${f} ; \
+		done ; \
+	fi
+	$($(PKG)_INSTALL_INIT_SYSV)
+endif
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
@@ -592,6 +609,7 @@ $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
+$$($(2)_TARGET_INSTALL_TARGET):		PKGDIR=$(pkgdir)
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
 $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
-- 
2.1.1
