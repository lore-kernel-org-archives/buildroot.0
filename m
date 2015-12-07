From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Dec 2015 15:23:46 +0000
Subject: [Buildroot] [PATCH] alsa-utils: fix conflics with pthread.h
Message-ID: <1449501826-39207-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport two upstream patches to fix a build failure due to conflicts
with pthread.h:

signal.h:27: error: conflicting types for 'sin_generator_init'
./signal.h:27: error: previous declaration of 'sin_generator_init' was
here
signal.h:28: error: conflicting types for 'sin_generator_next_sample'
./signal.h:28: error: previous declaration of
'sin_generator_next_sample' was here
....

Upstream patches:

  http://git.alsa-project.org/?p=alsa-utils.git;a=commit;h=3bf8e79c3bfee3ca14277aad3d9c406dfc053bbf
  http://git.alsa-project.org/?p=alsa-utils.git;a=commit;h=ed0cce1b6061aade0077982cb5d22fa68ddffd2f

Fixes:

  http://autobuild.buildroot.net/results/b11/b114ac7a25ac95a059418b07c6cad25714d19b77/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../0001-bat-Avoid-local-signal.h-file.patch       | 73 ++++++++++++++++++++++
 ...ass-incompatible-function-pointers-to-pth.patch | 61 ++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 package/alsa-utils/0001-bat-Avoid-local-signal.h-file.patch
 create mode 100644 package/alsa-utils/0002-bat-Don-t-pass-incompatible-function-pointers-to-pth.patch

diff --git a/package/alsa-utils/0001-bat-Avoid-local-signal.h-file.patch b/package/alsa-utils/0001-bat-Avoid-local-signal.h-file.patch
new file mode 100644
index 0000000..a5f7431
--- /dev/null
+++ b/package/alsa-utils/0001-bat-Avoid-local-signal.h-file.patch
@@ -0,0 +1,73 @@
+bat: Avoid local signal.h file
+
+Patch backported from upstream:
+
+  http://git.alsa-project.org/?p=alsa-utils.git;a=commit;h=3bf8e79c3bfee3ca14277aad3d9c406dfc053bbf
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 3bf8e79c3bfee3ca14277aad3d9c406dfc053bbf Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Mon, 9 Nov 2015 14:04:11 +0100
+Subject: [PATCH 1/2] bat: Avoid local signal.h file
+
+The local header file named as "signal.h" causes mysterious compile
+error when built with an old glibc.
+ signal.h:27: error: conflicting types for 'sin_generator_init'
+ ./signal.h:27: error: previous declaration of 'sin_generator_init' was here
+ signal.h:28: error: conflicting types for 'sin_generator_next_sample'
+ ./signal.h:28: error: previous declaration of 'sin_generator_next_sample' was here
+ ....
+
+This turned out to be the conflict of signal.h; namely, pthread.h that
+is included before our local signal.h also includes "pthread.h".
+Since our local "signal.h" has a higher priority, it gets loaded
+instead of the expected pthread's one.  Then we load it again, and it
+screws up.
+
+Although it's basically a bug of pthread, it's anyway not good to have
+a header file conflicting with the standard header file.  So, let's
+name it more explicitly as specific to BAT, bat-signal.h, for avoiding
+such a conflict.
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+---
+ bat/Makefile.am                | 2 +-
+ bat/alsa.c                     | 2 +-
+ bat/{signal.h => bat-signal.h} | 0
+ 3 files changed, 2 insertions(+), 2 deletions(-)
+ rename bat/{signal.h => bat-signal.h} (100%)
+
+diff --git a/bat/Makefile.am b/bat/Makefile.am
+index 842ae6b..f0dc5ab 100644
+--- a/bat/Makefile.am
++++ b/bat/Makefile.am
+@@ -13,7 +13,7 @@ bat_SOURCES = \
+ 
+ noinst_HEADERS = \
+ 	common.h \
+-	signal.h \
++	bat-signal.h \
+ 	alsa.h \
+ 	convert.h \
+ 	analyze.h
+diff --git a/bat/alsa.c b/bat/alsa.c
+index 582c604..d31a633 100644
+--- a/bat/alsa.c
++++ b/bat/alsa.c
+@@ -27,7 +27,7 @@
+ 
+ #include "common.h"
+ #include "alsa.h"
+-#include "signal.h"
++#include "bat-signal.h"
+ 
+ struct pcm_container {
+ 	snd_pcm_t *handle;
+diff --git a/bat/signal.h b/bat/bat-signal.h
+similarity index 100%
+rename from bat/signal.h
+rename to bat/bat-signal.h
+-- 
+2.4.10
+
diff --git a/package/alsa-utils/0002-bat-Don-t-pass-incompatible-function-pointers-to-pth.patch b/package/alsa-utils/0002-bat-Don-t-pass-incompatible-function-pointers-to-pth.patch
new file mode 100644
index 0000000..68015cf
--- /dev/null
+++ b/package/alsa-utils/0002-bat-Don-t-pass-incompatible-function-pointers-to-pth.patch
@@ -0,0 +1,61 @@
+bat: Don't pass incompatible function pointers to
+
+Patch backported from upstream:
+
+  http://git.alsa-project.org/?p=alsa-utils.git;a=commit;h=ed0cce1b6061aade0077982cb5d22fa68ddffd2f
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From ed0cce1b6061aade0077982cb5d22fa68ddffd2f Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Mon, 9 Nov 2015 14:09:50 +0100
+Subject: [PATCH 2/2] bat: Don't pass incompatible function pointers to
+ pthread_cleanup_push()
+
+pthread_cleanup_push() takes a function pointer for void (void *).
+Although it may work in most cases, we shouldn't pass an incompatible
+function pointer there, as some old gcc complains:
+  alsa.c:560: warning: initialization from incompatible pointer type
+  alsa.c:562: warning: initialization from incompatible pointer type
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+---
+ bat/alsa.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/bat/alsa.c b/bat/alsa.c
+index d31a633..5eaa25b 100644
+--- a/bat/alsa.c
++++ b/bat/alsa.c
+@@ -505,6 +505,16 @@ static int read_from_pcm_loop(FILE *fp, int count,
+ 	return 0;
+ }
+ 
++static void pcm_cleanup(void *p)
++{
++	snd_pcm_close(p);
++}
++
++static void file_cleanup(void *p)
++{
++	fclose(p);
++}
++
+ /**
+  * Record
+  */
+@@ -557,9 +567,9 @@ void *record_alsa(struct bat *bat)
+ 
+ 	pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
+ 	pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, NULL);
+-	pthread_cleanup_push(snd_pcm_close, sndpcm.handle);
++	pthread_cleanup_push(pcm_cleanup, sndpcm.handle);
+ 	pthread_cleanup_push(free, sndpcm.buffer);
+-	pthread_cleanup_push(fclose, fp);
++	pthread_cleanup_push(file_cleanup, fp);
+ 
+ 	err = write_wav_header(fp, &wav, bat);
+ 	if (err != 0) {
+-- 
+2.4.10
+
-- 
2.4.10
