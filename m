Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0741C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 12:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31B1C409F2;
	Sun, 23 Feb 2025 12:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Errod477HH2M; Sun, 23 Feb 2025 12:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFEF5409E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFEF5409E4;
	Sun, 23 Feb 2025 12:09:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F375920
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AF6460BE8
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flVTDv9EE66d for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 12:09:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D38960B45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D38960B45
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D38960B45
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:09:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C285713F8AE;
 Sun, 23 Feb 2025 13:09:03 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 13:09:03 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 13:09:03 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fabio Estevam <festevam@gmail.com>
Cc: buildroot@buildroot.org, gilles.talis@gmail.com
In-Reply-To: <20250222212837.3745977-1-festevam@gmail.com>
References: <20250222212837.3745977-1-festevam@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <23336cc24f07217ca65406a85eb3aa01@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740312546;
 bh=K7p9aiTN027gDQHYlyTYqHoM4mLtJoiZbWwKetqhENY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wzoc69FCXRUwk84v4c6CedrOqFlUH2uFYyaHCH2QP6uWrC6ippBleZkdtIGNdL8lc
 NuxEiS6d6qbncslTYhbIP2bffoMkLYacD6iTNBD/hBAaBXiBALFrUmh5zmeJlBykda
 tDFKl/FERoeNeXEx0WyMVODPnmj3bVWn8FgO2+NvC1KzaGkP7+I3/rBlEjiSzOyHUQ
 dfx1U1U/2nvap86MDbFBW94KucZE512XrNrzKBkWp+VsQ4YK90h1ISrxrAJPx0Lzry
 oLdQ2g9jzDNA2w8OgYdARqnejU4iamiCn+3WE5rbA9BlnQ7oKFc6WKilkl/y4ENfre
 jD48GfYiSXaAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wzoc69FC
Subject: Re: [Buildroot] [PATCH] configs/polyhex_debix_model_a_defconfig:
 Remove BR2_PACKAGE_HOST_IMX_MKIMAGE
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

On 22/02/2025 22:28, Fabio Estevam wrote:
> The BR2_PACKAGE_HOST_IMX_MKIMAGE is only needed when the NXP U-Boot
> version is used.
> 
> polyhex_debix_model_a_defconfig uses mainline U-Boot, which builds 
> flash.bin
> directly, without using the NXP imx-mkimage tool.
> 
> Remove such unneeded package.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
