Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6255610854C9
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 21:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A5A460C09;
	Wed, 18 Mar 2026 21:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFIzhcPX2cQ0; Wed, 18 Mar 2026 21:49:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7424960DDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773870552;
	bh=u3FRWp6XRYfAvGmlSCflfJnblULDV/jUQ+dO77tVsE0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i3R/NBwsOSJzc6x4m7yv0T7vkD19mSKAiiEuqKyD1S5/HRsJ1fs2ZbMjCIHOv3wpp
	 uU9SWqO6dP3gomXHKCtpYTeaxioZYr3/VQLN3bjl1YON2adbf7PQ8eiynmrmrFGqvd
	 dq0GIxidlMYOpxfe6i7igvlwc+Zb+s1PJYULbj+Ox77oGf7F9rHSghgqvoF0P0Lm2X
	 vrcwy3V+zhd1UtXpcKDaPoLfbTTNBVZL6HR3YgtDfMayE5vIZZaKC04NdfQiGg1IpM
	 nvhknWz43n9KK9A4v98IDooc4pkt0GLrYaRCHbeEVK9xpF437ZQeQTy111bX7IJbCL
	 PSl84Cutuak5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7424960DDA;
	Wed, 18 Mar 2026 21:49:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 768F11AD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6823E40992
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0b1mm6pwe86 for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 21:49:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 959B7409B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 959B7409B6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 959B7409B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:49:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A489913F899;
 Wed, 18 Mar 2026 22:49:05 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Mar 2026 22:49:05 +0100
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 22:49:05 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260318205114.3455758-1-bernd@kuhls.net>
References: <20260318205114.3455758-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <e88a2ebc80c526f043be4ab1ee99da0e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773870547;
 bh=jOTceBpGd21y2MJDoUQBgwAgOWwX6w82/EW9hyFb4jI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NSkDribl/HpMmC0gHptdscsHiPbQc3yBl42GUEHLMOvjyAskmg2d/S9HQKBE7hoFV
 Wpj/ak+hwcXoAloMUMcM6kF28bMBGj4mBYC7iYnCBULzEMe73wT316bAqSMMA0dCVY
 +SdzzwiSxFe/msd75k0bvDULXk7HzHsRGmQgb10NY18xiwhNd9oiLu2Z560FSrCD+e
 2bKDuCk5ViiIRlJ1y00OjV3SKc9RAE77bs6GdcHz9n6003GZp5uWbkNfYsM3mOP+BB
 3ITtlMHS5OM6Ox5y6SGxC1pbOVI8q+BqJWDRZEtjxBD3NEyErP/wMXHhuF6zmeBJf+
 pMVQ8Fc/pKdEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NSkDribl
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.3
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

On 18/03/2026 21:51, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-March/000842.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
