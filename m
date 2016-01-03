From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jan 2016 21:46:07 +0100
Subject: [Buildroot] [git commit] Makefile: drop ldconfig handling
Message-ID: <20160103210633.5672E82302@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c4072348960d99d39f2cf47ff022f2d3711962e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ldconfig handling in the main Makefile is utterly broken, as it
calls the build machine ldconfig to generate the ld.so.cache of the
target. Unfortunately, the format of the ld.so.cache is architecture
specific, and therefore the build machine ldconfig cannot be used
as-is.

This patch therefore simply drops using ldconfig entirely, and removes
/etc/ld.so.conf.d/ from the target skeleton. The idea is that all
libraries that should be loaded by the dynamic linker must be
installed in paths where the dynamic linker searches them by default
(typically /lib or /usr/lib).

This might potentially break a few packages, but the only way to know
is to actually stop handling ldconfig.

In order to be notified of such cases, we add a check in
target-finalize to verify that there is no /etc/ld.so.conf file as
well as no /etc/ld.so.conf.d directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                                | 17 ++++-------------
 system/skeleton/etc/ld.so.conf.d/.empty |  0
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 80e94a2..0883175 100644
--- a/Makefile
+++ b/Makefile
@@ -604,20 +604,11 @@ endif
 # debugging symbols.
 	find $(TARGET_DIR)/lib -type f -name 'ld-*.so*' | \
 		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
-
+	test -f $(TARGET_DIR)/etc/ld.so.conf && \
+		{ echo "ERROR: we shouldn't have a /etc/ld.so.conf file"; exit 1; } || true
+	test -d $(TARGET_DIR)/etc/ld.so.conf.d && \
+		{ echo "ERROR: we shouldn't have a /etc/ld.so.conf.d directory"; exit 1; } || true
 	mkdir -p $(TARGET_DIR)/etc
-	# Mandatory configuration file and auxiliary cache directory
-	# for recent versions of ldconfig
-	touch $(TARGET_DIR)/etc/ld.so.conf
-	mkdir -p $(TARGET_DIR)/var/cache/ldconfig
-	if [ -x "$(TARGET_CROSS)ldconfig" ]; \
-	then \
-		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR) \
-					-f $(TARGET_DIR)/etc/ld.so.conf; \
-	else \
-		/sbin/ldconfig -r $(TARGET_DIR) \
-			       -f $(TARGET_DIR)/etc/ld.so.conf; \
-	fi
 	( \
 		echo "NAME=Buildroot"; \
 		echo "VERSION=$(BR2_VERSION_FULL)"; \
diff --git a/system/skeleton/etc/ld.so.conf.d/.empty b/system/skeleton/etc/ld.so.conf.d/.empty
deleted file mode 100644
index e69de29..0000000
