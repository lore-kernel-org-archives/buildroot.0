Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8306FF885E
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 10:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 766BE430F7;
	Mon, 27 Apr 2026 10:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJYUvqbAHnTM; Mon, 27 Apr 2026 10:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA5AD42FDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777285191;
	bh=Ipq3EPxaeFxyZyZ6vYbFTsxL2+cganigXuIShdaQyfA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=LUNIhtPfx5VKX8X27eu4HNTuIceB5tRZKHz7gkOr51mQS8ya0tLK2biiuty1hY26+
	 dmCFfnCkC7tpQYAtxrxSuuiBt4P6Gxw3W5ZtSJUksaF16sTL6TrAFMJrBojBgQGIqX
	 r8A4vLtC/A2yAAN4GxSd0DkarXUtW83ftdXpQZ+VsPZFt25QUpuLpC39L7Z4wy5GNl
	 NHeuMqMKHZEWsP72+Auw3owuNy6w2MVrxrv84/myUnzEcHKDbhtrIMPs84GhnToxWM
	 vLrKHD4K8xzEoX3drswcnBWBznOXM3mGn+amcJnTrkHy8AAYPGgabyKxTwDKplVxIg
	 zZUgDbx/aVJ0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA5AD42FDD;
	Mon, 27 Apr 2026 10:19:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A00B1B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 10:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FF8542624
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 10:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAI2NdCQB71i for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 10:19:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4010740137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4010740137
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4010740137
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 10:19:49 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 18C2A2C82961;
 Mon, 27 Apr 2026 12:19:47 +0200 (CEST)
Message-ID: <16a7d5d5-cb83-4d2d-bb07-663484ccfaf4@bubu1.eu>
Date: Mon, 27 Apr 2026 12:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20260425101513.784747-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260425101513.784747-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777285187; bh=iyCWLAQ5ip1sJnUXy/eoQ75cStd5J2uGZOIQH9MC55I=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=VaFfQyd2uyASnQ9VdUhkxHr0US2EnrFjUSntjj0LYoZEfGCj/rdBBvkQqXPd87nWE
 kX3BH0WH6S6ca1gQUnZy4oVyPq44LZK6YXf/u0U3+weKT7xh3zqwC/USx4rreYQ8Gd
 vmuxGoKErr0IWuJQ7fkZq+lEp9HHSdAIHcOLg9rWm0gWO2xJdsoR+RJlcKiSEfnfW5
 5gNtoODncM7hHJGoujGfmTGaTsw5yIthau8D0tto/bY2tNiKyKoTPKDoCLykCLiE1A
 at3yPOFOpRhqtOYYGS/H4HwXGEcFj7cNkliVLH73R+t2QUB09f4psweFZhChDkFcGa
 DFh8WTblv/56w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=VaFfQyd2
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: drop obsolete
 dependency on host-intltool
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

On 4/25/26 12:15, Fiona Klute wrote:
> NetworkManager stopped requiring intltool with 1.40:
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/56b51b98fbb8627c4c09a483702e18fd8aee7ce1/NEWS#L434
> 
> host-gettext is already an indirect dependency via package/libglib2.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
I added a Fixes: e7c20ad548818fad6924f19e31ef2defdc418875 which is the 
commit that updated NM to 1.40, with that applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
