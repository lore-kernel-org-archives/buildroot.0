From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 20:40:56 +0200
Subject: [Buildroot] [git commit] attr: add patch to fix static installation
Message-ID: <20130823184141.79B489B551@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd2cac813e8f2cc9a2d6c1f3632ecb248de39feb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When attr is built static-only, it forgets to install its libattr.a
file, which leads to the build failure of packages such as 'acl' that
rely on attr.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../attr/attr-01-support-static-installation.patch |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/attr/attr-01-support-static-installation.patch b/package/attr/attr-01-support-static-installation.patch
new file mode 100644
index 0000000..87858ac
--- /dev/null
+++ b/package/attr/attr-01-support-static-installation.patch
@@ -0,0 +1,29 @@
+Support installation of .a file when doing static linking
+
+When doing static linking (i.e ENABLE_SHARED != yes), the attr build
+logic wasn't installing any library at all, not even the .a file which
+is needed for static linking. This patch fixes that.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/include/buildmacros
+===================================================================
+--- a/include/buildmacros
++++ b/include/buildmacros
+@@ -97,7 +97,15 @@
+ 
+ INSTALL_LTLIB_STATIC = \
+ 	cd $(TOPDIR)/$(LIBNAME)/.libs; \
+-	../$(INSTALL) -m 755 -d $(PKG_DEVLIB_DIR);
++	../$(INSTALL) -m 755 -d $(PKG_DEVLIB_DIR); \
++	../$(INSTALL) -m 644 -T old_lib $(LIBNAME).la $(PKG_DEVLIB_DIR); \
++	../$(INSTALL) -m 644 $(LIBNAME).la $(PKG_DEVLIB_DIR)/$(LIBNAME).la ; \
++	../$(INSTALL) -m 755 -d $(PKG_LIB_DIR); \
++	../$(INSTALL) -T so_base $(LIBNAME).la $(PKG_LIB_DIR); \
++	if test "x$(PKG_DEVLIB_DIR)" != "x$(PKG_LIB_DIR)" ; then \
++	../$(INSTALL) -S $(PKG_DEVLIB_DIR)/$(LIBNAME).a $(PKG_LIB_DIR)/$(LIBNAME).a; \
++	../$(INSTALL) -S $(PKG_DEVLIB_DIR)/$(LIBNAME).la $(PKG_LIB_DIR)/$(LIBNAME).la; \
++	fi
+ 
+ INSTALL_MAN = \
+ 	@for d in $(MAN_PAGES); do \
