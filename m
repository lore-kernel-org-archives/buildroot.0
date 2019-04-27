From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 27 Apr 2019 19:46:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: fix build with gcc < 4.9
Message-ID: <20190427174604.14188-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/7e68f32e62c34497848f0f7fc1f12dba67bf44d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptopp/cryptopp.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 59ced7654c..bd209a6e7a 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -15,9 +15,16 @@ define HOST_CRYPTOPP_EXTRACT_CMDS
 	$(UNZIP) $(HOST_CRYPTOPP_DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
 endef
 
+HOST_CRYPTOPP_CXXFLAGS = $(HOST_CFLAGS) -fPIC
+
 HOST_CRYPTOPP_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
-	CXXFLAGS="$(HOST_CXXFLAGS) -fPIC"
+	CXXFLAGS="$(HOST_CRYPTOPP_CXXFLAGS)"
+
+#?_mm256_broadcastsi128_si256 has been added only in gcc 4.9
+ifneq ($(BR2_HOST_GCC_AT_LEAST_4_9),y)
+HOST_CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_AVX2
+endif
 
 define HOST_CRYPTOPP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) shared
-- 
2.20.1
