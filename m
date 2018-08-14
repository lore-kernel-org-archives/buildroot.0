From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 22:06:32 +0200
Subject: [Buildroot] [git commit branch/next] openresolv: new package
Message-ID: <20180814200645.91C298D31E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6f33738676fe91d1207de927f5bd045e41830da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch added 'openresolv' package support. This tool
provides a dns management framework to track currently
available nameservers.

A key feature of this tool vs resolvconf is the ability to
manage multiple name server input configuration files and
generate the /etc/resolv.conf.  This is handy when you have
multiple dynamic communication paths providing nameserver
information.

REF: https://github.com/rsmarples/openresolv

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/openresolv/Config.in       |  8 ++++++++
 package/openresolv/openresolv.hash |  3 +++
 package/openresolv/openresolv.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5a1a66b1ae..9a2576ddc7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1353,6 +1353,7 @@ F:	package/mtd/
 F:	package/mtools/
 F:	package/nginx-upload/
 F:	package/omniorb/
+F:	package/openresolv/
 F:	package/paxtest/
 F:	package/picocom/
 F:	package/policycoreutils/
diff --git a/package/Config.in b/package/Config.in
index 7b4637900f..eda0f698dc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1866,6 +1866,7 @@ endif
 	source "package/open-plc-utils/Config.in"
 	source "package/openntpd/Config.in"
 	source "package/openobex/Config.in"
+	source "package/openresolv/Config.in"
 	source "package/openssh/Config.in"
 	source "package/openswan/Config.in"
 	source "package/openvpn/Config.in"
diff --git a/package/openresolv/Config.in b/package/openresolv/Config.in
new file mode 100644
index 0000000000..2a393c6bc4
--- /dev/null
+++ b/package/openresolv/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_OPENRESOLV
+	bool "openresolv"
+	help
+	  openresolv is a resolvconf implementation which
+	  manages resolv.conf. This tool provides a dns management
+	  framework to track currently available nameservers.
+
+	  https://github.com/rsmarples/openresolv
diff --git a/package/openresolv/openresolv.hash b/package/openresolv/openresolv.hash
new file mode 100644
index 0000000000..e1a1fb5468
--- /dev/null
+++ b/package/openresolv/openresolv.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 96b3f84435a183426c622db7097a930fb0d48a99e82cd87ce83bd343b8c20574 openresolv-fe4e1ec4e2be2adfc1530ade94ebb30aa6f51540.tar.gz
+sha256 d1f9dcd2dac4e095b14caab517cfe791a6e0785346164b7d0cafc13c714f8aa5 LICENSE
diff --git a/package/openresolv/openresolv.mk b/package/openresolv/openresolv.mk
new file mode 100644
index 0000000000..6adf973527
--- /dev/null
+++ b/package/openresolv/openresolv.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# openresolv
+#
+################################################################################
+
+OPENRESOLV_VERSION = fe4e1ec4e2be2adfc1530ade94ebb30aa6f51540
+OPENRESOLV_SITE = $(call github,rsmarples,openresolv,$(OPENRESOLV_VERSION))
+OPENRESOLV_LICENSE = BSD-2-Clause
+OPENRESOLV_LICENSE_FILES = LICENSE
+
+define OPENRESOLV_CONFIGURE_CMDS
+	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure --prefix=/usr \
+		--sysconfdir=/etc
+endef
+
+define OPENRESOLV_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define OPENRESOLV_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
