From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 17 Nov 2010 18:55:43 -0500
Subject: [Buildroot] [PATCH v2] linux: strip installed modules
In-Reply-To: <87oc9nad27.fsf@macbook.be.48ers.dk>
References: <87oc9nad27.fsf@macbook.be.48ers.dk>
Message-ID: <1290038143-17595-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The installed kernel modules should have useless build cruft stripped out
of them.  On my system, a default build went from a very unreasonable 30MB
to a normal 3MB (on disk) and from 14MB to 3MB when compressed due to the
info stored in the kernel modules alone.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- move to toplevel finalize target

 Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index e569a94..0396e37 100644
--- a/Makefile
+++ b/Makefile
@@ -403,6 +403,9 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
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
1.7.3.2
