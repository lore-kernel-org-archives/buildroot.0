From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Apr 2016 03:57:54 +0200
Subject: [Buildroot] [git commit] alsa-utils: bump to version 1.1.1
Message-ID: <20160401015824.215C87FEC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cd5abf7f9edd3c0a609e9626f12f71e2a6e4e7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches upstream so drop them.

The 'bat' binary utility was renamed to 'alsabat' probably to avoid some
clash, keep the old .config symbol to avoid pointless legacy.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-bat-Avoid-local-signal.h-file.patch       | 143 ---------------------
 ...ass-incompatible-function-pointers-to-pth.patch |  61 ---------
 package/alsa-utils/alsa-utils.hash                 |   2 +-
 package/alsa-utils/alsa-utils.mk                   |   4 +-
 4 files changed, 3 insertions(+), 207 deletions(-)

diff --git a/package/alsa-utils/0001-bat-Avoid-local-signal.h-file.patch b/package/alsa-utils/0001-bat-Avoid-local-signal.h-file.patch
deleted file mode 100644
index 250f77d..0000000
--- a/package/alsa-utils/0001-bat-Avoid-local-signal.h-file.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-bat: Avoid local signal.h file
-
-Patch backported from upstream:
-
-  http://git.alsa-project.org/?p=alsa-utils.git;a=commit;h=3bf8e79c3bfee3ca14277aad3d9c406dfc053bbf
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From 3bf8e79c3bfee3ca14277aad3d9c406dfc053bbf Mon Sep 17 00:00:00 2001
-From: Takashi Iwai <tiwai@suse.de>
-Date: Mon, 9 Nov 2015 14:04:11 +0100
-Subject: [PATCH 1/2] bat: Avoid local signal.h file
-
-The local header file named as "signal.h" causes mysterious compile
-error when built with an old glibc.
- signal.h:27: error: conflicting types for 'sin_generator_init'
- ./signal.h:27: error: previous declaration of 'sin_generator_init' was here
- signal.h:28: error: conflicting types for 'sin_generator_next_sample'
- ./signal.h:28: error: previous declaration of 'sin_generator_next_sample' was here
- ....
-
-This turned out to be the conflict of signal.h; namely, pthread.h that
-is included before our local signal.h also includes "pthread.h".
-Since our local "signal.h" has a higher priority, it gets loaded
-instead of the expected pthread's one.  Then we load it again, and it
-screws up.
-
-Although it's basically a bug of pthread, it's anyway not good to have
-a header file conflicting with the standard header file.  So, let's
-name it more explicitly as specific to BAT, bat-signal.h, for avoiding
-such a conflict.
-
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
----
- bat/Makefile.am  |  2 +-
- bat/alsa.c       |  2 +-
- bat/bat-signal.h | 30 ++++++++++++++++++++++++++++++
- bat/signal.h     | 30 ------------------------------
- 4 files changed, 32 insertions(+), 32 deletions(-)
- create mode 100644 bat/bat-signal.h
- delete mode 100644 bat/signal.h
-
-diff --git a/bat/Makefile.am b/bat/Makefile.am
-index 842ae6b..f0dc5ab 100644
---- a/bat/Makefile.am
-+++ b/bat/Makefile.am
-@@ -13,7 +13,7 @@ bat_SOURCES = \
- 
- noinst_HEADERS = \
- 	common.h \
--	signal.h \
-+	bat-signal.h \
- 	alsa.h \
- 	convert.h \
- 	analyze.h
-diff --git a/bat/alsa.c b/bat/alsa.c
-index 582c604..d31a633 100644
---- a/bat/alsa.c
-+++ b/bat/alsa.c
-@@ -27,7 +27,7 @@
- 
- #include "common.h"
- #include "alsa.h"
--#include "signal.h"
-+#include "bat-signal.h"
- 
- struct pcm_container {
- 	snd_pcm_t *handle;
-diff --git a/bat/bat-signal.h b/bat/bat-signal.h
-new file mode 100644
-index 0000000..a295517
---- /dev/null
-+++ b/bat/bat-signal.h
-@@ -0,0 +1,30 @@
-+/*
-+ * Copyright (C) 2015 Caleb Crome
-+ * Copyright (C) 2013-2015 Intel Corporation
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2 of the License, or
-+ * (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ */
-+
-+/*
-+ * Here's a generic sine wave generator that will work indefinitely
-+ * for any frequency.
-+ *
-+ * Note:  the state & phasor are stored as doubles (and updated as
-+ * doubles) because after a million samples the magnitude drifts a
-+ * bit.  If we really need floats, it can be done with periodic
-+ * renormalization of the state_real+state_imag magnitudes.
-+ */
-+
-+int sin_generator_init(struct sin_generator *, float, float, float);
-+float sin_generator_next_sample(struct sin_generator *);
-+void sin_generator_vfill(struct sin_generator *, float *, int);
-+int generate_sine_wave(struct bat *, int, void *);
-diff --git a/bat/signal.h b/bat/signal.h
-deleted file mode 100644
-index a295517..0000000
---- a/bat/signal.h
-+++ /dev/null
-@@ -1,30 +0,0 @@
--/*
-- * Copyright (C) 2015 Caleb Crome
-- * Copyright (C) 2013-2015 Intel Corporation
-- *
-- * This program is free software; you can redistribute it and/or modify
-- * it under the terms of the GNU General Public License as published by
-- * the Free Software Foundation; either version 2 of the License, or
-- * (at your option) any later version.
-- *
-- * This program is distributed in the hope that it will be useful,
-- * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- * GNU General Public License for more details.
-- *
-- */
--
--/*
-- * Here's a generic sine wave generator that will work indefinitely
-- * for any frequency.
-- *
-- * Note:  the state & phasor are stored as doubles (and updated as
-- * doubles) because after a million samples the magnitude drifts a
-- * bit.  If we really need floats, it can be done with periodic
-- * renormalization of the state_real+state_imag magnitudes.
-- */
--
--int sin_generator_init(struct sin_generator *, float, float, float);
--float sin_generator_next_sample(struct sin_generator *);
--void sin_generator_vfill(struct sin_generator *, float *, int);
--int generate_sine_wave(struct bat *, int, void *);
--- 
-2.4.10
-
diff --git a/package/alsa-utils/0002-bat-Don-t-pass-incompatible-function-pointers-to-pth.patch b/package/alsa-utils/0002-bat-Don-t-pass-incompatible-function-pointers-to-pth.patch
deleted file mode 100644
index 1aee9ae..0000000
--- a/package/alsa-utils/0002-bat-Don-t-pass-incompatible-function-pointers-to-pth.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-bat: Don't pass incompatible function pointers to pthread_cleanup_push()
-
-Patch backported from upstream:
-
-  http://git.alsa-project.org/?p=alsa-utils.git;a=commit;h=ed0cce1b6061aade0077982cb5d22fa68ddffd2f
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From ed0cce1b6061aade0077982cb5d22fa68ddffd2f Mon Sep 17 00:00:00 2001
-From: Takashi Iwai <tiwai@suse.de>
-Date: Mon, 9 Nov 2015 14:09:50 +0100
-Subject: [PATCH 2/2] bat: Don't pass incompatible function pointers to
- pthread_cleanup_push()
-
-pthread_cleanup_push() takes a function pointer for void (void *).
-Although it may work in most cases, we shouldn't pass an incompatible
-function pointer there, as some old gcc complains:
-  alsa.c:560: warning: initialization from incompatible pointer type
-  alsa.c:562: warning: initialization from incompatible pointer type
-
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
----
- bat/alsa.c | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/bat/alsa.c b/bat/alsa.c
-index d31a633..5eaa25b 100644
---- a/bat/alsa.c
-+++ b/bat/alsa.c
-@@ -505,6 +505,16 @@ static int read_from_pcm_loop(FILE *fp, int count,
- 	return 0;
- }
- 
-+static void pcm_cleanup(void *p)
-+{
-+	snd_pcm_close(p);
-+}
-+
-+static void file_cleanup(void *p)
-+{
-+	fclose(p);
-+}
-+
- /**
-  * Record
-  */
-@@ -557,9 +567,9 @@ void *record_alsa(struct bat *bat)
- 
- 	pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
- 	pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, NULL);
--	pthread_cleanup_push(snd_pcm_close, sndpcm.handle);
-+	pthread_cleanup_push(pcm_cleanup, sndpcm.handle);
- 	pthread_cleanup_push(free, sndpcm.buffer);
--	pthread_cleanup_push(fclose, fp);
-+	pthread_cleanup_push(file_cleanup, fp);
- 
- 	err = write_wav_header(fp, &wav, bat);
- 	if (err != 0) {
--- 
-2.4.10
-
diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index e6530eb..89eb510 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	3b1c3135b76e14532d3dd23fb15759ddd7daf9ffbc183f7a9a0a3a86374748f1	alsa-utils-1.1.0.tar.bz2
+sha256	89757c9abaf420831b088fce354d492acc170bd02bb50eb7392c175f594b8041	alsa-utils-1.1.1.tar.bz2
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index b5dc698..a04d2cb 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.1.0
+ALSA_UTILS_VERSION = 1.1.1
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_LICENSE = GPLv2
@@ -55,7 +55,7 @@ ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSATPLG) += usr/bin/alsatplg
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_AMIDI) += usr/bin/amidi
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_AMIXER) += usr/bin/amixer
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_APLAY) += usr/bin/aplay usr/bin/arecord
-ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_BAT) += usr/bin/bat
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_BAT) += usr/bin/alsabat
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_IECSET) += usr/bin/iecset
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ACONNECT) += usr/bin/aconnect
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSAUCM) += usr/bin/alsaucm
