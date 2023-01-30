Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55506C636CD
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0057840C47;
	Mon, 30 Jan 2023 21:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0057840C47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nEXMNXQNTnSt; Mon, 30 Jan 2023 21:57:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3074740C48;
	Mon, 30 Jan 2023 21:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3074740C48
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BAE91BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35EEA40C47
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35EEA40C47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJhqpskTpkhF for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:57:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 742BD40C3D
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 742BD40C3D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61EE38266B; Mon, 30 Jan 2023 21:57:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 22:56:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7316a0c2c22c8207edff531544e6eb0d6326b45c
X-Git-Newrev: 039dfca25290c4cebe1b7d859a03944598f4c104
X-Patchwork-Hint: ignore
Message-Id: <20230130215716.61EE38266B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ulogd: fix mysql build
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

commit: https://git.buildroot.net/buildroot/commit/?id=039dfca25290c4cebe1b7d859a03944598f4c104
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following mysql build failure raised since bump to version 2.0.8
in commit 6fc4b59ffd3007ca9e436d33647acc5dfff62970:

checking for mysql_config... no
configure: error: libmysqlclient not found

Fixes:
 - http://autobuild.buildroot.org/results/a059be353b7464d4e6a7830a685b43bdd7ecd5fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ulogd/ulogd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 7d4a1fde4d..033acb06c2 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -23,7 +23,9 @@ else
 ULOGD_CONF_OPTS += --disable-dbi
 endif
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-ULOGD_CONF_OPTS += --enable-mysql
+ULOGD_CONF_OPTS += \
+	--enable-mysql \
+	--with-mysql-config=$(STAGING_DIR)/usr/bin/mysql_config
 ULOGD_DEPENDENCIES += mysql
 else
 ULOGD_CONF_OPTS += --disable-mysql
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
