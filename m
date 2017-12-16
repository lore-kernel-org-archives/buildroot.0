From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 16 Dec 2017 20:55:16 +0100
Subject: [Buildroot] [PATCH v1] libdrm: fix libatomic_ops linking
Message-ID: <20171216195516.27144-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add explicit libatomic_ops linking, fixes etnavid tests linking

Fixes [1]:

    CCLD     etnaviv_cmd_stream_test
  ../../etnaviv/.libs/libdrm_etnaviv.so: undefined reference to `AO_store_full_emulation'
  ../../etnaviv/.libs/libdrm_etnaviv.so: undefined reference to `AO_fetch_compare_and_swap_emulation'
  collect2: error: ld returned 1 exit status

[1] http://autobuild.buildroot.net/results/92e074c49417261843eef95872ff935a56077c98

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libdrm/libdrm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 3d7b67122b..ecc525ca1e 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -21,6 +21,7 @@ LIBDRM_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
+LIBDRM_CONF_ENV += LIBS="-latomic_ops"
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
 LIBDRM_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DAO_NO_SPARC_V9"
 endif
-- 
2.15.1
