From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  6 Feb 2018 15:54:05 -0600
Subject: [Buildroot] [PATCH] setools: set package include path
Message-ID: <1517954045-19326-1-git-send-email-matthew.weber@rockwellcollins.com>
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
---
 package/setools/setools.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 6748c95..a719ea6 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -20,6 +20,9 @@ SETOOLS_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 SETOOLS_DEPENDENCIES += python-enum34
 endif
 
+SETOOLS_ENV += SEPOL_SRC=$(STAGING_DIR)
+HOST_SETOOLS_ENV += SEPOL_SRC=$(HOST_DIR)
+
 define SETOOLS_FIX_SETUP
 	# By default, setup.py will look for libsepol.a in the host machines
 	# /usr/lib directory. This needs to be changed to the staging directory.
-- 
1.9.1
