From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Nov 2010 22:24:06 +0100
Subject: [Buildroot] [git commit master 1/1] target-finalize: do not strip
	libthread_db.so
Message-ID: <20101124212443.C4DAC8DBB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c98bc88e3296222a20e59cfb7b9f3ec5aee3be1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For proper threading debug support, the libthread_db.so library cannot
be stripped on the target.  This is because the target gdbserver will
also load up this library at runtime and poke around its symbols.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 86aea91..22ae1d0 100644
--- a/Makefile
+++ b/Makefile
@@ -418,7 +418,8 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
 endif
-	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
+	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db.so*' | \
+		xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
 		xargs -r $(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
 
-- 
1.7.2.2
