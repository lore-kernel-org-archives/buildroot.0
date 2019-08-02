From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Aug 2019 22:40:18 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/cryptopp: fix
 build with gcc < 4.9
Message-ID: <20190802203843.573948CA76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d22a31da4a5c9216c5b9c8408f5e52dc9381b906
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/7e68f32e62c34497848f0f7fc1f12dba67bf44d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: re-order the assignments]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0a0648226b217ad1d9b601d7e0d58c16e0c8daf7)
[Peter: the existing patch in fact doesn't work as GCC 4.9 defines __AVX2__]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptopp/cryptopp.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index ae5feee433..5bd7d5d92c 100644
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
