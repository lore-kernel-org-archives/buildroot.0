From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jan 2021 23:16:56 +0100
Subject: [Buildroot] [git commit] package/open62541: new package
Message-ID: <20210105220234.A636385FD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b36ea68b5ad0f89ffd92cac3f91654e180683b1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann CARDAILLAC <ycardaillac@sepro-group.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  3 ++
 package/Config.in                |  1 +
 package/open62541/Config.in      | 71 ++++++++++++++++++++++++++++++++++++++++
 package/open62541/open62541.hash |  3 ++
 package/open62541/open62541.mk   | 55 +++++++++++++++++++++++++++++++
 5 files changed, 133 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ddab7073b8..258a51a14c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2710,6 +2710,9 @@ F:	package/fwup/
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/gloox/
 
+N:	Yann CARDAILLAC <ycardaillac@sepro-group.com>
+F:	package/open62541/
+
 N:	Yann E. MORIN <yann.morin.1998@free.fr>
 F:	board/friendlyarm/nanopi-neo/
 F:	configs/nanopi_neo_defconfig
diff --git a/package/Config.in b/package/Config.in
index 219dba1c9d..7264198001 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1803,6 +1803,7 @@ menu "Networking"
 	source "package/nss-myhostname/Config.in"
 	source "package/nss-pam-ldapd/Config.in"
 	source "package/omniorb/Config.in"
+	source "package/open62541/Config.in"
 	source "package/openldap/Config.in"
 	source "package/openmpi/Config.in"
 	source "package/openpgm/Config.in"
diff --git a/package/open62541/Config.in b/package/open62541/Config.in
new file mode 100644
index 0000000000..a835595e83
--- /dev/null
+++ b/package/open62541/Config.in
@@ -0,0 +1,71 @@
+config BR2_PACKAGE_OPEN62541
+	bool "open62541"
+	help
+	  open62541 is an open source and free implementation of OPC UA.
+
+	  http://open62541.org
+
+if BR2_PACKAGE_OPEN62541
+
+choice
+	prompt "namespace zero nodes"
+	help
+	  Namespace zero contains the standard-defined nodes. The full
+	  namespace zero may not be required for all applications.
+
+config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_DEFAULT
+	bool "default"
+	help
+	  Use the default namespace zero contents.
+
+config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL
+	bool "minimal"
+	help
+	  A barebones namespace zero that is compatible with most
+	  clients.  But this namespace 0 is so small that it does not
+	  pass the CTT (Conformance Testing Tools of the OPC
+	  Foundation).
+
+config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED
+	bool "reduced"
+	help
+	  Small namespace zero that passes the CTT.
+
+config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL
+	bool "full"
+	help
+	  Full namespace zero generated from the official XML
+	  definitions.
+
+endchoice
+
+config BR2_PACKAGE_OPEN62541_JSON_ENCODING
+	bool "json encoding"
+
+config BR2_PACKAGE_OPEN62541_PUBSUB
+	bool "publish/subscribe"
+	help
+	  Enable the experimental OPC UA PubSub support. The option
+	  will include the PubSub UDP multicast plugin.
+
+if BR2_PACKAGE_OPEN62541_PUBSUB
+
+config BR2_PACKAGE_OPEN62541_PUBSUB_DELTAFRAMES
+	bool "publish/subscribe deltaframes"
+	help
+	  The PubSub messages differentiate between keyframe (all
+	  published values contained) and deltaframe (only changed
+	  values contained) messages. Deltaframe messages creation
+	  consumes some additional ressources.
+
+config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL
+	bool "publish/subscribe information model"
+	depends on BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED || \
+		BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL
+	help
+	  Enable the information model representation of the PubSub
+	  configuration.
+
+endif # BR2_PACKAGE_OPEN62541_PUBSUB
+
+endif
diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
new file mode 100644
index 0000000000..a6b3b38ec6
--- /dev/null
+++ b/package/open62541/open62541.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 3300149c2e9e8c1f87fe2786e25d74372a33611a0bd4c6c202c5fca347633069  open62541-1.0.tar.gz
+sha256 fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
new file mode 100644
index 0000000000..71c14f78ba
--- /dev/null
+++ b/package/open62541/open62541.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# open62541
+#
+################################################################################
+
+OPEN62541_VERSION = 1.0
+OPEN62541_DL_VERSION = v$(OPEN62541_VERSION)
+OPEN62541_SITE_METHOD = git
+OPEN62541_SITE = git://github.com/open62541/open62541.git
+OPEN62541_GIT_SUBMODULES = YES
+OPEN62541_INSTALL_STAGING = YES
+OPEN62541_LICENSE = MPL-2.0
+OPEN62541_LICENSE_FILES = LICENSE
+
+# Don't use git describe to get the version number.
+# Disable hardening options to let Buildroot handle it.
+OPEN62541_CONF_OPTS = \
+	-DGIT_EXECUTABLE=NO \
+	-DOPEN62541_VERSION=$(OPEN62541_VERSION) \
+	-DUA_ENABLE_HARDENING=OFF
+
+ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL),y)
+OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL
+else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED),y)
+OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=REDUCED
+else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL),y)
+OPEN62541_CONF_OPTS +=  -DUA_NAMESPACE_ZERO=FULL
+endif
+
+ifeq ($(BR2_PACKAGE_OPEN62541_JSON_ENCODING),y)
+OPEN62541_CONF_OPTS += -DUA_ENABLE_JSON_ENCODING=ON
+else
+OPEN62541_CONF_OPTS += -DUA_ENABLE_JSON_ENCODING=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB),y)
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB=ON
+else
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB_DELTAFRAMES),y)
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_DELTAFRAMES=ON
+else
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_DELTAFRAMES=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL),y)
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL=ON
+else
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL=OFF
+endif
+
+$(eval $(cmake-package))
