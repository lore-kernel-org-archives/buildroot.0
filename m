From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Oct 2019 06:26:24 +0200
Subject: [Buildroot] [PATCH 2/4] package/gnuchess: fix static build on ARM
 Cortex-M
In-Reply-To: <20191002042626.26676-1-bernd.kuhls@t-online.de>
References: <20191002042626.26676-1-bernd.kuhls@t-online.de>
Message-ID: <20191002042626.26676-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see
http://lists.busybox.net/pipermail/buildroot/2019-June/253203.html

Fixes:
http://autobuild.buildroot.net/results/220/2209c58e3239e12f2580acc62452d51af4cf6bf1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gnuchess/gnuchess.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 4d91706de4..fbd3c97531 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -13,4 +13,10 @@ GNUCHESS_DEPENDENCIES = host-flex flex
 GNUCHESS_DEPENDENCIES += $(if $(BR2_PACKAGE_READLINE),readline) \
 	$(TARGET_NLS_DEPENDENCIES)
 
+# workaround for elf2flt bug
+# https://github.com/uclinux-dev/elf2flt/issues/11
+ifeq ($(BR2_ARM_CPU_ARMV7M)$(BR2_STATIC_LIBS),yy)
+GNUCHESS_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -O0"
+endif
+
 $(eval $(autotools-package))
-- 
2.20.1
