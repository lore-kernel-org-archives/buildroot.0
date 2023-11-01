Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24EBC4167B
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 18:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55AF782114;
	Wed,  1 Nov 2023 18:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55AF782114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10J8msroaj0j; Wed,  1 Nov 2023 18:13:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56DFC82327;
	Wed,  1 Nov 2023 18:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56DFC82327
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE4841BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7B5D408B4
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7B5D408B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3mqNobligfNx for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 18:13:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DF4F401E4
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 18:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DF4F401E4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC3FA8643F; Wed,  1 Nov 2023 18:13:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 19:10:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f986eaeb2e952121c8e2b257384ba1df83d6d2b
X-Git-Newrev: 4a2909ea48f31bb8558a4a8dcc32465cef698ee6
X-Patchwork-Hint: ignore
Message-Id: <20231101181336.EC3FA8643F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openrc: add bash-completion support
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a2909ea48f31bb8558a4a8dcc32465cef698ee6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openrc/openrc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 908b44190a..e3f51d45d1 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -20,6 +20,12 @@ OPENRC_CONF_OPTS = \
 	-Drootprefix=/ \
 	-Dbranding="\"Buildroot $(BR2_VERSION_FULL)\""
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+OPENRC_CONF_OPTS += -Dbash-completions=true
+else
+OPENRC_CONF_OPTS += -Dbash-completions=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 OPENRC_CONF_OPTS += -Dselinux=enabled
 OPENRC_DEPENDENCIES += libselinux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
