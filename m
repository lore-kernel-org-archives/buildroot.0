Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D87FC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D00BF60BE0;
	Tue, 15 Apr 2025 20:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtzgeAGn5mxX; Tue, 15 Apr 2025 20:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 080F760E4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 080F760E4B;
	Tue, 15 Apr 2025 20:08:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79099109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A32960E4B
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 684U6lRRn9Zx for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:08:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C7CA360D80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7CA360D80
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7CA360D80
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:08:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id F411613F8A9;
 Tue, 15 Apr 2025 22:08:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 22:08:25 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 22:08:25 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250415200117.2207610-1-thomas.petazzoni@bootlin.com>
References: <20250415200117.2207610-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <5c4b36894e36dfd8309d668b36b0a42a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744747707;
 bh=KI27zOrloDuXnX2PmNfdAIzAaJnJW8lpLXZPmuwU1Zw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QfNKKmIIX7h4odH6b/7eSnruvC/S38UbgT1YapqjR60srgPneDgOxFY8lckSEJotD
 D8GW5z4qj2Q5A7zkKw72gLJbPhJEyyA4HsDjR7kYEH7O5AbW55XY+BJMS9JRMwWGHs
 n1kGVcHXs7kY/1L1T6jDvKqxzvvpNvfLD6uGR0fERKxKg7z/ZsHRuI8gjVAWkHoGk8
 FqEJzXAda57RxmorQi+t+2qkZU+w5r+9GR4heG5kCKq3ZSXXVyRmRxATcA7HagonFh
 G/QCEow+3+HRyfmb9a03ssDSAWs91q4fzfCipMRuQmO5sR+Ywekxe2c0XZp6c17gj4
 pZRv/BK7+IZFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QfNKKmII
Subject: Re: [Buildroot] [PATCH] package/c-periphery: bump to version 2.4.3
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

On 15/04/2025 22:01, Thomas Petazzoni via buildroot wrote:
> Changelog:
> 
> * v2.4.3 - 02/28/2025
>     * Fix memory safety with some older `strerror_r()` implementations 
> in error
>       formatters for all modules.
>     * Build
>         * Fix character device GPIO support tests in Makefile for 
> alternate
>           shells and older versions of make.
>         * Fix cross-compilation in Makefile from Windows.
>         * Fix CMake minimum required version.
>         * Add CMake package generation.
>     * Contributors
>         * Ryan Barnett, @rjbarnet - ec31b39
>         * javalikescript, @javalikescript - 024a25d
>         * HopeCollector, @HopeCollector - aca6815, b5e53e6
> 
> The hash of the license file has changed due to a copyright year
> change:
> 
> - Copyright (c) 2014-2023 vsergeev / Ivan (Vanya) A. Sergeev
> + Copyright (c) 2014-2025 vsergeev / Ivan (Vanya) A. Sergeev
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
