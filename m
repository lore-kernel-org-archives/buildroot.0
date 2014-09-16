From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 22:09:57 +0200
Subject: [Buildroot] [git commit] memtester: fix rebuild
Message-ID: <20140916201651.A43419D6B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=badd4036c57d0275ab25b266a48efbe870abc495
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do the edit of conf-* files only when 'cc' appears at the beginning of line,
i.e. the files has not been edited. Otherwise, the 'cc' part of the cross
toolchain gets expanded, leading to the following error on 'make
memtester-rebuild':

./compile: line 3: /home/baruch/git/buildroot/output/host/usr/bin/i686-pc-linux-gnu-g/home/baruch/git/buildroot/output/host/usr/bin/i686-pc-linux-gnu-gcc: No such file or directory
Makefile:82: recipe for target 'memtester.o' failed
make[1]: *** [memtester.o] Error 127

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memtester/memtester.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 900c10d..d12babc 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -12,7 +12,7 @@ MEMTESTER_LICENSE_FILES = COPYING
 MEMTESTER_TARGET_INSTALL_OPTS = INSTALLPATH=$(TARGET_DIR)/usr
 
 define MEMTESTER_BUILD_CMDS
-	$(SED) "s,cc,$(TARGET_CC)," $(@D)/conf-*
+	$(SED) "s,^cc,$(TARGET_CC)," $(@D)/conf-*
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
