From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:06:48 +0100
Subject: [Buildroot] [PATCH 24/40] shared-mime-info: run
	update-mime-database with correct env variables
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <253f240cc5804bde4fab685cefa1f4479e5c6586.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When installing shared-mime-info on the target, we runn
update-mime-database, which has been built previously by building and
installing shared-mime-info for the host. However, for
update-mime-database (host version) to run properly, we must pass the
appropriate LD_LIBRARY_PATH variable.

We re-use the existing $(HOST_MAKE_ENV) variable to pass all the
appropriate variables.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shared-mime-info/shared-mime-info.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index cfd3521..80b0ccc 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -29,6 +29,6 @@ SHARED_MIME_INFO_HOST_BINARY:=$(HOST_DIR)/usr/bin/update-mime-database
 
 # update the shared-mime-info database in the target
 $(SHARED_MIME_INFO_HOOK_POST_INSTALL): host-shared-mime-info
-	$(SHARED_MIME_INFO_HOST_BINARY) $(STAGING_DIR)/usr/share/mime
+	$(HOST_MAKE_ENV) $(SHARED_MIME_INFO_HOST_BINARY) $(STAGING_DIR)/usr/share/mime
 	$(INSTALL) -D $(STAGING_DIR)/usr/share/mime/mime.cache $(TARGET_DIR)/usr/share/mime/mime.cache
 	touch $@
-- 
1.6.3.3
