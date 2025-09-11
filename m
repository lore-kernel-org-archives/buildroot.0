Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9067DCAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66AEB41F86;
	Thu, 11 Sep 2025 19:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WLAcbCyVEKMA; Thu, 11 Sep 2025 19:22:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CF0E41F4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CF0E41F4B;
	Thu, 11 Sep 2025 19:22:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BF3E2735
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AF0784A1C
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFpZPz06hssR for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B08B84A26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B08B84A26
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:22:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09953842A2; Thu, 11 Sep 2025 19:22:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:16:10 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9cabd336ed18b29ea08e5bb2ed2453cdb6454215
X-Git-Newrev: a4ac42f4e7a741312012498d936beb73240efd04
X-Patchwork-Hint: ignore
Message-Id: <20250911192231.09953842A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Revert
 "package/firewalld: add missing nftables json runtime dependency"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a4ac42f4e7a741312012498d936beb73240efd04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This reverts commit 1a729cbf5c2c392c83636d50bb6a244aafd3eea2.

The BR2_PACKAGE_NFTABLES_JSON variable is not present on the 2025.02.x
branch and was added in commit [1]. The behaviour of commit [1] can be
immitated by just selecting BR2_PACKAGE_JANSSON in firewalld. Which is
already the case.

[1] 2795fecc50 package/nftables: add an option to force JSON support

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/firewalld/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in
index 407f57c604..cc8411b34d 100644
--- a/package/firewalld/Config.in
+++ b/package/firewalld/Config.in
@@ -14,7 +14,6 @@ config BR2_PACKAGE_FIREWALLD
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_JANSSON # Uses the nftables json interface
 	select BR2_PACKAGE_NFTABLES
-	select BR2_PACKAGE_NFTABLES_JSON # runtime
 	select BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_GOBJECT
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
