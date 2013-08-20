From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Aug 2013 13:03:00 +0200
Subject: [Buildroot] [PATCH 1/5] attr: add patch to fix static installation
In-Reply-To: <1376996584-4462-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1376996584-4462-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1376996584-4462-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When attr is built static-only, it forgets to install its libattr.a
file, which leads to the build failure of packages such as 'acl' that
rely on attr.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../attr/attr-01-support-static-installation.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/attr/attr-01-support-static-installation.patch

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
-- 
1.8.1.2
