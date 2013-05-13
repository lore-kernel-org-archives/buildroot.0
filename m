From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 May 2013 13:40:54 -0300
Subject: [Buildroot] [PATCH 1/6] package infra: remove CPPFLAGS from CFLAGS
Message-ID: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CPPFLAGS don't belong in CFLAGS, and newer autoconf versions just error
out when it's used that way.
This is required for the libcurl bump to 7.30.0

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Makefile.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 9ba6e8c..8ba7d70 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -100,7 +100,7 @@ ifeq ($(BR2_LARGEFILE),y)
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
 
-TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
+TARGET_CFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
@@ -179,7 +179,6 @@ SED:=$(shell which sed || type -p sed) -i -e
 
 HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
 HOST_CFLAGS   ?= -O2
-HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
 HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
-- 
1.8.1.5
