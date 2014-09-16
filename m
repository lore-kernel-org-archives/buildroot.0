From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 16 Sep 2014 22:37:00 +0300
Subject: [Buildroot] [PATCH] memtester: fix rebuild
Message-ID: <5c88a09e632de7ceb60d70831ea1e1ec2604dc34.1410896220.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do the edit of conf-* files only when 'cc' appears at the beginning of line,
i.e. the files has not been edited. Otherwise, the 'cc' part of the cross
toolchain gets expanded, leading to the following error on 'make
memtester-rebuild':

./compile: line 3: /home/baruch/git/buildroot/output/host/usr/bin/i686-pc-linux-gnu-g/home/baruch/git/buildroot/output/host/usr/bin/i686-pc-linux-gnu-gcc: No such file or directory
Makefile:82: recipe for target 'memtester.o' failed
make[1]: *** [memtester.o] Error 127

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/memtester/memtester.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 900c10d2b2f3..d12babca3074 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -12,7 +12,7 @@ MEMTESTER_LICENSE_FILES = COPYING
 MEMTESTER_TARGET_INSTALL_OPTS = INSTALLPATH=$(TARGET_DIR)/usr
 
 define MEMTESTER_BUILD_CMDS
-	$(SED) "s,cc,$(TARGET_CC)," $(@D)/conf-*
+	$(SED) "s,^cc,$(TARGET_CC)," $(@D)/conf-*
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
-- 
2.1.0
