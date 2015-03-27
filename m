From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Mar 2015 18:09:36 +0100
Subject: [Buildroot] [git commit] mjpg-streamer: Fix build with ccache
	enabled.
Message-ID: <20150327170942.EB8E0817A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16359f0facbefd73179ffb9616594e0ebfbb5367
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quote the TARGET_CC variable, otherwise, if ccache is enabled:

[...] make CC=$TARGET_CC [...]
is expanded to e.g.
[...] make CC=ccache gcc [...]

The build succeeds with "make[2]: Nothing to be done for '[...]gcc'".
and the program is compiled at "make install" time, with the default
host compiler, resulting in a binary that does not run on the target.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mjpg-streamer/mjpg-streamer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
