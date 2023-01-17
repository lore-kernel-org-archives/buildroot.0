Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7C8C54E76
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 20:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64E158129B;
	Tue, 17 Jan 2023 20:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64E158129B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iGuYw-SjUMrV; Tue, 17 Jan 2023 20:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BABF9812A5;
	Tue, 17 Jan 2023 20:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BABF9812A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96B8F1BF292
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 20:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71D1360A81
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 20:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71D1360A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id txyre5YDUZ-X for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 20:57:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9AC860709
Received: from mail.xogium.me (mail.xogium.me [107.167.81.91])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9AC860709
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 20:57:27 +0000 (UTC)
Received: from ganimede.. (2a02-8428-324d-2201-5ccf-c338-3098-6959.rev.sfr.net
 [IPv6:2a02:8428:324d:2201:5ccf:c338:3098:6959])
 by mail.xogium.me (Postfix) with ESMTPSA id C5E16F40632;
 Tue, 17 Jan 2023 15:57:25 -0500 (EST)
From: Casey Reeves <casey@xogium.me>
To: buildroot@buildroot.org
Date: Tue, 17 Jan 2023 21:56:30 +0100
Message-Id: <20230117205630.221898-1-casey@xogium.me>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=xogium.me; s=xogium-mail; t=1673989046;
 bh=sobTXf8iyeGO0tdWhYki+zSxxeWdbdAu2Lgt+KbINWQ=;
 h=From:To:Cc:Subject:Date;
 b=cy+mObBGbhQOSYE/PFN2gYjEa01neJ4BFdA69oFHE2qsddwdX/upng43k5JxXiYXk
 6laE55xPfmAyugdnhPN6jrUZcsPHMM4bT3QnCKo/F2i6wTyECGsj9nr1DhZ37KOgER
 ITIWzrhrFzifUgx0wd+T9rpdV1+tDnmzmWpKxfK0jfbNPMX7yY3+Z4ZBa/XH9iegZd
 ktihiPVIam7Oy+nmJCycEjRpPMK+nqWKBcgAGP48jHSjvvMaJZUBW34pu07I+M3ZM3
 tphF+iRU8ydhI3/hqzqsTXyJ8OdhyyrNWgPAo8fWKPvN4SS5bZLbj4DbPMMeKky9EX
 6kgAJGqNf4Tlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=xogium.me header.i=@xogium.me
 header.a=rsa-sha256 header.s=xogium-mail header.b=cy+mObBG
Subject: [Buildroot] [PATCH] package/systemd: reenable utmp support
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

    This patch re-enables utmp support. This was originally disabled as it
    showed information about other users on the system, but this information
    can be found in other ways by a snoopy user (ps, journalctl, loginctl,
    top)...

    More importantly, this behaviour causes tools like uptime and
    who to falsely state 0 users are logged in. Revert it to fix those
    applications, as it can be very confusing and is not improving security.

    See commit 32f53bdfb482d0d78308e548c654898089b5c183.

Signed-off-by: Casey Reeves <casey@xogium.me>
---
 package/systemd/systemd.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b96873b73f..92b80dcf6e 100644
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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
