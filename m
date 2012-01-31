From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 12:15:09 +0100
Subject: [Buildroot] [git commit] python-netifaces: bump to 0.7
Message-ID: <20120131112714.16D6A90961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec35c076e1c20856baa48d461ebf968ef9fbd74f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cross-compilation changes were applied upstream, so remove the patch

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../python-netifaces-fix-cross-build.patch         |   54 --------------------
 package/python-netifaces/python-netifaces.mk       |    2 +-
 2 files changed, 1 insertions(+), 55 deletions(-)

diff --git a/package/python-netifaces/python-netifaces-fix-cross-build.patch b/package/python-netifaces/python-netifaces-fix-cross-build.patch
deleted file mode 100644
index 5a11b61..0000000
--- a/package/python-netifaces/python-netifaces-fix-cross-build.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-fix cross-compilation issues:
-
-- don't execute cross-compiled binaries
-- pass LDFLAGS to linker
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- setup.py |   19 +++++++------------
- 1 file changed, 7 insertions(+), 12 deletions(-)
-
-Index: b/setup.py
-===================================================================
---- a/setup.py
-+++ b/setup.py
-@@ -67,17 +67,8 @@
-                                                   libraries=libraries,
-                                                   debug=self.debug)
-                     if execute:
--                        abspath = os.path.abspath(os.path.join(self.build_temp,
--                                                               'conftest'))
--                        pipe = os.popen(abspath, 'r')
--                        result = pipe.read().strip()
--                        status = pipe.close()
--                        if status is None:
--                            status = 0
--                        if result == '':
--                            result = True
--                        if status != 0:
--                            result = False
-+                        # cross-compiled code can't be executed
-+                        result = True
-                         
-             finally:
-                 os.dup2(mystdout, 1)
-@@ -89,6 +80,10 @@
-         return result
- 
-     def check_requirements(self):
-+        # get library dirs
-+	if os.environ.has_key('LDFLAGS'):
-+	    lib_dirs = os.environ['LDFLAGS']
-+
-         # Load the cached config data from a previous run if possible; compiling
-         # things to test for features is slow
-         cache_file = os.path.join(self.build_temp, 'config.cache')
-@@ -356,7 +351,7 @@
-                                                    in optional_headers]),
-                             'sockaddr': sockaddr }
- 
--                    if self.test_build(testrig, execute=False):
-+                    if self.test_build(testrig, execute=False, library_dirs = [lib_dirs]):
-                         result.append(sockaddr)
-                 
-             if result:
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index 5bfa326..b5185f0 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PYTHON_NETIFACES_VERSION = 0.6
+PYTHON_NETIFACES_VERSION = 0.7
 PYTHON_NETIFACES_SOURCE  = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
 PYTHON_NETIFACES_SITE    = http://alastairs-place.net/projects/netifaces
 
