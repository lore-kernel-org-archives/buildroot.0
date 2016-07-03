From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 22:27:54 +0200
Subject: [Buildroot] [git commit] ninja: new package
Message-ID: <20160703202849.526B5802BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b63a0a021b1f6adfd258391489d6f593977a468
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package provides the host variant of Ninja, a small build
system with a focus on speed.

[Peter: use install -D]
Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ninja/ninja.hash |  2 ++
 package/ninja/ninja.mk   | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
new file mode 100644
index 0000000..47ec822
--- /dev/null
+++ b/package/ninja/ninja.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 51581de53cf4705b89eb6b14a85baa73288ad08bff256e7d30d529155813be19  ninja-v1.7.1.tar.gz
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
new file mode 100644
index 0000000..3cfe4fa
--- /dev/null
+++ b/package/ninja/ninja.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# ninja
+#
+################################################################################
+
+NINJA_VERSION = v1.7.1
+NINJA_SITE = $(call github,ninja-build,ninja,$(NINJA_VERSION))
+NINJA_LICENSE = Apache-2.0
+NINJA_LICENSE_FILES = COPYING
+
+HOST_NINJA_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+
+define HOST_NINJA_BUILD_CMDS
+	(cd $(@D); ./configure.py --bootstrap)
+endef
+
+define HOST_NINJA_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/ninja $(HOST_DIR)/usr/bin/ninja
+endef
+
+$(eval $(host-generic-package))
