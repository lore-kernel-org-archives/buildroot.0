From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 4 Mar 2021 21:27:07 +0100
Subject: [Buildroot] [git commit] package/dhcpcd: cherry-pick upstream
 arch-specific privsep fixes
Message-ID: <20210304200514.D865A8670E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5594f7239547672c08058b77f8098d2c080bebc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dhcpcd includes privsep-linux.c which contains platform-specific
definitions for the seccomp fixes. A lot of our architectures were not
supported yet in the 9.4.0 release, but are supported now thanks to
Fabrice Fontaine.

Cherry-pick those patches. All of them affect the same code, but they
are cherry-picked individually to keep the correspondence with upstream.
Slight adjustments had to be made but there were no merge conflicts.

Fixes:
 - http://autobuild.buildroot.org/results/9ed863b3ba5e6e0587a48e619395e5bdb7e9c557
 - http://autobuild.buildroot.org/results/affd2f094084c4f53a324830539d07050b83587e
 - http://autobuild.buildroot.org/results/67f39606054930d307ddd0eb7743f06316d41544

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...privsep-linux.c-add-support-for-nds32-21.patch} | 15 ++++--
 ...rivsep-linux.c-add-support-for-xtensa-22.patch} | 30 ++++++-----
 ...003-Linux-Add-support-for-NDS32BE-SECCOMP.patch | 31 +++++++++++
 package/dhcpcd/0004-Typo-with-prior.patch          | 27 ++++++++++
 ...privsep-linux.c-add-support-for-nios2-23.patch} | 28 +++++-----
 ...ep-linux.c-add-support-for-microblaze-24.patch} | 32 +++++------
 ...src-privsep-linux.c-add-support-for-sh-25.patch | 54 +++++++++++++++++++
 ...8-src-privsep-linux-fix-build-on-sparc-26.patch | 45 ++++++++++++++++
 ...-privsep-linux.c-add-support-for-or1k-27.patch} | 27 +++++-----
 ...rc-privsep-linux.c-add-support-for-arc-28.patch | 62 ++++++++++++++++++++++
 10 files changed, 291 insertions(+), 60 deletions(-)

diff --git a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch b/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32-21.patch
similarity index 70%
copy from package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch
copy to package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32-21.patch
index 89dd3c7637..5d28fca516 100644
--- a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch
+++ b/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32-21.patch
@@ -1,7 +1,7 @@
-From bc59536c202ba134422a42fe4dfdfe0643806c8f Mon Sep 17 00:00:00 2001
+From 92dc3bd959681cf65d4a3466c89233cf0411b693 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 29 Jan 2021 22:21:00 +0100
-Subject: [PATCH] src/privsep-linux.c: add support for nds32
+Date: Sat, 30 Jan 2021 12:10:08 +0100
+Subject: [PATCH] src/privsep-linux.c: add support for nds32 (#21)
 
 Fix the following build failure:
 
@@ -13,17 +13,22 @@ privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a fu
   BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
                                       ^~~~~~~~~~~~~~~~~~
 
+It should be noted that AUDIT_ARCH_NDS32 is only defined since kernel
+5.2 and
+https://github.com/torvalds/linux/commit/fa562447e154334523daa44c0b60625d71a345f5
+
 Fixes:
  - http://autobuild.buildroot.org/results/af8ba07ea0c12ab8cd24d528ef98db05521f3d36
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rsmarples/dhcpcd/pull/21]
+(cherry picked from commit 3848e7204f23bb78eb42dcde4898c70aca67d58d)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 ---
  src/privsep-linux.c | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 2226659b..e81689bb 100644
+index d31d720d..8716032c 100644
 --- a/src/privsep-linux.c
 +++ b/src/privsep-linux.c
 @@ -182,6 +182,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
