From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 10 Nov 2013 20:58:33 +0000
Subject: [Buildroot] [PATCH] zmqpp: fix build failure
Message-ID: <1384117113-6710-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The zmqpp client needs a little help to link against libpthread. Fix build
failures such as the following.

  http://autobuild.buildroot.net/results/d0a/d0a740d4d5414844ca7f2de266fc92223d3d20c8

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/zmqpp/zmqpp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index 83e088f..4c8417f 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -12,6 +12,7 @@ ZMQPP_LICENSE = MIT
 ZMQPP_LICENSE_FILES = LICENSE
 
 ZMQPP_MAKE_OPT = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
+ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
 
 ifeq ($(BR2_PACKAGE_ZMQPP_CLIENT),y)
 ZMQPP_DEPENDENCIES += boost
@@ -19,6 +20,7 @@ endif
 
 define ZMQPP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		LDFLAGS="$(ZMQPP_LDFLAGS)" \
 		$(ZMQPP_MAKE_OPT) $(if $(BR2_PACKAGE_ZMQPP_CLIENT),all) -C $(@D)
 endef
 
-- 
1.8.3.2
