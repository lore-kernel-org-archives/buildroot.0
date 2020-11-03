From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  3 Nov 2020 22:32:20 +0100
Subject: [Buildroot] [PATCH 1/2] package/alsa-lib: bump version to 1.2.4
Message-ID: <20201103213221.727208-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased patch 0001, added patch 0002 to fix compile error with uClibc.

Changelog: https://www.alsa-project.org/wiki/Changes_v1.2.3.2_v1.2.4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...01-Don-t-use-fork-on-noMMU-platforms.patch |  4 ++-
 .../0002-dlmisc-the-snd_plugin_dir_set.patch  | 34 +++++++++++++++++++
 package/alsa-lib/alsa-lib.hash                |  2 +-
 package/alsa-lib/alsa-lib.mk                  |  2 +-
 4 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 package/alsa-lib/0002-dlmisc-the-snd_plugin_dir_set.patch

diff --git a/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch b/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
index 5bf9dd2057..17b57d1f3d 100644
--- a/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
+++ b/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
@@ -10,6 +10,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [J?rg: update patch for 1.1.6]
 Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 Upstream: http://mailman.alsa-project.org/pipermail/alsa-devel/2018-November/141376.html
+[Bernd: update patch for 1.2.4]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  configure.ac         |  2 ++
  src/pcm/pcm_direct.c | 10 +++++++++-
@@ -32,7 +34,7 @@ diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
 index 2b07eff9..4dc3ea26 100644
 --- a/src/pcm/pcm_direct.c
 +++ b/src/pcm/pcm_direct.c
-@@ -431,13 +431,21 @@ int snd_pcm_direct_server_create(snd_pcm_direct_t *dmix)
+@@ -437,13 +437,21 @@ int snd_pcm_direct_server_create(snd_pcm_direct_t *dmix)
  		close(dmix->server_fd);
  		return ret;
  	}
diff --git a/package/alsa-lib/0002-dlmisc-the-snd_plugin_dir_set.patch b/package/alsa-lib/0002-dlmisc-the-snd_plugin_dir_set.patch
new file mode 100644
index 0000000000..61d945455c
--- /dev/null
+++ b/package/alsa-lib/0002-dlmisc-the-snd_plugin_dir_set.patch
@@ -0,0 +1,34 @@
+From ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Thu, 22 Oct 2020 20:57:32 +0200
+Subject: [PATCH] dlmisc: the snd_plugin_dir_set / snd_plugin_dir must be
+ declared even for \!DL_ORIGIN_AVAILABLE
+
+Fixes: 8580c081c2 ("dlsym: add support for ALSA_PLUGIN_DIR environment variable")
+BugLink: https://github.com/alsa-project/alsa-lib/issues/91
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Downloaded from upstream commit
+https://github.com/alsa-project/alsa-lib/commit/ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/dlmisc.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/dlmisc.c b/src/dlmisc.c
+index c9517c55..f20eb593 100644
+--- a/src/dlmisc.c
++++ b/src/dlmisc.c
+@@ -42,11 +42,9 @@
+ #ifndef PIC
+ struct snd_dlsym_link *snd_dlsym_start = NULL;
+ #endif
+-#ifdef DL_ORIGIN_AVAILABLE
+ static int snd_plugin_dir_set = 0;
+ static char *snd_plugin_dir = NULL;
+ #endif
+-#endif
+ 
+ #if defined(DL_ORIGIN_AVAILABLE) && defined(HAVE_LIBPTHREAD)
+ static pthread_mutex_t snd_dlpath_mutex = PTHREAD_MUTEX_INITIALIZER;
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 8a565e580b..6e65fb7166 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  e81fc5b7afcaee8c9fd7f64a1e3043e88d62e9ad2c4cff55f578df6b0a9abe15  alsa-lib-1.2.3.2.tar.bz2
+sha256  f7554be1a56cdff468b58fc1c29b95b64864c590038dd309c7a978c7116908f7  alsa-lib-1.2.4.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 30f7c88153..728aec31a1 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.3.2
+ALSA_LIB_VERSION = 1.2.4
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
-- 
2.27.0
