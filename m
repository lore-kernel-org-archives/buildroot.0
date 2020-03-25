From: unixmania at gmail.com <unixmania@gmail.com>
Date: Tue, 24 Mar 2020 21:21:54 -0300
Subject: [Buildroot] [PATCH] linux: run depmod only if modules are enabled
Message-ID: <20200325002154.5882-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

If the kernel configuration CONFIG_MODULES disabled, there's no
/lib/modules/<version> directory, causing this:

depmod: ERROR: could not open directory [...]/target/lib/modules/4.19.8: No such file or directory
depmod: FATAL: could not search modules: No such file or directory
Makefile:745: recipe for target 'target-finalize' failed

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 linux/linux.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 2e3ea52053..b2ceeecafb 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -539,7 +539,9 @@ endef
 # Run depmod in a target-finalize hook, to encompass modules installed by
 # packages.
 define LINUX_RUN_DEPMOD
-	$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
+	if grep -q "CONFIG_MODULES=y" $(LINUX_DIR)/.config; then \
+		$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED); \
+	fi
 endef
 LINUX_TARGET_FINALIZE_HOOKS += LINUX_RUN_DEPMOD
 
-- 
2.18.2
