Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A57EC71136
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 21:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFC1F844A5;
	Fri, 13 Jun 2025 21:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80ST_Pe_nx_o; Fri, 13 Jun 2025 21:15:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFE5F844A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFE5F844A1;
	Fri, 13 Jun 2025 21:15:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C342E151
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA16A4007E
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHPV8GBzKcR9 for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 21:15:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ACE70405BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACE70405BB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACE70405BB
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:15:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 190C713F879;
 Fri, 13 Jun 2025 23:15:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Jun 2025 23:15:37 +0200
MIME-Version: 1.0
Date: Fri, 13 Jun 2025 23:15:37 +0200
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Bernd
 Kuhls <bernd@kuhls.net>
In-Reply-To: <20250612100515.1133081-1-peter@korsgaard.com>
References: <20250612100515.1133081-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c968338e9b62fb92c32720f0d16860a4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749849341;
 bh=uiixX8VQC/Rhspo3zFh33KpZljqmTpjxaSGnIT9vRy4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gD/ALNMhmBlwj+z3SDjfo2cOv/vTwAHHGHPIO1Vnl3hgU3CKJHubGFsHLbhDrKmJB
 lS+u29ERkqsXlcLFSOGKzUyKdInq4vX9EmkQTk15mBiDvaHueNpqAX24kH6pSydUa2
 sLVBlInJVERlVZKic7JxQFwTyEkOdEuzvLXll+XSHgwPF4hUKp8XQ0yio9OkYYNh0Q
 iqJjr6NtLh7EGLjD7mZ0E0w8D7zroJs00u59QJUyniDgCPApO29E5Mm24mdyl+roGb
 a+39OF7ew0wxWS7NFTkDKJMRsZF44B9OlGgWIdIcaD0dNUnuNvNRP2RCocKDoIPA5m
 4yNPMtkjdwz0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gD/ALNMh
Subject: Re: [Buildroot] [PATCH] package/mesa3d: clarify MESA3D_OPENCL
 dependencies
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

On 12/06/2025 12:05, Peter Korsgaard wrote:
> Commit fc7c7d74aa61 ("package/mesa3d: add RustiCL support") extended 
> the
> BR2_PACKAGE_MESA3D_OPENCL dependencies to include
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS &&
> BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER) as an alternative 
> provider.
> 
> This is correct as in the kconfig language && has a higher priority 
> than ||,
> E.G. A || B || C && D is parsed as A || B || (C && D)
> 
> https://docs.kernel.org/kbuild/kconfig-language.html#menu-dependencies
> 
> But it is somehat unclear, so add a parenthesis for clarity.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
