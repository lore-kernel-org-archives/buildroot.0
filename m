From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jul 2010 23:41:14 +0200
Subject: [Buildroot] [git commit master 1/1] alsa-lib: make sure to only
	look in STAGING_DIR for Python includes
Message-ID: <20100718214236.68F56807FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=538773a66f2e71ac29cf799e3249737dd6903c8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though we pass a -I option to tell alsa-lib to look for Python
includes in the STAGING_DIR, alsa-lib build process still looks in
/usr/include for some stuff, causing bug #321.

This fix is the one suggested by Ulf Samuelsson in bug #321, and
allows to make alsa-lib with Python support to build properly on a 64
bits machine with python-dev installed on the host. Without this fix,
the build fails with exactly the same problem that Ulf reported.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/alsa-lib/alsa-lib.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index 1f120c6..6e4c575 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -54,7 +54,9 @@ ALSA_LIB_CFLAGS+=-DAVR32_INLINE_BUG
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
-ALSA_LIB_CONF_OPT += --with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR)
+ALSA_LIB_CONF_OPT += \
+	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
+	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_CFLAGS+=-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_DEPENDENCIES = libpython
 else
-- 
1.7.1
