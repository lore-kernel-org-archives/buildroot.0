From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Jan 2021 22:36:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: fix build with nds32
Message-ID: <20210129213608.1030271-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build failure with dhcpcd due to SECCOMP_AUDIT_ARCH which is used
since version 9.3.0 and
https://github.com/rsmarples/dhcpcd/commit/a926ee6d8f4eb2f04e01d72664893e3cb95fceca

Fixes:
 - http://autobuild.buildroot.org/results/af8ba07ea0c12ab8cd24d528ef98db05521f3d36

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rivsep-linux.c-add-support-for-nds32.patch | 40 +++++++++++++++++++
 package/dhcpcd/dhcpcd.mk                      |  5 +++
 2 files changed, 45 insertions(+)
 create mode 100644 package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch

diff --git a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch b/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch
new file mode 100644
index 0000000000..89dd3c7637
--- /dev/null
+++ b/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch
@@ -0,0 +1,40 @@
+From bc59536c202ba134422a42fe4dfdfe0643806c8f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 29 Jan 2021 22:21:00 +0100
+Subject: [PATCH] src/privsep-linux.c: add support for nds32
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
+Fixes:
+ - http://autobuild.buildroot.org/results/af8ba07ea0c12ab8cd24d528ef98db05521f3d36
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rsmarples/dhcpcd/pull/21]
+---
+ src/privsep-linux.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index 2226659b..e81689bb 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -182,6 +182,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
+ #  else
+ #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_MIPS
+ #  endif
++#elif defined(__nds32__)
++#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32
+ #elif defined(__powerpc64__)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
+ #elif defined(__powerpc__)
+-- 
+2.29.2
+
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index ce1443eed0..cb269f1138 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -16,6 +16,11 @@ DHCPCD_CONFIG_OPTS = \
 	--os=linux \
 	--privsepuser=dhcpcd
 
+# AUDIT_ARCH_NDS32 is only available since kernel >= 5.2
+ifeq ($(BR2_nds32):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2),y:)
+DHCPCD_CONFIG_OPTS += --disable-privsep
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 DHCPCD_CONFIG_OPTS += --with-udev
 DHCPCD_DEPENDENCIES += udev
-- 
2.29.2
