From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 15:31:19 +0200
Subject: [Buildroot] [git commit] python: rework python symlinks installation
Message-ID: <20140405153937.A39B29C58D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1584b7d335002f6107d5da92d82aa5fd5a51532
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change adds a patch to python disabling the installation of the
python and python-config symlinks.

This allows Buildroot to control these symlinks' installation:

* the python symlink should be unconditionally installed in the target
  tree, and the python-config symlink in the staging tree, since it is
  only built and installed in the target tree if the user selected it;

* the python and python-config symlinks should only be installed in
  the host tree when python(2) is the selection of the user for the
  target.
  Otherwise, when python3 is selected for the target, the host-python
  may be required to built some packages. In such cases, the python
  symlink should points to python3 (so should the python-config
  symlink) to reflect the staging/target tree.

[Thomas: fix comments according to Yann's suggestions, and replaced
python(2) by python2, as suggested by Yann.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../python/python-011-remove-python-symlink.patch  |   29 ++++++++++++++++++++
 package/python/python.mk                           |   26 +++++++++++++++++
 2 files changed, 55 insertions(+), 0 deletions(-)

diff --git a/package/python/python-011-remove-python-symlink.patch b/package/python/python-011-remove-python-symlink.patch
new file mode 100644
index 0000000..a9b1daa
--- /dev/null
+++ b/package/python/python-011-remove-python-symlink.patch
@@ -0,0 +1,29 @@
+Remove the python symlink install rules.
+
+The python symlink installation will be handled by Buildroot itself, because
+Buildroot needs to control to what python interpreter (python2 or python3) the
+python symlink points to.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+diff -purN a/Makefile.pre.in b/Makefile.pre.in
+--- a/Makefile.pre.in	2014-03-02 17:56:56.529132499 +0100
++++ b/Makefile.pre.in	2014-03-02 19:24:02.346491849 +0100
+@@ -857,17 +857,10 @@ $(DESTSHARED):
+ #  $(PYTHON) -> python2 -> python$(VERSION))
+ # Also create equivalent chains for other installed files
+ bininstall:	altbininstall
+-	-if test -f $(DESTDIR)$(BINDIR)/$(PYTHON) -o -h $(DESTDIR)$(BINDIR)/$(PYTHON); \
+-	then rm -f $(DESTDIR)$(BINDIR)/$(PYTHON); \
+-	else true; \
+-	fi
+-	(cd $(DESTDIR)$(BINDIR); $(LN) -s python2$(EXE) $(PYTHON))
+ 	-rm -f $(DESTDIR)$(BINDIR)/python2$(EXE)
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)$(EXE) python2$(EXE))
+ 	-rm -f $(DESTDIR)$(BINDIR)/python2-config
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-config python2-config)
+-	-rm -f $(DESTDIR)$(BINDIR)/python-config
+-	(cd $(DESTDIR)$(BINDIR); $(LN) -s python2-config python-config)
+ 	-test -d $(DESTDIR)$(LIBPC) || $(INSTALL) -d -m $(DIRMODE) $(DESTDIR)$(LIBPC)
+ 	-rm -f $(DESTDIR)$(LIBPC)/python2.pc
+ 	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python2.pc)
diff --git a/package/python/python.mk b/package/python/python.mk
index 216448e..feff644 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -175,8 +175,34 @@ endef
 
 PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_ENSURE_LIBPYTHON_STRIPPED
 
+# Always install the python symlink in the target tree
+define PYTHON_INSTALL_TARGET_PYTHON_SYMLINK
+	ln -sf python2 $(TARGET_DIR)/usr/bin/python
+endef
+
+PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_INSTALL_TARGET_PYTHON_SYMLINK
+
+# Always install the python-config symlink in the staging tree
+define PYTHON_INSTALL_STAGING_PYTHON_CONFIG_SYMLINK
+	ln -sf python2-config $(STAGING_DIR)/usr/bin/python-config
+endef
+
+PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_INSTALL_STAGING_PYTHON_CONFIG_SYMLINK
+
 PYTHON_AUTORECONF = YES
 
+# Some packages may have build scripts requiring python2.
+# Only install the python symlink in the host tree if python2 is enabled
+# for the target.
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+define HOST_PYTHON_INSTALL_PYTHON_SYMLINK
+	ln -sf python2 $(HOST_DIR)/usr/bin/python
+	ln -sf python2-config $(HOST_DIR)/usr/bin/python-config
+endef
+
+HOST_PYTHON_POST_INSTALL_HOOKS += HOST_PYTHON_INSTALL_PYTHON_SYMLINK
+endif
+
 # Provided to other packages
 PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
 
