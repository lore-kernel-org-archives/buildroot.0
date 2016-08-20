From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 11:34:45 +0200
Subject: [Buildroot] [git commit] jack2: fix build with gcc 6
Message-ID: <20160820094444.161078211A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b7304022687e469a030dc6ed7cebcdf6e2f6d63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With gcc version 6, we get the following error when building jack2:

  ../tests/iodelay.cpp:170:49: error: narrowing conversion of '-1' from 'int' to 'jack_nframes_t {aka unsigned int}' inside { } [-Wnarrowing]
   jack_latency_range_t   capture_latency = {-1, -1};
                                                   ^
  ../tests/iodelay.cpp:170:49: error: narrowing conversion of '-1' from 'int' to 'jack_nframes_t {aka unsigned int}' inside { } [-Wnarrowing]
  ../tests/iodelay.cpp:171:50: error: narrowing conversion of '-1' from 'int' to 'jack_nframes_t {aka unsigned int}' inside { } [-Wnarrowing]
   jack_latency_range_t   playback_latency = {-1, -1};
                                                    ^
  ../tests/iodelay.cpp:171:50: error: narrowing conversion of '-1' from 'int' to 'jack_nframes_t {aka unsigned int}' inside { } [-Wnarrowing]

This is fixed by grabbing an upstream commit,
ff1ed2c4524095055140370c1008a2d9cccc5645

Fixes:

  http://autobuild.buildroot.net/results/8a8/8a8d533a0f785591fee10f1c09c9294f892ef7f7/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jack2/jack2.hash | 1 +
 package/jack2/jack2.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/jack2/jack2.hash b/package/jack2/jack2.hash
index ab031b9..1b981a4 100644
--- a/package/jack2/jack2.hash
+++ b/package/jack2/jack2.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 88f1b6601b7c8950e6a2d5940b423a33ee628ae5583da40bdce3d9317d8c600d  jack2-v1.9.10.tar.gz
+sha256 f372c4300e3fb2c1ce053e47829df44f3f8b933feb820759392187723ae8e640  ff1ed2c4524095055140370c1008a2d9cccc5645.patch
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 777a321..f6ab974 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -9,6 +9,7 @@ JACK2_SITE = $(call github,jackaudio,jack2,$(JACK2_VERSION))
 JACK2_LICENSE = GPLv2+ (jack server), LGPLv2.1+ (jack library)
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
 JACK2_INSTALL_STAGING = YES
+JACK2_PATCH = https://github.com/jackaudio/jack2/commit/ff1ed2c4524095055140370c1008a2d9cccc5645.patch
 
 ifeq ($(BR2_PACKAGE_OPUS),y)
 JACK2_DEPENDENCIES += opus
