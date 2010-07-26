From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Jul 2010 00:52:13 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile: fix ldconfig
	selection for internal toolchains
Message-ID: <20100726225418.8F69B834AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e49e2feda47fffb5e7a568a89d1f36615e75ce87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ed0d45fdd (Choose host/target ldconfig based on availability)
added a runtime check for a cross-ldconfig being available.
Unfortunately this checks runs too early (at package/Makefile.in parsing
time), so it always fails when using an internal toolchain as ldconfig
isn't built yet.

Fix it by moving the check to the only place it is used (target-finalize).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile            |    8 ++++++--
 package/Makefile.in |    6 ------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index f6e02bc..a864aae 100644
--- a/Makefile
+++ b/Makefile
@@ -406,8 +406,12 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 endif
 	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
-	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
-
+	if [ -x "$(TARGET_CROSS)ldconfig" ]; \
+	then \
+		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR) 2>/dev/null; \
+	else \
+		/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null; \
+	fi
 	mkdir -p $(TARGET_DIR)/etc
 	echo $(BR2_VERSION)$(shell $(TOPDIR)/scripts/setlocalversion) > \
 		$(TARGET_DIR)/etc/br-version
diff --git a/package/Makefile.in b/package/Makefile.in
index 1962466..fc53a1b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -127,12 +127,6 @@ TARGET_RANLIB   = $(TARGET_CROSS)ranlib
 TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
 TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 
-ifeq ($(shell $(SHELL) -c "command -v $(TARGET_CROSS)ldconfig"),)
-TARGET_LDCONFIG = /sbin/ldconfig
-else
-TARGET_LDCONFIG = $(TARGET_CROSS)ldconfig
-endif
-
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_DISCARD_ALL:=--discard-all
 STRIP_STRIP_UNNEEDED:=--strip-unneeded
-- 
1.7.1
