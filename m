From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  9 May 2019 23:50:02 +0300
Subject: [Buildroot] [PATCH v2] package/strace: disable bpf support for m68k
Message-ID: <d10e11cd2b915958286cf09efc470beb80c8ccb0.1557435002.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mismatch in struct bpf_prog_info fields offset between kernel headers
and strace local definition causes build failure. Disable bpf support
for m68k until upstream (either strace or the kernel) find a solution.

https://lists.strace.io/pipermail/strace-devel/2019-May/thread.html#8750

Fixes:
http://autobuild.buildroot.net/results/c036b11bf1f2fc39f42661634ef3e03360fb85de/
http://autobuild.buildroot.net/results/f142e4c7f0d512bb872572f5e678230117ab0ad5/
http://autobuild.buildroot.net/results/b74a17cfa7112c026938cacafdd18c6dca285005/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: Only disable bpf support; add Fixes tag
---
 package/strace/strace.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 0f705a2fb8ae..f957144160af 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -19,6 +19,12 @@ STRACE_CONF_OPTS += st_cv_m32_mpers=no \
 	st_cv_mx32_mpers=no
 endif
 
+# struct bpf_prog_info fields offset mismatch
+# https://lists.strace.io/pipermail/strace-devel/2019-May/thread.html#8750
+ifeq ($(BR2_m68k),y)
+STRACE_CONF_OPTS += ac_cv_header_linux_bpf_h=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 STRACE_DEPENDENCIES += libunwind
 STRACE_CONF_OPTS += --with-libunwind
-- 
2.20.1
