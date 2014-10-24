From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Oct 2014 23:47:37 +0200
Subject: [Buildroot] [git commit] package/trinity: New package
Message-ID: <20141024230432.07C209CDBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab88446507c7816899787d5a02e9d7098350090d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding the Trinity Linux System call fuzz tester.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in          |    1 +
 package/trinity/Config.in  |    6 ++++++
 package/trinity/trinity.mk |   35 +++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d6cd876..6822cd7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -90,6 +90,7 @@ endif
 	source "package/sysprof/Config.in"
 	source "package/tinymembench/Config.in"
 	source "package/trace-cmd/Config.in"
+	source "package/trinity/Config.in"
 	source "package/valgrind/Config.in"
 	source "package/whetstone/Config.in"
 endmenu
diff --git a/package/trinity/Config.in b/package/trinity/Config.in
new file mode 100644
index 0000000..de9c467
--- /dev/null
+++ b/package/trinity/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TRINITY
+	bool "trinity"
+	help
+	  A Linux System call fuzz tester
+
+	  http://codemonkey.org.uk/projects/trinity/
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
new file mode 100644
index 0000000..8415141
--- /dev/null
+++ b/package/trinity/trinity.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# trinity
+#
+################################################################################
+
+TRINITY_VERSION = d68d1f7b9ab6c65a379ea990a263ee6b4f234bbd
+TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
+TRINITY_LICENSE = GPLv2
+TRINITY_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_INET_IPV6),)
+TARGET_CONFIGURE_OPTS += IPV6=no
+endif
+
+define TRINITY_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.sh)
+endef
+
+define TRINITY_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define TRINITY_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
+endef
+
+# Install helper scripts
+define TRINITY_INSTALL_HELPER_SCRIPTS
+	mkdir -p $(TARGET_DIR)/usr/libexec/trinity
+	cp -p $(@D)/scripts/* $(TARGET_DIR)/usr/libexec/trinity/
+endef
+TRINITY_POST_INSTALL_TARGET_HOOKS += TRINITY_INSTALL_HELPER_SCRIPTS
+
+$(eval $(generic-package))
