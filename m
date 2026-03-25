Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570CB109C059
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 19:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14FF040AF7;
	Wed, 25 Mar 2026 19:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MoQpkKeCERgu; Wed, 25 Mar 2026 19:59:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D0B140AA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774468772;
	bh=opFDRpOn3L64CPJu2XrzYxM5uJiEcEH/dsgKAGiWQdM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BGdV6gw5vE1YAFuhKAqqpe1qVXooC89r5zYbwHf8jVHxREEIDMoZcwI8wrM9fUyTn
	 NNgQw4qHv11L75kDyShXE7GMTQMIXI8YMoUqA6z1Negua4OH2uGRza8EJgC990aiu2
	 P7vuH1OesQ2pex0W0EynZHdUjgoaTUHZKEGYHVGeohxJBCCeC2BxykZiGn9lwiiM+t
	 vBHallR2j4hQ8Iz9yweylnbtL65M2oLMYD/HWuIiiFruSrjzmMj90SSKyxHtFNtQGK
	 CHqNInsfYv0EaVvZTcC7Hm29ai1BJZI4Q7Jh0/tv5ReeEhJ8X3VJ51gxl9DZCTcOAV
	 ydhtFd5P72/Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D0B140AA5;
	Wed, 25 Mar 2026 19:59:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12F0D353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1095E40AA5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CT8J07drHNFy for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 19:59:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E87C40A44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E87C40A44
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E87C40A44
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:59:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3711778035B;
 Wed, 25 Mar 2026 20:59:27 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Mar 2026 20:59:27 +0100
MIME-Version: 1.0
Date: Wed, 25 Mar 2026 20:59:27 +0100
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260325134526.3550234-1-lazzer@gmail.com>
References: <20260325134526.3550234-1-lazzer@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <65dfd07619fd8ffdaaba507527829791@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774468768;
 bh=Lip62OExzEgFIibz5/QipfeT8f/tm+8H6QHq2UKhW5o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g5IwqQewICZ4DkI7EZVwc+LPZOigeBKya1vPKLDBsOVU2Sb+r0fYBynHoB4w01O/L
 vtLAwAjUxE6xiV2nfTvXkmeHXtCodMSgr4GhQxeISesj/L/nNUCuAgnwD4ANv3r6JC
 pRPqgf/i0e3PiTDNWZo5CWsh1UDgPGFmYWBqiPuVPJNQASfTJO/RbuHM2vOE4kvIxP
 lRpQrBl72NgAOBRHMIbfa7/ngr/8alrfOp6vqyfm8KPqUO/ok6S4jVQs9ZCVzVQi+w
 DQvb3H19IVewZenTT4cc0ze1JaqfGHGdDX28qFg2mt0cwHqRNW8EvoYXu6FbEt3ujP
 i2DAfBU8G6hUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g5IwqQew
Subject: Re: [Buildroot] [PATCH 1/1] package/nghttp2: security bump to 1.68.1
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjUvMDMvMjAyNiAxNDo0NSwgTWF0dGlhcyBXYWxzdHLDtm0gd3JvdGU6Cj4gVGhpcyBmaXgg
Q1ZFLTIwMjYtMjcxMzUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aWFzIFdhbHN0csO2bSA8bGF6
emVyQGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
