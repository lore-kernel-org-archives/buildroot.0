From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Mar 2018 10:48:19 +0200
Subject: [Buildroot] [git commit] Makefile: fix build break in sdk target
Message-ID: <20180326085211.9FB7883BFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6697f3bcdb4ecd6f311125670803933c8f5afb1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After commit 6729050f3a49dba42d2d881d31dbefd6b82b8dad nothing creates
$(HOST_DIR)/share/buildroot anymore, causing sdk to fail with:

 /bin/bash: .../output/host/share/buildroot/sdk-location: No such file or directory

Add creation of that directory to the "sdk" build steps itself.

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index a3a9d290d9..9e2402d7d9 100644
--- a/Makefile
+++ b/Makefile
@@ -574,6 +574,7 @@ sdk: world
 	$(TOPDIR)/support/scripts/fix-rpath host
 	$(TOPDIR)/support/scripts/fix-rpath staging
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
+	mkdir -p $(HOST_DIR)/share/buildroot
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
 
 # Populating the staging with the base directories is handled by the skeleton package
