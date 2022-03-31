Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D63EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 06:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D15ED40C02;
	Thu, 31 Mar 2022 06:28:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LpoSeuNPjjvZ; Thu, 31 Mar 2022 06:28:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB3EE40BFB;
	Thu, 31 Mar 2022 06:28:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B02F01C115D
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB7A860A81
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4fnKanmldtRj for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 06:27:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73E2B60B5B
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 06:27:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 02FEC85FF2; Thu, 31 Mar 2022 06:18:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 08:25:36 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f0bda6dd18e9276cc00813e62c6c53680c318c67
X-Git-Newrev: 0467bb87de58a9e6f0f8117e80ed510604ffa9e5
X-Patchwork-Hint: ignore
Message-Id: <20220331061814.02FEC85FF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/busybox: fix
 udhcpc options in minimal config
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
Content-Type: multipart/mixed; boundary="===============6769605536206313650=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6769605536206313650==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0467bb87de58a9e6f0f8117e80ed510604ffa9e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 3de486f8b052b25c8e29a82903b334ca90f25735)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============6769605536206313650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6769605536206313650==--
