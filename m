From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  9 Oct 2018 14:23:26 +0200
Subject: [Buildroot] [PATCH] poco: disable fpenvironment for MIPS without FPU
Message-ID: <20181009122326.12174-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

glibc fixed a bug, that defined FPU capabilities not
available for MIPS without FPU. So add --no-fpenvironment
to the configuration options for this case.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/poco/poco.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 018344d5c7..1f3eabd009 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -42,6 +42,13 @@ ifeq ($(BR2_sh4a)$(BR2_nios2),y)
 POCO_CONF_OPTS += --no-fpenvironment
 endif
 
+# MIPS without FPU
+ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
+ifeq ($(BR2_MIPS_SOFT_FLOAT),y)
+POCO_CONF_OPTS += --no-fpenvironment
+endif
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 POCO_MAKE_TARGET = static_release
 else ifeq ($(BR2_SHARED_LIBS),y)
-- 
2.17.0
