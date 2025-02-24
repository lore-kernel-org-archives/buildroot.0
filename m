Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BF0C021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 19:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5261F605F7;
	Mon, 24 Feb 2025 19:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2xRoBQZtlnM; Mon, 24 Feb 2025 19:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6938A60BB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6938A60BB8;
	Mon, 24 Feb 2025 19:51:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 838912292
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E9394031F
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJDJgVY9PqVQ for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 19:51:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B234A403C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B234A403C8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B234A403C8
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:51:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 871E4B0059A;
 Mon, 24 Feb 2025 20:51:26 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Feb 2025 20:51:26 +0100
MIME-Version: 1.0
Date: Mon, 24 Feb 2025 20:51:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fabio Estevam <festevam@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250224160927.909402-1-festevam@gmail.com>
References: <20250224160927.909402-1-festevam@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <9feaed1aef4e4df9713b809a4e1f551d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740426687;
 bh=+jzSADPXXkomvCsYM4HOOpRyP1zR+x8SQmm2v/RB/30=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eB//aJ2MrdcX+LDsQ145RNRI2hxure7h3N3VMLi2diG+2U3kC5N2DtiswcJmMTD3A
 FM8KP4dlC/C8r2HGOp9ESXFib+S7J/H1daoMQChPrDSwyvS3ocGG5JHomdmeVjjWwz
 6Jc/2pDo2WZrf0Q4H3TzjFwi3kS4QeteL5osQUeptEq4o6yQ44u9xD0soRT++q1glC
 V63uw5HAUM7EqvRptqPdduCYlV4m/vNnsK6UD0JIC3cgrOiTObJAu6AM3jzp6NrZSn
 5cMpNqb0ia1bVq2BX1wTjk6lxZNg+pN5sC7Nhah5QK4gBraMZTMxxHOYepLVZrIZ9X
 ZFTVxi4Zr7f0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eB//aJ2M
Subject: Re: [Buildroot] [PATCH] configs/imx8mn-ddr4-evk_defconfig: new
 defconfig
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

On 24/02/2025 17:09, Fabio Estevam wrote:
> Add a new defconfig for the imx8mn-ddr4-evk board that uses upstream
> components, such as:
> 
> - Linux Kernel: Upstream version 6.12.16
> - U-boot: Upstream version 2025.01
> - ATF: Upstream version 2.12
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to masted, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
