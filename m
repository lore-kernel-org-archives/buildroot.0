From: Semyon Kolganov <semenak94@mail.ru>
Date: Mon, 17 Apr 2017 18:20:39 +0300
Subject: [Buildroot] [PATCHv3] mpir: fix build failure fixes:
	http://autobuild.buildroot.net/results/49b/49b4d4b8d8afc3e0353529146270ee8b289dc8be/
In-Reply-To: <mpir: fix build failure>
References: <mpir: fix build failure>
Message-ID: <1492442439-2540-1-git-send-email-semenak94@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 http://autobuild.buildroot.net/results/b4c/b4c65ad8f35299588de67917be5d020a7f641ce7/

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
---
Changes between v1 and v2:
 - removed unneeded depend on
 - fixed build for powerpc
---
 package/mpir/mpir.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 430d587..2a5807b 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -12,4 +12,17 @@ MPIR_LICENSE_FILES = COPYING.LIB
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
+MPIR_CONF_OPTS += ABI=mode64
+export MPN_PATH=generic
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
