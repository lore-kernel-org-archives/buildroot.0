From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Jun 2011 11:39:37 +0200
Subject: [Buildroot] [git commit] libdnet: fix python module build
Message-ID: <20110621094118.9D45D88C8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=21438ec500ca0962fa0f2572a6212786674d5e32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure the correct compiler/linker flags are used.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libdnet/libdnet-002-python-makefile.patch |   12 +++++++++---
 package/libdnet/libdnet.mk                        |    2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/libdnet/libdnet-002-python-makefile.patch b/package/libdnet/libdnet-002-python-makefile.patch
index 4c8729d..fb41e43 100644
--- a/package/libdnet/libdnet-002-python-makefile.patch
+++ b/package/libdnet/libdnet-002-python-makefile.patch
@@ -1,10 +1,16 @@
---- a/python/Makefile.am	2006-01-15 18:08:23.000000000 +1100
-+++ b/python/Makefile.am	2008-09-04 15:25:52.000000000 +1000
+---
+ python/Makefile.am |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: libdnet-1.11/python/Makefile.am
+===================================================================
+--- libdnet-1.11.orig/python/Makefile.am
++++ libdnet-1.11/python/Makefile.am
 @@ -11,6 +11,7 @@
  	pyrexc $(srcdir)/dnet.pyx
  
  python-build: $(srcdir)/dnet.c
-+	CC="$(CC)" LDSHARED="$(CC) -shared" $(PYTHON) setup.py build_ext -I$(PYINCDIR)
++	CC="$(CC)" LDSHARED="$(CC) -shared" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(PYTHON) setup.py build_ext -I$(PYINCDIR) -L$(PYLIBDIR)
  	$(PYTHON) setup.py build
  	touch python-build
  
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 649db31..ae4c9ff 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -17,7 +17,7 @@ LIBDNET_CONF_OPT = \
 ifneq ($(BR2_PACKAGE_LIBDNET_PYTHON),)
 LIBDNET_DEPENDENCIES = python
 LIBDNET_CONF_OPT += --with-python
-LIBDNET_MAKE_OPT = PYTHON=python$(PYTHON_VERSION_MAJOR) PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
+LIBDNET_MAKE_OPT = PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) PYLIBDIR=$(STAGING_DIR)/usr/lib
 LIBDNET_INSTALL_TARGET_OPT = $(LIBDNET_MAKE_OPT) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
 LIBDNET_INSTALL_STAGING_OPT = $(LIBDNET_MAKE_OPT) DESTDIR=$(STAGING_DIR) install
 endif
-- 
1.7.3.4
