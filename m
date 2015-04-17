From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Apr 2015 18:10:33 +0200
Subject: [Buildroot] [PATCH] target-finalize: fix calling ldconfig
Message-ID: <1429287033-21225-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some systems (e.g. Fedora 20), the build breaks when parsing include
directives in our /etc/ld.so.conf, with error messages as thus:

    /sbin/ldconfig: need absolute file name for configuration file
    when using -r

So, enforce the path to the ld.so.conf file to point to our own, in the
target/ directory.

Reported-by: Al West <al.west@v-nova.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 70d6b4a..2e71c80 100644
--- a/Makefile
+++ b/Makefile
@@ -583,9 +583,11 @@ endif
 	mkdir -p $(TARGET_DIR)/var/cache/ldconfig
 	if [ -x "$(TARGET_CROSS)ldconfig" ]; \
 	then \
-		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR); \
+		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR) \
+					-f $(TARGET_DIR)/etc/ld.so.conf; \
 	else \
-		/sbin/ldconfig -r $(TARGET_DIR); \
+		/sbin/ldconfig -r $(TARGET_DIR) \
+			       -f $(TARGET_DIR)/etc/ld.so.conf; \
 	fi
 	( \
 		echo "NAME=Buildroot"; \
-- 
1.9.1
