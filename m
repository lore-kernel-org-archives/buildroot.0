From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  5 Mar 2016 21:02:24 +0100
Subject: [Buildroot] [PATCH 2/2] package/czmq: make zmakecert and zgossip
	optional
In-Reply-To: <1457208144-6613-1-git-send-email-joerg.krause@embedded.rocks>
References: <1457208144-6613-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1457208144-6613-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zmakecert and zgossip are optional binaries built by default. Let's make them
optional to allow building the czmq library only.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/czmq/Config.in | 15 +++++++++++++++
 package/czmq/czmq.mk   | 13 +++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index 6a99336..afad57b 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -10,6 +10,21 @@ config BR2_PACKAGE_CZMQ
 
 	  http://czmq.zeromq.org/
 
+if BR2_PACKAGE_CZMQ
+
+config BR2_PACKAGE_CZMQ_ZMAKECERT
+	bool "zmakecert"
+	help
+	  Certificate generator for ZeroMQ CURVE security.
+
+config BR2_PACKAGE_CZMQ_ZGOSSIP
+	bool "zgossip"
+	help
+	  Implements a gossip protocol for decentralized configuration
+	  management.
+
+endif
+
 comment "czmq needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 0060c89..3eb2d92 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -18,6 +18,19 @@ CZMQ_LICENSE_FILES = LICENSE
 # host-python, so disable asciidoc entirely.
 CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
 
+ifeq ($(BR2_PACKAGE_CZMQ_ZMAKECERT),y)
+CZMQ_CONF_OPTS += --with-makecert=yes
+else
+CZMQ_CONF_OPTS += --with-makecert=no
+endif
+
+ifeq ($(BR2_PACKAGE_CZMQ_ZGOSSIP),y)
+CZMQ_CONF_OPTS += --with-test_zgossip=yes
+else
+CZMQ_CONF_OPTS += --with-test_zgossip=no
+endif
+
+
 define CZMQ_CREATE_CONFIG_DIR
 	mkdir -p $(@D)/config
 endef
-- 
2.7.2
