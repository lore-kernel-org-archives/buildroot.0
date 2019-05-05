From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 May 2019 22:31:10 +0200
Subject: [Buildroot] [git commit] package/cryptopp: fix build with gcc < 4.9
Message-ID: <20190505202828.6B1108148C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a0648226b217ad1d9b601d7e0d58c16e0c8daf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/7e68f32e62c34497848f0f7fc1f12dba67bf44d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: re-order the assignments]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cryptopp/cryptopp.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 33c8423157..3a9f621c67 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -15,9 +15,16 @@ define HOST_CRYPTOPP_EXTRACT_CMDS
 	$(UNZIP) $(HOST_CRYPTOPP_DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
 endef
 
+HOST_CRYPTOPP_CXXFLAGS = $(HOST_CFLAGS) -fPIC
+
+#??_mm256_broadcastsi128_si256 has been added only in gcc 4.9
+ifneq ($(BR2_HOST_GCC_AT_LEAST_4_9),y)
+HOST_CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_AVX2
+endif
+
 HOST_CRYPTOPP_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
-	CXXFLAGS="$(HOST_CXXFLAGS) -fPIC"
+	CXXFLAGS="$(HOST_CRYPTOPP_CXXFLAGS)"
 
 define HOST_CRYPTOPP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) shared
