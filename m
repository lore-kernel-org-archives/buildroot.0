From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Jul 2009 10:45:17 +0000 (UTC)
Subject: [Buildroot] [Bug 473] memstat_0.5.tar.gz has install with -D and
 that fails "make" (last buildroot git)
In-Reply-To: <bug-473-163@https.bugs.busybox.net/>
References: <bug-473-163@https.bugs.busybox.net/>
Message-ID: <20090721104517.E060B77806@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=473





--- Comment #9 from Bernhard Reutner-Fischer <aldot@uclibc.org>  2009-07-21 10:45:17 UTC ---
Right, sorry.

diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
index 7220aee..a54509a 100644
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -21,15 +21,17 @@ $(MEMSTAT_DIR)/.configured: $(MEMSTAT_DIR)/.unpacked
        touch $@

 $(MEMSTAT_DIR)/memstat: $(MEMSTAT_DIR)/.configured
-       $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(@D)/memstat.c -o $@
+       $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+               $(CFLAGS_WHOLE_PROGRAM) $(@D)/memstat.c -o $@

 $(TARGET_DIR)/usr/bin/memstat: $(MEMSTAT_DIR)/memstat
        [ -e $(TARGET_DIR)/etc/memstat.conf ] || \
-               $(INSTALL) -m 0644 -D $(^D)/memstat.conf $(TARGET_DIR)/etc
+               $(INSTALL) -m 0644 -D $(^D)/memstat.conf \
+                       $(TARGET_DIR)/etc/memstat.conf
        $(INSTALL) -m 0755 -D $^ $@
        $(STRIPCMD) $(STRIP_STRIP_ALL) $@

-memstat: uclibc $(TARGET_DIR)/usr/bin/memstat
+memstat: $(TARGET_DIR)/usr/bin/memstat

 memstat-source: $(DL_DIR)/$(MEMSTAT_SOURCE)


Better?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
