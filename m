From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  7 May 2010 21:30:08 +0200
Subject: [Buildroot] [PATCH 2/3] libxcb: fix path to Python modules
In-Reply-To: <cover.1273260574.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273260574.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4880edd506a2c629efa4ccf38f27f47d5d5d8804.1273260574.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building libxcb, the variable XCBPROTO_XCBPYTHONDIR must point to
the location where the Python modules needed to run the c_client.py
program are installed. The path
$(STAGING_DIR)/usr/lib/python2.6/site-packages was hardcoded. However,
it doesn't work when the version of Python installed on the host is
Python 2.5.

Therefore, add a little bit of magic to compute the host Python
version.

We also verify that Python is available on the host, as we don't build
it in Buildroot.

Fixes bug #1531.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/libxcb/libxcb.mk         |    3 ++-
 toolchain/dependencies/dependencies.sh |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index ec9843e..c8b70ea 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -13,7 +13,8 @@ LIBXCB_AUTORECONF = NO
 LIBXCB_LIBTOOL_PATCH = NO
 LIBXCB_DEPENDENCIES = host-libxslt pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau
 LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
-LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb XCBPROTO_XCBPYTHONDIR=$(STAGING_DIR)/usr/lib/python2.6/site-packages
+HOST_PYTHON_VERSION=$(shell python --version 2>&1 | sed 's/Python \(2\.[0-9]\)\..*/\1/')
+LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb XCBPROTO_XCBPYTHONDIR=$(STAGING_DIR)/usr/lib/python$(HOST_PYTHON_VERSION)/site-packages
 
 $(eval $(call AUTOTARGETS,package/x11r7,libxcb))
 
diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 013c1d5..923c76b 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -122,7 +122,7 @@ if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
 fi;
 
 # Check that a few mandatory programs are installed
-for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio ; do
+for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python ; do
     if ! which $prog > /dev/null ; then
 	/bin/echo -e "\nYou must install '$prog' on your build machine";
 	if test $prog = "makeinfo" ; then
-- 
1.6.3.3
