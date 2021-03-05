From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 23:23:39 +0100
Subject: [Buildroot] [git commit] package/dhcpcd: fix build on m68k
Message-ID: <20210305220229.89EEC82A3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c6840049b364d25e46ab4bb6deaecf53796c7c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/56301b566e210f06ac581e04ad1ec2ca3f9b7103

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-src-privsep-linux.c-add-support-for-m68k.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/dhcpcd/0011-src-privsep-linux.c-add-support-for-m68k.patch b/package/dhcpcd/0011-src-privsep-linux.c-add-support-for-m68k.patch
new file mode 100644
index 0000000000..8fe80d4266
--- /dev/null
+++ b/package/dhcpcd/0011-src-privsep-linux.c-add-support-for-m68k.patch
@@ -0,0 +1,37 @@
+From f7721a6728bfd786604474df051f463a12dd0335 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 5 Mar 2021 12:22:13 +0100
+Subject: [PATCH] src/privsep-linux.c: add support for m68k
+
+Fix the following build failure:
+
+privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
+ #  error "Platform does not support seccomp filter yet"
+    ^~~~~
+In file included from privsep-linux.c:36:
+privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
+  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
+                                      ^~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rsmarples/dhcpcd/pull/29]
+---
+ src/privsep-linux.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index 21d41a9a..7dc92083 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -188,6 +188,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_IA64
+ #elif defined(__microblaze__)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_MICROBLAZE
++#elif defined(__m68k__)
++#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_M68K
+ #elif defined(__mips__)
+ #  if defined(__MIPSEL__)
+ #    if defined(__LP64__)
+-- 
+2.30.0
+
