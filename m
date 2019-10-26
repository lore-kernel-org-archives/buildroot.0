From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 14:56:34 +0200
Subject: [Buildroot] [git commit] package/brltty: fix build with expat
Message-ID: <20191026125042.36C6788375@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=899ab0d63ca88979d97309027a3916f5a6fac1a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tbl2hex is a host command line that is built with:

$(CC_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ $(TBL2HEX_OBJECTS) $(EXPAT_LIBS_FOR_BUILD) $(LDLIBS_FOR_BUILD)

It needs cldr.o which can depends on expat and is built through:

%.$B: $(SRC_DIR)/%.c
       $(CC_FOR_BUILD) -DFOR_BUILD $(CFLAGS_FOR_BUILD) -o $@ -c $<

When cross-compiling, build fails because expat is not found on host:

gcc -DFOR_BUILD -I. -I. -I./../Programs -I../Programs -I../Headers -I./.. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE  -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE -DHAVE_CONFIG_H -g -O2 -std=gnu99 -Wall -Werror=format-security -o cldr.build.o -c cldr.c
cldr.c:31:10: fatal error: expat.h: No such file or directory
 #include <expat.h>
          ^~~~~~~~~

To fix this issue, add host-expat dependency as well as patch so that
the *_FOR_BUILD variables are properly passed to the sub-configure
script that brltty runs to build the host utilities.

Fixes:
 - http://autobuild.buildroot.org/results/362cfb57e4a91a066493269d8078d931529ddf69

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: use a different, simpler solution.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ange-how-the-_FOR_BUILD-variables-are-pas.patch | 53 ++++++++++++++++++++++
 package/brltty/brltty.mk                           |  3 +-
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/package/brltty/0002-mk4build-change-how-the-_FOR_BUILD-variables-are-pas.patch b/package/brltty/0002-mk4build-change-how-the-_FOR_BUILD-variables-are-pas.patch
new file mode 100644
index 0000000000..ddcc5ba9ea
--- /dev/null
+++ b/package/brltty/0002-mk4build-change-how-the-_FOR_BUILD-variables-are-pas.patch
@@ -0,0 +1,53 @@
+From 0414ad2b4e8978a14343d920a5a1f11da892eaf3 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 26 Oct 2019 14:28:51 +0200
+Subject: [PATCH] mk4build: change how the _FOR_BUILD variables are passed to
+ sub-configure
+
+The logic that eval's for *_FOR_BUILD variables to set them to their
+equivalent without _FOR_BUILD before calling the sub-configure for the
+host machine doesn't work: the variables are not exported, and
+therefore they are not seen by the ./configure script, which runs as a
+separate process.
+
+So instead, keep things simple and pass them explicitly in the
+environment of the ./configure script.
+
+This patch was written in the context of the Buildroot build system,
+which does cross-compilation, through which we discovered that the
+*_FOR_BUILD variables are not properly passed down to the
+sub-configure.
+
+Upstream: https://github.com/brltty/brltty/pull/183
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ mk4build | 13 ++++++-------
+ 1 file changed, 6 insertions(+), 7 deletions(-)
+
+diff --git a/mk4build b/mk4build
+index 3fb9d8917..3c64963b7 100755
+--- a/mk4build
++++ b/mk4build
+@@ -67,13 +67,12 @@ then
+ 
+    needTemporaryDirectory
+ 
+-   for variable in CC CFLAGS CXX CXXFLAGS LDFLAGS LDLIBS
+-   do
+-      unset "${variable}"
+-      variableForBuild="${variable}_FOR_BUILD"
+-      eval test '"${'"${variableForBuild}"'+set}"' != "set" || eval "${variable}"'="${'"${variableForBuild}"'}"'
+-   done
+-
++   CC=${CC_FOR_BUILD} \
++   CFLAGS=${CFLAGS_FOR_BUILD} \
++   CXX=${CXX_FOR_BUILD} \
++   CXXFLAGS=${CXXFLAGS_FOR_BUILD} \
++   LDFLAGS=${LDFLAGS_FOR_BUILD} \
++   LDLIBS=${LDLIBS_FOR_BUILD} \
+    "${sourceRoot}/configure" \
+       --disable-api \
+       --disable-gpm \
+-- 
+2.21.0
+
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index b9d608b9f5..3ae8b899b8 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -51,7 +51,8 @@ BRLTTY_CONF_OPTS += --without-espeak
 endif
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
-BRLTTY_DEPENDENCIES += expat
+# host-expat is needed by tbl2hex's host program
+BRLTTY_DEPENDENCIES += host-expat expat
 BRLTTY_CONF_OPTS += --enable-expat
 else
 BRLTTY_CONF_OPTS += --disable-expat
