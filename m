From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 23:13:24 +0200
Subject: [Buildroot] [git commit branch/next] python-pyroute2: new package
Message-ID: <20150818211347.95ADE81D5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c994d5638310e0a6e5110bd11e51ab0d56188cad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
  - fix legal info:
    * the license is GPLv2+ *or* Apache 2.0
    * the license files list separator is space, not comma
    * README.license.md has been added to the license files, since it
      contains some useful information about the licensing.
  - rewrap Config.in help text.]

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/python-pyroute2/Config.in          |    7 +++++++
 package/python-pyroute2/python-pyroute2.mk |   21 +++++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3ab87cf..729df7a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -646,6 +646,7 @@ menu "external python modules"
 	source "package/python-pypcap/Config.in"
 	source "package/python-pyqt/Config.in"
 	source "package/python-pyro/Config.in"
+	source "package/python-pyroute2/Config.in"
 	source "package/python-pysendfile/Config.in"
 	source "package/python-pysnmp/Config.in"
 	source "package/python-pysnmp-apps/Config.in"
diff --git a/package/python-pyroute2/Config.in b/package/python-pyroute2/Config.in
new file mode 100644
index 0000000..4f13ab2
--- /dev/null
+++ b/package/python-pyroute2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYROUTE2
+	bool "python-pyroute2"
+	help
+	  Python netlink library - Linux network / netns / wireless /
+	  ipset configuration.
+
+	  https://github.com/svinota/pyroute2
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
new file mode 100644
index 0000000..61de195
--- /dev/null
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# python-pyroute2
+#
+#############################################################
+
+PYTHON_PYROUTE2_VERSION = 16a8aced82c65b94eb9e15a7d773a3256763d155
+PYTHON_PYROUTE2_SITE = $(call github,svinota,pyroute2,$(PYTHON_PYROUTE2_VERSION))
+PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPLv2+
+PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache.v2 LICENSE.GPL.v2 README.license.md
+PYTHON_PYROUTE2_SETUP_TYPE = distutils
+PYTHON_PYROUTE2_DEPENDENCIES = host-gawk
+
+# this hook is needed to create setup.py from setup.py.in
+define PYTHON_PYROUTE2_CREATE_SETUP_PY
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) update-version
+endef
+
+PYTHON_PYROUTE2_PRE_CONFIGURE_HOOKS += PYTHON_PYROUTE2_CREATE_SETUP_PY
+
+$(eval $(python-package))
