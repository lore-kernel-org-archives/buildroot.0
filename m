From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 May 2019 15:56:51 +0200
Subject: [Buildroot] [git commit] package/strace: disable bpf support for
 m68k
Message-ID: <20190510135358.B24D788F9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8ef3fb82694c0ed03335a42435a6a61ededc445
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mismatch in struct bpf_prog_info fields offset between kernel headers
and strace local definition causes build failure. Disable bpf support
for m68k until upstream (either strace or the kernel) find a solution.

https://lists.strace.io/pipermail/strace-devel/2019-May/thread.html#8750

Fixes:
http://autobuild.buildroot.net/results/c036b11bf1f2fc39f42661634ef3e03360fb85de/
http://autobuild.buildroot.net/results/f142e4c7f0d512bb872572f5e678230117ab0ad5/
http://autobuild.buildroot.net/results/b74a17cfa7112c026938cacafdd18c6dca285005/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/strace.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 0f705a2fb8..f957144160 100644
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
