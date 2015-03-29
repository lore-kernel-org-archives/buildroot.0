From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 29 Mar 2015 09:35:33 +0200
Subject: [Buildroot] [PATCH 1/2] jack2: use -j only when is PARALLEL_JOBS is
	defined
Message-ID: <1427614534-32460-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When top-level parallel makefile is being used the PARALLEL_JOBS is
empty but the build system of jack2 does not accept a -j without an
argument so don't use the -j option when PARALLEL_JOBS is empty.

Fix build failure:
waf: error: -j option requires an argument
<snip>
make: *** [/home/tetsuya/buildroot/br2/output/build/jack2-ab409a65df95bc261ff72b52d6b3f4a65cf3266a/.stamp_built] Error 2

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/jack2/jack2.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 3f52ff4..a472df2 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -10,6 +10,10 @@ JACK2_LICENSE = GPLv2+ (jack server), LGPLv2.1+ (jack library)
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
 JACK2_INSTALL_STAGING = YES
 
+ifneq ($(PARALLEL_JOBS),)
+ JACK2_PARALLEL_JOBS = -j$(PARALLEL_JOBS)
+endif
+
 define JACK2_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS)	\
@@ -20,7 +24,8 @@ define JACK2_CONFIGURE_CMDS
 endef
 
 define JACK2_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
+	(cd $(@D); $(HOST_DIR)/usr/bin/python2 \
+		./waf build $(JACK2_PARALLEL_JOBS))
 endef
 
 define JACK2_INSTALL_TARGET_CMDS
-- 
2.3.4
