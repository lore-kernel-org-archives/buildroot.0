Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BCC10FC442
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 20:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB14441029;
	Wed,  8 Apr 2026 20:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3JTfZwRhxq1; Wed,  8 Apr 2026 20:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C18240FB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775681757;
	bh=3bzc2b1Uj5HNz6DNWiK3R2LOCMS9TUtGoYoKluCZSi0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Cy1RBz8Q3g22J7GTIcDGjY70AcD47G4d0dhJbU7hMrlGKqdlKc1BRdq2wyFFJ0o8W
	 0ClIh6mMlYUJ3l3RGehSFxSlWMT43EeI9KczPDzDLc44cY+GT+TmZ3iwWsP1m75beG
	 IvNz/BdIJrnjSSJj3NKDoNK8L0NqEdDK+mj4mfssJOdjSNRjzYe6ihaP29oW6ooZ+r
	 xGHlIk+mZqS2T351dY1RDiiZOXuv8KvB7ghAeoDpoeTfsPYmCavOzxVbUa91u4KTbx
	 exHMx98eiQOdLi/nQUwPrtt6KA0oKDUnQ+hnZZk9cYsyOJGgFx5I2P8/iYBP7wluhU
	 S1rX6jA5pobig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C18240FB2;
	Wed,  8 Apr 2026 20:55:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B25A42C7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 20:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3D8B60847
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 20:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Fio-YNguIIX for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 20:55:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5A5B6058D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5A5B6058D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5A5B6058D
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 20:55:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 617ADB00548;
 Wed,  8 Apr 2026 22:55:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Apr 2026 22:55:49 +0200
MIME-Version: 1.0
Date: Wed, 08 Apr 2026 22:55:49 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, Lothar
 Felten <lothar.felten@gmail.com>
In-Reply-To: <20260408065700.2978798-1-dario.binacchi@amarulasolutions.com>
References: <20260408065700.2978798-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <4de1248c3452fd60e75c589ccc072313@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775681752;
 bh=6vkePzTfVgyIOrViDUZdvEYO4OXgpgd5C37/VSt3gF0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Nu2RVI7E2nKUbwhqKpuZAZLp+2MecGe0xlKUD5YRvvWpfUqjLeZas3MfkusxGgoZN
 6A0UOxwVGDPw2cysSfHzAMh0KdS2GOKugRTePRHS0/lioiVxCPMAmqL3aV8Hqy2TXz
 NeCrmPOLpMfkABdygLvWw4nokebllusIr0l59bdcU2Xh8WRihO8gYYwAS/MJYCT/OS
 wPFqeBwPReeLOd7y3/YbX94mQ7V7sef0/idx2dE4kpXBA/88n1keLduw4n5lJS1O6d
 XD9gkvtoW+yjq/AcE6p0HItVrN5glidxSZNYmMKLWFMjiMpSO3dWeBZODBYYwFFuVh
 jI+fpwg8Mc5QA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Nu2RVI7E
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglebone: bump Linux to
 6.18.21 and U-Boot to 2026.04
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

On 08/04/2026 08:57, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.18.21 and U-Boot to
> version 2026.04.
> 
> Tested on beaglebone black.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
