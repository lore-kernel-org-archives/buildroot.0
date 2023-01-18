Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F00C32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 19:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B96F06107F;
	Wed, 18 Jan 2023 19:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B96F06107F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZxETLil6jq9j; Wed, 18 Jan 2023 19:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0246661064;
	Wed, 18 Jan 2023 19:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0246661064
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 435D01BF429
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 19:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A9694185B
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 19:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A9694185B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 92yRMRH7px0b for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 19:50:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6478A4187D
Received: from mail.xogium.me (mail.xogium.me [107.167.81.91])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6478A4187D
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 19:50:10 +0000 (UTC)
Received: from ganimede.. (2a02-8428-324d-2201-5ccf-c338-3098-6959.rev.sfr.net
 [IPv6:2a02:8428:324d:2201:5ccf:c338:3098:6959])
 by mail.xogium.me (Postfix) with ESMTPSA id CBB4FF40214;
 Wed, 18 Jan 2023 14:50:07 -0500 (EST)
From: Casey Reeves <casey@xogium.me>
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 20:49:25 +0100
Message-Id: <20230118194925.254654-1-casey@xogium.me>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117205630.221898-1-casey@xogium.me>
References: <20230117205630.221898-1-casey@xogium.me>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=xogium.me; s=xogium-mail; t=1674071408;
 bh=VtMzuhNWt/YyEB07I/RlFoW/qH7kEPqw0tvrU/CiEzg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=QhIOgq3J6IIs+FBpIRDrYtxvUOnYNyv4xXJA0/81B5l3q9+18HHc4gOM8oOqsZ05X
 TuYwokmNcPUw4L6OXcCYa0t1qEKwHMeBBqiHirIKTQvhsUoend0239EmamaaWp4+m/
 CqGzS7csIrEYozTesRiVLapixjXlTt69Fa9QAxseotQFdJsy59lzDde802arHUxDpJ
 vwxGGCz7WYEc02hbDeVGee64jxKkvE+aLRSvEs0+S+25en35AiJm3uZjcEBrnSrw0B
 V5Klnmu6CnCJ8vjKzjoWnEOjVUPeef5bpzDcV4WtaYPl7/euSLs9n2ubAgFxCQq1N6
 +ZAdEu32zgvsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=xogium.me header.i=@xogium.me
 header.a=rsa-sha256 header.s=xogium-mail header.b=QhIOgq3J
Subject: [Buildroot] [PATCH v2] package/systemd: reenable utmp support
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch provides a way to enable utmp support when using systemd,
with it disabled by default, as some security concerns may apply. Still,
there are cases where having utmp is desirable, even though it is rare,
so let's make this configurable.

See commit 32f53bdfb482d0d78308e548c654898089b5c183.

Signed-off-by: Casey Reeves <casey@xogium.me>

---
Changes v1 -> v2:
- Make this a configurable option rather than hardcode it to forcefully
disabled or enabled
---
 package/systemd/Config.in  | 16 ++++++++++++++++
 package/systemd/systemd.mk |  9 +++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 45a9e2d644..daa72b65b1 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -518,6 +518,22 @@ config BR2_PACKAGE_SYSTEMD_USERDB
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-userdbd.service.html
 
+config BR2_PACKAGE_SYSTEMD_UTMP
+	bool "enable utmp support"
+	help
+	  When this feature is selected, systemd will manage the
+	  support of utmp.
+
+	  Utmp keeps track of what users do on the system (where they
+	  logged from, on which terminal, ...) along with a general
+	  status of the system (list of reboots, current uptime, current
+	  number of users logged in).
+
+	  You should only enable this if your system requires actual
+	  users to log in.
+
+	  https://man7.org/linux/man-pages/man5/utmp.5.html
+
 config BR2_PACKAGE_SYSTEMD_VCONSOLE
 	bool "enable vconsole tool"
 	default y
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b96873b73f..f191542866 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -87,8 +87,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dtelinit-path= \
 	-Dtests=false \
 	-Dtmpfiles=true \
-	-Dumount-path=/usr/bin/umount \
-	-Dutmp=false
+	-Dumount-path=/usr/bin/umount
 
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_OPTIMIZE_FAST),y)
@@ -331,6 +330,12 @@ else
 SYSTEMD_CONF_OPTS += -Dbinfmt=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_UTMP),y)
+SYSTEMD_CONF_OPTS += -Dutmp=true
+else
+SYSTEMD_CONF_OPTS += -Dutmp=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_VCONSOLE),y)
 SYSTEMD_CONF_OPTS += -Dvconsole=true
 else
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
