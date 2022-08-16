Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C80CC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2EE48174A;
	Tue, 16 Aug 2022 20:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2EE48174A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0QaTXDJPSunr; Tue, 16 Aug 2022 20:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 655FA814A0;
	Tue, 16 Aug 2022 20:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 655FA814A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03DF51BF9C2
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD6E04010D
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD6E04010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GyieQxzhIgeZ for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECC714019E
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECC714019E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BA2D98788B; Tue, 16 Aug 2022 19:58:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 22:09:15 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8c0726bd2429e708ffa1acdd5018d098a18f975e
X-Git-Newrev: 5cf3136f4025526dfc256f3aeffcc0037cbf149a
X-Patchwork-Hint: ignore
Message-Id: <20220816195810.BA2D98788B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bind: add libidn2
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=5cf3136f4025526dfc256f3aeffcc0037cbf149a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 75a287a4fa667001286c753f003b490d76fbad90)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 1646fc6237..86049d3648 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -54,6 +54,13 @@ else
 BIND_CONF_OPTS += --disable-linux-caps
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+BIND_CONF_OPTS += --with-libidn2
+BIND_DEPENDENCIES += libidn2
+else
+BIND_CONF_OPTS += --without-libidn2
+endif
+
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
 BIND_CONF_OPTS += --with-gssapi=$(STAGING_DIR)/usr/bin/krb5-config
 BIND_DEPENDENCIES += libkrb5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
