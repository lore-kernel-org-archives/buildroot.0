From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:37 +0200
Subject: [Buildroot] [RFC v4 03/16] packages/scons: make avaiable the
	GCC_SYSROOT environment variable
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to support the per-package staging feature, make avaiable the
GCC_SYSROOT environment variable to scons packages so the toolchain
wrapper can use it.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/scons/scons.mk     |  3 ++-
 package/scons/site_init.py | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 package/scons/site_init.py

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 39fb258..e8ae086 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -18,4 +18,5 @@ HOST_SCONS_INSTALL_OPTS = \
 $(eval $(host-python-package))
 
 # variables used by other packages
-SCONS = $(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/scons $(if $(QUIET),-s)
+SCONS = $(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/scons \
+	$(if $(QUIET),-s) --site-dir=$(TOPDIR)/package/scons
diff --git a/package/scons/site_init.py b/package/scons/site_init.py
new file mode 100644
index 0000000..f0d8b53
--- /dev/null
+++ b/package/scons/site_init.py
@@ -0,0 +1,19 @@
+"""
+Decorate SCons Environment constructor so that the "GCC_SYSROOT"
+variable is always included.
+"""
+
+from functools import wraps
+import SCons.Environment
+
+def add_gcc_sysroot(environment_init):
+    @wraps(environment_init)
+    def wrapper(self, *args, **kwargs):
+        environment_init(self, *args, **kwargs)
+
+        self.PrependENVPath('GCC_SYSROOT', os.environ['GCC_SYSROOT'])
+
+    return wrapper
+
+SCons.Environment.Environment.__init__ = \
+    add_gcc_sysroot(SCons.Environment.Environment.__init__)
-- 
2.4.3
