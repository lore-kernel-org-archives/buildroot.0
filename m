From: Martin Bark <martin@barkynet.com>
Date: Thu,  2 Jul 2015 10:43:25 +0100
Subject: [Buildroot] [v4 2/4] package/nodejs: symlink
	/usr/lib/node_modules/.bin/* to /usr/bin
In-Reply-To: <1435830207-16664-1-git-send-email-martin@barkynet.com>
References: <1435830207-16664-1-git-send-email-martin@barkynet.com>
Message-ID: <1435830207-16664-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch symlinks all executables in /usr/lib/node_modules/.bin
to /usr/bin so that node.js modules installed using
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL are accessible from the command line.

Signed-off-by: Martin Bark <martin@barkynet.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Chnages v3 -> v4
 - Added Reviewed-by: Yann E. MORIN

Changes v2 -> v3
 - Create symlinks instead of setting PATH (Suggested by Yann E. MORIN)

Changes v1 -> v2
 - Improved commit message
---
 package/nodejs/nodejs.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 59e03b0..0b3f8a5 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -111,6 +111,14 @@ define NODEJS_INSTALL_MODULES
 		$(HOST_DIR)/usr/bin/npm install \
 		$(NODEJS_MODULES_LIST) \
 	)
+
+	# Symlink all executables in $(TARGET_DIR)/usr/lib/node_modules/.bin to
+	# $(TARGET_DIR)/usr/bin so they are accessible from the command line
+	cd $(TARGET_DIR)/usr/bin; \
+	for f in ../../usr/lib/node_modules/.bin/*; do \
+		[ -f "$${f}" -a -x "$${f}" ] || continue; \
+		ln -sf "$${f}" "$${f##*/}" || exit 1; \
+	done
 endef
 endif
 
-- 
2.1.4
