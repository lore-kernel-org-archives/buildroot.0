Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69645C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2692F81D35;
	Sun, 27 Mar 2022 16:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8D7oXtUFSaA; Sun, 27 Mar 2022 16:09:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 284ED81D24;
	Sun, 27 Mar 2022 16:09:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 696A31BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 589FE60E64
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GAOwSV-reyfd for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:09:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF92E60B9D
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4C89585E09; Sun, 27 Mar 2022 16:00:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:59:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3eb888ce3959860dce8e4aa25fb2633a40b074f6
X-Git-Newrev: 3de486f8b052b25c8e29a82903b334ca90f25735
X-Patchwork-Hint: ignore
Message-Id: <20220327160039.4C89585E09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: fix udhcpc options in
 minimal config
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
Content-Type: multipart/mixed; boundary="===============5919277670960610858=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5919277670960610858==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3de486f8b052b25c8e29a82903b334ca90f25735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The busybox-minimal.config, which is used by systems without an MMU, specifies
the "-b" command line option for udhcpc. However, this option is not supported
by BusyBox udhcpc anymore since version 1.27.0 when building for systems
without an MMU.

Remove the "-b" option from busybox-minimal.config to repair network
initialization on systems without an MMU.

This fixes the following network initialization failure:

  udhcpc: invalid option -- b
  FAIL

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox-minimal.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 9eae0f51f4..1fb4e39e21 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -1018,7 +1018,7 @@ CONFIG_UDHCP_DEBUG=9
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 # CONFIG_FEATURE_UDHCP_RFC3397 is not set
 # CONFIG_FEATURE_UDHCP_8021Q is not set
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-b -R"
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R"
 
 #
 # Print Utilities

--===============5919277670960610858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5919277670960610858==--
