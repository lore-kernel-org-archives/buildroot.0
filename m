From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 14 Dec 2018 23:38:13 -0200
Subject: [Buildroot] [PATCH] package/pcm-tools: fix build with GCC 4.8.2
Message-ID: <20181215013813.451-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass $(TARGET_CONFIGURE_OPTS) as arguments to make and add "-std=c++11"
to CXXFLAGS, forcing C++ 2011 standard (it's experimental in GCC 4.8.2
but goot enough to build pcm-tools).

Fixes:
  http://autobuild.buildroot.net/results/cf3c79f0c94be8a184d532570bdb1893090316a3/

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/pcm-tools/pcm-tools.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
index c0d6d8bc52..98b562eac4 100644
--- a/package/pcm-tools/pcm-tools.mk
+++ b/package/pcm-tools/pcm-tools.mk
@@ -15,7 +15,8 @@ PCM_TOOLS_EXE_FILES = \
 
 define PCM_TOOLS_BUILD_CMDS
 	touch $(@D)/daemon-binaries
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
 		UNAME=Linux HOST=_LINUX
 endef
 
-- 
2.19.2
