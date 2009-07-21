From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 21 Jul 2009 12:47:38 +0200
Subject: [Buildroot] [git commit] Fix memstat's install
Message-ID: <20090721104808.7013677806@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e2bdce02c45edbb65bffb9a31a423de9ccbff3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 package/memstat/memstat.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
index 7220aee..a54509a 100644
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -21,15 +21,17 @@ $(MEMSTAT_DIR)/.configured: $(MEMSTAT_DIR)/.unpacked
 	touch $@
 
 $(MEMSTAT_DIR)/memstat: $(MEMSTAT_DIR)/.configured
-	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(@D)/memstat.c -o $@
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		$(CFLAGS_WHOLE_PROGRAM) $(@D)/memstat.c -o $@
 
 $(TARGET_DIR)/usr/bin/memstat: $(MEMSTAT_DIR)/memstat
 	[ -e $(TARGET_DIR)/etc/memstat.conf ] || \
-		$(INSTALL) -m 0644 -D $(^D)/memstat.conf $(TARGET_DIR)/etc
+		$(INSTALL) -m 0644 -D $(^D)/memstat.conf \
+			$(TARGET_DIR)/etc/memstat.conf
 	$(INSTALL) -m 0755 -D $^ $@
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
-memstat: uclibc $(TARGET_DIR)/usr/bin/memstat
+memstat: $(TARGET_DIR)/usr/bin/memstat
 
 memstat-source: $(DL_DIR)/$(MEMSTAT_SOURCE)
 
-- 
1.6.3.3
