From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 22:36:49 +0200
Subject: [Buildroot] [git commit] package/mender: Fix incorrectly named
 service file
Message-ID: <20200828203330.76C467FA1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db751e2c89be128c858d466d5cc689aa16704f6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many of the mender CLI commands use systemctl commands to get information about
the daemon, such as the PID (IE: systemctl show -p MainPID mender-client).
As seen above, these commands expect the service file to be named
"mender-client" instead of "mender."

As such, in the current state, running a forced update check in the CLI will
result in the following error:
failed to force updateCheck: could not find the PID of the mender daemon.

Changing the name of mender.service to mender-client.service fixes the issue.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/{mender.service => mender-client.service} | 0
 package/mender/mender.mk                                 | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender/mender.service b/package/mender/mender-client.service
similarity index 100%
rename from package/mender/mender.service
rename to package/mender/mender-client.service
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 325141787e..ca24b853b5 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -77,8 +77,8 @@ endef
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
 
 define MENDER_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/mender.service
+	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender-client.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mender-client.service
 endef
 
 define MENDER_INSTALL_INIT_SYSV
