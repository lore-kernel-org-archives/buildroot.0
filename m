Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63D2D2A537
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E5D0608D7;
	Thu,  4 Dec 2025 20:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ew4pZZxs94T; Thu,  4 Dec 2025 20:54:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E560608DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764881657;
	bh=ivZDz6Xi1949KystgESdkjwFgCr+bD9BAZOvJf1WTsQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PGucFeyi96aWGxJrI3SJ/SnCub1dki7pFLOGWg/s7bpGgCdP1hY1Sm8P33T3vECWq
	 4qKQE9n5aJTuDNefdcExQxkKeLHaP6Wp9stpuTy2y27EinyIxpoS13C9qS7PImwDBt
	 1F+HqNbGv3QTBU7qssoyLbJRGsCMrbXtJpEopeviv56/q88RtD7YvSyVAFw6VlFNJY
	 EYSQeumg7UQSpgmEbPW0apVIJpPBQnqJT+KNp2OnDsk5Dj761mupytEAPGjaZpC3WX
	 lgUsmyjmz566SMsUn1/Vv9aRk66BR6QM9G8EyVfdpKDuIEMvEJMBWu0UhR224Ci+aq
	 CWDE+LyoTQYpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E560608DF;
	Thu,  4 Dec 2025 20:54:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CE0A4199
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3D7740805
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUV0_SXPuBih for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:54:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AEAE4407D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEAE4407D7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEAE4407D7
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:54:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CAFFEA4C797E;
 Thu,  4 Dec 2025 21:54:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56170)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRGL6-000000003xU-0Oin;
 Thu, 04 Dec 2025 20:54:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Thu,  4 Dec 2025 21:54:12 +0100
Message-ID: <20251204205412.2158168-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204205412.2158168-1-bernd@kuhls.net>
References: <20251204205412.2158168-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764881652;
 bh=/Hk4xLKmrl6+rovWYQjNxCxxChtjH+NHwzQrBDwJOKQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VXvGISWstgEi4jJxwD/EuGeOT46DHCLnAB7w6GU+6MHtt1gKtWlA3rh4k9lYTZnUT
 2tQNDT2xV8XpKswHx5ZLkhNQZMnYMHFak/rifsGubMODIQBiXkDKgVlmPHCH2WeHa7
 EhUejJfXjDu7Aje1Ej6vCfLGnpKvB6Y0XoZnYPwtBnvarRvNOTFLTFJpEBXCJiZeZI
 +nHTg3NfxmtEOJ1Z4bSY8PPlhCuH7Zwx7F2MSqhg3ZxaI040LPdrYFzHMbvfvOgKwC
 xURUktLXvvu4MtYjGVBJ6d1pXgTv1DLSesuPeKJjltgbsKVgBItt7hHzq6u3EWxKwV
 YFzCNgG8Lsp0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=VXvGISWs
Subject: [Buildroot] [PATCH/next 2/2] package/wtfutil: bump version to 0.47.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/wtfutil/wtf/releases

Needs bump of go to >= 1.25.4.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wtfutil/wtfutil.hash | 2 +-
 package/wtfutil/wtfutil.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wtfutil/wtfutil.hash b/package/wtfutil/wtfutil.hash
index d4afbdc050..9e90731ac3 100644
--- a/package/wtfutil/wtfutil.hash
+++ b/package/wtfutil/wtfutil.hash
@@ -1,2 +1,2 @@
-sha256  1f2a3a037b0e4967039d2241cbe2ba3693a60bd92bd0047cc3361b0faad2a7b6  wtfutil-0.41.0-go2.tar.gz
+sha256  1283e2338e5ca35a7c65596192f151859ab14ea3299321dcf1bb17de30904ceb  wtfutil-0.47.1-go2.tar.gz
 sha256  b59f3dbd83c6aa4e003b6eafa80bc53f0629e4d164e8b125c56869c2603dbc8f  LICENSE.md
diff --git a/package/wtfutil/wtfutil.mk b/package/wtfutil/wtfutil.mk
index 54fea09574..3b92a5797d 100644
--- a/package/wtfutil/wtfutil.mk
+++ b/package/wtfutil/wtfutil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WTFUTIL_VERSION = 0.41.0
+WTFUTIL_VERSION = 0.47.1
 WTFUTIL_SITE = $(call github,wtfutil,wtf,v$(WTFUTIL_VERSION))
 WTFUTIL_LICENSE = MPL-2.0
 WTFUTIL_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
