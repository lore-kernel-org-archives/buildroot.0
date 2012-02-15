From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 15 Feb 2012 23:22:23 +0100
Subject: [Buildroot] [git commit] libecore: tweak makekeys workaround for
	make 3.82
Message-ID: <20120215222628.08D9690AAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6628bca393f9f01c9b320f2eb60db51519ae54d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems that make 3.82 gets confused and considers makekeys
out of date when there isn't a makekeys.o, so ensure that we
create both makekeys and makekeys.o before building.

Also move the workaround to the extract step so we can build using
make's default rules rather than explicitly calling gcc.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libecore/libecore.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index 2b668ab..db14356 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -76,11 +76,10 @@ LIBECORE_DEPENDENCIES += libxcb xlib_libX11 xcb-util
 # teach it about CC_FOR_BUILD, but for now simply build makekeys by
 # hand in advance
 define LIBECORE_BUILD_MAKEKEYS_FOR_HOST
-	cd $(@D)/src/util && $(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
-		-o makekeys makekeys.c
+	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/src/util makekeys.o makekeys
 endef
 
-LIBECORE_POST_CONFIGURE_HOOKS += LIBECORE_BUILD_MAKEKEYS_FOR_HOST
+LIBECORE_POST_EXTRACT_HOOKS += LIBECORE_BUILD_MAKEKEYS_FOR_HOST
 else
 LIBECORE_CONF_OPT += --disable-ecore-x-xcb
 endif
