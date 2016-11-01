From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Nov 2016 15:14:48 +0100
Subject: [Buildroot] [PATCH] owfs: install python bindings in the correct
	location
Message-ID: <20161101141448.14792-1-arnout@mind.be>
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
 package/owfs/owfs.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index 83614af..7ee8915 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -66,6 +66,15 @@ OWFS_MAKE_ENV += \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
 OWFS_DEPENDENCIES += python host-swig
+# The configure scripts finds PYSITEDIR as the python_lib directory of
+# host-python, and then prepends DESTDIR in front of it. So we end up
+# installing things in $(TARGET_DIR)/$(HOST_DIR)/usr/lib/python which is
+# clearly wrong.
+# Patching owfs to do the right thing is not trivial, it's much easier to
+# override the PYSITEDIR variable in make. That, in turn, is easier to do by
+# setting OWFS_MAKE, otherwise both OWFS_INSTALL_STAGING_OPTS and
+# OWFS_INSTALL_TARGET_OPTS would have to be overridden
+OWFS_MAKE = $(MAKE) PYSITEDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 else
 OWFS_CONF_OPTS += --disable-owpython --without-python
 endif
-- 
2.9.3
