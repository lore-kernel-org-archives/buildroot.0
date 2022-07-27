Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02CEC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FF2F405D2;
	Wed, 27 Jul 2022 14:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FF2F405D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yOPWGkuweq5o; Wed, 27 Jul 2022 14:47:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 937D940603;
	Wed, 27 Jul 2022 14:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 937D940603
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 206021BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACD7360AEB
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACD7360AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 812GYZ4KUIBo for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:46:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE34D60C09
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE34D60C09
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A494D86699; Wed, 27 Jul 2022 14:32:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 16:44:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69284b6700e5f45e25a583e87b86ed1eb95038fd
X-Git-Newrev: 166ea61fb4400f9d1b23a89a7a2c1c6fbee62327
X-Patchwork-Hint: ignore
Message-Id: <20220727143225.A494D86699@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jack2: add systemd optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=166ea61fb4400f9d1b23a89a7a2c1c6fbee62327
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add systemd optional dependency (enabled by default)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jack2/jack2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 3b45474cc4..73f723aef0 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -47,6 +47,13 @@ else
 JACK2_CONF_OPTS += --readline=no
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+JACK2_DEPENDENCIES += systemd
+JACK2_CONF_OPTS += --systemd=yes
+else
+JACK2_CONF_OPTS += --systemd=no
+endif
+
 ifeq ($(BR2_PACKAGE_JACK2_LEGACY),y)
 JACK2_CONF_OPTS += --classic
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
