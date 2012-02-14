From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Feb 2012 10:32:30 +0100
Subject: [Buildroot] [git commit] python: workaround distutils issue with
	binary extensions
Message-ID: <20120214095225.A3DBC90A9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40281284ad5ab41fea4058d57c130cbae0fb9d70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

distutils adds -L$LIBDIR (/usr/lib), breaking build of binary extensions.
Seen with netifaces, but other extensions may be affected as well.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python/python.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 78895d4..28e215c 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -131,6 +131,15 @@ PYTHON_MAKE_ENV = \
 	PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
 	PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib"
 
+# python distutils adds -L$LIBDIR when linking binary extensions, causing
+# trouble for cross compilation
+define PYTHON_FIXUP_LIBDIR
+	$(SED) 's|^LIBDIR=.*|LIBDIR= $(STAGING_DIR)/usr/lib|' \
+	   $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config/Makefile
+endef
+
+PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_FIXUP_LIBDIR
+
 #
 # Development files removal
 #
