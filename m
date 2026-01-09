Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F56DD26D94
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 19:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD50A83C93;
	Fri,  9 Jan 2026 19:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfJxpYqOulUo; Fri,  9 Jan 2026 19:55:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17A5783C94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767988522;
	bh=Wo+6mpr2uBZSm/HcxM5Llbk/5EOTALqcW77OKJrGyKI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Lohr1cC8RpvUra2ifRpyVImM2kS2aEX3Z8f63/4JnMkb/ZYJa7gLlf12GdKXBD7J8
	 GwSy9CzLjYzb5RPxvwZeAkJTe7Mo/CpbklUqbhQyxqgnufL9PSAVSXni5VlZoT1sjn
	 fdaJXCfsi2HdwQbaccz0tqHYfwklEmclANxJR4lgxaQOXW/iYsi9E3n1/jSr0I4SBc
	 ZWiBiJqGK4x7P9SBCp7z8EMlr/PtX3d4MAtXHNk5+vUS1ZcvERCDEd80kCULCgVAcB
	 bL/WqRKE4i5LB5rid67PBrbgh+bQqXuLzjyoeU/jjnkA7IYXk4xZTkZLYjbL0ezN7S
	 Z1SXgetlndd3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17A5783C94;
	Fri,  9 Jan 2026 19:55:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D27E1131
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 19:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B895C60659
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 19:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9HRS1UHk0uC for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 19:55:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBEB060F17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBEB060F17
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBEB060F17
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 19:55:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1DB7FB00563;
 Fri,  9 Jan 2026 20:55:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Jan 2026 20:55:15 +0100
MIME-Version: 1.0
Date: Fri, 09 Jan 2026 20:55:15 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260109183026.535792-1-dario.binacchi@amarulasolutions.com>
References: <20260109183026.535792-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <09e26a30a5125c66514b3853221222e3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767988517;
 bh=KrsdFhdmvvsFDqB2Aynl/REAg5oSQ/oMbSUMfWtOLe4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZUH+5lZlCnAsLgu3DAqCg6mk25NbjgatDd6BwRBvVThw0QZQxclm7s0LDTeUxU/hs
 5Viv52qUPTCD6BN1UmNIiiZDaxKQWYqA8+L4jTGhelB3MWyTL09w6p0IKWHRNY4EXQ
 foAAsTtPXWNzf+HLRI3yCf34Sen8kIhaxRUVYYEZt8tqZxZKgftFyQa9xZ20y4IL6b
 rMVwSByqRw43r4sFeR7XU8ZxBGF/M16QV0W55J4S3OWn77zAcf2QyQJC9ItchTxf2R
 3wPSP7XwJT8ba7PuMNQi6O5b/mR2kqfw0hKDfcJJJDQvW2KysEvMvRBVSD8+1wtAY2
 4tVdwzMuFaQBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZUH+5lZl
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f746_disco_sd: bump Linux
 to 5.15.197 and U-Boot to 2026.01
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

On 09/01/2026 19:30, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 5.15.197 and U-Boot to
> version 2026.01.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
