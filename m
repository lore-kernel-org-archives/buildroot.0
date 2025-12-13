Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288B6D5B154
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 16:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 192A380D3F;
	Sat, 13 Dec 2025 16:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2rcdGPvf1q6; Sat, 13 Dec 2025 16:49:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 245C280B69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765644591;
	bh=kNs16GdrI5xpEwWCwPfEPl6v8KkjxDFgeTiuAU1OYFA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cyasYjX3KuZm2N+8pPFy82HyPcbZIBAQ99857AicXBpDFg+n4iyrrYYDFSLaFbDya
	 H/l12fE1vk5kIslqUYYWZ6t76ZSM8E6A6N0VD79FwTQ2RxqovlCta4CopDsbDrg++l
	 hLFTUDS2oVdLHsKVYaEfFysKtiXjCx5Dh2qVERL4VhhZiZAVwqLFuZZmdeH0bvrgCs
	 djeX0HfubOb5aYN54qSMZAzeDZCafAIwYBj1aVHbovor301TSmKdQYShnIoRV0yrf3
	 QhHaPZa/M72VSBuHxk4ndgdCqRux+ZSb5SB3Da47K/YDbLFFZnlgPhe85jdmDYAxwF
	 r49HSaBtCcwhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 245C280B69;
	Sat, 13 Dec 2025 16:49:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A536613D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B05880B69
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2GvXrwxJ8td for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 16:49:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA5C780B4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA5C780B4A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA5C780B4A
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:49:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C9946B0056A;
 Sat, 13 Dec 2025 17:49:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 17:49:34 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 17:49:34 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, John Stile <johns@msli.com>, Alexey Brodkin
 <Alexey.Brodkin@synopsys.com>, ARC Maintainers <arc-buildroot@synopsys.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour
 <romain.naour@gmail.com>, Alistair Francis <alistair@alistair23.me>, Maxim
 Kochetkov <fido_max@inbox.ru>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
In-Reply-To: <20251211161615.503688-1-thomas.petazzoni@bootlin.com>
References: <20251211161615.503688-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <15a5ac3d391bb8b83ba2c3c504accf5c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765644585;
 bh=IKftTbNj6XcQF82UiepqmwhVYydsduZJjtVQD/QdP0k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kOGcbiXjf/urolwZrVt7kLfwKGYa7fTOtKLOn6ZswnnQsnyx6+93NAOLBD20jcAC8
 tT7UtBnujotnayjT0wxQg/W0olULVVwLSuFLnT8O65/8sNl0jPTOV8JIqcxYkYvqbX
 bocdw3pytWZYLz1uJwcgDWoFLNh/m1TmB/v464VDGl7i2fL4k7eE/ZddsCuqcNKdGR
 343pXzpYQuo2TATDGSVKP3voZ1Jz91NPsmtxScoVll7vUluouZRQyZYgBiAdQExPzo
 jDEq/llXBCo/EB4z+CylbuQYk4ksd/FsajSOfPY+l+TPa/jPTYxNI4nbtIF90aEBKd
 RuRd7uAOG1mig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kOGcbiXj
Subject: Re: [Buildroot] [PATCH] arch: drop support for ARC big-endian
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

On 11/12/2025 17:16, Thomas Petazzoni via buildroot wrote:
> Alexey Brodkin from Synopsys says:
> 
>   I think indeed, we may remove all the big-endian support for ARC.
>   Reasons are since introduction of ARC HS4x processors we no longer
>   support big-endian in any new processor IP, and even for older IP
>   which used to support big-endian it was rarely used... so basically
>   there's no good justification to spend any cycles on big-endian
>   support looking forward in this project.  I.e. BE support in uClibc
>   could also be removed if it makes any difference.
> 
> Therefore, let's removed support for ARC big-endian.
> 
> Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> Cc: ARC Maintainers <arc-buildroot@synopsys.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

For info, I had to remove a remaining "BR2_arceb" from pkg-meson.mk to
fix a check-symbols error.  See:
https://gitlab.com/buildroot.org/buildroot/-/commit/2d570f8369342590836378e86e3d2a65f7fb6fc3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
