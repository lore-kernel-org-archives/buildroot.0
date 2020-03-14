From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 15:15:40 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/jpeg-turbo: force
 fPIC for shared libraries
Message-ID: <20200314141336.5D3B582283@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45717ee0c62975920c79cc627ba1b272ca155884
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

When BR2_SSP_ALL is set, there is a link issue due to missing -fPIC in CFLAGS.
Set CMAKE_POSITION_INDEPENDENT_CODE=ON to add it.

This is a similar fix as for gtest package [1]

[1] https://git.buildroot.net/buildroot/commit/?id=2026621f3c60167aa8ba48e658be1b214d1347d7

Fixes:
http://autobuild.buildroot.net/results/e1f/e1f164cee16b037c0232fdda40fc16caf8f0c0af

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Murat Demirten <mdemirten@yh.com.tr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 37f3d09d46a7b3b4ba8f564c0005f4ab7ff1a69c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 0c75cf1db5..1ab60bab1e 100644
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