diff --git a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch b/package/dhcpcd/0002-src-privsep-linux.c-add-support-for-xtensa-22.patch
similarity index 52%
copy from package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch
copy to package/dhcpcd/0002-src-privsep-linux.c-add-support-for-xtensa-22.patch
index 89dd3c7637..f1789b13f1 100644
--- a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch
+++ b/package/dhcpcd/0002-src-privsep-linux.c-add-support-for-xtensa-22.patch
@@ -1,7 +1,7 @@
-From bc59536c202ba134422a42fe4dfdfe0643806c8f Mon Sep 17 00:00:00 2001
+From 1a77d82b0020ff4c71ffe55262676c3403978bd5 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 29 Jan 2021 22:21:00 +0100
-Subject: [PATCH] src/privsep-linux.c: add support for nds32
+Date: Sun, 31 Jan 2021 03:35:10 +0100
+Subject: [PATCH]  src/privsep-linux.c: add support for xtensa (#22)
 
 Fix the following build failure:
 
@@ -13,28 +13,30 @@ privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a fu
   BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
                                       ^~~~~~~~~~~~~~~~~~
 
-Fixes:
- - http://autobuild.buildroot.org/results/af8ba07ea0c12ab8cd24d528ef98db05521f3d36
+It should be noted that AUDIT_ARCH_XTENSA is only defined since kernel
+5.0 and
+https://github.com/torvalds/linux/commit/98c3115a4ec56f03056efd9295e0fcb4c5c57a85
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rsmarples/dhcpcd/pull/21]
+(cherry picked from commit 19c3d9209a834e02918a17e011afd9da3e5be38d)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 ---
  src/privsep-linux.c | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 2226659b..e81689bb 100644
+index 8716032c..f1b33f91 100644
 --- a/src/privsep-linux.c
 +++ b/src/privsep-linux.c
-@@ -182,6 +182,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
+@@ -204,6 +204,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
  #  else
- #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_MIPS
+ #    define AUDIT_ARCH_SPARC
  #  endif
-+#elif defined(__nds32__)
-+#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32
- #elif defined(__powerpc64__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
- #elif defined(__powerpc__)
++#elif defined(__xtensa__)
++#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_XTENSA
+ #else
+ #  error "Platform does not support seccomp filter yet"
+ #endif
 -- 
 2.29.2
 
diff --git a/package/dhcpcd/0003-Linux-Add-support-for-NDS32BE-SECCOMP.patch b/package/dhcpcd/0003-Linux-Add-support-for-NDS32BE-SECCOMP.patch
new file mode 100644
index 0000000000..de95268849
--- /dev/null
+++ b/package/dhcpcd/0003-Linux-Add-support-for-NDS32BE-SECCOMP.patch
@@ -0,0 +1,31 @@
+From 4d2ef61b8b4abcb446699b9d3c29b422f2cf9826 Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Sun, 31 Jan 2021 07:37:03 +0000
+Subject: [PATCH] Linux: Add support for NDS32BE SECCOMP
+
+(cherry picked from commit 8253ef16e11db8b52af1ed8021cd2517046165d6)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ src/privsep-linux.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index f1b33f91..04950ed2 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -183,7 +183,11 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
+ #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_MIPS
+ #  endif
+ #elif defined(__nds32__)
+-#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32
++#  if (BYTE_ORDER == LITTLE_ENDIAN)
++#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32
++#ele
++#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32BE
++#endif
+ #elif defined(__powerpc64__)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
+ #elif defined(__powerpc__)
+-- 
+2.29.2
+
diff --git a/package/dhcpcd/0004-Typo-with-prior.patch b/package/dhcpcd/0004-Typo-with-prior.patch
new file mode 100644
index 0000000000..9c98895713
--- /dev/null
+++ b/package/dhcpcd/0004-Typo-with-prior.patch
@@ -0,0 +1,27 @@
+From 59f67be640881eaf56cc30c304362af00523ff5d Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Sun, 31 Jan 2021 10:08:11 +0000
+Subject: [PATCH] Typo with prior
+
+(cherry picked from commit d8d7f68001db3f084dfbb6e5b8ea4491088b55ba)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ src/privsep-linux.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index 04950ed2..1660447c 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -185,7 +185,7 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
+ #elif defined(__nds32__)
+ #  if (BYTE_ORDER == LITTLE_ENDIAN)
+ #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32
+-#ele
++#else
+ #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32BE
+ #endif
+ #elif defined(__powerpc64__)
+-- 
+2.29.2
+
diff --git a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch b/package/dhcpcd/0005-src-privsep-linux.c-add-support-for-nios2-23.patch
similarity index 56%
copy from package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch
copy to package/dhcpcd/0005-src-privsep-linux.c-add-support-for-nios2-23.patch
index 89dd3c7637..ac1ef071a1 100644
--- a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch
+++ b/package/dhcpcd/0005-src-privsep-linux.c-add-support-for-nios2-23.patch
@@ -1,7 +1,7 @@
-From bc59536c202ba134422a42fe4dfdfe0643806c8f Mon Sep 17 00:00:00 2001
+From 24ca5bdd409dd811a088bc702a2b6f99ea05ad19 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 29 Jan 2021 22:21:00 +0100
-Subject: [PATCH] src/privsep-linux.c: add support for nds32
+Date: Sun, 31 Jan 2021 11:12:21 +0100
+Subject: [PATCH]  src/privsep-linux.c: add support for nios2 (#23)
 
 Fix the following build failure:
 
@@ -13,25 +13,27 @@ privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a fu
   BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
                                       ^~~~~~~~~~~~~~~~~~
 
-Fixes:
- - http://autobuild.buildroot.org/results/af8ba07ea0c12ab8cd24d528ef98db05521f3d36
+It should be noted that AUDIT_ARCH_NIOS2 is only defined since kernel
+5.2 and
+https://github.com/torvalds/linux/commit/1660aac45e5b49a5ace29fb5b73254617533fcbd
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rsmarples/dhcpcd/pull/21]
+(cherry picked from commit d670866ce008c21cbf6d5b20c4d4af6460ec35d2)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 ---
  src/privsep-linux.c | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 2226659b..e81689bb 100644
