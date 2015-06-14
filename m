From: Martin Bark <martin@barkynet.com>
Date: Sun, 14 Jun 2015 17:12:55 +0100
Subject: [Buildroot] [PATCH 3/4] package/nodejs: Add global node_module to
	the PATH
In-Reply-To: <1434298376-31893-1-git-send-email-martin@barkynet.com>
References: <1434298376-31893-1-git-send-email-martin@barkynet.com>
Message-ID: <1434298376-31893-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds /usr/lib/node_modules/.bin to PATH so that global
node_modules are accessible from the command line

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 59e03b0..5d95f77 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -111,6 +111,11 @@ define NODEJS_INSTALL_MODULES
 		$(HOST_DIR)/usr/bin/npm install \
 		$(NODEJS_MODULES_LIST) \
 	)
+
+	# Add global node_modules to PATH
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/profile.d
+	printf "export PATH=\x24PATH:/usr/lib/node_modules/.bin\n" \
+		>$(TARGET_DIR)/etc/profile.d/node_modules.sh
 endef
 endif
 
-- 
2.1.4
