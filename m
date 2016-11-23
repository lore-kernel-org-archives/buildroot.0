From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 12:08:07 +0100
Subject: [Buildroot] [PATCH v3 07/18] reproducibility/busybox: disable build
	timestamps
In-Reply-To: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
References: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479899298-14655-8-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>

Busybox includes some information about the build environment in its
binary. For BR2_REPRODUCIBLE, remove that information.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index fc23a90..f4a241d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -36,6 +36,12 @@ BUSYBOX_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	CFLAGS="$(BUSYBOX_CFLAGS)" \
 	CFLAGS_busybox="$(BUSYBOX_CFLAGS_busybox)"
+
+ifeq ($(BR2_REPRODUCIBLE),y)
+BUSYBOX_MAKE_ENV += \
+	KCONFIG_NOTIMESTAMP=1
+endif
+
 BUSYBOX_MAKE_OPTS = \
 	CC="$(TARGET_CC)" \
 	ARCH=$(KERNEL_ARCH) \
-- 
1.9.1
