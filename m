From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 00:55:22 +0100
Subject: [Buildroot] [PATCH] package/owfs: fixup Python sysconfigdata for
 per-package directories
Message-ID: <20200217235523.107701-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is needed so that building the owfs Python module uses the gcc
from owfs per-package directory, and not the one from the python
per-package directory.

Fixes:

  http://autobuild.buildroot.net/results/0d582dda367507991a4c38141db36b0fa8e47e67/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/owfs/owfs.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index 7668735ff5..ffc0b3098d 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -87,6 +87,16 @@ OWFS_DEPENDENCIES += python host-swig
 # Patching owfs to do the right thing is not trivial, it's much easier to
 # override the PYSITEDIR variable in make.
 OWFS_EXTRA_MAKE_OPTS += PYSITEDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define OWFS_FIXUP_PYTHON_SYSCONFIGDATA
+	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
+		-name "_sysconfigdata*.py" | xargs --no-run-if-empty \
+		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/owfs/:g"
+endef
+OWFS_PRE_CONFIGURE_HOOKS += OWFS_FIXUP_PYTHON_SYSCONFIGDATA
+endif
+
 else
 OWFS_CONF_OPTS += --disable-owpython --without-python
 endif
-- 
2.24.1
