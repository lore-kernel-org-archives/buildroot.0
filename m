From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 13 Jul 2021 21:13:59 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/apg: new package
Message-ID: <20210713191359.858920-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: fixed license, added dot to help text (Yegor)

 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/apg/Config.in |  6 ++++++
 package/apg/apg.hash  |  3 +++
 package/apg/apg.mk    | 21 +++++++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/apg/Config.in
 create mode 100644 package/apg/apg.hash
 create mode 100644 package/apg/apg.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 15ea800f4b..4eb76e0fe1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -314,6 +314,7 @@ N:	Bernd Kuhls <bernd.kuhls@t-online.de>
 F:	package/alsa-lib/
 F:	package/alsa-utils/
 F:	package/apache/
+F:	package/apg/
 F:	package/apr/
 F:	package/apr-util/
 F:	package/bcg729/
diff --git a/package/Config.in b/package/Config.in
index 1a8ba3c23c..f5fb97f3cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2400,6 +2400,7 @@ comment "Shells"
 	source "package/mksh/Config.in"
 	source "package/zsh/Config.in"
 comment "Utilities"
+	source "package/apg/Config.in"
 	source "package/at/Config.in"
 	source "package/bash-completion/Config.in"
 	source "package/ccrypt/Config.in"
diff --git a/package/apg/Config.in b/package/apg/Config.in
new file mode 100644
index 0000000000..94c286a178
--- /dev/null
+++ b/package/apg/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_APG
+	bool "apg"
+	help
+	  Automated Password Generator (APG).
+
+	  https://github.com/wilx/apg
diff --git a/package/apg/apg.hash b/package/apg/apg.hash
new file mode 100644
index 0000000000..5532289a68
--- /dev/null
+++ b/package/apg/apg.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  89539aa734a47d68124fca5ba7acbe559edc5003b6791f5200ef9e706dd00fe9  apg-2.3.0b.tar.gz
+sha256  5d0c892ea452c3828f1e311637cde4e3a04eb6431554308b3fcdac8c1b330168  COPYING
diff --git a/package/apg/apg.mk b/package/apg/apg.mk
new file mode 100644
index 0000000000..ac4dce77f9
--- /dev/null
+++ b/package/apg/apg.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# apg
+#
+################################################################################
+
+APG_VERSION = 2.3.0b
+APG_SITE = $(call github,wilx,apg,v$(APG_VERSION))
+APG_LICENSE = BSD-3-Clause
+APG_LICENSE_FILES = COPYING
+
+define APG_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(APG_CFLAGS)" \
+		-C $(@D)
+endef
+
+define APG_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/apg $(TARGET_DIR)/usr/bin/apg
+endef
+
+$(eval $(generic-package))
-- 
2.30.2
