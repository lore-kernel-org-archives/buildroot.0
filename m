From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  6 Apr 2014 09:35:15 +0200
Subject: [Buildroot] [PATCH] python: fix host-python symlink installation
	when no python is selected
Message-ID: <1396769715-28635-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When no python interpreter is selected, all host-python symlink
installation were disabled.
This could lead to a non-existing $(HOST_DIR)/usr/bin/python program.

Fixes:
  http://autobuild.buildroot.net/results/6e7/6e74a343b4e8e113fd34d45c9279419e233afe8a/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/python/python.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index feff644..8a2ba65 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -192,9 +192,9 @@ PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_INSTALL_STAGING_PYTHON_CONFIG_SYMLIN
 PYTHON_AUTORECONF = YES
 
 # Some packages may have build scripts requiring python2.
-# Only install the python symlink in the host tree if python2 is enabled
-# for the target.
-ifeq ($(BR2_PACKAGE_PYTHON),y)
+# Only install the python symlink in the host tree if python3 is not enabled
+# for the target, otherwise the default python program may be missing.
+ifneq ($(BR2_PACKAGE_PYTHON3),y)
 define HOST_PYTHON_INSTALL_PYTHON_SYMLINK
 	ln -sf python2 $(HOST_DIR)/usr/bin/python
 	ln -sf python2-config $(HOST_DIR)/usr/bin/python-config
-- 
1.9.1
