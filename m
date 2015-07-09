From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Jul 2015 08:54:00 +0200
Subject: [Buildroot] [git commit] openssl: fix static build
Message-ID: <20150709065651.3952581775@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca58207df09caa6f2e40bad09d919f63b7406cbf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If configured with no-dso, the openssl binary still gets linked with
-ldl, while libdl is not available for static-only builds. The OpenSSL
framework does not support automatically dropping -ldl with no-dso, so
-ldl has to be removed from Makefile after calling ./Configure as
explained in PROBLEMS.

Fixes http://autobuild.buildroot.org/results/cbb35f2582f1cfeb3d11cb4952a80784ff660baf

[Peter: add reference to PROBLEMS file]
Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/openssl.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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
