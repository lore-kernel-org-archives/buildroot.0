From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 17:52:48 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/libopenssl: fix
 issue when compiling with BR2_OPTIMIZE_G=y
Message-ID: <20210204164022.A899F7FE3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8ee27108b6bc1a22e3060026af8ff6c7305bdfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

For instance on risc-v 64 arch the build would otherwise fail because
of undefined ucontext_t because "-DOPENSSL_NO_ASYNC" would not propagate
through to CFLAGS in the Makefile.

Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a00b6354a20e46f0623ed4dd25b8cc47b9ab3d44)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index ac12d17016..5c47927b08 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -65,7 +65,7 @@ define HOST_LIBOPENSSL_CONFIGURE_CMDS
 		shared \
 		zlib-dynamic \
 	)
-	$(SED) "s#-O[0-9s]#$(HOST_CFLAGS)#" $(@D)/Makefile
+	$(SED) "s#-O[0-9sg]#$(HOST_CFLAGS)#" $(@D)/Makefile
 endef
 
 define LIBOPENSSL_CONFIGURE_CMDS
@@ -89,7 +89,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
 	)
 	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
-	$(SED) "s#-O[0-9s]#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
+	$(SED) "s#-O[0-9sg]#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
 	$(SED) "s# build_tests##" $(@D)/Makefile
 endef
 
