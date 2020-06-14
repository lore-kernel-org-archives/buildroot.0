From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 18:02:33 +0200
Subject: [Buildroot] [git commit] package/alsa-lib: bump version to 1.2.3
Message-ID: <20200614160202.60D1D82286@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfb3ac81e48485a3ab8c018854725cfe30631e3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.alsa-project.org/wiki/Changes_v1.2.2_v1.2.3

Added patch to fix uClibc build.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr:
  - actually backport the patch now it has been applied upstream
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../alsa-lib/0002-dlmisc.c-fix-uclibc-build.patch  | 37 ++++++++++++++++++++++
 package/alsa-lib/alsa-lib.hash                     |  2 +-
 package/alsa-lib/alsa-lib.mk                       |  2 +-
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/0002-dlmisc.c-fix-uclibc-build.patch b/package/alsa-lib/0002-dlmisc.c-fix-uclibc-build.patch
new file mode 100644
index 0000000000..af629e0f6f
--- /dev/null
+++ b/package/alsa-lib/0002-dlmisc.c-fix-uclibc-build.patch
@@ -0,0 +1,37 @@
+From eec95e69e5d0dcc16fd8872c1ad680265a96cce3 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 13 Jun 2020 17:44:45 +0200
+Subject: [PATCH] dlmisc.c: fix uclibc build
+
+RTLD_DL_LINKMAP & RTLD_DI_ORIGIN, are unsupported on uClibc:
+https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/include/dlfcn.h#n106
+
+This patch adds detection for uClibc because uClibc also defines
+__GLIBC__:
+https://lists.gnu.org/archive/html/bug-gnulib/2010-11/msg00280.html
+
+BugLink: https://github.com/alsa-project/alsa-lib/pull/58
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+---
+Backported from upstream eec95e69e5d0dcc16fd8872c1ad680265a96cce3
+---
+ src/dlmisc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dlmisc.c b/src/dlmisc.c
+index 5d672146..ca94b123 100644
+--- a/src/dlmisc.c
++++ b/src/dlmisc.c
+@@ -69,7 +69,7 @@ static inline void snd_dlpath_unlock(void) {}
+ int snd_dlpath(char *path, size_t path_len, const char *name)
+ {
+ #ifdef HAVE_LIBDL
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+ 	static int plugin_dir_set = 0;
+ 	snd_dlpath_lock();
+ 	if (!plugin_dir_set) {
+-- 
+2.20.1
+
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index a4656e230c..9ce8a3408e 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d8e853d8805574777bbe40937812ad1419c9ea7210e176f0def3e6ed255ab3ec  alsa-lib-1.2.2.tar.bz2
+sha256  02f00922fc511eaf37b037197afa930d5ff0912c1a86f333393f91f3426f678e  alsa-lib-1.2.3.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 1855eb3d08..a3b2081fdb 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.2
+ALSA_LIB_VERSION = 1.2.3
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
