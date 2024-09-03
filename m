Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E1FCE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32A1184A39;
	Fri,  6 Sep 2024 20:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rg6vdB9JYqXP; Fri,  6 Sep 2024 20:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA4D80C44
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FA4D80C44;
	Fri,  6 Sep 2024 20:06:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 434811BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E68E40822
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkMKUySYB73Y for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90AF040B4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90AF040B4F
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C3A9869F2; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:14:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe2b0ad4595db98babd0f513b6dfa7a879bbe684
X-Git-Newrev: 410995b7120b42790934ad35cf7656ade30d8539
X-Patchwork-Hint: ignore
Message-Id: <20240906195859.8C3A9869F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: needs CGO linking for host
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=410995b7120b42790934ad35cf7656ade30d8539
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: http://autobuild.buildroot.org/results/35e/35ec43c0970f001e422d0b2ca6f8319deea2cde4/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/skopeo/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/skopeo/Config.in.host b/package/skopeo/Config.in.host
index b3a1c155f7..334a12b6fc 100644
--- a/package/skopeo/Config.in.host
+++ b/package/skopeo/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_SKOPEO
 	bool "host skopeo"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
 	help
 	  skopeo is a command line utility that performs various
 	  operations on container images and image repositories.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
