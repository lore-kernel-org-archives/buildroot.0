From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 09:06:39 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] linux: run depmod only if
 modules are enabled
Message-ID: <20200407070402.80FE68D485@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3b746a156d3299107e3307bccf1b5fb80e9b0f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

If the kernel configuration CONFIG_MODULES disabled, there's no
/lib/modules/<version> directory, causing this:

depmod: ERROR: could not open directory [...]/target/lib/modules/4.19.8: No such file or directory
depmod: FATAL: could not search modules: No such file or directory
Makefile:745: recipe for target 'target-finalize' failed

Fixes:

https://gitlab.com/buildroot.org/buildroot/-/jobs/483712831
https://gitlab.com/buildroot.org/buildroot/-/jobs/483712817
https://gitlab.com/buildroot.org/buildroot/-/jobs/483712814
https://gitlab.com/buildroot.org/buildroot/-/jobs/483712796
https://gitlab.com/buildroot.org/buildroot/-/jobs/483712729
https://gitlab.com/buildroot.org/buildroot/-/jobs/483712727
https://gitlab.com/buildroot.org/buildroot/-/jobs/483712698
https://gitlab.com/buildroot.org/buildroot/-/jobs/483712691
https://gitlab.com/buildroot.org/buildroot/-/jobs/483712660
https://gitlab.com/buildroot.org/buildroot/-/jobs/483712573
https://gitlab.com/buildroot.org/buildroot/-/jobs/483712574

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 43f41a7bf8e92ad88d1e59c48b27718c343ca548)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 5baca23ea2..097190dc0f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -531,7 +531,9 @@ endef
 # Run depmod in a target-finalize hook, to encompass modules installed by
 # packages.
 define LINUX_RUN_DEPMOD
-	$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
+	if grep -q "CONFIG_MODULES=y" $(LINUX_DIR)/.config; then \
+		$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED); \
+	fi
 endef
 LINUX_TARGET_FINALIZE_HOOKS += LINUX_RUN_DEPMOD
 
