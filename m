From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Wed, 11 Mar 2020 11:54:46 +0100
Subject: [Buildroot] [PATCH v3 3/4] package/python-iptables: use installed
 iptables by default
In-Reply-To: <20200311105447.23808-1-frank.vanbever@essensium.com>
References: <20200228163917.10596-1-frank.vanbever@essensium.com>
 <20200311105447.23808-1-frank.vanbever@essensium.com>
Message-ID: <20200311105447.23808-3-frank.vanbever@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-iptables depends on ctypes.util.find_library() which does not work due to
the absence of gcc and friends on target. The location of the xtables library
and the iptables modules can be configured through environment variables. Within
the scope of buildroot we can determine what these should be at build time and
replace the calls to os.getenv() with the correct value.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12271

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
---
v2 -> v3:
 - None
v1 -> v2:
 - Remove unnecessary continuation in pre-build hook
 - Change sed separator to %

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
---
 package/python-iptables/Config.in          | 2 +-
 package/python-iptables/python-iptables.mk | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/python-iptables/Config.in b/package/python-iptables/Config.in
index a35577bad3..0e24283d06 100644
--- a/package/python-iptables/Config.in
+++ b/package/python-iptables/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_IPTABLES
 	bool "python-iptables"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_IPTABLES # runtime dependency
+	select BR2_PACKAGE_IPTABLES
 	help
 	  Python bindings for iptables.
 
diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
index 66e478a89a..38c6ee3950 100644
--- a/package/python-iptables/python-iptables.mk
+++ b/package/python-iptables/python-iptables.mk
@@ -9,5 +9,14 @@ PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/08/5e/16a5ca35c42
 PYTHON_IPTABLES_SETUP_TYPE = setuptools
 PYTHON_IPTABLES_LICENSE = Apache-2.0
 PYTHON_IPTABLES_LICENSE_FILES = NOTICE
+PYTHON_IPTABLES_DEPENDENCIES = iptables
+
+define PYTHON_IPTABLES_SET_XTABLES_ENV_VARS
+	XTABLES_VERSION=`awk '/XTABLES_VERSION_CODE/ {print $$NF}' $(STAGING_DIR)/usr/include/xtables-version.h`; \
+	sed -i "s%os.getenv(\"PYTHON_IPTABLES_XTABLES_VERSION\")%$$XTABLES_VERSION%" $(@D)/iptc/xtables.py
+	sed -i "s%os.getenv(\"XTABLES_LIBDIR\")%\"/usr/lib/xtables\"%" $(@D)/iptc/xtables.py
+endef
+
+PYTHON_IPTABLES_PRE_BUILD_HOOKS += PYTHON_IPTABLES_SET_XTABLES_ENV_VARS
 
 $(eval $(python-package))
-- 
2.20.1
