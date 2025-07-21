Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CBCC83F1A
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 20:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E386C6E987;
	Mon, 21 Jul 2025 20:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gVF-pAzRUr4; Mon, 21 Jul 2025 20:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4E8E61530
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4E8E61530;
	Mon, 21 Jul 2025 20:19:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC990E0
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 20:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D34D340F67
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 20:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bvziB2ajtaRy for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 20:19:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB629400FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB629400FF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB629400FF
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 20:19:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 71D2613F861;
 Mon, 21 Jul 2025 22:19:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Jul 2025 22:19:22 +0200
MIME-Version: 1.0
Date: Mon, 21 Jul 2025 22:19:22 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20250618145857.1206836-1-giulio.benetti@benettiengineering.com>
References: <20250618145857.1206836-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7d2af0ec1bebf016adb99f4496efb6eb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753129164;
 bh=XT0tStyFFYO1pcjOp61xcid9LDCgftPoYXY87HeWqUg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PnPcX3nEcVO8Y0bwGCgLgOhWUp1ipZqvlSPOHKiInZSj1ZQ8UPIKq7npLI6Xbio4E
 w8DUD9qLiDY3rZjlpct8CusHeNdQbrbl+wAmtP7ZgAm6jjTcEz+idPl0BduM4gU/xc
 IIJArGBEfMjQDpk2Xf8LvPHG8oo+p04VdC9fIiGuD4+tVP5+9D5oINrX7z90U96sgO
 Dkb/U3lJZSvekKvVPz0ZD5EWB2UmxJEDeVM2lcZoa4yHSwI/g5dyXDACFHQqyDH/UV
 l+xqGFEGW+EhRpYd3kyj/FJAwLZa1La2wqpLCHxcmSFp5Jc2nz7rKCU4hVMkn01S3b
 JHXTpa6HALsDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PnPcX3nE
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: move upstream to Benetti
 Engineering Github to fix Linux 6.15 build failure
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18/06/2025 16:58, Giulio Benetti wrote:
> Benetti Engineering just took over Larry Finger(lwfinger)'s repository
> rtl8188eu since Larry unfortunately passed away[0](RIP) and there are
> pending PRs that will never be checked as stated here[1]. So basically 
> move
> github user to benetti-engineering-sas and update version with latest 
> that
> fixes build failure with Linux version 6.15. And let's drop local 
> patches
> that are now upstreamed as well. Let's also drop obsolete Config.in
> informations since as stated here[2]: "This driver is under development
> and has a limited feature set. In particular it does not yet support 
> 40MHz
> channels and power management". At the same time drop other suggestions
> like enabling CONFIG_WIRELESS_EXT or "this package needs a firmware 
> loading
> mechanism to load the binary blob for the chip to work" since they are 
> now
> part of the package. And of course let's update package's URL due to 
> the
> moving.
> 
> [0]: https://lwn.net/Articles/979419/
> [1]: https://github.com/lwfinger/rtl8188eu/pull/464
> 
> Fixes:
> https://autobuild.buildroot.org/results/d59537da8eb27d737718885dc81ec257a2791455/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
