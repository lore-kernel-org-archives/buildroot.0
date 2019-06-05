From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Jun 2019 22:57:03 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/netsurf: change
 how CFLAGS/LDFLAGS are passed
Message-ID: <20190605210240.1D0108D206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a906c4c4feb6b821b3d39ba3232783a5961260fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
http://autobuild.buildroot.net/results/eeb2863c6237aac8428e49a5ee514d43088b0fb8
http://autobuild.buildroot.net/results/f938fd1515f1d6e11b57aa6e314135789da52a44

In commit 6da049f8ae61b956d135526722ce58fc2f67626a ("package/netsurf:
fix build"), the CC variable passed to netsurf's build system was
extended to pass some special -I and -L options needed for netsurf to
find its own headers/libraries.

Unfortunately, on some systems (including mine), it breaks the build,
due to:

  toolpath_ := $(shell /bin/which $(CC__))

when $(CC__) contains some -I/-L options, they are considered to be
options "to which", which causes the funny:

/usr/bin/make install --directory=libnslog HOST=arm-buildroot-linux-uclibcgnueabi PREFIX=/home/thomas/projets/outputs/shared-netsurf/build/netsurf-3.8/tmpusr Q=@ WARNFLAGS='-Wall -W -Wno-error' DESTDIR=
make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
/bin/which: invalid option -- 'I'
/bin/which: invalid option -- '/'
/bin/which: invalid option -- 'h'
/bin/which: invalid option -- 'o'
/bin/which: invalid option -- 'm'
/bin/which: invalid option -- 'e'
/bin/which: invalid option -- '/'
/bin/which: invalid option -- 't'
/bin/which: invalid option -- 'h'
/bin/which: invalid option -- 'o'
/bin/which: invalid option -- 'm'
/bin/which: invalid option -- 's'
/bin/which: invalid option -- '/'
[...]
/bin/which: invalid option -- 'l'
/bin/which: invalid option -- 'b'
/bin/which: --read-alias, -i: Warning: stdin is a tty.

and the build simply hangs.

We cannot pass CFLAGS/LDFLAGS as make options, as they would override
the CFLAGS definitions in netsurf Makefiles. However, those Makefiles
use the construct:

CFLAGS := $(CFLAGS) -more-flags

so by passing CFLAGS and LDFLAGS through the make environment, which
can achieve our goal.

It is worth mentioning that it remains very fragile, because
CFLAGS/LDFLAGS are used both for building target objects but also some
host tools. The netsurf build system is really not good.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1da0a84f788c637b6a2ce4eda5bb77b7ce7abe06)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsurf/netsurf.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index e617707ade..31cf9e62b8 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -70,13 +70,18 @@ define NETSURF_CONFIGURE_CMDS
 	$(NETSURF_CURL_CONFIGURE_CMDS)
 endef
 
+NETSURF_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	CFLAGS="$(TARGET_CFLAGS) -I$(@D)/tmpusr/include" \
+	LDFLAGS="$(TARGET_LDFLAGS) -L$(@D)/tmpusr/lib"
+
 NETSURF_MAKE_OPTS = \
 	TARGET=$(NETSURF_FRONTEND) \
 	BISON="$(HOST_DIR)/bin/bison" \
 	FLEX="$(HOST_DIR)/bin/flex" \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	BUILD_CC="$(HOSTCC)" \
-	CC="$(TARGET_CC) -I$(@D)/tmpusr/include -L$(@D)/tmpusr/lib" \
+	CC="$(TARGET_CC)" \
 	AR="$(TARGET_AR)" \
 	TMP_PREFIX=$(@D)/tmpusr \
 	NETSURF_CONFIG="$(NETSURF_CONFIG)" \
@@ -84,7 +89,7 @@ NETSURF_MAKE_OPTS = \
 
 define NETSURF_BUILD_CMDS
 	mkdir -p $(@D)/tmpusr
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(NETSURF_MAKE_OPTS) \
+	$(NETSURF_MAKE_ENV) $(MAKE) -C $(@D) $(NETSURF_MAKE_OPTS) \
 		build
 endef
 
