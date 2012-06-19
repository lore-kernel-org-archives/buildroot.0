From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 19 Jun 2012 11:35:53 +0100
Subject: [Buildroot] [PATCH] sudo: fix install
Message-ID: <1340102153-22387-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Running sudo on the target fails with the following errors.

  sudo: /usr/libexec/sudoers.so: No such file or directory
  sudo: fatal error, unable to load plugins

The problem is that the installation of the sudo package is broken. This patch
replaces the hand-crafted install rule with the default AUTOTARGETS install.

Unfortunately, the default install fails because it includes a step that invokes
the cross-compiled visudo binary. A patch is provided here to disable this
visudo invocation, which is for sanity checking only.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/sudo/sudo-fix-sudoers-plugin-install.patch |   19 +++++++++++++++++++
 package/sudo/sudo.mk                               |    8 --------
 2 files changed, 19 insertions(+), 8 deletions(-)
 create mode 100644 package/sudo/sudo-fix-sudoers-plugin-install.patch

diff --git a/package/sudo/sudo-fix-sudoers-plugin-install.patch b/package/sudo/sudo-fix-sudoers-plugin-install.patch
new file mode 100644
index 0000000..e85e5d8
--- /dev/null
+++ b/package/sudo/sudo-fix-sudoers-plugin-install.patch
@@ -0,0 +1,19 @@
+The installation of the sudoers plugin fails when cross compiling, because it
+tries to run the cross-compiled visudo, rather than that of the host.
+
+The visudo invocation is only required in order to sanity check any existing
+sudoers file in the target directory; this can safely be dispensed with.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+diff -Nurp a/plugins/sudoers/Makefile.in b/plugins/sudoers/Makefile.in
+--- a/plugins/sudoers/Makefile.in	2012-05-15 17:22:02.000000000 +0100
++++ b/plugins/sudoers/Makefile.in	2012-06-19 11:24:00.322449438 +0100
+@@ -239,7 +239,7 @@ sudoers: $(srcdir)/sudoers.in
+ pre-install:
+ 	@if test -r $(DESTDIR)$(sudoersdir)/sudoers; then \
+ 	    echo "Checking existing sudoers file for syntax errors."; \
+-	    ./visudo -c -f $(DESTDIR)$(sudoersdir)/sudoers; \
++	    (echo "SKIPPED" || ./visudo -c -f $(DESTDIR)$(sudoersdir)/sudoers); \
+ 	fi
+ 
+ install: install-plugin install-binaries install-sudoers install-doc
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 3629ad1..f1efc54 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -14,12 +14,4 @@ SUDO_CONF_OPT = \
 		--without-interfaces \
 		--without-pam
 
-define SUDO_INSTALL_TARGET_CMDS
-	install -m 4555 -D $(@D)/src/sudo $(TARGET_DIR)/usr/bin/sudo
-	install -m 0555 -D $(@D)/plugins/sudoers/visudo  \
-		$(TARGET_DIR)/usr/sbin/visudo
-	install -m 0440 -D $(@D)/plugins/sudoers/sudoers \
-		$(TARGET_DIR)/etc/sudoers
-endef
-
 $(eval $(call AUTOTARGETS))
-- 
1.7.9.5
