Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4C3ECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 11:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18FE740C22;
	Mon, 29 Aug 2022 11:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18FE740C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sxjXWyY7puv2; Mon, 29 Aug 2022 11:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CF8940C0B;
	Mon, 29 Aug 2022 11:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CF8940C0B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3751BF2BD
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53F9940C4B
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53F9940C4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-nyetCoHqZ6 for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 11:36:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AD4E40C3F
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 11:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AD4E40C3F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9327687F56; Mon, 29 Aug 2022 11:21:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 13:35:28 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 774e310383bc16f1918302693be57bbddaf780ac
X-Git-Newrev: cd4fc11abb56d56561c4e32dbbc1f7fce65320c3
X-Patchwork-Hint: ignore
Message-Id: <20220829112111.9327687F56@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/netdata: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd4fc11abb56d56561c4e32dbbc1f7fce65320c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 55106a056e09cbb1c16c561c41ba160464305c62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netdata/netdata.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 04b146591f..c0ce74d18b 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -36,6 +36,13 @@ else
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
