Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD526ECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 11:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55AF7416EE;
	Mon, 29 Aug 2022 11:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55AF7416EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bkPiDzYJHj9W; Mon, 29 Aug 2022 11:37:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22FE7416D0;
	Mon, 29 Aug 2022 11:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22FE7416D0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C64C1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4587183216
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4587183216
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RAlCU_aBP5bP for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 11:36:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E5F2831AE
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 11:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E5F2831AE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 859B487F43; Mon, 29 Aug 2022 11:21:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 13:35:41 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7526e7c88a06ecf36c0e213f9cbcab38d76296f3
X-Git-Newrev: 7c9e4af6410cd732a46275c9a15fbf98e8b22bbb
X-Patchwork-Hint: ignore
Message-Id: <20220829112105.859B487F43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/netdata: add
 freeipmi optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c9e4af6410cd732a46275c9a15fbf98e8b22bbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 55106a056e09cbb1c16c561c41ba160464305c62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netdata/netdata.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 6def59764a..60eac14009 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -29,6 +29,13 @@ else
 NETDATA_CONF_OPTS += --disable-plugin-cups
 endif
 
+ifeq ($(BR2_PACKAGE_FREEIPMI),y)
+NETDATA_CONF_OPTS += --enable-plugin-freeipmi
+NETDATA_DEPENDENCIES += freeipmi
+else
+NETDATA_CONF_OPTS += --disable-plugin-freeipmi
+endif
+
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 NETDATA_CONF_OPTS += --enable-jsonc
 NETDATA_DEPENDENCIES += json-c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
