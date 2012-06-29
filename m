From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jun 2012 15:09:10 +0200
Subject: [Buildroot] [git commit] ramspeed: use provided linker flags as well
Message-ID: <20120629144806.098EE8EE23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e6ec6e319f87c3f3e97d314ea88a181096c451e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ramspeed/Makefile    |    6 +++---
 package/ramspeed/ramspeed.mk |    3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/ramspeed/Makefile b/package/ramspeed/Makefile
index acb8cfd..f4a4de6 100644
--- a/package/ramspeed/Makefile
+++ b/package/ramspeed/Makefile
@@ -2,13 +2,13 @@
 all: generic
 
 generic: ramspeed.c fltmem.c fltmark.c intmem.c intmark.c
-	$(CC) $(CFLAGS) $^ -o ramspeed
+	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o ramspeed
 
 i386: ramspeed.c i386/*.s i386/cpuinfo/*.s
-	$(CC) $(CFLAGS) -DI386_ASM $^ -o ramspeed
+	$(CC) $(CFLAGS) -DI386_ASM $(LDFLAGS) $^ -o ramspeed
 
 x86_64: ramspeed.c amd64/*.s
-	$(CC) $(CFLAGS) -DAMD64_ASM $^ -o ramspeed
+	$(CC) $(CFLAGS) -DAMD64_ASM $(LDFLAGS) $^ -o ramspeed
 
 clean:
 	rm -f *.o ramspeed
diff --git a/package/ramspeed/ramspeed.mk b/package/ramspeed/ramspeed.mk
index 9ac21ad..478c2fb 100644
--- a/package/ramspeed/ramspeed.mk
+++ b/package/ramspeed/ramspeed.mk
@@ -10,8 +10,7 @@ RAMSPEED_ARCH = $(if $(BR2_i386),i386)$(if $(BR2_x86_64),x86_64)
 
 define RAMSPEED_BUILD_CMDS
 	cp -f package/ramspeed/Makefile $(@D)
-	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
-		make -C $(@D) $(RAMSPEED_ARCH)
+	$(TARGET_CONFIGURE_OPTS) make -C $(@D) $(RAMSPEED_ARCH)
 endef
 
 define RAMSPEED_INSTALL_TARGET_CMDS
