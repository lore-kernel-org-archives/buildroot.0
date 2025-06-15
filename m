Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E44C71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 17:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B83F760859;
	Sun, 15 Jun 2025 17:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrS9R9NyNDgR; Sun, 15 Jun 2025 17:37:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F08A660898
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F08A660898;
	Sun, 15 Jun 2025 17:37:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97BE31A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 17:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E1EE40626
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 17:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVrHQoOMaogy for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 17:37:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8204140624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8204140624
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8204140624
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 17:37:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4DFD5B00576;
 Sun, 15 Jun 2025 19:37:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 19:37:18 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 19:37:18 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250615161635.2499294-1-bernd@kuhls.net>
References: <20250615161635.2499294-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <8df51074b0a8fba78e9169c5762f1800@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750009039;
 bh=VW6mszUC30rApaNsBrjtQ55EmJ8hGG1QDPtkkcJJVWs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l0rpq2fuO1QhBQitUsoJiaKlKZOAzEDNy/a3TG7Bn3xZupcKkytTEYBLB67Xt6i7t
 xkbs4q4QHFxkPNnGzRMm6ErudN5C5RaVfFY7C7wvPCf/wWnCmeUnroFlJP55vh7tve
 nPudw9RDZD1THWU14ParDE9rFCNxozftSDcCLxcaIfAaY1b+ScXKJcYenxFjo97PYn
 XgFpB246ICguwWmTTJatRgqPpTq+SiZBYaHMYZzN67ziusynts9ORxp1moctak2x7e
 i0E3dntfn5Oj0LzllV9IJ/S2FTNfr8MfdoFpDK7XIpzbOKidZd6jJ59B2gDI43Us2C
 OOW/eTfaxlHHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l0rpq2fu
Subject: Re: [Buildroot] [PATCH 1/2] package/samba4: security bump version
 to 4.21.6
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

On 15/06/2025 18:16, Bernd Kuhls wrote:
> Release notes:
> https://www.samba.org/samba/history/samba-4.21.5.html
> https://www.samba.org/samba/history/samba-4.21.6.html
> 
> Version 4.21.6 fixes CVE-2025-0620:
> https://www.samba.org/samba/security/CVE-2025-0620.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.

For info, I added "select BR2_PACKAGE_HOST_PYTHON3" in Config.in,
in the second patch, to fix a Kconfig warning:

     WARNING: unmet direct dependencies detected for 
BR2_PACKAGE_HOST_PYTHON3_SSL
       Depends on [n]: BR2_PACKAGE_HOST_PYTHON3 [=n]
       Selected by [y]:
       - BR2_PACKAGE_SAMBA4 [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR 
[=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && !BR2_STATIC_LIBS [=n] && 
BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && !BR2_TOOLCHAIN_USES_MUSL [=n]

See:
https://gitlab.com/buildroot.org/buildroot/-/commit/286d85d7c45e078ec8df3c1e48ee08cd6a472f1a

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
