Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4E6C5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 21:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1862F80BAA;
	Mon, 24 Aug 2026 21:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K08F2fARGcVR; Mon, 24 Aug 2026 21:35:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787607302;
	bh=I7YEStkGBwt7SWAI2ahi/EV28Ef/1NYh8+Gj/wqU+8Q=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=S6On9t5dM7fMf2sAWWzV/LfAwjKiHi+cRmt7rJnGm4Wyos0S+lBij/bxUUnBh7z55
	 IgDY3vBsYTsNEcAo9w5xof7ahzKqJcelCaCziJPrxkj1/cS+Gjx+7SHlGnXh2Q5bf8
	 zi6HOL0uhf2/5L5yxJnOjQw8dQMEmwuy52rIZ1VRvLn8ybzs8p863Q54NgHYx/wXAY
	 QIpR5VScszxHfBVS92hc1Ibig9TswhBSaJLTke1fJ4ip8gkGF3P2eNWSQEwtAQhRTv
	 IbS+OqgYGd4c0X1eaaZWrWN3CzrbZytkGzCZocu95hWTZK357NB2mbh5uKGARnf3nL
	 4o99tZzJT6X6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2412180C7E;
	Mon, 24 Aug 2026 21:35:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B04F3386
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96B6580C7E
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBVH8W2Gk9Uf for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 21:34:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74D1080BAA
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:34:58 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 837285FFB1;
 Mon, 24 Aug 2026 23:34:54 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Mon, 24 Aug 2026 23:34:44 +0200
Message-ID: <20260824213444.1189360-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/weston: add patch to fix with
 libdisplay-info 0.4.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit [1] bumped libdisplay-info to 0.4.0.
The weston version 15.0.1 in Buildroot has a strict condition on
libdisplay-info < 0.4.0. See [2].

This commit fixes the issue by adding an upstream patch which relax this
condition.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060154054

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/766d3a6e87003bda9ae7ff3f92e17b7fdced82aa
[2] https://gitlab.freedesktop.org/wayland/weston/-/blob/15.0.1/meson.build#L181

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested with command:

    utils/docker-run support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_weston
---
 .../0001-Allow-libdisplay-info-0.4.0.patch    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/weston/0001-Allow-libdisplay-info-0.4.0.patch

diff --git a/package/weston/0001-Allow-libdisplay-info-0.4.0.patch b/package/weston/0001-Allow-libdisplay-info-0.4.0.patch
new file mode 100644
index 0000000000..8d7739e8c4
--- /dev/null
+++ b/package/weston/0001-Allow-libdisplay-info-0.4.0.patch
@@ -0,0 +1,28 @@
+From f0152f4c04d6ef21159dd5bc98700dc46ac8cb04 Mon Sep 17 00:00:00 2001
+From: Tom Pollard <tom.pollard@codethink.co.uk>
+Date: Tue, 28 Jul 2026 10:51:27 +0100
+Subject: [PATCH] Allow libdisplay-info 0.4.0
+
+Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
+Upstream: https://gitlab.freedesktop.org/wayland/weston/-/commit/54cd5c3354c618815addd7e1d82fc66247099136
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 79256cd6..d6ede4df 100644
+--- a/meson.build
++++ b/meson.build
+@@ -178,7 +178,7 @@ endif
+ 
+ dep_libdisplay_info = dependency(
+ 	'libdisplay-info',
+-	version: ['>= 0.2.0', '< 0.4.0'],
++	version: ['>= 0.2.0', '< 0.5.0'],
+ 	fallback: ['display-info', 'di_dep'],
+ 	default_options: [
+ 		'werror=false',
+-- 
+2.55.0
+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
