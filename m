From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 8 Feb 2013 22:32:53 +0100
Subject: [Buildroot] [git commit] package: remove scripts listed in
	<pkg>_CONFIG_SCRIPTS from target
Message-ID: <20130208214322.2A7E396DC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=580225af20b6c692da76eb43b20382a47b3ed170
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The <foo>-config scripts are useless on the target, since they are
only needed for development, so we remove them automatically.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-generic.txt |    7 ++++++-
 package/pkg-generic.mk                  |    5 +++++
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 13d200d..78df24a 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -90,6 +90,9 @@ The argument to be given to +LIBFOO_CONFIG_SCRIPTS+ is the file name(s)
 of the shell script(s) needing fixing. All these names are relative to
 '$(STAGING_DIR)/usr/bin' and if needed multiple names can be given.
 
+In addition, the scripts listed in +LIBFOO_CONFIG_SCRIPTS+ are removed
+from +$(TARGET_DIR)/usr/bin+, since they are not needed on the target.
+
 Example 1:
 
 Package divine installs shell script '$(STAGING_DIR)/usr/bin/divine-config'.
@@ -288,7 +291,9 @@ information is (assuming the package name is +libfoo+) :
 * +LIBFOO_CONFIG_SCRIPTS+ lists the names of the files in
   '$(STAGING_DIR)/usr/bin' that need some special fixing to make them
   cross-compiling friendly. Multiple file names separated by space can
-  be given and all are relative to '$(STAGING_DIR)/usr/bin'.
+  be given and all are relative to '$(STAGING_DIR)/usr/bin'. The files
+  listed in +LIBFOO_CONFIG_SCRIPTS+ are also removed from
+  +$(TARGET_DIR)/usr/bin+ since they are not needed on the target.
 
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
