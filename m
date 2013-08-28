From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Aug 2013 16:20:12 +0200
Subject: [Buildroot] [git commit] redis: fix build with ccache enabled
Message-ID: <20130828142015.4255F9B5D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5088380d3aa475fe2457fc12a47353dd66c4c19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some parts of redis fail to build when ccache is enabled, due to one of our
own patches. The construct
    make CC=$(CC) target1 target2
would result in
    make CC=ccache <tuple>-gcc target1 target2

and here <tuple>-gcc would be treated as a target and the compiler used
would be just 'ccache'.

Reported-by: Johan Sagaert <sagaert.johan@skynet.be>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/redis/redis-001-uclibc.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/redis/redis-001-uclibc.patch b/package/redis/redis-001-uclibc.patch
index 8762ca2..01657d0 100644
--- a/package/redis/redis-001-uclibc.patch
+++ b/package/redis/redis-001-uclibc.patch
@@ -39,7 +39,7 @@ diff -ur old/src/Makefile new/src/Makefile
  	echo PREV_FINAL_CFLAGS=$(FINAL_CFLAGS) >> .make-settings
  	echo PREV_FINAL_LDFLAGS=$(FINAL_LDFLAGS) >> .make-settings
 -	-(cd ../deps && $(MAKE) $(DEPENDENCY_TARGETS))
-+	-(cd ../deps && $(MAKE) CC=$(CC) $(DEPENDENCY_TARGETS))
++	-(cd ../deps && $(MAKE) CC="$(CC)" $(DEPENDENCY_TARGETS))
  
  .PHONY: persist-settings
  
