From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 29 Nov 2016 09:57:29 +1100
Subject: [Buildroot] [PATCH v2 1/1] package/libdvbcsa: fix altivec problems
	on powerpc64
Message-ID: <519f9bc4a4a939e271938a2f974ce4b464187a1f.1480373845.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e6d22f5e0258c7ebb8a3ed39c11e014c721cd219

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
Notes:

I'm not an expert on Altivec, but the fix seems reasonable and the
package's test programs succeed.

 package/libdvbcsa/0001-altivec-powerpc64.patch | 33 ++++++++++++++++++++++++++
 package/libdvbcsa/libdvbcsa.mk                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 package/libdvbcsa/0001-altivec-powerpc64.patch

diff --git a/package/libdvbcsa/0001-altivec-powerpc64.patch b/package/libdvbcsa/0001-altivec-powerpc64.patch
new file mode 100644
index 0000000..3605c14
--- /dev/null
+++ b/package/libdvbcsa/0001-altivec-powerpc64.patch
@@ -0,0 +1,33 @@
+Fix compile on powerpc64/powerpc64le w/ altivec
+
+Correct the type of some vectors passed to vec_slo() or vec_sro(), which only
+takes a char vector.
+
+Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
+
+--- a/src/dvbcsa_bs_altivec.h	2016-11-28 14:33:34.410021500 +1100
++++ b/src/dvbcsa_bs_altivec.h	2016-11-28 14:34:25.442238715 +1100
+@@ -64,7 +64,7 @@
+ 	}
+ 	case 0x29: {
+ 		dvbcsa_bs_word_t x = vec_splat_u8(10);
+-		return (dvbcsa_bs_word_t)vec_add(vec_splat_u8(0x1),vec_rl(x,x));
++		return (dvbcsa_bs_word_t)vec_add((dvbcsa_bs_word_t)vec_splat_u8(0x1),vec_rl(x,x));
+ 	}
+ 	case 0x40: {
+ 		dvbcsa_bs_word_t x = vec_splat_u8(4);
+@@ -99,10 +99,10 @@
+ #define SHVAL_14 BS_VAL8(0e)
+ #define SHVAL_7 BS_VAL8(07)
+ 
+-#define BS_SHL(a, n)	({ dvbcsa_bs_word_t x = SHVAL_##n; vec_sll(vec_slo((a), x), x); })
+-#define BS_SHR(a, n)	({ dvbcsa_bs_word_t x = SHVAL_##n; vec_srl(vec_sro((a), x), x); })
+-#define BS_SHL8(a, n)	({ dvbcsa_bs_word_t x = vec_splat_u8(n*2); x = vec_add(x,x); x = vec_add(x,x); vec_slo((a), x); })
+-#define BS_SHR8(a, n)	({ dvbcsa_bs_word_t x = vec_splat_u8(n*2); x = vec_add(x,x); x = vec_add(x,x); vec_sro((a), x); })
++#define BS_SHL(a, n)	({ vector unsigned char x = SHVAL_##n; vec_sll(vec_slo((a), x), x); })
++#define BS_SHR(a, n)	({ vector unsigned char x = SHVAL_##n; vec_srl(vec_sro((a), x), x); })
++#define BS_SHL8(a, n)	({ vector unsigned char x = vec_splat_u8(n*2); x = vec_add(x,x); x = vec_add(x,x); vec_slo((a), x); })
++#define BS_SHR8(a, n)	({ vector unsigned char x = vec_splat_u8(n*2); x = vec_add(x,x); x = vec_add(x,x); vec_sro((a), x); })
+ 
+ #define BS_EXTRACT8(a, n) ((uint8_t*)&(a))[15 - (n)]
+ 
diff --git a/package/libdvbcsa/libdvbcsa.mk b/package/libdvbcsa/libdvbcsa.mk
index 1472537..dfbb4c2 100644
--- a/package/libdvbcsa/libdvbcsa.mk
+++ b/package/libdvbcsa/libdvbcsa.mk
@@ -24,6 +24,7 @@ endif
 
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 LIBDVBCSA_CONF_OPTS += --enable-altivec
+LIBDVBCSA_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -flax-vector-conversions"
 else
 LIBDVBCSA_CONF_OPTS += --disable-altivec
 endif
-- 
2.10.0.297.gf6727b0
