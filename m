From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Apr 2016 21:46:00 +0300
Subject: [Buildroot] [PATCH] mbedtls: fix companion programs static build
Message-ID: <f6eae4fae3adae10a41a1723da17fe484299ba95.1460486760.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set LINK_WITH_PTHREAD to explicitly add pthread to the list of libraries.

Fixes:
http://autobuild.buildroot.net/results/e08/e087dfa2a6057b18209cd6adff2760026a9ca1db/
http://autobuild.buildroot.net/results/615/61565f1a88b7d6eea03a355ccf8dd3fe6585c4ab/
http://autobuild.buildroot.net/results/6b2/6b267b9cba37655e7d8e6d78821f96d9a8dd7d2e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mbedtls/mbedtls.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index fe166e21f4db..994a3f40a808 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -23,6 +23,9 @@ define MBEDTLS_ENABLE_THREADING
 		$(@D)/include/mbedtls/config.h
 endef
 MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_THREADING
+ifeq ($(BR2_STATIC_LIBS),y)
+MBEDTLS_CONF_OPTS += -DLINK_WITH_PTHREAD=ON
+endif
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.8.0.rc3
