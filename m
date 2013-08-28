From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 28 Aug 2013 15:40:25 +0200
Subject: [Buildroot] [PATCH] redis: fix build with ccache enabled
Message-ID: <c0967e3e463dd286cb2b.1377697225@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some parts of redis fail to build when ccache is enabled, due to one of our
own patches. The construct
    make CC=$(CC) target1 target2
would result in
    make CC=ccache <tuple>-gcc target1 target2

and here <tuple>-gcc would be treated as a target and the compiler used
would be just 'ccache'.

Reported-by: Johan Sagaert <sagaert.johan@skynet.be>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
I think this should still be applied for 2013.08.

 package/redis/redis-001-uclibc.patch |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/redis/redis-001-uclibc.patch b/package/redis/redis-001-uclibc.patch
--- a/package/redis/redis-001-uclibc.patch
+++ b/package/redis/redis-001-uclibc.patch
@@ -39,7 +39,7 @@ diff -ur old/src/Makefile new/src/Makefi
  	echo PREV_FINAL_CFLAGS=$(FINAL_CFLAGS) >> .make-settings
  	echo PREV_FINAL_LDFLAGS=$(FINAL_LDFLAGS) >> .make-settings
 -	-(cd ../deps && $(MAKE) $(DEPENDENCY_TARGETS))
-+	-(cd ../deps && $(MAKE) CC=$(CC) $(DEPENDENCY_TARGETS))
++	-(cd ../deps && $(MAKE) CC="$(CC)" $(DEPENDENCY_TARGETS))
  
  .PHONY: persist-settings
  
