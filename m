From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Nov 2019 15:33:07 +0100
Subject: [Buildroot] [git commit] package/jailhouse: python scripts needs
 python-mako
Message-ID: <20191110142612.66B338E76E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e63ec171df98860e18d8328d9d00248050af69d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jailhouse-config-create script needs python-mako, see
https://github.com/siemens/jailhouse/commit/5c7f2c4c30f19aa7eb95dffa7b7bb92393c09ba7

Moreover jailhouse-config-create needs host-python-mako to build
jailhouse-config-collect

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jailhouse/Config.in    |  1 +
 package/jailhouse/jailhouse.mk | 12 +++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
index 5b9ecc7b7b..d270a2ae8e 100644
--- a/package/jailhouse/Config.in
+++ b/package/jailhouse/Config.in
@@ -16,6 +16,7 @@ if BR2_PACKAGE_JAILHOUSE
 config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
 	bool "Jailhouse helper scripts"
 	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_MAKO # runtime
 	help
 	  Python-based helpers for the Jailhouse Hypervisor.
 
diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index fa74f9e8c4..aab232eb92 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -18,10 +18,16 @@ JAILHOUSE_MAKE_OPTS = \
 	DESTDIR="$(TARGET_DIR)"
 
 ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
-JAILHOUSE_DEPENDENCIES += host-python-setuptools
-JAILHOUSE_MAKE_OPTS += PYTHON_PIP_USABLE="yes"
+JAILHOUSE_DEPENDENCIES += \
+	host-python-mako \
+	host-python-setuptools
+JAILHOUSE_MAKE_OPTS += \
+	HAS_PYTHON_MAKO="yes" \
+	PYTHON_PIP_USABLE="yes"
 else
-JAILHOUSE_MAKE_OPTS += PYTHON_PIP_USABLE="no"
+JAILHOUSE_MAKE_OPTS += \
+	HAS_PYTHON_MAKO="no" \
+	PYTHON_PIP_USABLE="no"
 endif
 
 define JAILHOUSE_BUILD_CMDS
