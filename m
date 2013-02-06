From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Feb 2013 00:10:15 +0100
Subject: [Buildroot] [PATCH 2/5] package: remove scripts listed in
	<pkg>_CONFIG_SCRIPTS from target
In-Reply-To: <1360192218-30930-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360192218-30930-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360192218-30930-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The <foo>-config scripts are useless on the target, since they are
only needed for development, so we remove them automatically.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |   11 ++++++++++-
 package/pkg-generic.mk                  |    5 +++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 13d200d..1450907 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -90,6 +90,11 @@ The argument to be given to +LIBFOO_CONFIG_SCRIPTS+ is the file name(s)
 of the shell script(s) needing fixing. All these names are relative to
 '$(STAGING_DIR)/usr/bin' and if needed multiple names can be given.
 
+In addition, the scripts listed in +LIBFOO_CONFIG_SCRIPTS+ are removed
+from +$(TARGET_DIR)/usr/bin+ if they are not needed (i.e, when the
+installation of development files on the target has not been selected,
+which is the default).
+
 Example 1:
 
 Package divine installs shell script '$(STAGING_DIR)/usr/bin/divine-config'.
@@ -288,7 +293,11 @@ information is (assuming the package name is +libfoo+) :
 * +LIBFOO_CONFIG_SCRIPTS+ lists the names of the files in
   '$(STAGING_DIR)/usr/bin' that need some special fixing to make them
   cross-compiling friendly. Multiple file names separated by space can
-  be given and all are relative to '$(STAGING_DIR)/usr/bin'.
+  be given and all are relative to '$(STAGING_DIR)/usr/bin'. The files
+  listed in +LIBFOO_CONFIG_SCRIPTS+ are also removed from
+  +$(TARGET_DIR)/usr/bin+ if they are not needed (i.e, when the
+  installation of development files on the target has not been
+  selected, which is the default).
 
 * +LIBFOO_DEVICES+ lists the device files to be created by Buildroot
   when using the static device table. The syntax to use is the
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 066b6c8..57b0fd0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -153,6 +153,11 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 		$($(PKG)_INSTALL_INIT_SYSV))
 	$($(PKG)_INSTALL_TARGET_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
+ifeq ($(BR2_HAVE_DEVFILES),)
+	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
+		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
+	fi
+endif
 	$(Q)touch $@
 
 # Clean package
-- 
1.7.9.5
