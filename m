Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A9AC636CD
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FFC841903;
	Mon, 30 Jan 2023 21:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FFC841903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMZUyjJ7B3Bl; Mon, 30 Jan 2023 21:57:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3374F418E1;
	Mon, 30 Jan 2023 21:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3374F418E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93F3E1BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E22C418B0
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E22C418B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EaYIzpo3dT-x for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:57:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E4A1418AA
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E4A1418AA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 581A882660; Mon, 30 Jan 2023 21:57:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 22:56:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7115ab39189a6c660745267d8bf0bf41cf8b3db7
X-Git-Newrev: 7316a0c2c22c8207edff531544e6eb0d6326b45c
X-Patchwork-Hint: ignore
Message-Id: <20230130215716.581A882660@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ulogd: dbi needs threads
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7316a0c2c22c8207edff531544e6eb0d6326b45c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3b3dbd0183265c3f7da49b0b331688fb7573383f forgot to disable dbi
without threads

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ulogd/ulogd.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 561429599c..7d4a1fde4d 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -41,7 +41,11 @@ else
 ULOGD_CONF_OPTS += --disable-sqlite3
 endif
 else
-ULOGD_CONF_OPTS += --disable-mysql --disable-pgsql --disable-sqlite3
+ULOGD_CONF_OPTS += \
+	--disable-dbi \
+	--disable-mysql \
+	--disable-pgsql \
+	--disable-sqlite3
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
