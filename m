Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CBBC55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 16:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D5880C7A;
	Tue,  4 Aug 2026 16:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gs-rizI3AX_8; Tue,  4 Aug 2026 16:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DE0980AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785860446;
	bh=YGJBplYYoMQiEG5kl59aD+Pxyz8R5dCdwO3Vvilc84Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q0i8y6Rlihvyhu218Pm7vPYs000J/1tyVGCZrTMyxI7jVlBDw1Jw1QSHKnhzw+GqZ
	 7GYT+8sTGPAvUOwFKMiMdW723YIX2ReKg9XXdJfBoInICqnooyA4juab+07y9mkd6c
	 zhUSLSBgmLHqM4AY3iEj4kPB3GHTBh1LTLgEeUTA5Sd5fnP3In66AkMylwdQQomss/
	 0/50VSTzPj/AT2jB3ZlSaW0r5065rBsMEOE8Hfj8duczd9IaH7GJYUZHyt2Ft7o4Th
	 hZcD+DaFE0zNHRfrvciQLMjC5DNUKs0yiE0F+4TCFzePt9xsfIb0EpT/tzzmxt7fSd
	 UuMUv+6c2UKtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DE0980AE8;
	Tue,  4 Aug 2026 16:20:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B96F2218
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F75A40064
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmyb5nqsp1dq for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 16:20:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE53340135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE53340135
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE53340135
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:20:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C49C4B00573;
 Tue,  4 Aug 2026 18:20:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Aug 2026 18:20:32 +0200
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 18:20:32 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20260804070113.884891-1-neal.frager@amd.com>
References: <20260804070113.884891-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <92d0c2300cfe6a3bab37051d788836d1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785860441;
 bh=gF0UOe0fWxUbSL3ue3Vpt/iTEbC+jswetkbpccSAF+0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AfrkGJcktmTPs0aZr1ptyyDl04yxPD138QMf+qqhZh16IW/hgRR1QEKkmHkesk3Z3
 kUdWMafsqbIuba4nLPe7Lne9HXeLmCkvDu7z0I0+Fs8e/cI6P+mOLoNveXTmn6YCaX
 7xDaQ5tZBUNAufZmRta8nxFFt1unqg6RvfoVwdWJrEIWA+oJ9DPI46ZKc/RLme01sa
 BkhtuLKF16omVrt+ZAySMs0nBYcBUD7GjjL7Xl9dZ/acc1aivfPUMsvKIhqqa8jMfU
 5butffa0JtXCMYxR26DUJjGppBg1EdLaO10xpCRSt8DhiS2GrKSmj3rfzJLdIE/8vu
 vq+jl02Brn6oQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AfrkGJck
Subject: Re: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: bump to
 binutils 2.47
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

On 04/08/2026 09:01, Neal Frager via buildroot wrote:
> Bump the binutils-bare-metal package to version 2.47.
> 
> Release notes can be found here:
> https://sourceware.org/pipermail/binutils/2026-July/150449.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
