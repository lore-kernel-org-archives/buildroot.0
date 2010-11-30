From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Nov 2010 16:28:41 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile: introduce KSTRIPCMD
	to strip kernel modules
Message-ID: <20101130153051.823D38CA41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0dc940cdeeaa1fae3510ff8a1b581f4ecf27b5c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When sstrip is selected it tries to strip kernel modules too.
Unfortunately this fails with a "unrecognized program segment header
size" error thus interrupting the build process.

We introduce a new $(KSTRIPCMD) strip command for this, being a regular
strip when sstrip is selected and an empty stub when not stripping.

At the same time get rid of the REMOVE_SECTION_* variables, as they are
only used once.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile            |    2 +-
 package/Makefile.in |    9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 8dbb026..008bdf3 100644
--- a/Makefile
+++ b/Makefile
@@ -421,7 +421,7 @@ endif
 	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so*' | \
 		xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
-		xargs -r $(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
+		xargs -r $(KSTRIPCMD) || true
 
 	mkdir -p $(TARGET_DIR)/etc
 	# Mandatory configuration file and auxilliary cache directory
diff --git a/package/Makefile.in b/package/Makefile.in
index a39dbbc..2ca8c31 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -146,23 +146,22 @@ ifeq ($(BR2_STRIP_strip),y)
 STRIP_DISCARD_ALL:=--discard-all
 STRIP_STRIP_UNNEEDED:=--strip-unneeded
 STRIP_STRIP_ALL:=--strip-all
-REMOVE_SECTION_COMMENT:=--remove-section=.comment
-REMOVE_SECTION_NOTE:=--remove-section=.note
 TARGET_STRIP=$(TARGET_CROSS)strip
-STRIPCMD=$(TARGET_CROSS)strip $(REMOVE_SECTION_COMMENT) $(REMOVE_SECTION_NOTE)
+STRIPCMD=$(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
+KSTRIPCMD=$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
 endif
 ifeq ($(BR2_STRIP_sstrip),y)
 STRIP_DISCARD_ALL:=
 STRIP_STRIP_UNNEEDED:=
 STRIP_STRIP_ALL:=
-REMOVE_SECTION_COMMENT:=
-REMOVE_SECTION_NOTE:=
 TARGET_STRIP=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
 STRIPCMD=$(TARGET_STRIP)
+KSTRIPCMD=$(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note --strip-unneeded
 endif
 ifeq ($(BR2_STRIP_none),y)
 TARGET_STRIP=true
 STRIPCMD=$(TARGET_STRIP)
+KSTRIPCMD=$(TARGET_STRIP)
 endif
 INSTALL:=$(shell which install || type -p install)
 FLEX:=$(shell which flex || type -p flex)
-- 
1.7.2.2
