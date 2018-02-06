From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  6 Feb 2018 16:16:45 -0600
Subject: [Buildroot] [PATCH v2] setools: set package include path
Message-ID: <1517955405-12547-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With per-package host/staging, the setuptools include path will
point at the python package's include folder and not the common
sysroot/hostdir location.  So this patch updates to explicitly
point at the respective folder for the target vs host.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--
Changes v1 -> v2
 - correct path for target to be ${STAGING_DIR}/usr
    (previous did not include usr)
---
 package/setools/setools.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 6748c95..bef7356 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -20,6 +20,9 @@ SETOOLS_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 SETOOLS_DEPENDENCIES += python-enum34
 endif
 
+SETOOLS_ENV += SEPOL_SRC=$(STAGING_DIR)/usr
+HOST_SETOOLS_ENV += SEPOL_SRC=$(HOST_DIR)
+
 define SETOOLS_FIX_SETUP
 	# By default, setup.py will look for libsepol.a in the host machines
 	# /usr/lib directory. This needs to be changed to the staging directory.
-- 
1.9.1