+index 1660447c..e374c068 100644
 --- a/src/privsep-linux.c
 +++ b/src/privsep-linux.c
-@@ -182,6 +182,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #  else
- #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_MIPS
- #  endif
-+#elif defined(__nds32__)
-+#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32
+@@ -188,6 +188,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
+ #else
+ #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32BE
+ #endif
++#elif defined(__nios2__)
++#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NIOS2
  #elif defined(__powerpc64__)
  #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
  #elif defined(__powerpc__)
diff --git a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch b/package/dhcpcd/0006-src-privsep-linux.c-add-support-for-microblaze-24.patch
similarity index 50%
copy from package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch
copy to package/dhcpcd/0006-src-privsep-linux.c-add-support-for-microblaze-24.patch
index 89dd3c7637..245faed476 100644
--- a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch
+++ b/package/dhcpcd/0006-src-privsep-linux.c-add-support-for-microblaze-24.patch
@@ -1,7 +1,7 @@
-From bc59536c202ba134422a42fe4dfdfe0643806c8f Mon Sep 17 00:00:00 2001
+From 89a2f250ed978950aecf4854d1cee16f57946759 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 29 Jan 2021 22:21:00 +0100
-Subject: [PATCH] src/privsep-linux.c: add support for nds32
+Date: Sun, 31 Jan 2021 21:57:40 +0100
+Subject: [PATCH]  src/privsep-linux.c: add support for microblaze (#24)
 
 Fix the following build failure:
 
@@ -13,28 +13,30 @@ privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a fu
   BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
                                       ^~~~~~~~~~~~~~~~~~
 
-Fixes:
- - http://autobuild.buildroot.org/results/af8ba07ea0c12ab8cd24d528ef98db05521f3d36
+It should be noted that AUDIT_ARCH_MICROBLAZE is only defined since
+kernel 3.18 and
+https://github.com/torvalds/linux/commit/ce5d112827e5c2e9864323d0efd7ec2a62c6dce0
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rsmarples/dhcpcd/pull/21]
+(cherry picked from commit e3a40586dbb584774d0a17bc277e69cb500cfa38)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 ---
  src/privsep-linux.c | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 2226659b..e81689bb 100644
+index e374c068..a861a836 100644
 --- a/src/privsep-linux.c
 +++ b/src/privsep-linux.c
