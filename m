From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Nov 2010 22:02:40 +0100
Subject: [Buildroot] [git commit master 1/1] linux: strip installed modules
Message-ID: <20101124210355.4BF778DECF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8101c9a357d110d7b9055fc13e77f9775ea1b1e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The installed kernel modules should have useless build cruft stripped out
of them.  On my system, a default build went from a very unreasonable 30MB
to a normal 3MB (on disk) and from 14MB to 3MB when compressed due to the
info stored in the kernel modules alone.

[Peter: don't hardcode binutils strip specific options]
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index ef130de..cfaa316 100644
--- a/Makefile
+++ b/Makefile
@@ -418,6 +418,9 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 endif
 	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
+	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
+		xargs -r $(STRIPCMD) -R .comment -R .note -g --strip-unneeded
+
 	mkdir -p $(TARGET_DIR)/etc
 	# Mandatory configuration file and auxilliary cache directory
 	# for recent versions of ldconfig
-- 
1.7.2.2
