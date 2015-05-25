From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2015 21:58:03 +0200
Subject: [Buildroot] [git commit] gptfdisk: ensure correct libintl/libiconv
	build order
Message-ID: <20150525205004.005E580E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43713266cf01cbc8d4e057f60c3c4b3b0101b4b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/c7d/c7d48554d76e39cbdf715721ae51e3516a99f97e/

We're explicitly linking against libintl/libiconv if enabled when linking
statically, but weren't ensuring that those libraries had already been built
before gptfdisk leading to linker issues.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gptfdisk/gptfdisk.mk |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index e84e3d3..f812376 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -24,9 +24,15 @@ endif
 ifeq ($(BR2_STATIC_LIBS),y)
 # gptfdisk dependencies may link against libintl/libiconv, so we need
 # to do so as well when linking statically
-GPTFDISK_LDLIBS = \
-	$(if $(BR2_PACKAGE_GETTEXT),-lintl) \
-	$(if $(BR2_PACKAGE_LIBICONV),-liconv)
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+GPTFDISK_DEPENDENCIES += gettext
+GPTFDISK_LDLIBS += -lintl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+GPTFDISK_DEPENDENCIES += libiconv
+GPTFDISK_LDLIBS += -liconv
+endif
 endif
 
 define GPTFDISK_BUILD_CMDS
