From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Aug 2013 16:23:40 -0300
Subject: [Buildroot] [PATCH 2/3] uclibc: set MMU usage accordingly
In-Reply-To: <1376076221-28066-1-git-send-email-gustavo@zacarias.com.ar>
References: <1376076221-28066-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1376076221-28066-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On architectures that lack a MMU (like blackfin) uclibc just undefined
ARCH_HAS_MMU which disabled ARCH_USE_MMU.
But for other architectures which may or may not have one like ARM we
need to set this according to user choice.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uclibc.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 36a5001..39877bb 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -242,6 +242,20 @@ endef
 endif
 
 #
+# MMU
+#
+
+ifeq ($(BR2_USE_MMU),y)
+define UCLIBC_MMU_CONFIG
+	$(call UCLIBC_OPT_SET,ARCH_USE_MMU,y,$(@D))
+endef
+else
+define UCLIBC_MMU_CONFIG
+	$(call UCLIBC_OPT_UNSET,ARCH_USE_MMU,$(@D))
+endef
+endif
+
+#
 # IPv6
 #
 
-- 
1.8.1.5
