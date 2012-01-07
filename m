From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 7 Jan 2012 21:00:33 +0100
Subject: [Buildroot] [git commit] New package: python-netifaces
Message-ID: <20120107201230.F37DA9000C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=221d609bcf6baed80ac07230e80da49d1522e069
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/python-netifaces/Config.in                 |    8 +++
 .../python-netifaces-fix-cross-build.patch         |   54 ++++++++++++++++++++
 package/python-netifaces/python-netifaces.mk       |   25 +++++++++
 4 files changed, 88 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bfb6ac9..a82c658 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -241,6 +241,7 @@ if BR2_PACKAGE_PYTHON
 menu "external python modules"
 source "package/python-dpkt/Config.in"
 source "package/python-mad/Config.in"
+source "package/python-netifaces/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 endmenu
diff --git a/package/python-netifaces/Config.in b/package/python-netifaces/Config.in
new file mode 100644
index 0000000..b9d66d8
--- /dev/null
+++ b/package/python-netifaces/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_NETIFACES
+	bool "python-netifaces"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	help
+	  Portable access to network interfaces from Python.
+
+	  http://alastairs-place.net/projects/netifaces
diff --git a/package/python-netifaces/python-netifaces-fix-cross-build.patch b/package/python-netifaces/python-netifaces-fix-cross-build.patch
new file mode 100644
index 0000000..5a11b61
--- /dev/null
+++ b/package/python-netifaces/python-netifaces-fix-cross-build.patch
@@ -0,0 +1,54 @@
+fix cross-compilation issues:
+
+- don't execute cross-compiled binaries
+- pass LDFLAGS to linker
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ setup.py |   19 +++++++------------
+ 1 file changed, 7 insertions(+), 12 deletions(-)
+
+Index: b/setup.py
+===================================================================
+--- a/setup.py
++++ b/setup.py
+@@ -67,17 +67,8 @@
+                                                   libraries=libraries,
+                                                   debug=self.debug)
+                     if execute:
+-                        abspath = os.path.abspath(os.path.join(self.build_temp,
+-                                                               'conftest'))
+-                        pipe = os.popen(abspath, 'r')
+-                        result = pipe.read().strip()
+-                        status = pipe.close()
+-                        if status is None:
+-                            status = 0
+-                        if result == '':
+-                            result = True
+-                        if status != 0:
+-                            result = False
++                        # cross-compiled code can't be executed
++                        result = True
+                         
+             finally:
+                 os.dup2(mystdout, 1)
+@@ -89,6 +80,10 @@
+         return result
+ 
+     def check_requirements(self):
++        # get library dirs
++	if os.environ.has_key('LDFLAGS'):
++	    lib_dirs = os.environ['LDFLAGS']
++
+         # Load the cached config data from a previous run if possible; compiling
+         # things to test for features is slow
+         cache_file = os.path.join(self.build_temp, 'config.cache')
+@@ -356,7 +351,7 @@
+                                                    in optional_headers]),
+                             'sockaddr': sockaddr }
+ 
+-                    if self.test_build(testrig, execute=False):
++                    if self.test_build(testrig, execute=False, library_dirs = [lib_dirs]):
+                         result.append(sockaddr)
+                 
+             if result:
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
new file mode 100644
index 0000000..e9a7099
--- /dev/null
+++ b/package/python-netifaces/python-netifaces.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# python-netifaces
+#
+#############################################################
+
+PYTHON_NETIFACES_VERSION = 0.6
+PYTHON_NETIFACES_SOURCE  = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
+PYTHON_NETIFACES_SITE    = http://alastairs-place.net/projects/netifaces
+
+PYTHON_NETIFACES_DEPENDENCIES = python host-python-setuptools host-python-distutilscross
+
+define PYTHON_NETIFACES_BUILD_CMDS
+	(cd $(@D); \
+		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
+		LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
+	$(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_NETIFACES_INSTALL_TARGET_CMDS
+	(cd $(@D); PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(call GENTARGETS))
