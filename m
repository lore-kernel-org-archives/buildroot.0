From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Nov 2010 22:24:06 +0100
Subject: [Buildroot] [git commit master 1/1] auto remove empty /usr/share dir
Message-ID: <20101124212443.93BA58DBB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=68ad6d4ee07aa8b800a0ec3f25f61d0177c43d40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Often times, the only reason /usr/share exists is because of documentation
installed into it.  So once we're done cleaning the docs, attempt to rmdir
/usr/share.  If it's empty, things will work out nicely.

[Peter: use make infrastructure to ignore errors rather than shell]
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index a53ef89..86aea91 100644
--- a/Makefile
+++ b/Makefile
@@ -416,6 +416,7 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
 	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
+	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
 endif
 	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
-- 
1.7.2.2
