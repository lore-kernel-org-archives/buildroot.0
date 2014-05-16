From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 May 2014 16:08:04 +0200
Subject: [Buildroot] [git commit] jack2: force host-python dependency for
	waf build-system
Message-ID: <20140516141217.87D479CBC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc8fcec306dab7191dc557ee583e90fc1a3a6c29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jack2 uses Waf 1.6.11. The waf configure program combines a part of
python script with a compiled blob. According to Waf documentation,
waf currently supports python interpreter from version 2.3 to 3.1.

However, Buildroot provides python-3.4. So, let's uses host python2
interpreter for building jack2.

This patch also cleanup whitespace, replacing wrongly used spaces with
tabs.

Fixed:
  http://autobuild.buildroot.net/results/913/913bb1836076be9f201bf6641c7614708d6916bc/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack2/jack2.mk |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index f2ded00..68f6e42 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -7,23 +7,24 @@
 JACK2_VERSION = ab409a65df95bc261ff72b52d6b3f4a65cf3266a
 JACK2_SITE = $(call github,jackaudio,jack2,$(JACK2_VERSION))
 JACK2_LICENSE = GPLv2+ (jack server), LGPLv2.1+ (jack library)
-JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib
+JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
 
 define JACK2_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS)	\
-		./waf configure			\
+		$(HOST_DIR)/usr/bin/python2 ./waf configure \
 		--prefix=/usr			\
-                --alsa				\
-       )
+		--alsa				\
+	)
 endef
 
 define JACK2_BUILD_CMDS
-       (cd $(@D); ./waf build -j $(PARALLEL_JOBS))
+	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
 endef
 
 define JACK2_INSTALL_TARGET_CMDS
-       (cd $(@D); ./waf --destdir=$(TARGET_DIR) install)
+	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
+		install)
 endef
 
 $(eval $(generic-package))
