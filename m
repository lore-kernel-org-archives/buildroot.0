From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Feb 2021 22:11:47 +0100
Subject: [Buildroot] [git commit] package/libopenssl: fix issue when
 compiling with BR2_OPTIMIZE_G=y
Message-ID: <20210202205925.6558981445@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a00b6354a20e46f0623ed4dd25b8cc47b9ab3d44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For instance on risc-v 64 arch the build would otherwise fail because
of undefined ucontext_t because "-DOPENSSL_NO_ASYNC" would not propagate
through to CFLAGS in the Makefile.

Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libopenssl/libopenssl.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index f4bb62911c..972ed534ba 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -67,7 +67,7 @@ define HOST_LIBOPENSSL_CONFIGURE_CMDS
 		shared \
 		zlib-dynamic \
 	)
-	$(SED) "s#-O[0-9s]#$(HOST_CFLAGS)#" $(@D)/Makefile
+	$(SED) "s#-O[0-9sg]#$(HOST_CFLAGS)#" $(@D)/Makefile
 endef
 
 define LIBOPENSSL_CONFIGURE_CMDS
@@ -91,7 +91,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
 	)
 	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
-	$(SED) "s#-O[0-9s]#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
+	$(SED) "s#-O[0-9sg]#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
 	$(SED) "s# build_tests##" $(@D)/Makefile
 endef
 
