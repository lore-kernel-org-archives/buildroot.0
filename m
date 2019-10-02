From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Oct 2019 06:26:26 +0200
Subject: [Buildroot] [PATCH 4/4] package/dvblast: fix static build on ARM
 Cortex-M
In-Reply-To: <20191002042626.26676-1-bernd.kuhls@t-online.de>
References: <20191002042626.26676-1-bernd.kuhls@t-online.de>
Message-ID: <20191002042626.26676-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see
http://lists.busybox.net/pipermail/buildroot/2019-June/253203.html

Fixes:
http://autobuild.buildroot.net/results/155/1555cf00b9e8cc942b955a2f2f5edf0a2072eff2/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dvblast/dvblast.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/dvblast/dvblast.mk b/package/dvblast/dvblast.mk
index 3571ff3c74..5dc43e276e 100644
--- a/package/dvblast/dvblast.mk
+++ b/package/dvblast/dvblast.mk
@@ -13,6 +13,12 @@ DVBLAST_DEPENDENCIES = bitstream libev
 
 DVBLAST_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS)
 
+# workaround for elf2flt bug
+# https://github.com/uclinux-dev/elf2flt/issues/11
+ifeq ($(BR2_ARM_CPU_ARMV7M)$(BR2_STATIC_LIBS),yy)
+DVBLAST_MAKE_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 DVBLAST_DEPENDENCIES += libiconv
 DVBLAST_MAKE_ENV += LDLIBS=-liconv
-- 
2.20.1
