From: Yann Cardaillac <ycardaillac@sepro-group.com>
Date: Fri, 17 Jan 2020 09:34:37 +0100 (CET)
Subject: [Buildroot] [PATCH] package/open62541: new package
In-Reply-To: <1579212339-5234-1-git-send-email-yann.cardaillac@smile.fr>
References: <1579212339-5234-1-git-send-email-yann.cardaillac@smile.fr>
Message-ID: <1652584748.18055981.1579250077721.JavaMail.zimbra@sepro-group.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I did a bit of work to simplify our integration of package. 

Kubu gave me a bit of advices before posting the work once again. 

Any feedback will be deeply appreciated. 

However it might take me a bit of time to act on them.

Best regards,

Yann

----- Mail original -----
De: "Yann CARDAILLAC" <yann.cardaillac@smile.fr>
?: "buildroot" <buildroot@busybox.net>
Cc: "Yann CARDAILLAC" <ycardaillac@sepro-group.com>, "romain naour" <romain.naour@smile.fr>
Envoy?: Jeudi 16 Janvier 2020 23:05:39
Objet: [PATCH] package/open62541: new package

From: Yann CARDAILLAC <ycardaillac@sepro-group.com>

Signed-off-by: Yann CARDAILLAC <ycardaillac@sepro-group.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/Config.in                |  1 +
 package/open62541/Config.in      | 62 ++++++++++++++++++++++++++++++++
 package/open62541/open62541.hash |  3 ++
 package/open62541/open62541.mk   | 57 +++++++++++++++++++++++++++++
 4 files changed, 123 insertions(+)
 create mode 100644 package/open62541/Config.in
 create mode 100644 package/open62541/open62541.hash
 create mode 100644 package/open62541/open62541.mk

diff --git a/package/Config.in b/package/Config.in
index 4c94914680..748446f3b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -499,6 +499,7 @@ endmenu
 	source "package/ofono/Config.in"
 	source "package/on2-8170-modules/Config.in"
 	source "package/open2300/Config.in"
+	source "package/open62541/Config.in"
 	source "package/openipmi/Config.in"
 	source "package/openocd/Config.in"
 	source "package/openpowerlink/Config.in"
diff --git a/package/open62541/Config.in b/package/open62541/Config.in
new file mode 100644
index 0000000000..8fb0c1f8e6
--- /dev/null
+++ b/package/open62541/Config.in
@@ -0,0 +1,62 @@
+config BR2_PACKAGE_OPEN62541
+	bool "open62541"
+	help
+	  open62541 is an open source and free implementation of OPC UA
+
+	  http://open62541.org
+
+if BR2_PACKAGE_OPEN62541
+
+choice
+	prompt "choose UA_NAMESPACE_ZERO"
+
+config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_NONE
+	bool "NONE"
+	help
+	  Don't set the UA_NAMESPACE_ZERO.
+
+config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL
+	bool "MINIMAL"
+	help
+	  A barebones namespace zero that is compatible with most
+	  clients.  But this namespace 0 is so small that it does
+	  not pass the CTT
+	  (Conformance Testing Tools of the OPC Foundation).
+
+config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED
+	bool "REDUCED"
+	help
+	  Small namespace zero that passes the CTT.
+
+config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL
+	bool "FULL"
+	help
+	  Full namespace zero generated from the official XML
+	  definitions.
+
+endchoice
+
+menu "Advanced build options"
+
+config BR2_PACKAGE_OPEN62541_JSON_ENCODING
+	bool "json encoding"
+
+config BR2_PACKAGE_OPEN62541_PUBSUB
+	bool "publish/subscribe"
+
+config BR2_PACKAGE_OPEN62541_PUBSUB_DELTAFRAMES
+	bool "publish/subscribe deltaframes"
+
+config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL
+	bool "publish/subscribe informationmodel"
+	depends on BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED || BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL
+	select BR2_PACKAGE_OPEN62541_PUBSUB
+
+config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL_METHODS
+	bool "publish/subscribe informationmodel methods"
+	depends on BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED || BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL
+	select BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL
+
+endmenu
+
+endif
diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
new file mode 100644
index 0000000000..1f9f3787b9
--- /dev/null
+++ b/package/open62541/open62541.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 766dc30dd7d27578560f7091f70f97d1edcbbdbea6ac0c33c6bc6df5e9daadc9  open62541-v1.0.tar.gz
+sha256 fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
new file mode 100644
index 0000000000..b3d2eb7dd5
--- /dev/null
+++ b/package/open62541/open62541.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# open62541
+#
+################################################################################
+
+OPEN62541_VERSION = v1.0
+OPEN62541_SITE_METHOD = git
+OPEN62541_SITE = git://github.com/open62541/open62541.git
+OPEN62541_GIT_SUBMODULES = YES
+OPEN62541_INSTALL_STAGING = YES
+OPEN62541_LICENSE = MPL-2.0
+OPEN62541_LICENSE_FILES = LICENSE
+
+# Don't use git discribe to get the version number.
+OPEN62541_CONF_OPTS += -DGIT_EXECUTABLE=NO \
+	-DOPEN62541_VERSION=$(OPEN62541_VERSION)
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
+ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL_METHODS),y)
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=ON
+else
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.21.1
