From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 21:38:50 +0200
Subject: [Buildroot] [git commit] cryptopp: new package
Message-ID: <20160419203323.89AF281D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=615a04b2c3378ec05627f2f2c6b9047c87c735cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julian Scheel <julian@jusst.de>
[Thomas:
 - put HOST_CRYPTOPP_EXTRACT_CMDS earlier in the file, since it's what
   gets executed first.
 - fix typo in the name of HOST_CRYPTOPP_MAKE_OPTS
 - pass -fPIC in CXXFLAGS, since we're building a shared library
 - just call "make shared" for the build and "make install" for the
   installation.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptopp/cryptopp.hash |  2 ++
 package/cryptopp/cryptopp.mk   | 30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

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
index 0000000..887557d
--- /dev/null
+++ b/package/cryptopp/cryptopp.mk
@@ -0,0 +1,30 @@
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
+define HOST_CRYPTOPP_EXTRACT_CMDS
+	$(UNZIP) $(DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
+endef
+
+HOST_CRYPTOPP_MAKE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	CXXFLAGS="$(HOST_CXXFLAGS) -fPIC"
+
+define HOST_CRYPTOPP_BUILD_CMDS
+	$(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) shared
+endef
+
+define HOST_CRYPTOPP_INSTALL_CMDS
+	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install
+endef
+
+$(eval $(host-generic-package))
