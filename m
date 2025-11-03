Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC07FCCFA03
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 21:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 989FD406D4;
	Mon,  3 Nov 2025 21:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HaVoNTx-HVSE; Mon,  3 Nov 2025 21:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27262406CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27262406CE;
	Mon,  3 Nov 2025 21:02:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 046E9462
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE70F404F6
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6yRVPBA9AlQ for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 21:02:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73E16404A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73E16404A5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73E16404A5
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:02:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C119413F89C;
 Mon,  3 Nov 2025 22:02:16 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Nov 2025 22:02:16 +0100
MIME-Version: 1.0
Date: Mon, 03 Nov 2025 22:02:16 +0100
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
In-Reply-To: <20251103135354.776-1-kory.maincent@bootlin.com>
References: <20251103135354.776-1-kory.maincent@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8473cd7b94fced20e0e0b52497f82869@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762203739;
 bh=yRaFyKUu/H1A4LjH478HZUjJm1mtqiBJMtoP42AXKac=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aaQYb/yK7sf0R1j+BhNTTPG/AdMdS56zLSwvsl4XZSlO62Tzvn5+qPtsGDvqp9jUf
 8VAzcUywRjZF6PAPubpiOqCEdFWMe7BbLOEewZTNnWnswhR4gxmsk0BnF5CmOznF85
 0VI7cGqqSesAum1BZn1I7cpSv+szECl8LPjy3w3FUmf8Dz+hroy5/mXj9l6m1syGD/
 TaTuT3zzBT2JCJ1vAmdOf1n5oo24U3q7woBLUkFtGqtMKIm3An0QNb+Yi6tzOR/XC/
 XaZREkwmrdM/ckOvTjCyYKSDAkCGnx8Vhw0rgms9n2H+7RG/kJNM12uXbsXGZWAgWe
 LPc0l03S9pwrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aaQYb/yK
Subject: Re: [Buildroot] [PATCH v2] package/uboot-tools: Bump to version
 2025.10
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

On 03/11/2025 14:53, Kory Maincent via buildroot wrote:
> - The mkeficapsule tools need gnutls to build, and the config 
> dependency
>   to build the tool has changed
> - CONFIG_FIT_SIGNATURE need to be defined to build fit_check_sign
> - CONFIG_FIT_PRINT does not need to be defined anymore
> - Remove patch 2 and reorder patch files
> - Include linux/kconfig.h to include/config.h to allow IS_ENABLED macro
>   to be used in c files
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
