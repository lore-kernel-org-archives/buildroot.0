From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 May 2010 23:55:16 +0200
Subject: [Buildroot] [PATCH 2/3] libxcb: fix path to Python modules
In-Reply-To: <cover.1273096504.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273096504.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ea5d9f4196b6fdcd1fc55428c058b1d83b430591.1273096504.git.thomas.petazzoni@free-electrons.com>
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

Fixes bug #1531.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/libxcb/libxcb.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
 
-- 
1.6.3.3
