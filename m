From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Jul 2017 18:53:25 +0200
Subject: [Buildroot] [PATCH 03/20] jack2: don't download patch from Github
In-Reply-To: <20170702165342.29522-1-thomas.petazzoni@free-electrons.com>
References: <20170702165342.29522-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170702165342.29522-4-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Fix-initialization-in-test-iodelay.patch  | 65 ++++++++++++++++++++++
 ...patch => 0002-Improve-check-for-ucontext.patch} |  0
 ...ce-support-depends-on-execinfo.h-existen.patch} |  0
 ...=> 0004-tests-define-__STDC_LIMIT_MACROS.patch} |  0
 package/jack2/jack2.hash                           |  1 -
 package/jack2/jack2.mk                             |  1 -
 6 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 package/jack2/0001-Fix-initialization-in-test-iodelay.patch
 rename package/jack2/{0001-Improve-check-for-ucontext.patch => 0002-Improve-check-for-ucontext.patch} (100%)
 rename package/jack2/{0002-Make-backtrace-support-depends-on-execinfo.h-existen.patch => 0003-Make-backtrace-support-depends-on-execinfo.h-existen.patch} (100%)
 rename package/jack2/{0003-tests-define-__STDC_LIMIT_MACROS.patch => 0004-tests-define-__STDC_LIMIT_MACROS.patch} (100%)

diff --git a/package/jack2/0001-Fix-initialization-in-test-iodelay.patch b/package/jack2/0001-Fix-initialization-in-test-iodelay.patch
new file mode 100644
index 0000000..ee24938
--- /dev/null
+++ b/package/jack2/0001-Fix-initialization-in-test-iodelay.patch
@@ -0,0 +1,65 @@
+From ff1ed2c4524095055140370c1008a2d9cccc5645 Mon Sep 17 00:00:00 2001
+From: Adrian Knoth <adi@drcomp.erfurt.thur.de>
+Date: Sat, 11 Jun 2016 05:35:07 +0200
+Subject: [PATCH] Fix initialization in test/iodelay.cpp
+
+jack_latency_range_t is
+
+struct _jack_latency_range {
+    jack_nframes_t min;
+    jack_nframes_t max;
+};
+
+and jack_nframes_t is
+
+typedef uint32_t        jack_nframes_t;
+
+so it's unsigned. Initialising it with -1 is invalid (at least in C++14). We cannot use {0, 0}, because latency_cb has
+
+   jack_latency_range_t range;
+   range.min = range.max = 0;
+   if ((range.min != capture_latency.min) || (range.max !=
+       capture_latency.max)) {
+       capture_latency = range;
+   }
+
+so we must not have {0, 0}, otherwise the condition would never be true.
+
+Using UINT32_MAX should be equivalent to the previous -1.
+
+[Upstream commit https://github.com/jackaudio/jack2/commit/ff1ed2c4524095055140370c1008a2d9cccc5645]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ tests/iodelay.cpp | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/tests/iodelay.cpp b/tests/iodelay.cpp
+index e1ba63fa..1ef470fd 100644
+--- a/tests/iodelay.cpp
++++ b/tests/iodelay.cpp
+@@ -20,6 +20,7 @@
+ 
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <stdint.h>
+ #include <math.h>
+ #include <unistd.h>
+ #include <jack/jack.h>
+@@ -167,8 +168,8 @@ static jack_client_t  *jack_handle;
+ static jack_port_t    *jack_capt;
+ static jack_port_t    *jack_play;
+ 
+-jack_latency_range_t   capture_latency = {-1, -1};
+-jack_latency_range_t   playback_latency = {-1, -1};
++jack_latency_range_t   capture_latency = {UINT32_MAX, UINT32_MAX};
++jack_latency_range_t   playback_latency = {UINT32_MAX, UINT32_MAX};
+ 
+ void
+ latency_cb (jack_latency_callback_mode_t mode, void *arg)
+@@ -266,4 +267,4 @@ int main (int ac, char *av [])
+     return 0;
+ }
+ 
+-// --------------------------------------------------------------------------------
+\ No newline at end of file
++// --------------------------------------------------------------------------------
diff --git a/package/jack2/0001-Improve-check-for-ucontext.patch b/package/jack2/0002-Improve-check-for-ucontext.patch
similarity index 100%
rename from package/jack2/0001-Improve-check-for-ucontext.patch
rename to package/jack2/0002-Improve-check-for-ucontext.patch
diff --git a/package/jack2/0002-Make-backtrace-support-depends-on-execinfo.h-existen.patch b/package/jack2/0003-Make-backtrace-support-depends-on-execinfo.h-existen.patch
similarity index 100%
rename from package/jack2/0002-Make-backtrace-support-depends-on-execinfo.h-existen.patch
rename to package/jack2/0003-Make-backtrace-support-depends-on-execinfo.h-existen.patch
diff --git a/package/jack2/0003-tests-define-__STDC_LIMIT_MACROS.patch b/package/jack2/0004-tests-define-__STDC_LIMIT_MACROS.patch
similarity index 100%
rename from package/jack2/0003-tests-define-__STDC_LIMIT_MACROS.patch
rename to package/jack2/0004-tests-define-__STDC_LIMIT_MACROS.patch
diff --git a/package/jack2/jack2.hash b/package/jack2/jack2.hash
index 1b981a4..ab031b9 100644
--- a/package/jack2/jack2.hash
+++ b/package/jack2/jack2.hash
@@ -1,3 +1,2 @@
 # Locally calculated
 sha256 88f1b6601b7c8950e6a2d5940b423a33ee628ae5583da40bdce3d9317d8c600d  jack2-v1.9.10.tar.gz
-sha256 f372c4300e3fb2c1ce053e47829df44f3f8b933feb820759392187723ae8e640  ff1ed2c4524095055140370c1008a2d9cccc5645.patch
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index c57ad0e..b61c5d7 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -9,7 +9,6 @@ JACK2_SITE = $(call github,jackaudio,jack2,$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
 JACK2_INSTALL_STAGING = YES
-JACK2_PATCH = https://github.com/jackaudio/jack2/commit/ff1ed2c4524095055140370c1008a2d9cccc5645.patch
 
 JACK2_CONF_OPTS = --alsa
 
-- 
2.9.4