-@@ -182,6 +182,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #  else
- #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_MIPS
+@@ -170,6 +170,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
  #  endif
-+#elif defined(__nds32__)
-+#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32
- #elif defined(__powerpc64__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
- #elif defined(__powerpc__)
+ #elif defined(__ia64__)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_IA64
++#elif defined(__microblaze__)
++#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_MICROBLAZE
+ #elif defined(__mips__)
+ #  if defined(__MIPSEL__)
+ #    if defined(__LP64__)
 -- 
 2.29.2
 
diff --git a/package/dhcpcd/0007-src-privsep-linux.c-add-support-for-sh-25.patch b/package/dhcpcd/0007-src-privsep-linux.c-add-support-for-sh-25.patch
new file mode 100644
index 0000000000..b9c023805e
--- /dev/null
+++ b/package/dhcpcd/0007-src-privsep-linux.c-add-support-for-sh-25.patch
@@ -0,0 +1,54 @@
+From 10acecc0583b7301cb539ba6875618956fa3d13b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 5 Feb 2021 09:05:54 +0100
+Subject: [PATCH] src/privsep-linux.c: add support for sh (#25)
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
+It should be noted that AUDIT_ARCH_{SH,SHEL,SH64,SHEL64} are defined at
+least since kernel 3.7 and
+https://github.com/torvalds/linux/commit/607ca46e97a1b6594b29647d98a32d545c24bdff
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+(cherry picked from commit 166491c2953546a677073694036f43a65fc25063)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ src/privsep-linux.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index a861a836..428ea4b0 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -206,6 +206,20 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_S390X
+ #elif defined(__s390__)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_S390
++#elif defined(__sh__)
++#  if defined(__LP64__)
++#    if (BYTE_ORDER == LITTLE_ENDIAN)
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_SHEL64
++#    else
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_SH64
++#    endif
++#  else
++#    if (BYTE_ORDER == LITTLE_ENDIAN)
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_SHEL
++#    else
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_SH
++#    endif
++#  endif
+ #elif defined(__sparc__)
+ #  if defined(__arch64__)
+ #    define AUDIT_ARCH_SPARC64
+-- 
+2.29.2
+
diff --git a/package/dhcpcd/0008-src-privsep-linux-fix-build-on-sparc-26.patch b/package/dhcpcd/0008-src-privsep-linux-fix-build-on-sparc-26.patch
new file mode 100644
index 0000000000..06199228ce
--- /dev/null
+++ b/package/dhcpcd/0008-src-privsep-linux-fix-build-on-sparc-26.patch
@@ -0,0 +1,45 @@
+From be36eccb1ae53422f2aa9b42f257baeb21bd8be7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 5 Feb 2021 09:25:12 +0100
+Subject: [PATCH] src/privsep-linux: fix build on sparc (#26)
+
+Fix the following build failure:
+
+privsep-linux.c:203: warning: "AUDIT_ARCH_SPARC64" redefined
+  203 | #    define AUDIT_ARCH_SPARC64
+      |
+In file included from privsep-linux.c:35:
+/srv/storage/autobuild/run/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/linux/audit.h:392: note: this is the location of the previous definition
+  392 | #define AUDIT_ARCH_SPARC64 (EM_SPARCV9|__AUDIT_ARCH_64BIT)
+      |
+In file included from privsep-linux.c:36:
+privsep-linux.c:215:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
+  215 |  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
+      |                                      ^~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+(cherry picked from commit dcfd7a23f002793a855156255e81662ef84064d3)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ src/privsep-linux.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index 428ea4b0..8093740a 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -222,9 +222,9 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
+ #  endif
+ #elif defined(__sparc__)
+ #  if defined(__arch64__)
+-#    define AUDIT_ARCH_SPARC64
++#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_SPARC64
+ #  else
+-#    define AUDIT_ARCH_SPARC
++#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_SPARC
+ #  endif
+ #elif defined(__xtensa__)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_XTENSA
+-- 
+2.29.2
+
diff --git a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch b/package/dhcpcd/0009-src-privsep-linux.c-add-support-for-or1k-27.patch
similarity index 56%
rename from package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch
rename to package/dhcpcd/0009-src-privsep-linux.c-add-support-for-or1k-27.patch
index 89dd3c7637..3756cac7e9 100644
--- a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32.patch
+++ b/package/dhcpcd/0009-src-privsep-linux.c-add-support-for-or1k-27.patch
@@ -1,7 +1,7 @@
-From bc59536c202ba134422a42fe4dfdfe0643806c8f Mon Sep 17 00:00:00 2001
+From 617e3a44137cbba55afae24f6754580916bb770b Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 29 Jan 2021 22:21:00 +0100
-Subject: [PATCH] src/privsep-linux.c: add support for nds32
+Date: Sun, 7 Feb 2021 09:43:14 +0100
+Subject: [PATCH] src/privsep-linux.c: add support for or1k (#27)
 
 Fix the following build failure:
 
@@ -13,25 +13,26 @@ privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a fu
   BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
                                       ^~~~~~~~~~~~~~~~~~
 
-Fixes:
- - http://autobuild.buildroot.org/results/af8ba07ea0c12ab8cd24d528ef98db05521f3d36
+It should be noted that AUDIT_ARCH_OPENRISC is defined since kernel 3.7:
+https://github.com/torvalds/linux/commit/e2bebb4ae6d9ac4ffc524db67f7ecb205a173f77
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rsmarples/dhcpcd/pull/21]
+(cherry picked from commit f3f7332001d5d5722239f6b7279f32923e4eedd0)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 ---
  src/privsep-linux.c | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 2226659b..e81689bb 100644
+index 8093740a..58df5c30 100644
 --- a/src/privsep-linux.c
 +++ b/src/privsep-linux.c
-@@ -182,6 +182,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #  else
- #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_MIPS
- #  endif
-+#elif defined(__nds32__)
-+#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32
+@@ -192,6 +192,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
+ #endif
+ #elif defined(__nios2__)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NIOS2
++#elif defined(__or1k__)
++#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_OPENRISC
  #elif defined(__powerpc64__)
  #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
  #elif defined(__powerpc__)
diff --git a/package/dhcpcd/0010-src-privsep-linux.c-add-support-for-arc-28.patch b/package/dhcpcd/0010-src-privsep-linux.c-add-support-for-arc-28.patch
new file mode 100644
index 0000000000..b7b3e153eb
--- /dev/null
+++ b/package/dhcpcd/0010-src-privsep-linux.c-add-support-for-arc-28.patch
@@ -0,0 +1,62 @@
+From 1b6b6329daf70e29221f341ef1946717f158ec8a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 8 Feb 2021 07:23:54 +0100
+Subject: [PATCH] src/privsep-linux.c: add support for arc (#28)
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
+It should be noted that AUDIT_ARCH_{ARCOMPACT,ARCV2} is only defined
+since kernel 5.2 and
+https://github.com/torvalds/linux/commit/67f2a8a29311841ba6ab9b0e2d1b8f1e9978cd84
+
+Detection of arc compact and arc v2 have been "copy/pasted" from
+https://github.com/wbx-github/uclibc-ng/commit/afab56958f1cbb47b831ee3ebff231dfbae74af2
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d29083700a80dd647621eed06faeeae03f0587d3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+(cherry picked from commit 82386110e67cf75c224e9817fce55e6b0f143266)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ src/privsep-linux.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index 58df5c30..fc269a5c 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -149,6 +149,22 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_I386
+ #elif defined(__x86_64__)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_X86_64
++#elif defined(__arc__)
++#  if defined(__A7__)
++#    if (BYTE_ORDER == LITTLE_ENDIAN)
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCOMPACT
++#    else
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCOMPACTBE
++#    endif
++#  elif defined(__HS__)
++#    if (BYTE_ORDER == LITTLE_ENDIAN)
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCV2
++#    else
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCV2BE
++#    endif
++#  else
++#    error "Platform does not support seccomp filter yet"
++#  endif
+ #elif defined(__arm__)
+ #  ifndef EM_ARM
+ #    define EM_ARM 40
+-- 
+2.29.2
+
