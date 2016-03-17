From: Julian Scheel <julian@jusst.de>
Date: Thu, 17 Mar 2016 16:03:55 +0100
Subject: [Buildroot] [PATCHv2 1/4] Add package cryptopp
In-Reply-To: <1458227038-16383-1-git-send-email-julian@jusst.de>
References: <1458227038-16383-1-git-send-email-julian@jusst.de>
Message-ID: <1458227038-16383-2-git-send-email-julian@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julian Scheel <julian@jusst.de>
---
 package/cryptopp/cryptopp.hash |  2 ++
 package/cryptopp/cryptopp.mk   | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 package/cryptopp/cryptopp.hash
 create mode 100644 package/cryptopp/cryptopp.mk

diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
new file mode 100644
index 0000000..3af7183
--- /dev/null
+++ b/package/cryptopp/cryptopp.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  9390670a14170dd0f48a6b6b06f74269ef4b056d4718a1a329f6f6069dc957c9  cryptopp563.zip
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
new file mode 100644
index 0000000..cd7c9fa
--- /dev/null
+++ b/package/cryptopp/cryptopp.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# cryptopp
+#
+################################################################################
+
+CRYPTOPP_VERSION = 5.6.3
+CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
+CRYPTOPP_SITE = http://cryptopp.com/
+CRYPTOPP_LICENSE = Boost-v1.0
+CRYPTOPP_LICENSE_FILES = License.txt
+CRYPTOPP_INSTALL_STAGING = YES
+
+HOST_CRRYPTOPP_MAKE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	LDFLAGS="$(HOST_LDFLAGS)"
+
+define HOST_CRYPTOPP_BUILD_CMDS
+	$(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) -f GNUmakefile
+	$(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) libcryptopp.so
+endef
+
+define HOST_CRYPTOPP_INSTALL_CMDS
+	$(INSTALL) -d ${HOST_DIR}/usr/include/cryptopp
+	$(INSTALL) -D -m 644 $(@D)/*.h ${HOST_DIR}/usr/include/cryptopp/
+	$(INSTALL) -D -m 0755 $(@D)/libcryptopp.so ${HOST_DIR}/usr/lib/libcryptopp.so
+endef
+
+define HOST_CRYPTOPP_EXTRACT_CMDS
+	$(UNZIP) $(DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
+endef
+
+$(eval $(host-generic-package))
-- 
2.7.3
