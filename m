From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2014 09:28:15 +0100
Subject: [Buildroot] [git commit] live555: unbreak build without locale
	support in toolchain
Message-ID: <20140121083119.129319C54D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20a6dae075f2c78cf6703e9b6d3e85916d34fd2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/7c1/7c1a1847c5d8ce1d97ef077f26289153660848e8/
  http://autobuild.buildroot.net/results/d2b/d2bb82d0cca04ff66f7d1c8c2f0493f41b43ad3f/
  http://autobuild.buildroot.net/results/3b2/3b2e5f3a3914a3a651086cd8d8520380a7612d7e/
  http://autobuild.buildroot.net/results/c00/c00835074917e14adc759df1b6bdbe3f6221e84e/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 7bb45cf..756bec6 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -11,8 +11,14 @@ LIVE555_LICENSE = LGPLv2.1+
 LIVE555_LICENSE_FILES = COPYING
 LIVE555_INSTALL_STAGING = YES
 
+LIVE555_CFLAGS = $(TARGET_CFLAGS)
+
+ifndef ($(BR2_ENABLE_LOCALE),y)
+LIVE555_CFLAGS += -DLOCALE_NOT_USED
+endif
+
 define LIVE555_CONFIGURE_CMDS
-	echo 'COMPILE_OPTS = $$(INCLUDES) -I. -DSOCKLEN_T=socklen_t $(TARGET_CFLAGS)' >> $(@D)/config.linux
+	echo 'COMPILE_OPTS = $$(INCLUDES) -I. -DSOCKLEN_T=socklen_t $(LIVE555_CFLAGS)' >> $(@D)/config.linux
 	echo 'C_COMPILER = $(TARGET_CC)' >> $(@D)/config.linux
 	echo 'CPLUSPLUS_COMPILER = $(TARGET_CXX)' >> $(@D)/config.linux
 	echo 'LINK = $(TARGET_CXX) -o' >> $(@D)/config.linux
