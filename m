Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABB7ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F03A4174F;
	Tue, 30 Aug 2022 16:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F03A4174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oRa9qmtR6kvE; Tue, 30 Aug 2022 16:20:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67760415DF;
	Tue, 30 Aug 2022 16:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67760415DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0986B1BF3A8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7342A40BB1
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7342A40BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glqVdvVf9jvq for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37A3040BC9
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37A3040BC9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 81C09880D3; Tue, 30 Aug 2022 16:00:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 18:09:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 342993ed87bb5e40517dbc20f9b99181806b18ad
X-Git-Newrev: dd0e1dede47c53199693696c4b9467147576f5b5
X-Patchwork-Hint: ignore
Message-Id: <20220830160007.81C09880D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/jack2: add
 systemd optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd0e1dede47c53199693696c4b9467147576f5b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Add systemd optional dependency (enabled by default)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 166ea61fb4400f9d1b23a89a7a2c1c6fbee62327)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
