From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2014 08:21:50 +0100
Subject: [Buildroot] [git commit] systemd: fix sed line in "sanitize path in
	units" hook
Message-ID: <20140228133413.8A04E9BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc075564085ed1ebaf19847bd6ea078ff8b992d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The expanded SED variable already contains -e, so the extra -e was being
interpreted as the sed command and causing sed to fail.

Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9086045..36ef704 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -103,7 +103,7 @@ endef
 
 define SYSTEMD_SANITIZE_PATH_IN_UNITS
 	find $(TARGET_DIR)/lib/systemd/system -name '*.service' \
-		-exec $(SED) -e 's,$(HOST_DIR),,g' {} \;
+		-exec $(SED) 's,$(HOST_DIR),,g' {} \;
 endef
 
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
