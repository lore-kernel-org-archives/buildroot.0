From: unixmania at gmail.com <unixmania@gmail.com>
Date: Tue, 24 Mar 2020 21:30:53 -0300
Subject: [Buildroot] [PATCH] package/busybox: fix target-finalize hook
Message-ID: <20200325003053.6305-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

It was searching for CONFIG_ASH=y and CONFIG_HUSH=y at $(@D)/.config,
which does not contain the package build path at the target-finalize
step. Use $(BUSYBOX_DIR), instead.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/busybox/busybox.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 767499b0c0..0da73b4eab 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -329,11 +329,11 @@ endef
 # Add /bin/{a,hu}sh to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
 define BUSYBOX_INSTALL_ADD_TO_SHELLS
-	if grep -q CONFIG_ASH=y $(@D)/.config; then \
+	if grep -q CONFIG_ASH=y $(BUSYBOX_DIR)/.config; then \
 		grep -qsE '^/bin/ash$$' $(TARGET_DIR)/etc/shells \
 		|| echo "/bin/ash" >> $(TARGET_DIR)/etc/shells; \
 	fi
-	if grep -q CONFIG_HUSH=y $(@D)/.config; then \
+	if grep -q CONFIG_HUSH=y $(BUSYBOX_DIR)/.config; then \
 		grep -qsE '^/bin/hush$$' $(TARGET_DIR)/etc/shells \
 		|| echo "/bin/hush" >> $(TARGET_DIR)/etc/shells; \
 	fi
-- 
2.18.2
