Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7957DC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 13:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17946409A9;
	Sun, 19 Mar 2023 13:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17946409A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RdOBRnn94WCp; Sun, 19 Mar 2023 13:51:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B683409BE;
	Sun, 19 Mar 2023 13:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B683409BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DE071BF577
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 13:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 492DF403FF
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 13:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 492DF403FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ice4rknNnulp for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 13:50:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 834CD400A6
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 13:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 834CD400A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 724EC8716C; Sun, 19 Mar 2023 13:50:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 14:45:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9833247d491e06c7dfefd1e1bf62043fe08eae11
X-Git-Newrev: f5b50cb14ca5b08c2d123a63b4d8829f19078578
X-Patchwork-Hint: ignore
Message-Id: <20230319135059.724EC8716C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: fix media control
 profile
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5b50cb14ca5b08c2d123a63b4d8829f19078578
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With bluez 5.66 (bumped in c6c79d6) the Media Control Profile (MCP), Basic
Audio Profile (BAP) and Volume Control Profile (VCP) where added.
All three are enabled by default.
MCP only works if AVRCP is enabled, as it requires player.c which is
otherwise not compiled.
Only enable all three new profiles when the audio plugin is selected.

Fixes:
 - http://autobuild.buildroot.net/results/d62/d6260a5acf766657f683d85fa1bdc27b7a43551e/

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bluez5_utils/bluez5_utils.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 4059b34556..7fe6899cdb 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -64,9 +64,19 @@ endif
 
 # enable audio plugins (a2dp and avrcp)
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO),y)
-BLUEZ5_UTILS_CONF_OPTS += --enable-a2dp --enable-avrcp
-else
-BLUEZ5_UTILS_CONF_OPTS += --disable-a2dp --disable-avrcp
+BLUEZ5_UTILS_CONF_OPTS += \
+	--enable-a2dp \
+	--enable-avrcp \
+	--enable-bap \
+	--enable-mcp \
+	--enable-vcp
+else
+BLUEZ5_UTILS_CONF_OPTS += \
+	--disable-a2dp \
+	--disable-avrcp \
+	--disable-bap \
+	--disable-mcp \
+	--disable-vcp
 endif
 
 # enable health plugin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
