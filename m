From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 18:56:12 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/busybox: fix
 target-finalize hook
Message-ID: <20200407180222.45CEC8D596@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e11ad9ebae5da853bf539e2c4885d50b7f87777d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

It was searching for CONFIG_ASH=y and CONFIG_HUSH=y at $(@D)/.config,
which does not contain the package build path at the target-finalize
step. Use $(BUSYBOX_DIR), instead.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9ab1d565eef8935694d12bff2cd33c64b7a97f0f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index dfcd9d392c..b9d82ed71e 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -318,11 +318,11 @@ endef
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
