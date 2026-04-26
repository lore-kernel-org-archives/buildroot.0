Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7021FF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 16:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D69A61008;
	Sun, 26 Apr 2026 16:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Td_G1E5oy2rt; Sun, 26 Apr 2026 16:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BA83610A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777221252;
	bh=Nt7yilKHDVffWzgW+CoO+8g40QlAXaCHPDtvfD0s99s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LSt6aYHT13+ehqv7d9PxhwjjaUM/HLak/UMO4NTcpCls3lzCkHS73XHMZRQUmYu0s
	 JcUdJciIYlXUr4HpplC1aPM541NEOC9vxUOY3x/j6h339JYc8a0X+fOY/ZUPOrnqRg
	 QjKR4SR2fAlTQn6y4HvWz9D6B7Ew+KQYU7D0rlVzZFitCVgoF36PIqfKnDDENnE8lv
	 cMUvU/qyMOe5pbD5JoRBi0XD0IqhuiA3YoR2FxENxMBkwBr//6La9sBdCt2O/0bie8
	 VKLhaHxjyokQMGvFPj23ti+afSEzGDaxkbKpIsfPgGYxS5eUfryBnirVknB+claudb
	 dDvAANN36FkIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BA83610A6;
	Sun, 26 Apr 2026 16:34:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA68A2DF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90C1242984
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-oNfiCk4v1s for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 16:34:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D8EB42265
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D8EB42265
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D8EB42265
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:34:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 671FF2003AE;
 Sun, 26 Apr 2026 18:34:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Apr 2026 18:34:05 +0200
MIME-Version: 1.0
Date: Sun, 26 Apr 2026 18:34:05 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260426071936.391076-1-bernd@kuhls.net>
References: <20260426071936.391076-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <49736186d48420fc93ce13aab920394f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777221247;
 bh=8iYCKaVbzU+CZP1Xxo5r/jZIscca8Kw4/pC9QdDSWiQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Oq4nstbkkYlFn0RKzcjWk2VfHRcGaxJkGdeZkPR+mY0riVDbSbEyDK6gl6f8paK/7
 pv3VOmMSgW9EMoz5CFjO0Vjw78qWoqUV9zheKUaboW2KJ6fyaJTxvZ0KLPcZL8WLC8
 NwXFEIrTMq9fohiefWPlrjgHrCZkVLen89A0Piowygeu8eKpfaaH2QK28UdF1qAF/k
 J/N6kXku43JUlIEEriOrU8xFqXBPKiqJIbMVy8NjqHWi6zf7+sha/O6AGMzk0vRb2Q
 Swk4YMnEi1WcMKxVAxHAhdRwP8E9iYty3Yz2BrTRpKbARMEjw4SQ8zjj9p5u8QzpsN
 05z4ggyOwGsyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Oq4nstbk
Subject: Re: [Buildroot] [PATCH 1/1] package/libxml2: security bump version
 to 2.15.3
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

On 26/04/2026 09:19, Bernd Kuhls wrote:
> https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.3.news
> 
> - parser: Pass userData to SAX text callbacks in xmlParseReference 
> (type-confusion)
> - entities: copy children in xmlCopyEntity
> - c14n: Fix Type confusion in xmlC14NProcessAttrsAxis
> - python: Do not decref string after adding to the list (double-free / 
> use-after-free)
> - c14n: Reuse tmp_str, xmlStrcat reallocates *cur (double-free)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
