Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04758C4708E
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B14B9410C6;
	Mon,  6 Nov 2023 22:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B14B9410C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TDqVPDoz-31l; Mon,  6 Nov 2023 22:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAB6041740;
	Mon,  6 Nov 2023 22:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAB6041740
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33B101BF954
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B057827DE
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B057827DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jf6PK_uugSeA for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:08:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3766E824CE
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3766E824CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24D2B86B60; Mon,  6 Nov 2023 22:08:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:07:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16dd1e41002fedaf9e2cc7d9d14ca8e7361a54e2
X-Git-Newrev: 4513f5198a8f24af7bd24fdfc1ede143eb4e844a
X-Patchwork-Hint: ignore
Message-Id: <20231106220816.24D2B86B60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: fix python
 handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=4513f5198a8f24af7bd24fdfc1ede143eb4e844a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python handling is wrong since the addition of the package in commit
736c4c1655d93652a9a7e79235bbe726b3d46176 so disable python(2) and enable
python3 if needed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeradius-server/freeradius-server.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index e493f7a17e..107eaf3ee4 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -46,6 +46,7 @@ FREERADIUS_SERVER_CONF_OPTS += \
 	--without-rlm_eap_ike \
 	--without-rlm_eap_tnc \
 	--without-rlm_perl \
+	--without-rlm_python \
 	--without-rlm_sql_iodbc \
 	--without-rlm_sql_oracle \
 	--without-rlm_sql_freetds \
@@ -148,10 +149,10 @@ FREERADIUS_SERVER_CONF_OPTS += --without-pcre
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-FREERADIUS_SERVER_CONF_OPTS += --with-rlm_python
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_python3
 FREERADIUS_SERVER_DEPENDENCIES += python3
 else
-FREERADIUS_SERVER_CONF_OPTS += --without-rlm_python
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_python3
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
