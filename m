From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 27 Nov 2010 18:55:24 -0500
Subject: [Buildroot] [PATCH] target-finalize: punt config scripts too
Message-ID: <1290902124-12102-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libpcap package installs a pcap-config into /usr/bin/ which makes it
into the final filesystem.  So have the top level punt all config scripts
to keep random packages from bleeding in.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 3798905..836a089 100644
--- a/Makefile
+++ b/Makefile
@@ -409,7 +409,7 @@ target-finalize:
 ifeq ($(BR2_HAVE_DEVFILES),y)
 	( scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
 else
-	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/aclocal
+	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/aclocal $(TARGET_DIR)/usr/bin/*-config
 	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 endif
-- 
1.7.3.2
