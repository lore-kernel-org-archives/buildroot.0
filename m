From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 14:33:54 +0100
Subject: [Buildroot] [git commit] systemd: Properly define the
	__NR_memfd_create macro for MIPS
Message-ID: <20141107133601.20357B2C99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc902d92d7dbb23936ecc2df3dfba7f96f8ae7be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is an upstream patch which has been applied to the master branch
and I have adapted it to make it apply to the v216 version.

v217 is not fixed. This patch can be removed when we bump to v218.

Upstream commit:
  http://cgit.freedesktop.org/systemd/systemd/commit/?id=e6c019026b8cfd27a997e6e6ed1349f8f289b7e2

Fixes:
  http://autobuild.buildroot.net/results/596/59617a822fb2c8961881dd78a0dc8e41bdb14ede/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fine-the-__NR_memfd_create-macro-for-MIPS.patch |   60 ++++++++++++++++++++
 1 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/package/systemd/0004-Properly-define-the-__NR_memfd_create-macro-for-MIPS.patch b/package/systemd/0004-Properly-define-the-__NR_memfd_create-macro-for-MIPS.patch
new file mode 100644
index 0000000..6aca13c
--- /dev/null
+++ b/package/systemd/0004-Properly-define-the-__NR_memfd_create-macro-for-MIPS.patch
@@ -0,0 +1,60 @@
+Properly define the __NR_memfd_create macro for MIPS
+
+This is an upstream patch which has been applied to the master branch
+and I have adapted it to make it apply to the v216 version.
+
+Upstream commit:
+  http://cgit.freedesktop.org/systemd/systemd/commit/?id=e6c019026b8cfd27a997e6e6ed1349f8f289b7e2
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From cdd25569e583ccfff3aef0eda175a2d07c00f859 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Tue, 4 Nov 2014 10:49:58 +0000
+Subject: [PATCH] Properly define the __NR_memfd_create macro for MIPS
+
+This macro exists for MIPS since v3.17:
+  https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=42944521af97a3b25516f15f3149aec3779656dc
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ src/shared/missing.h |    9 +++++++++
+ 1 files changed, 9 insertions(+), 0 deletions(-)
+
+diff --git a/src/shared/missing.h b/src/shared/missing.h
+index 3ff1a21..6888163 100644
+--- a/src/shared/missing.h
++++ b/src/shared/missing.h
+@@ -152,6 +152,9 @@ static inline int pivot_root(const char *new_root, const char *put_old) {
+ #    ifndef __NR_fanotify_mark
+ #      define __NR_fanotify_mark 4337
+ #    endif
++#    ifndef __NR_memfd_create
++#      define __NR_memfd_create 4354
++#    endif
+ #  elif _MIPS_SIM == _MIPS_SIM_NABI32
+ #    ifndef __NR_fanotify_init
+ #      define __NR_fanotify_init 6300
+@@ -159,6 +162,9 @@ static inline int pivot_root(const char *new_root, const char *put_old) {
+ #    ifndef __NR_fanotify_mark
+ #      define __NR_fanotify_mark 6301
+ #    endif
++#    ifndef __NR_memfd_create
++#      define __NR_memfd_create 6318
++#    endif
+ #  elif _MIPS_SIM == _MIPS_SIM_ABI64
+ #    ifndef __NR_fanotify_init
+ #      define __NR_fanotify_init 5295
+@@ -166,6 +172,9 @@ static inline int pivot_root(const char *new_root, const char *put_old) {
+ #    ifndef __NR_fanotify_mark
+ #      define __NR_fanotify_mark 5296
+ #    endif
++#    ifndef __NR_memfd_create
++#      define __NR_memfd_create 5314
++#    endif
+ #  endif
+ #else
+ #  ifndef __NR_fanotify_init
+-- 
+1.7.1
+
