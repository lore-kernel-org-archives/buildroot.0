From: Semyon Kolganov <semenak94@mail.ru>
Date: Wed, 19 Apr 2017 12:12:57 +0300
Subject: [Buildroot] [PATCHv4] mpir: fix build failure
In-Reply-To: <mpir: fix build failure>
References: <mpir: fix build failure>
Message-ID: <1492593177-18336-1-git-send-email-semenak94@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes:

 http://autobuild.buildroot.net/results/ecd/ecdde998c6763c14b2314d4513f15db95305fa11//
 http://autobuild.buildroot.net/results/b4c/b4c65ad8f35299588de67917be5d020a7f641ce7//

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
---
Changes between v3 and v4:
 - small formatting change

Changes between v2 and v3:
 - fixed build for mips

Changes between v1 and v2:
 - removed unneeded depend on
 - fixed build for powerpc
---
 package/mpir/mpir.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 430d587..24cd00d 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -12,4 +12,18 @@ MPIR_LICENSE_FILES = COPYING.LIB
 MPIR_INSTALL_STAGING = YES
 MPIR_DEPENDENCIES = gmp host-yasm
 
+ifeq ($(BR2_MIPS_NABI32),y)
+MPIR_CONF_OPTS += ABI=n32
+endif
+
+ifeq ($(BR2_MIPS_NABI64),y)
+MPIR_CONF_OPTS += ABI=n64
+endif
+
+ifeq ($(BR2_powerpc_CLASSIC),y)
+MPIR_CONF_OPTS += \
+	ABI=mode64 \
+	MPN_PATH=generic
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
