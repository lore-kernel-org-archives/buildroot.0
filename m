Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8C2C021B3
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 13:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D474881295;
	Sun, 23 Feb 2025 13:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChCGvxv1jbS7; Sun, 23 Feb 2025 13:29:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF86381296
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF86381296;
	Sun, 23 Feb 2025 13:29:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12FB3943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F80640763
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYbcvtaOGP5K for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 13:28:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7121140758
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7121140758
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7121140758
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:28:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 599EA780333;
 Sun, 23 Feb 2025 14:28:53 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 14:28:53 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 14:28:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20250223125926.3645897-1-yann.morin.1998@free.fr>
References: <20250223125926.3645897-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <4fec8ac34c67f29b30913b1d8b266055@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740317335;
 bh=Ab8sOEnE4RdimiBIe8mP3HAHp67V7Vpc0GTiLJQUtc0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xrzwqr0OXO6dpFY+dionkUQxMczt513+wrJAg1Ije48vPOSQLhieNmn1Y8wOzheDk
 JNCufHYhezN80xlQ/7CNOnUzwfxM3X/WxZ3FIPK4NogYX/II7K4HAB3TX3snzrMeaK
 PkZMaeBoSFoAA7Uw0cg3J+d+zvCPIdhdejsG8BjlE/3YuPYXpz5NNZcMlueCoXFYlG
 VqFJLUwadBD4DYcCxfQ7iGp8wV6COpPVRNrC9bfCUTJHpXeLGeXnSsGR895MAjO1tL
 2RfaLTgbvi0cZ8ZcomZIbY07O5WNqo+QLZ2l7+3fG7kIcYibNF/Ne40hieVJtGRH4Q
 SioyYoNj8wfOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Xrzwqr0O
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: fix cyclonedx script name
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

On 23/02/2025 13:59, Yann E. MORIN wrote:
> In commit dbab39e2d908 (support/scripts/generate-cyclonedx.py: add
> script to generate CycloneDX-style SBOM), the script was renamed while
> applying thr patch, but the entry in DEVELOPERS was not updated
> accordingly:
> 
>     $ ./utils/docker-run ./utils/get-developers -v
>     WARNING: 'utils/generate-cyclonedx.py' doesn't match any file, line 
> 3179
> 
> Fix that.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
