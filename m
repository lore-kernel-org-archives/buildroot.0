Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F61CCD3440
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A78A403DB;
	Tue,  3 Sep 2024 21:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P79HtROR2_It; Tue,  3 Sep 2024 21:15:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9A3F4042E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9A3F4042E;
	Tue,  3 Sep 2024 21:15:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F6FF1BF95C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6611D40182
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFdRKE2Yc_YS for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A9D3402F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A9D3402F6
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:14:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56E6180E4F; Tue,  3 Sep 2024 21:14:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:14:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fe2b0ad4595db98babd0f513b6dfa7a879bbe684
X-Git-Newrev: 410995b7120b42790934ad35cf7656ade30d8539
X-Patchwork-Hint: ignore
Message-Id: <20240903211449.56E6180E4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/skopeo: needs CGO
 linking for host
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
