From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 May 2012 20:53:03 +0200
Subject: [Buildroot] [git commit branch/next] logsurfer: new package
Message-ID: <20120519185938.BD13996D48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b99b75fb66b453746179eee8e2a9131de87e331
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Peter: fix target installation, install man pages, AUTOTARGETS args]
Signed-off-by: Dominik Faessler <faessler@was.ch>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/logsurfer/Config.in    |    7 +++++++
 package/logsurfer/logsurfer.mk |   29 +++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 75d5c46..359ba47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -621,6 +621,7 @@ source "package/file/Config.in"
 source "package/inotify-tools/Config.in"
 source "package/lockfile-progs/Config.in"
 source "package/logrotate/Config.in"
+source "package/logsurfer/Config.in"
 source "package/screen/Config.in"
 source "package/sudo/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/logsurfer/Config.in b/package/logsurfer/Config.in
new file mode 100644
index 0000000..27d1881
--- /dev/null
+++ b/package/logsurfer/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LOGSURFER
+	bool "logsurfer"
+	help
+	  Logsurfer is a program for monitoring system logs in real-time,
+	  and reporting on the occurrence of events.
+
+	  http://www.crypt.gen.nz/logsurfer/
diff --git a/package/logsurfer/logsurfer.mk b/package/logsurfer/logsurfer.mk
new file mode 100644
index 0000000..89f6bbd
--- /dev/null
+++ b/package/logsurfer/logsurfer.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# logsurfer
+#
+#############################################################
+
+LOGSURFER_VERSION = 1.8
+LOGSURFER_SOURCE = logsurfer-$(LOGSURFER_VERSION).tar.gz
+LOGSURFER_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/logsurfer/logsurfer/logsurfer-$(LOGSURFER_VERSION)
+
+define LOGSURFER_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/logsurfer \
+		$(TARGET_DIR)/usr/bin/logsurfer
+endef
+
+ifeq ($(BR2_HAVE_DOCUMENTATION),y)
+
+define LOGSURFER_INSTALL_TARGET_MAN
+	$(INSTALL) -D -m 0644 $(@D)/man/logsurfer.1 \
+		$(TARGET_DIR)/usr/man/man1/logsurfer.1
+	$(INSTALL) -D -m 0644 $(@D)/man/logsurfer.conf.4 \
+		$(TARGET_DIR)/usr/man/man4/logsurfer.conf.4
+endef
+
+LOGSURFER_POST_INSTALL_TARGET_HOOKS += LOGSURFER_INSTALL_TARGET_MAN
+
+endif
+
+$(eval $(call AUTOTARGETS))
