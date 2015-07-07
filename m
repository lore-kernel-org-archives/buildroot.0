From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Tue,  7 Jul 2015 12:37:58 +0200
Subject: [Buildroot] [PATCH] openssl: fix static build
Message-ID: <1436265478-3738-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If configured with no-dso, the openssl binary still gets linked with
-ldl, while libdl is not available for static-only builds. The OpenSSL
framework does not support automatically dropping -ldl with no-dso, so
-ldl has to be removed from Makefile after calling ./Configure.

Fixes http://autobuild.buildroot.org/results/cbb35f2582f1cfeb3d11cb4952a80784ff660baf

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 package/openssl/openssl.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 4068cf1..37c640d 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -90,6 +90,14 @@ define OPENSSL_CONFIGURE_CMDS
 	$(SED) "s: build_tests::" $(@D)/Makefile
 endef
 
+# libdl is not available in a static build, and this is not implied by no-dso
+ifeq ($(BR2_STATIC_LIBS),y)
+define OPENSSL_FIXUP_STATIC_MAKEFILE
+	$(SED) 's/-ldl//g' $(@D)/Makefile
+endef
+OPENSSL_POST_CONFIGURE_HOOKS += OPENSSL_FIXUP_STATIC_MAKEFILE
+endif
+
 define HOST_OPENSSL_BUILD_CMDS
 	$(MAKE1) -C $(@D)
 endef
-- 
2.1.4
