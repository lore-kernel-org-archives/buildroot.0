From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 19:33:01 +0200
Subject: [Buildroot] [git commit] package/python-more-itertools: drop Python
 2 support
Message-ID: <20191021172643.83924836C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8542a545ecffb82cc91adbcf548e2eedbd040bae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 6.0.0, the package supports only Python 3, and will
lead to syntax errors when in use with Python 2.
In addition, the dependency of python-six is no longer needed.

The reursive reverse dependencies were updated accordingly.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cheroot/Config.in          | 3 +--
 package/python-cherrypy/Config.in         | 7 +++----
 package/python-jaraco-functools/Config.in | 3 +--
 package/python-more-itertools/Config.in   | 2 +-
 package/python-portend/Config.in          | 1 +
 package/python-tempora/Config.in          | 1 +
 package/python-webpy/Config.in            | 2 +-
 7 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/python-cheroot/Config.in b/package/python-cheroot/Config.in
index 0b732f8c0b..45dd2d8a11 100644
--- a/package/python-cheroot/Config.in
+++ b/package/python-cheroot/Config.in
@@ -1,10 +1,9 @@
 config BR2_PACKAGE_PYTHON_CHEROOT
 	bool "python-cheroot"
+	depends on BR2_PACKAGE_PYTHON3 # python-more-itertools, python-jaraco-functools
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE \
-	       if BR2_PACKAGE_PYTHON # runtime
 	help
 	  Cheroot is the high-performance, pure-Python
 	  HTTP server used by CherryPy.
diff --git a/package/python-cherrypy/Config.in b/package/python-cherrypy/Config.in
index 622dd1f49b..eb83054be3 100644
--- a/package/python-cherrypy/Config.in
+++ b/package/python-cherrypy/Config.in
@@ -1,13 +1,12 @@
 config BR2_PACKAGE_PYTHON_CHERRYPY
 	bool "python-cherrypy"
+	depends on BR2_PACKAGE_PYTHON3 # python-cheroot, python-portend
 	select BR2_PACKAGE_PYTHON_CHEROOT # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_CLASSES # runtime
 	select BR2_PACKAGE_PYTHON_PORTEND # runtime
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  A minimalist web framework
 
diff --git a/package/python-jaraco-functools/Config.in b/package/python-jaraco-functools/Config.in
index 62669dba6f..6c914f3851 100644
--- a/package/python-jaraco-functools/Config.in
+++ b/package/python-jaraco-functools/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS
 	bool "python-jaraco-functools"
+	depends on BR2_PACKAGE_PYTHON3 # python-more-itertools
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE \
-	       if BR2_PACKAGE_PYTHON # runtime
 	help
 	  Additional functools in the spirit of stdlib???s
 	  functools.
diff --git a/package/python-more-itertools/Config.in b/package/python-more-itertools/Config.in
index dc5fb7ce54..1a7f95c27f 100644
--- a/package/python-more-itertools/Config.in
+++ b/package/python-more-itertools/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_MORE_ITERTOOLS
 	bool "python-more-itertools"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  More routines for operating on iterables, beyond itertools.
 
diff --git a/package/python-portend/Config.in b/package/python-portend/Config.in
index 6b21078caa..30a50c7f61 100644
--- a/package/python-portend/Config.in
+++ b/package/python-portend/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PORTEND
 	bool "python-portend"
+	depends on BR2_PACKAGE_PYTHON3 # python-tempora
 	select BR2_PACKAGE_PYTHON_TEMPORA # runtime
 	help
 	  TCP port monitoring utilities.
diff --git a/package/python-tempora/Config.in b/package/python-tempora/Config.in
index 508cbae3f3..06ccbfc283 100644
--- a/package/python-tempora/Config.in
+++ b/package/python-tempora/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TEMPORA
 	bool "python-tempora"
+	depends on BR2_PACKAGE_PYTHON3 # python-jaraco-functools
 	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
diff --git a/package/python-webpy/Config.in b/package/python-webpy/Config.in
index d30da70e13..419a4a180f 100644
--- a/package/python-webpy/Config.in
+++ b/package/python-webpy/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEBPY
 	bool "python-webpy"
-	select BR2_PACKAGE_PYTHON_HASHLIB if BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON3 # python-cheroot
 	select BR2_PACKAGE_PYTHON_CHEROOT # runtime
 	select BR2_PACKAGE_PYTHON_MARKDOWN # runtime
 	help
