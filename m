From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Dec 2016 10:27:31 +0100
Subject: [Buildroot] [git commit] package/python: security bump version to
	2.7.13
Message-ID: <20161222093427.28BB77FCFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5df0bfa9a0f36c6533e95621363d004bd36785fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patches 004 & 010.

Changelog:
https://hg.python.org/cpython/raw-file/v2.7.13/Misc/NEWS

Fixes CVE-2016-2183 & CVE-2016-1000110.

This bump also fixes the host build with openssl 1.1.0,
http://patchwork.ozlabs.org/patch/696139/ is not needed anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/004-sysconfigdata-install-location.patch | 6 +++---
 package/python/010-fix-python-config.patch              | 2 +-
 package/python/python.hash                              | 6 +++---
 package/python/python.mk                                | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python/004-sysconfigdata-install-location.patch b/package/python/004-sysconfigdata-install-location.patch
index edf7120..2998364 100644
--- a/package/python/004-sysconfigdata-install-location.patch
+++ b/package/python/004-sysconfigdata-install-location.patch
@@ -58,9 +58,9 @@ Index: b/Makefile.pre.in
  	-rm -f python*-gdb.py
 -	-rm -f pybuilddir.txt
 +	-rm -f pybuilddir.txt pysysconfigdatadir.txt
- 	find $(srcdir)/[a-zA-Z]* '(' -name '*.fdc' -o -name '*~' \
- 				     -o -name '[@,#]*' -o -name '*.old' \
- 				     -o -name '*.orig' -o -name '*.rej' \
+ 	# Issue #28258: set LC_ALL to avoid issues with Estonian locale.
+ 	# Expansion is performed here by shell (spawned by make) itself before
+ 	# arguments are passed to find. So LC_ALL=C must be set as a separate
 Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
diff --git a/package/python/010-fix-python-config.patch b/package/python/010-fix-python-config.patch
index 1266f3d..b40339b 100644
--- a/package/python/010-fix-python-config.patch
+++ b/package/python/010-fix-python-config.patch
@@ -61,7 +61,7 @@ Index: b/Makefile.pre.in
 @@ -410,7 +410,7 @@
  
  # Default target
- all:		build_all
+ all:		@DEF_MAKE_ALL_RULE@
 -build_all:	$(BUILDPYTHON) oldsharedmods sharedmods gdbhooks
 +build_all:	$(BUILDPYTHON) oldsharedmods sharedmods gdbhooks python-config
  
diff --git a/package/python/python.hash b/package/python/python.hash
index b7d0036..f285e42 100644
--- a/package/python/python.hash
+++ b/package/python/python.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-2712/
-md5	57dffcee9cee8bb2ab5f82af1d8e9a69	Python-2.7.12.tar.xz
+# From https://www.python.org/downloads/release/python-2713/
+md5 53b43534153bb2a0363f08bae8b9d990  Python-2.7.13.tar.xz
 # Locally calculated
-sha256 d7837121dd5652a05fef807c361909d255d173280c4e1a4ded94d73d80a1f978  Python-2.7.12.tar.xz
+sha256 35d543986882f78261f97787fd3e06274bfa6df29fac9b4a94f73930ff98f731  Python-2.7.13.tar.xz
diff --git a/package/python/python.mk b/package/python/python.mk
index cfd5a0a..7b20434 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).12
+PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).13
 PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE = http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE = Python software foundation license v2, others
