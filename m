From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Nov 2014 14:54:37 +0100
Subject: [Buildroot] [git commit branch/next] systemd: bump version to v217
Message-ID: <20141114135608.98332B1447@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76246491fe0a5f4ab4d7f5c2f7bcc56ec8c44214
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Bump version to v217
- Add a hash file
- Adapt the needed patches

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fine-the-__NR_memfd_create-macro-for-MIPS.patch |   44 +++++++------------
 package/systemd/systemd.hash                       |    2 +
 package/systemd/systemd.mk                         |    2 +-
 3 files changed, 19 insertions(+), 29 deletions(-)

diff --git a/package/systemd/0004-Properly-define-the-__NR_memfd_create-macro-for-MIPS.patch b/package/systemd/0004-Properly-define-the-__NR_memfd_create-macro-for-MIPS.patch
index 6aca13c..9ce64c9 100644
--- a/package/systemd/0004-Properly-define-the-__NR_memfd_create-macro-for-MIPS.patch
+++ b/package/systemd/0004-Properly-define-the-__NR_memfd_create-macro-for-MIPS.patch
@@ -1,16 +1,16 @@
 Properly define the __NR_memfd_create macro for MIPS
 
 This is an upstream patch which has been applied to the master branch
-and I have adapted it to make it apply to the v216 version.
+and I have adapted it to make it apply to the v217 version.
 
 Upstream commit:
   http://cgit.freedesktop.org/systemd/systemd/commit/?id=e6c019026b8cfd27a997e6e6ed1349f8f289b7e2
 
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
-From cdd25569e583ccfff3aef0eda175a2d07c00f859 Mon Sep 17 00:00:00 2001
+From a51496db6edc8168268c86ea55915405f95b0212 Mon Sep 17 00:00:00 2001
 From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Tue, 4 Nov 2014 10:49:58 +0000
+Date: Thu, 13 Nov 2014 17:32:52 +0000
 Subject: [PATCH] Properly define the __NR_memfd_create macro for MIPS
 
 This macro exists for MIPS since v3.17:
@@ -18,43 +18,31 @@ This macro exists for MIPS since v3.17:
 
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 ---
- src/shared/missing.h |    9 +++++++++
- 1 files changed, 9 insertions(+), 0 deletions(-)
+ src/shared/missing.h |   11 +++++++++--
+ 1 files changed, 9 insertions(+), 2 deletions(-)
 
 diff --git a/src/shared/missing.h b/src/shared/missing.h
-index 3ff1a21..6888163 100644
+index bb4f8f2..66bedcf 100644
 --- a/src/shared/missing.h
 +++ b/src/shared/missing.h
-@@ -152,6 +152,9 @@ static inline int pivot_root(const char *new_root, const char *put_old) {
- #    ifndef __NR_fanotify_mark
- #      define __NR_fanotify_mark 4337
- #    endif
-+#    ifndef __NR_memfd_create
+@@ -125,8 +125,15 @@ static inline int pivot_root(const char *new_root, const char *put_old) {
+ #  endif
+ #elif defined _MIPS_SIM
+ #  ifndef __NR_memfd_create
+-#    warning "__NR_memfd_create not yet defined for MIPS"
+-#    define __NR_memfd_create 0xffffffff
++#    if _MIPS_SIM == _MIPS_SIM_ABI32
 +#      define __NR_memfd_create 4354
 +#    endif
- #  elif _MIPS_SIM == _MIPS_SIM_NABI32
- #    ifndef __NR_fanotify_init
- #      define __NR_fanotify_init 6300
-@@ -159,6 +162,9 @@ static inline int pivot_root(const char *new_root, const char *put_old) {
- #    ifndef __NR_fanotify_mark
- #      define __NR_fanotify_mark 6301
- #    endif
-+#    ifndef __NR_memfd_create
++#    if _MIPS_SIM == _MIPS_SIM_NABI32
 +#      define __NR_memfd_create 6318
 +#    endif
- #  elif _MIPS_SIM == _MIPS_SIM_ABI64
- #    ifndef __NR_fanotify_init
- #      define __NR_fanotify_init 5295
-@@ -166,6 +172,9 @@ static inline int pivot_root(const char *new_root, const char *put_old) {
- #    ifndef __NR_fanotify_mark
- #      define __NR_fanotify_mark 5296
- #    endif
-+#    ifndef __NR_memfd_create
++#    if _MIPS_SIM == _MIPS_SIM_ABI64
 +#      define __NR_memfd_create 5314
 +#    endif
  #  endif
  #else
- #  ifndef __NR_fanotify_init
+ #  ifndef __NR_memfd_create
 -- 
 1.7.1
 
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
new file mode 100644
index 0000000..5b7ba7f
--- /dev/null
+++ b/package/systemd/systemd.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  a031e6fbcdc7077b37338bae8074d9428ee2fa98033beb4923a62871890f7498  systemd-217.tar.xz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 75a32f4..5362319 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 216
+SYSTEMD_VERSION = 217
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_LICENSE = LGPLv2.1+; GPLv2+ for udev; MIT-like license for few source files listed in README
