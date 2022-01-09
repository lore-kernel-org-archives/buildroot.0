Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9627C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 12:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87E46813B6;
	Sun,  9 Jan 2022 12:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ENwOBRqlpHnq; Sun,  9 Jan 2022 12:50:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF5FE8190B;
	Sun,  9 Jan 2022 12:50:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E78D31BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5D52813B6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NF4QIa6Brv0M for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 12:50:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ECAA8139E
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 12:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A248D82D32; Sun,  9 Jan 2022 12:44:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 13:48:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f9828e5cf2a58f3f9be78ff32e97601c31356aa
X-Git-Newrev: f7a928f883b7f4c783b966fd6832332976517885
X-Patchwork-Hint: ignore
Message-Id: <20220109124415.A248D82D32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: always enable
 systemd-tmpfilesd
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7a928f883b7f4c783b966fd6832332976517885
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this tool and service is pretty much expected to be enabled,
making this a certainty will enable future improvements.

The config variable BR2_PACKAGE_SYSTEMD_TMPFILES is still
availabe and always set.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dhcp/Config.in     | 1 -
 package/systemd/Config.in  | 9 +--------
 package/systemd/systemd.mk | 7 +------
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index e6e70908dd..515040c612 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -13,7 +13,6 @@ if BR2_PACKAGE_DHCP
 
 config BR2_PACKAGE_DHCP_SERVER
 	bool "dhcp server"
-	select BR2_PACKAGE_SYSTEMD_TMPFILES if BR2_PACKAGE_SYSTEMD
 	help
 	  DHCP server from the ISC DHCP distribution.
 
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 27a12bc947..833c89eaa2 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -501,15 +501,8 @@ config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 	  http://www.freedesktop.org/software/systemd/man/systemd-timesyncd.html
 
 config BR2_PACKAGE_SYSTEMD_TMPFILES
-	bool "enable tmpfiles support"
+	bool
 	default y
-	help
-	  systemd-tmpfiles creates, deletes, and cleans up volatile
-	  and temporary files and directories, based on the
-	  configuration file format and location specified in
-	  tmpfiles.d(5).
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
 
 config BR2_PACKAGE_SYSTEMD_USERDB
 	bool "enable userdb daemon"
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 540a4d64f9..7bf8018438 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -71,6 +71,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dsysvrcnd-path= \
 	-Dtelinit-path= \
 	-Dtests=false \
+	-Dtmpfiles=true \
 	-Dumount-path=/usr/bin/umount \
 	-Dutmp=false
 
@@ -315,12 +316,6 @@ else
 SYSTEMD_CONF_OPTS += -Dquotacheck=false
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
-SYSTEMD_CONF_OPTS += -Dtmpfiles=true
-else
-SYSTEMD_CONF_OPTS += -Dtmpfiles=false
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
 SYSTEMD_CONF_OPTS += -Dsysusers=true
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
