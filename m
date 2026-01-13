Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB64D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10A1684475;
	Tue, 13 Jan 2026 19:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mS_eC04OtMMV; Tue, 13 Jan 2026 19:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F86784476
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333705;
	bh=kmmpEog5UvMJQyrl230oNB+3q1nw/12DmAQxv1Ay0Cc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m07OXKP7ssV2GJpU+WNeBTjxb/UAy1MYg23Wu1I4lvFNaqJqthpr9wyus+QF2u4l8
	 VbiGJJqg37L7Kw0MrdOjiyqXv/DY6wUbjQfK/j6dGzfA/bdDzv1MBaG4OFTuDujHr9
	 YEMAukGbMGr9IhvgxG0+sJn1SKYiOjztibIb8pTn4RbwcuM/BmlRR1MoRuRyEjrHKU
	 wKBQSXaeHrdGkYa98CIXF/ZAqEs2pY/3hqwcmUWcsLMc8+V2tel4ee1VMV4/h6ZcqD
	 +S+okLmhRozxHnnq8Hgzng80g9CWSTND1TS/Cp7XxJYq8KPGqumfKqbcxzN8Nr7vgc
	 1dhctebENClIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F86784476;
	Tue, 13 Jan 2026 19:48:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14F82231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 050AA40E60
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cymaQsppZZFG for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:48:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07ACB40E62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07ACB40E62
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07ACB40E62
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 33084B97A863; Tue, 13 Jan 2026 20:48:19 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:48:17 +0100
Message-ID: <20260113194817.100671-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102201743.3421271-1-bernd@kuhls.net>
References: <20260102201743.3421271-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333699; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=kkGl2KG1EXAoTyBVSEvIeJpmxtvIwzk8R0Ep5jnjxho=;
 b=GylSDcHQT7ZkfhauEvsQuS2laoIJncwL6G4HR+HehO1A23Of506neVfFAq9TeaYr1p6nXc
 nJmYAYeevDoUzOADdC23Zfvouu+VVkly8PwE2MNbdo1yWA/HbBIS8VSkrbiUVr6ezx/cuH
 q/kktboVOiDqDe1aMio3qbTlE/5RgyZjjbIG9h3tSKsbFLy1CzFq/dDYdD6682Xoej7oGg
 R4lRHGBTpTJMjW2USf0wHTwm+jS2AfxSAp9tadsZvk6bIrBGedMYUaNCZNzg7Vlfs92xty
 3WxD8Ciut2rmFTqf3KadxV7qRJigUkgIVYSfLjIRFH1jmJTSgXHkeCp8mlVegw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GylSDcHQ
Subject: Re: [Buildroot] [PATCH 1/1] package/fio: fix build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Buildroot commit 215133c0fc2819f059fbb35071ab2e0987f5107d bumped fio from
> 3.38 to 3.41. Upstream commit
> https://github.com/axboe/fio/commit/4175f4dbec5d1d9e5e0490026e98b1806188e098
> was added to fio 3.40 including FALLOC_FL_ZERO_RANGE which causes build
> errors.
> 
> Added upstream commit which not only fixes musl builds but also uclibc.
> 
> Fixes:
> musl: https://autobuild.buildroot.net/results/8e9/8e946c7104be0295a9a2b946fe4a82bba0e28db8/
> uclibc: https://autobuild.buildroot.net/results/ece/ece6ff1b20fa3482a88ffb3a6167b2bba9b06101/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/fio/0001-fix-musl-builds.patch | 38 ++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/fio/0001-fix-musl-builds.patch
> 
> diff --git a/package/fio/0001-fix-musl-builds.patch b/package/fio/0001-fix-musl-builds.patch
> new file mode 100644
> index 0000000000..16c3d3836d
> --- /dev/null
> +++ b/package/fio/0001-fix-musl-builds.patch
> @@ -0,0 +1,38 @@
> +From ccce76d2850d6e52da3d7986c950af068fbfe0fd Mon Sep 17 00:00:00 2001
> +From: Arthur Gautier <arthur.gautier@arista.com>
> +Date: Sat, 13 Dec 2025 20:07:11 -0800
> +Subject: [PATCH] fix musl builds
> +
> +This commit fixes the build on musl which fails with the following
> +error:
> +```
> +oslib/linux-blkzoned.c: In function 'blkzoned_move_zone_wp':
> +oslib/linux-blkzoned.c:389:37: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
> +  389 |                 ret = fallocate(fd, FALLOC_FL_ZERO_RANGE, z->wp, length);
> +      |                                     ^~~~~~~~~~~~~~~~~~~~
> +oslib/linux-blkzoned.c:389:37: note: each undeclared identifier is reported only once for each function it appears in
> +make: *** [Makefile:501: oslib/linux-blkzoned.o] Error 1
> +make: *** Waiting for unfinished jobs....
> +```
> +
> +Signed-off-by: Arthur Gautier <arthur.gautier@arista.com>
> +
> +Upstream: https://github.com/axboe/fio/commit/ccce76d2850d6e52da3d7986c950af068fbfe0fd
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + oslib/linux-blkzoned.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/oslib/linux-blkzoned.c b/oslib/linux-blkzoned.c
> +index 78e25fca91..c45ef623de 100644
> +--- a/oslib/linux-blkzoned.c
> ++++ b/oslib/linux-blkzoned.c
> +@@ -25,6 +25,7 @@
> + #ifndef BLKFINISHZONE
> + #define BLKFINISHZONE _IOW(0x12, 136, struct blk_zone_range)
> + #endif
> ++#include <linux/falloc.h>
> + 
> + /*
> +  * If the uapi headers installed on the system lacks zone capacity support,
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
