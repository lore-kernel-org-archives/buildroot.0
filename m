From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 22:24:59 +0200
Subject: [Buildroot] [git commit branch/next] package/git-crypt: fix build
 with gcc-4.9
Message-ID: <20180820201746.704258DFDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=995fb9a4ebca3acb5dc6eb22edee039b67bf5303
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes

In file included from commands.cpp:32:0:
crypto.hpp:60:7: error: 'unique_ptr' in namespace 'std' does not name a template type
  std::unique_ptr<Aes_impl> impl;

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/git-crypt/git-crypt.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/git-crypt/git-crypt.mk b/package/git-crypt/git-crypt.mk
index 507534c139..37e3d885a9 100644
--- a/package/git-crypt/git-crypt.mk
+++ b/package/git-crypt/git-crypt.mk
@@ -14,7 +14,8 @@ GIT_CRYPT_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 
 define GIT_CRYPT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
-		LDFLAGS="$(TARGET_LDFLAGS) $(GIT_CRYPT_LIBS)" PREFIX=/usr
+		LDFLAGS="$(TARGET_LDFLAGS) $(GIT_CRYPT_LIBS)" \
+		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" PREFIX=/usr
 endef
 
 define GIT_CRYPT_INSTALL_TARGET_CMDS
