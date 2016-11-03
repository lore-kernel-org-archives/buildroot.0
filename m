From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 3 Nov 2016 21:36:04 +0100
Subject: [Buildroot] [PATCH v2] owfs: install python bindings in the correct
	location
Message-ID: <20161103203604.19427-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The owfs build system has a pretty complicated way of configuring the
Python bindings. It ends up with setting PYSITEDIR to the host-python
site-packages path, and it still prepends DESTDIR to that.

As a simple fix, override PYSITEDIR with the correct value on the make
command line.

Fixes:
http://autobuild.buildroot.net/results/200/200846650641494290aa67d28ea6fb2c9351d4dc
http://autobuild.buildroot.net/results/99c/99c00248dd8b00071bcdbc73336cc276c68a4c16
and many more

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: use an intermediate OWFS_EXTRA_MAKE_OPTS instead of directly
    overwriting OWFS_MAKE, so it is easier to append stuff.
---
 package/owfs/owfs.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index 83614af..e0679d2 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -66,6 +66,13 @@ OWFS_MAKE_ENV += \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
 OWFS_DEPENDENCIES += python host-swig
+# The configure scripts finds PYSITEDIR as the python_lib directory of
+# host-python, and then prepends DESTDIR in front of it. So we end up
+# installing things in $(TARGET_DIR)/$(HOST_DIR)/usr/lib/python which is
+# clearly wrong.
+# Patching owfs to do the right thing is not trivial, it's much easier to
+# override the PYSITEDIR variable in make.
+OWFS_EXTRA_MAKE_OPTS += PYSITEDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 else
 OWFS_CONF_OPTS += --disable-owpython --without-python
 endif
@@ -75,6 +82,8 @@ ifeq ($(BR2_STATIC_LIBS),y)
 OWFS_CONF_OPTS += --disable-zero
 endif
 
+OWFS_MAKE = $(MAKE) $(OWFS_EXTRA_MAKE_OPTS)
+
 define OWFS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)S25owserver \
 		$(TARGET_DIR)/etc/init.d/S25owserver
-- 
2.9.3
