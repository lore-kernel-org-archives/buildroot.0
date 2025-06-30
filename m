Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A2EC83030
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 20:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F1DC84918;
	Mon, 30 Jun 2025 20:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKN0gQLHIjrz; Mon, 30 Jun 2025 20:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59ABE84910
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59ABE84910;
	Mon, 30 Jun 2025 20:11:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CF97223
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 20:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E1C861400
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 20:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onIgec_u-iRk for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 20:11:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD22A613FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD22A613FD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD22A613FD
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 20:11:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 395B813F8AE;
 Mon, 30 Jun 2025 22:11:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 30 Jun 2025 22:11:30 +0200
MIME-Version: 1.0
Date: Mon, 30 Jun 2025 22:11:30 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20250629205947.1033440-1-thomas.perale@mind.be>
References: <20250629205947.1033440-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <74ec857dee46b112afd6e70cbf590c56@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751314292;
 bh=Fk61rk1Rmup3I6DBcVYKGf4JR3TwHqlomSm4jFPQpvo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=df+e05RnoWo8WDmtxSZmKIL1pSlFBKgly3LYOjf4930txzvg2SawDKZv6XCwHtuee
 PXy41lWHFjc26b3q3ZXC/8tODYaKZbP9qJgcrXwfunODDpNEdCOPwFO22WeCX0EKQC
 6JBu83cLbPqC7FNIdzV9l67vrz0Qqekly9MD5dTQK8CqH+poA/qVgrLW4zuUSIDDWW
 SxM/BTPhtcgoK5s8YoIS5rRYwW+Xl7iXIp/qjQgp6gcvazwjX57DdYY/IGzOWOQgqH
 L8xaOZeHT5PDdI1PAmMf4ipJHFa4ffU92479j5VpLSusZMoNRR6Rke1cBYNde6K3zB
 FyJwMebVht6JQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=df+e05Rn
Subject: Re: [Buildroot] [PATCH] package/libavif: security bump to v1.3.0
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

On 29/06/2025 22:59, Thomas Perale via buildroot wrote:
> Fixes the following security issues:
> 
> - CVE-2025-48174: makeRoom in stream.c has an integer overflow and
>     resultant buffer overflow in stream->offset+size.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-48174
>   - https://github.com/AOMediaCodec/libavif/pull/2768/commits
> 
> - CVE-2025-48175: avifImageRGBToYUV in reformat.c has integer overflows
>     in multiplications involving rgbRowBytes, yRowBytes, uRowBytes, and
>     vRowBytes.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-48175
>   - 
> https://github.com/AOMediaCodec/libavif/commit/64d956ed5a602f78cebf29da023280944ee92efd
> 
> For more details on the version bump, see:
>   - https://github.com/AOMediaCodec/libavif/releases/tag/v1.3.0
>   - https://github.com/AOMediaCodec/libavif/releases/tag/v1.2.1
>   - https://github.com/AOMediaCodec/libavif/releases/tag/v1.2.0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
