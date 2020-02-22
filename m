From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 22 Feb 2020 19:10:40 +0100
Subject: [Buildroot] [PATCH] package/jpeg-turbo: force fPIC for shared
 libraries
Message-ID: <20200222181040.375497-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_SSP_ALL is set, there is a link issue due to missing -fPIC in CFLAGS.
Set CMAKE_POSITION_INDEPENDENT_CODE=ON to add it.

This is a similar fix as for gtest package [1]

[1] https://git.buildroot.net/buildroot/commit/?id=2026621f3c60167aa8ba48e658be1b214d1347d7

Fixes:
http://autobuild.buildroot.net/results/e1f/e1f164cee16b037c0232fdda40fc16caf8f0c0af

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Murat Demirten <mdemirten@yh.com.tr>
---
 package/jpeg-turbo/jpeg-turbo.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 2767ce6de4..126b470630 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -31,6 +31,16 @@ else
 JPEG_TURBO_CONF_OPTS += -DWITH_SIMD=OFF
 endif
 
+# Ensure that jpeg-turbo is compiled with -fPIC to allow linking the static
+# libraries with dynamically linked programs. This is not a requirement
+# for most architectures but is mandatory for ARM.
+# This allow to avoid link issues with BR2_SSP_ALL:
+# jsimd_none.c.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against external symbol `__stack_chk_guard@@GLIBC_2.17'
+# can not be used when making a shared object; recompile with -fPIC
+ifeq ($(BR2_STATIC_LIBS),)
+JPEG_TURBO_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
+endif
+
 define JPEG_TURBO_REMOVE_USELESS_TOOLS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom tjbench wrjpgcom)
 endef
-- 
2.24.1
