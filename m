From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 20:40:26 +0100
Subject: [Buildroot] [git commit] Pass --static rather than -static in
	LDFLAGS when BR2_PREFER_STATIC_LIB
Message-ID: <20130114194106.3B6D69A11C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a4bd19f4a136930c611027942ce43124a81c5cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following changes LDFLAGS from -static to --static if building
with BR2_PREFER_STATIC_LIB so that various components actually build
statically.

Libtool interpret -static as linking statically with libraries that will not
be installed to the libdir; you have to pass it -all-static to force static
linking.  Or, pass --static, which libtool passes on blindly to gcc.  gcc
and (GNU) ld both interpret --static the same as -static (although this
isn't documented).

Signed-off-by: Andy Kennedy <andy.kennedy@adtran.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index cc8f320..038bd9c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -319,7 +319,7 @@ endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
-TARGET_LDFLAGS += -static
+TARGET_LDFLAGS += --static
 else
 SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
 endif
