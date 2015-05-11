From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2015 22:26:39 +0200
Subject: [Buildroot] [git commit] fbterm: fix linking issue when static
	linking and a toolchain with threads
Message-ID: <20150511203048.9864F8198B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1951143a366920e33c6fe487c2d96272510e2cae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/899/899eb7e36dc31b7dcb51c0dd23d91965111d22c4/
http://autobuild.buildroot.net/results/43a/43a34d8b64f536caa579709508bb5e00633ba6e7/
http://autobuild.buildroot.net/results/f34/f343d015b127f29d614e7ea38b173d3a5c270d84/
http://autobuild.buildroot.net/results/da8/da88f40dfc51aea122c146e5bfee19b031cfaab6/

And many more.

Fontconfig uses pthreads if available, but fbterm forgets to link with it
breaking static builds.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbterm/fbterm.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
index 7e9d324..d78d6b7 100644
--- a/package/fbterm/fbterm.mk
+++ b/package/fbterm/fbterm.mk
@@ -10,4 +10,10 @@ FBTERM_LICENSE = GPLv2+
 FBTERM_LICENSE_FILES = COPYING
 FBTERM_DEPENDENCIES = fontconfig liberation
 
+ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+# fontconfig uses pthreads if available, but fbterm forgets to link
+# with it breaking static builds
+FBTERM_CONF_ENV += LIBS='-lpthread'
+endif
+
 $(eval $(autotools-package))
