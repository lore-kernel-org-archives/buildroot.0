From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Sep 2019 10:40:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/brltty: fix build with expat
Message-ID: <20190929084004.21350-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tbl2hex is a host command line that is built with:

TBL2HEX_OBJECTS_FOR_BUILD = tbl2hex.$(O_FOR_BUILD) $(PROGRAM_OBJECTS_FOR_BUILD) dataarea.$(O_FOR_BUILD) ttb_compile.$(O_FOR_BUILD) ttb_native.$(O_FOR_BUILD) atb_compile.$(O_FOR_BUILD) ctb_compile.$(O_FOR_BUILD) cldr.$(O_FOR_BUILD)
TBL2HEX_OBJECTS = $(TBL2HEX_OBJECTS_FOR_BUILD:.$(O_FOR_BUILD)=.$B)

tbl2hex$(X_FOR_BUILD): $(TBL2HEX_OBJECTS)
$(CC_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ $(TBL2HEX_OBJECTS) $(EXPAT_LIBS_FOR_BUILD) $(LDLIBS_FOR_BUILD)

So build fails if expat is enabled on target but not found on host:

gcc -DFOR_BUILD -I. -I. -I./../Programs -I../Programs -I../Headers -I./.. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE  -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE -DHAVE_CONFIG_H -g -O2 -std=gnu99 -Wall -Werror=format-security -o cldr.build.o -c cldr.c
cldr.c:31:10: fatal error: expat.h: No such file or directory
 #include <expat.h>
          ^~~~~~~~~

To fix this issue, build host-expat if needed

Fixes:
 - http://autobuild.buildroot.org/results/362cfb57e4a91a066493269d8078d931529ddf69

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/brltty/brltty.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
2.23.0
