Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C75C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 11:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7D744016F;
	Sat,  8 Jan 2022 11:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id azkYC4-91bmP; Sat,  8 Jan 2022 11:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1AA4404DD;
	Sat,  8 Jan 2022 11:04:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F2761BF34E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 11:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EABB44016F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 11:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hm-vEZizJHQD for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 11:04:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C77304012E
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 11:04:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AE3C881323; Sat,  8 Jan 2022 10:58:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 12:04:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd448234d284dc42730bef0ffa1e6d9b8e5b0096
X-Git-Newrev: 726209fc7999986fa414d629ff60d1bc76c63a2c
X-Patchwork-Hint: ignore
Message-Id: <20220108105818.AE3C881323@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/scons: bring back Python
 interpreter call in SCONS variable
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=726209fc7999986fa414d629ff60d1bc76c63a2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Back in commit
f72be49830404fb69480a9e5db4381dfcc6dc8ec ("package/scons: remove
python from SCONS"), we changed the SCONS variable to not explicitly
invoke the Python interpreter, because some scons-based packages used
python2, some python3.

Now that the 3 remaining packages using scons (gpsd, mongodb and
benejson) all use python3, we can bring back the python3 interpreter
call into the SCONS variable, and slightly simplify those packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/benejson/benejson.mk | 2 +-
 package/gpsd/gpsd.mk         | 6 +++---
 package/mongodb/mongodb.mk   | 4 ++--
 package/scons/scons.mk       | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/benejson/benejson.mk b/package/benejson/benejson.mk
index 5bb57d028d..f6f936ec71 100644
--- a/package/benejson/benejson.mk
+++ b/package/benejson/benejson.mk
@@ -41,7 +41,7 @@ endif # Shared enabled
 define BENEJSON_BUILD_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
-		$(HOST_DIR)/bin/python3 $(SCONS) $(BENEJSON_SCONS_TARGETS))
+		$(SCONS) $(BENEJSON_SCONS_TARGETS))
 endef
 
 define BENEJSON_INSTALL_STAGING_CMDS
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index ff924c49e0..61391f0e9b 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -211,7 +211,7 @@ GPSD_SCONS_ENV += \
 define GPSD_BUILD_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
-		$(HOST_DIR)/bin/python3 $(SCONS) \
+		$(SCONS) \
 		$(GPSD_SCONS_OPTS))
 endef
 
@@ -219,7 +219,7 @@ define GPSD_INSTALL_TARGET_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
 		DESTDIR=$(TARGET_DIR) \
-		$(HOST_DIR)/bin/python3 $(SCONS) \
+		$(SCONS) \
 		$(GPSD_SCONS_OPTS) \
 		$(if $(BR2_PACKAGE_HAS_UDEV),udev-install,install))
 endef
@@ -241,7 +241,7 @@ define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
 		DESTDIR=$(STAGING_DIR) \
-		$(HOST_DIR)/bin/python3 $(SCONS) \
+		$(SCONS) \
 		$(GPSD_SCONS_OPTS) \
 		install)
 endef
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index ede03e44d6..c33c3c2eb7 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -86,7 +86,7 @@ endif
 
 define MONGODB_BUILD_CMDS
 	(cd $(@D); \
-		$(HOST_DIR)/bin/python3 $(SCONS) \
+		$(SCONS) \
 		$(MONGODB_SCONS_ENV) \
 		$(MONGODB_SCONS_OPTS) \
 		$(MONGODB_SCONS_TARGETS))
@@ -94,7 +94,7 @@ endef
 
 define MONGODB_INSTALL_TARGET_CMDS
 	(cd $(@D); \
-		$(HOST_DIR)/bin/python3 $(SCONS) \
+		$(SCONS) \
 		$(MONGODB_SCONS_ENV) \
 		$(MONGODB_SCONS_OPTS) \
 		--prefix=$(TARGET_DIR)/usr \
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index a95fa7fd69..bc5d2a1ef9 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -18,4 +18,4 @@ HOST_SCONS_INSTALL_OPTS = \
 $(eval $(host-python-package))
 
 # variables used by other packages
-SCONS = $(HOST_DIR)/bin/scons $(if $(QUIET),-s)
+SCONS = $(HOST_DIR)/bin/python3 $(HOST_DIR)/bin/scons $(if $(QUIET),-s)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
