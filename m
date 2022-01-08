Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C875C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCA2B8138E;
	Sat,  8 Jan 2022 18:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FMuvFYSvyz1v; Sat,  8 Jan 2022 18:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21FC781378;
	Sat,  8 Jan 2022 18:57:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87E051BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 827BD400E3
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmnasykWikm6 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:57:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82110400C1
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:57:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A359082693; Sat,  8 Jan 2022 18:51:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 19:33:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e070d606675ce3750496128b50227673d5a47944
X-Git-Newrev: be256690788fefad93ab00f0233ddb9414d29727
X-Patchwork-Hint: ignore
Message-Id: <20220108185105.A359082693@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: pre-create directories
 for services
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

commit: https://git.buildroot.net/buildroot/commit/?id=be256690788fefad93ab00f0233ddb9414d29727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

various services need directories in /var when they are started,
and create them if necessary. Creating those before, allows
those services to start even if /var is read-only.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 404943c45c..17bb922f51 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -353,12 +353,14 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
 SYSTEMD_CONF_OPTS += -Dlogind=true
+SYSTEMD_LOGIND_PERMISSIONS = /var/lib/systemd/linger d 755 0 0 - - - - -
 else
 SYSTEMD_CONF_OPTS += -Dlogind=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_MACHINED),y)
 SYSTEMD_CONF_OPTS += -Dmachined=true -Dnss-mymachines=true
+SYSTEMD_MACHINED_PERMISSIONS = /var/lib/machines d 700 0 0 - - - - -
 else
 SYSTEMD_CONF_OPTS += -Dmachined=false -Dnss-mymachines=false
 endif
@@ -372,6 +374,7 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_HOMED),y)
 SYSTEMD_CONF_OPTS += -Dhomed=true
 SYSTEMD_DEPENDENCIES += cryptsetup openssl
+SYSTEMD_HOMED_PERMISSIONS = /var/lib/systemd/home d 755 0 0 - - - - -
 else
 SYSTEMD_CONF_OPTS += -Dhomed=false
 endif
@@ -416,12 +419,14 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
 SYSTEMD_CONF_OPTS += -Dcoredump=true
 SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * - - - systemd core dump processing
+SYSTEMD_HOMED_PERMISSIONS = /var/lib/systemd/coredump d 755 0 0 - - - - -
 else
 SYSTEMD_CONF_OPTS += -Dcoredump=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_PSTORE),y)
 SYSTEMD_CONF_OPTS += -Dpstore=true
+SYSTEMD_PSTORE_PERMISSIONS = /var/lib/systemd/pstore d 755 0 0 - - - - -
 else
 SYSTEMD_CONF_OPTS += -Dpstore=false
 endif
@@ -502,6 +507,7 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPTS += -Dtimesyncd=true
 SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - systemd Time Synchronization
+SYSTEMD_TIMESYNCD_PERMISSIONS = /var/lib/systemd/timesync d 755 systemd-timesync systemd-timesync - - - - -
 else
 SYSTEMD_CONF_OPTS += -Dtimesyncd=false
 endif
@@ -565,6 +571,19 @@ define SYSTEMD_INSTALL_IMAGES_CMDS
 	$(SYSTEMD_INSTALL_BOOT_FILES)
 endef
 
+define SYSTEMD_PERMISSIONS
+	/var/spool d 755 0 0 - - - - -
+	/var/lib d 755 0 0 - - - - -
+	/var/lib/private d 700 0 0 - - - - -
+	/var/log/private d 700 0 0 - - - - -
+	/var/cache/private d 700 0 0 - - - - -
+	$(SYSTEMD_LOGIND_PERMISSIONS)
+	$(SYSTEMD_MACHINED_PERMISSIONS)
+	$(SYSTEMD_HOMED_PERMISSIONS)
+	$(SYSTEMD_PSTORE_PERMISSIONS)
+	$(SYSTEMD_TIMESYNCD_PERMISSIONS)
+endef
+
 define SYSTEMD_USERS
 	# udev user groups
 	# systemd user groups
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
