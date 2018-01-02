From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  2 Jan 2018 11:33:32 -0500
Subject: [Buildroot] [PATCH 3/8] python-setuptools: check host-python version
In-Reply-To: <20180102163337.6334-1-aduskett@gmail.com>
References: <20180102163337.6334-1-aduskett@gmail.com>
Message-ID: <20180102163337.6334-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-setuptools is compatible with both python2 and python3, as such,
there is no need to force python2 as a dependency.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-setuptools/python-setuptools.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 28d4f29b5b..a21494a288 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -10,10 +10,18 @@ PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
+HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON += python3
+HOST_PYTHON_SETUPTOOLS_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
+else
+HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON += python
+HOST_PYTHON_SETUPTOOLS_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
+endif
+
 # recent setuptools versions require bootstrap.py to be invoked
 # before the standard setup process.
 define PYTHON_SETUPTOOLS_RUN_BOOTSTRAP
-	cd  $(@D) && $(HOST_DIR)/bin/python ./bootstrap.py
+	cd  $(@D) && $(HOST_DIR)/bin/$(HOST_PYTHON_SETUPTOOLS_PYLIBVER) ./bootstrap.py
 endef
 
 PYTHON_SETUPTOOLS_PRE_CONFIGURE_HOOKS = PYTHON_SETUPTOOLS_RUN_BOOTSTRAP
-- 
2.14.3
