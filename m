Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7E2D11182
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 16:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D7E440D8F;
	Sun,  3 Nov 2024 16:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1ro5xB9EHPF; Sun,  3 Nov 2024 16:29:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AA95411D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AA95411D8;
	Sun,  3 Nov 2024 16:29:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 964171128
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 16:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 843706073B
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 16:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ROyAX1uVuvS for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 16:29:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A3206077B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A3206077B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A3206077B
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 16:29:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 635962003DE;
 Sun,  3 Nov 2024 17:29:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35290])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 Nov 2024 17:29:04 +0100
MIME-Version: 1.0
Date: Sun, 03 Nov 2024 17:29:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241102191711.677252-1-romain.naour@smile.fr>
References: <20241102191711.677252-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <181840dc91565efd994d72e11d4c5adf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730651345;
 bh=cJzsIbOtOk+RkTV0turD0caS/gE5iurLEGD7vxw/sy8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X/W3Ucvkb3BmM89QhMA2ReG1d6pRLio4vpZTQszRXRrK5aIX3k1Yk4X8nfZ3NvIhM
 cutfi9Av42lQJ2J0pBFCth2Vfiwtplv2J7m2jMt8J3GBjmgpVI4B5yeMR9UPqFizDP
 N556zzFK+XPuUJOCtqaP8D24I1CsefYA1etts4PJym1T8nNj/yQVmQbzF21vDlHMZ2
 pJg8NGr9y/ffOKWN/cqhPzOweuLf80I3ujZNanmmqMcCWqY4k9teezibW1oNCX351i
 BHE59ZT5veB0hGFfV2SgEQF8sug7XtqkX/eG+ZP5xnSuIAvqauuWvhzWNZlbBQJZI5
 WrRzqp5E0/kpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=X/W3Ucvk
Subject: Re: [Buildroot] [PATCH] package/exfatprogs: fix TestExfatProgs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/11/2024 20:17, Romain Naour via buildroot wrote:
> There is a regression in exfatlabel since exfatprogs 1.2.5.
> 
> exfatlabel tool error out when we try to set a new volume serial or
> label.
> 
>   exfatlabel /dev/sda1 "new label"
>   exfatlabel -i /dev/sda1 0x12345678
> 
> Error out only if too few argument is given, ignore additional
> arguments.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992419
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master. Thanks!

> ---
>  ...rogs-fix-argument-validation-check-2.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 
> package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch
> 
> diff --git 
> a/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch 
> b/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch
> new file mode 100644
> index 0000000000..28c9a71466
> --- /dev/null
> +++ 
> b/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch
> @@ -0,0 +1,41 @@
> +From 5055bc4e852e18ddbfc618623cdaa2c0572d5f0e Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@smile.fr>
> +Date: Sat, 2 Nov 2024 19:27:46 +0100
> +Subject: [PATCH] exfatprogs: fix argument validation check (2)
> +
> +Since commit 7d354e5be83ed3bb981c59b3435ff64da56d185d
> +("exfatprogs: fix argument validation check"), exfatlabel tool
> +error out when we try to set a new volume serial or label.
> +
> +  exfatlabel /dev/sda1 "new label"
> +  exfatlabel -i /dev/sda1 0x12345678
> +
> +Error out only if too few argument is given, ignore
> +additional arguments.
> +
> +Fixes:
> +https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992419
> +
> +Upstream: https://github.com/exfatprogs/exfatprogs/pull/279
> +
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> + label/label.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/label/label.c b/label/label.c
> +index 12d027b..9c8aff3 100644
> +--- a/label/label.c
> ++++ b/label/label.c
> +@@ -78,7 +78,7 @@ int main(int argc, char *argv[])
> + 	if (version_only)
> + 		exit(EXIT_FAILURE);
> +
> +-	if (argc - optind != 1)
> ++	if (argc - optind < 1)
> + 		usage();
> +
> + 	ui.dev_name = argv[serial_mode + 1];
> +--
> +2.45.0
> +
> --
> 2.45.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
