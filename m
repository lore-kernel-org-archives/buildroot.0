From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Fri, 27 Mar 2015 17:50:36 +0100
Subject: [Buildroot] [PATCH 1/1] mjpg-streamer: Fix build with ccache
	enabled.
Message-ID: <1427475036-10363-1-git-send-email-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quote the TARGET_CC variable, otherwise, if ccache is enabled:

[...] make CC=$TARGET_CC [...]
is expanded to e.g.
[...] make CC=ccache gcc [...]

The build succeeds with "make[2]: Nothing to be done for '[...]gcc'".
and the program is compiled at "make install" time, with the default
host compiler, resulting in a binary that does not run on the target.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/mjpg-streamer/mjpg-streamer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 2385429..e10e9a8 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -15,7 +15,7 @@ MJPG_STREAMER_LICENSE_FILES = LICENSE
 MJPG_STREAMER_DEPENDENCIES = jpeg
 
 define MJPG_STREAMER_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D)
 endef
 
 define MJPG_STREAMER_INSTALL_TARGET_CMDS
-- 
2.1.4
