From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 20:41:32 +0200
Subject: [Buildroot] [git commit] acl: add patch to fix static installation
Message-ID: <20130823184141.7C6429B528@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8484ed9c075666d9a6f7090e51e291e57c433c84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just like 'attr', 'acl' doesn't use automake to control the
build/installation of its components, and the static-only installation
process was not installing libacl.a. We add a patch that fixes this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../acl/acl-01-support-static-installation.patch   |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/acl/acl-01-support-static-installation.patch b/package/acl/acl-01-support-static-installation.patch
new file mode 100644
index 0000000..4cb473f
--- /dev/null
+++ b/package/acl/acl-01-support-static-installation.patch
@@ -0,0 +1,29 @@
+Support installation of .a file when doing static linking
+
+When doing static linking (i.e ENABLE_SHARED != yes), the acl build
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
