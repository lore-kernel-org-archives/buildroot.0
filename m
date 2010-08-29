From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Aug 2010 23:24:07 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile: fix
	source/source-check/external-deps with O=
Message-ID: <20100829212918.DBFA78A2D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=de846f6e043bf6fe13fb387cd92585a7a70913a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Will Wagner <will_wagner@carallon.com>.

Now that the .config is located in the output directory when O=<dir>
is used, we have to pass the O= option to make for
source/source-check/external-deps to get them to look in the right place
for the .config.

Fix it by introducing an EXTRAMAKEARGS variable and use it whenever we
call back into the toplevel Makefile.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 291badf..d37d81f 100644
--- a/Makefile
+++ b/Makefile
@@ -59,6 +59,8 @@ MAKEOVERRIDES =
 # To really make O go away, we have to override it.
 override O:=$(O)
 CONFIG_DIR:=$(O)
+# we need to pass O= everywhere we call back into the toplevel makefile
+EXTRAMAKEARGS = O=$(O)
 endif
 
 # $(shell find . -name *_defconfig |sed 's/.*\///')
@@ -432,11 +434,11 @@ endif
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 _source-check:
-	$(MAKE) SPIDER=--spider source
+	$(MAKE) $(EXTRAMAKEARGS) SPIDER=--spider source
 
 external-deps:
 	@$(MAKE) -Bs BR2_WGET=$(TOPDIR)/toolchain/wget-show-external-deps.sh \
-		SPIDER=--spider source
+		$(EXTRAMAKEARGS) SPIDER=--spider source
 
 show-targets:
 	@echo $(TARGETS)
@@ -558,7 +560,7 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf
 
 # check if download URLs are outdated
 source-check: allyesconfig
-	$(MAKE) _source-check
+	$(MAKE) $(EXTRAMAKEARGS) _source-check
 
 endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
@@ -585,11 +587,7 @@ flush:
 
 %_defconfig: $(TOPDIR)/configs/%_defconfig
 	cp $^ $(CONFIG_DIR)/.config
-ifeq ($(O),output)
-	@$(MAKE) oldconfig
-else
-	@$(MAKE) O=$(O) oldconfig
-endif
+	@$(MAKE) $(EXTRAMAKEARGS) oldconfig
 
 configured: dirs host-sed kernel-headers uclibc-config busybox-config linux26-config
 
-- 
1.7.1
