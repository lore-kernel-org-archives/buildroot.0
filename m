From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 15:38:07 +0200
Subject: [Buildroot] [git commit] python3: rework python symlinks
	installation
Message-ID: <20140405153937.ADA269BCF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8127d3cf8296597c1f76215252efd12578a4e76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch reworks the way python3 and python3-config symlink are
installed.

Buildroot wants to control these symlinks' installation:

* the python3 symlink should be unconditionally installed in the target
  tree, and the python3-config symlink in the staging tree, since it is
  the only python package built and installed in the target tree if the
  user selected it;

* the python3 and python3-config symlinks should only be installed in
  the host tree when python3 is the selection of the user for the
  target.

[Thomas: fix comment as suggested by Yann.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 0144d1e..542f2c9 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -155,11 +155,18 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
 endif
 
+# Some packages may have build scripts requiring python3, whatever is the
+# python version chosen for the target.
+# Only install the python symlink in the host tree if python3 is enabled
+# for the target.
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
 define HOST_PYTHON3_INSTALL_SYMLINK
 	ln -fs python3 $(HOST_DIR)/usr/bin/python
+	ln -fs python3-config $(HOST_DIR)/usr/bin/python-config
 endef
 
 HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
+endif
 
 # Provided to other packages
 PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
