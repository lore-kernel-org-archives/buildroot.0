From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Aug 2019 06:54:38 +0300
Subject: [Buildroot] [PATCH next 2/2] package/strace: reenable bpf for m68k
In-Reply-To: <2dbcdf78584fc5d00cc68a5582510af74ed0588a.1565927678.git.baruch@tkos.co.il>
References: <2dbcdf78584fc5d00cc68a5582510af74ed0588a.1565927678.git.baruch@tkos.co.il>
Message-ID: <593878c6ee43b76681b2da5c32fa067a983fe3af.1565927678.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kernel commit 0472301a28f ("bpf: fix uapi bpf_prog_info fields
alignment") fixed the issue causing build failure in bpf support code.
The fix has been applied to all kernel versions that are affected and
supported (v4.19, v5.1, v5.2). Enable back bpf for m68k.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
Note: the binary toolchain based on 2019.05.1 is still affected
---
 package/strace/strace.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 9ec81728e205..9049e52d4a73 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -19,12 +19,6 @@ STRACE_CONF_OPTS += st_cv_m32_mpers=no \
 	st_cv_mx32_mpers=no
 endif
 
-# struct bpf_prog_info fields offset mismatch
-# https://lists.strace.io/pipermail/strace-devel/2019-May/thread.html#8750
-ifeq ($(BR2_m68k),y)
-STRACE_CONF_OPTS += ac_cv_header_linux_bpf_h=no
-endif
-
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 STRACE_DEPENDENCIES += libunwind
 STRACE_CONF_OPTS += --with-libunwind
-- 
2.23.0.rc1
