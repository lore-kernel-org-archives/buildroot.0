Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E53C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 283E24028C;
	Mon, 22 Jul 2024 08:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9E-7K_CCl1gf; Mon, 22 Jul 2024 08:05:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEC33402D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC33402D9;
	Mon, 22 Jul 2024 08:05:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 269D71BF8C7
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 139854028C
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPRBE7jvB8Tl for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26B9540281
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26B9540281
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:05:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 102CB86FC3; Mon, 22 Jul 2024 08:05:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 09:48:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1bd5b31f255a8864a53a54de22a3b07fe799931
X-Git-Newrev: f807855b4d77cd277702e8764f8877d7643f87bf
X-Patchwork-Hint: ignore
Message-Id: <20240722080537.102CB86FC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libp11: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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

commit: https://git.buildroot.net/buildroot/commit/?id=f807855b4d77cd277702e8764f8877d7643f87bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libp11 unconditionally calls the (deprecated) ENGINE_* logic in
libopenssl resulting in a build failure when
!BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
623d3bbe43e9193aa8e3395367d01af59071b859:

eng_front.c:25:2: error: #error did not get engine.h
   25 | #error did not get engine.h
      |  ^~~~~

Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
 - http://autobuild.buildroot.org/results/b03cc27a60f9e6794b3341517196fbf8dc3ec2d4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libp11/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libp11/Config.in b/package/libp11/Config.in
index 3c7ccdee27..3bf13a6051 100644
--- a/package/libp11/Config.in
+++ b/package/libp11/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBP11
 	bool "libp11"
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
