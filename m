Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C6EEE6B68
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 21:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFE62611CA;
	Fri,  6 Feb 2026 21:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQ3A_Nmzkc_Y; Fri,  6 Feb 2026 21:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89F5F6117F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770414318;
	bh=B3GQ/nnfOhEWcsjnHclNcDvpMUqIs4n+7+KbQOr/iQw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AvcxRJltHEpqf9AN+71CEuy0SkkN9KXRDqkqK6ZYzq9byQfpKcy1SahSo1i+sBAdG
	 McF42Efh/1l6t9xK6i0z6t76tfDa7z0JsKBl6DUM8pg6v2Uxxl/AN59ZmVs9SpQqVX
	 LwWOzjxLM7ZaQlTETSM6sBvF+4gkxzpjtNZxTPd0HihwP8CEAw4fylTElTbTbE+qhU
	 qQK14WCfdd2Mq9WCUcx/8MLAoi6eUYRZze7K7WyVKtnig9ZJ239oPMcn4E7xAKrP6i
	 nQoADOwwQVYwYmw4ikwXzm8FsTiYSeS/POROMIVHuYJ5Tuaa9Q2jmFwX6iWnHiF+24
	 vgE2Hl3FgZxXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89F5F6117F;
	Fri,  6 Feb 2026 21:45:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1845173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3069811A2
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JS3OYHL1uhE9 for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 21:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D99228119F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D99228119F
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:45:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC0AC86AD8; Fri,  6 Feb 2026 21:45:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Feb 2026 22:43:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10033b62c498418d9cb5dbc5d07026bd3cc398dd
X-Git-Newrev: 67b7da7d3d2f48d2d4ed252fbb42eeba10ccb492
X-Patchwork-Hint: ignore
Message-Id: <20260206214516.BC0AC86AD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: fix hash dir links
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/67b7da7d3d2f48d2d4ed252fbb42eeba10ccb492
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since commit 0e3ddc9dc85e29cd00338cc79ea4be1d634a75ba "{linux,
linux-headers}: split hash file in before and from 6.17" there are two
hash file variants, and symlinks for the individual versions. These
were not updated in 48186093fd355ede91151b2342e222cef303a6ca "bump
5.{10, 15}.x / 6.{1, 6, 12, 18}.x series".

Fixes: 48186093fd355ede91151b2342e222cef303a6ca

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{6.18.8 => 6.18.9}                     | 0
 package/linux-headers/{5.10.248 => 5.10.249} | 0
 package/linux-headers/{5.15.198 => 5.15.199} | 0
 package/linux-headers/{6.1.161 => 6.1.162}   | 0
 package/linux-headers/{6.12.68 => 6.12.69}   | 0
 package/linux-headers/{6.18.8 => 6.18.9}     | 0
 package/linux-headers/{6.6.112 => 6.6.123}   | 0
 7 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/linux/6.18.8 b/linux/6.18.9
similarity index 100%
rename from linux/6.18.8
rename to linux/6.18.9
diff --git a/package/linux-headers/5.10.248 b/package/linux-headers/5.10.249
similarity index 100%
rename from package/linux-headers/5.10.248
rename to package/linux-headers/5.10.249
diff --git a/package/linux-headers/5.15.198 b/package/linux-headers/5.15.199
similarity index 100%
rename from package/linux-headers/5.15.198
rename to package/linux-headers/5.15.199
diff --git a/package/linux-headers/6.1.161 b/package/linux-headers/6.1.162
similarity index 100%
rename from package/linux-headers/6.1.161
rename to package/linux-headers/6.1.162
diff --git a/package/linux-headers/6.12.68 b/package/linux-headers/6.12.69
similarity index 100%
rename from package/linux-headers/6.12.68
rename to package/linux-headers/6.12.69
diff --git a/package/linux-headers/6.18.8 b/package/linux-headers/6.18.9
similarity index 100%
rename from package/linux-headers/6.18.8
rename to package/linux-headers/6.18.9
diff --git a/package/linux-headers/6.6.112 b/package/linux-headers/6.6.123
similarity index 100%
rename from package/linux-headers/6.6.112
rename to package/linux-headers/6.6.123
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
