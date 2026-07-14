Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8399C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 10:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F89B81198;
	Tue, 14 Jul 2026 10:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjQ41xEb1gEW; Tue, 14 Jul 2026 10:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77649811C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784026729;
	bh=QhaiOJAkzs5c+t2lYbEqM0Fo5MxhoOIuVWtPTYOhmQg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NumCOj9rnHroXe/Zt2Sc8KY6r7X3H7MfCWEUgSKJ/5xAiT3eOKFzY5q+V9lL7ZYa4
	 2/Uy3kQjdvzdezcy64E/rimFpf54uWa2GUaMHiUM6db3JT/a4PxrWd1z2aYe4x8Z4F
	 atN9kTPhda0LQwJTJ6UVlR2jGtBSh1CW0by/3MB3PhmWe8SkLq3KJkm9p8z0s5gqh4
	 z/WW+lBJxRTne3CP0+oF329HEJKHIhLq061AsQ+I2GbCBsnvhtRUWyROKWNyCW87Tw
	 AO9D8bqnYahLaMnufiV/LoYavcLg/QpFta8sRM2QYoiNQtTM5/QwzzzSHH01cyohP8
	 E+aiwSbb35n0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77649811C2;
	Tue, 14 Jul 2026 10:58:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52484128
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4452B401FD
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrXCdU4XNcqR for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 10:58:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3DDC7401D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DDC7401D2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DDC7401D2
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:58:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 47016B005CC;
 Tue, 14 Jul 2026 12:58:43 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 12:58:43 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 12:58:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Theo Debrouwere <t.debrouwere@televic.com>
In-Reply-To: <20260620154343.2708220-1-bernd@kuhls.net>
References: <20260620154343.2708220-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <5a7cd56d2ef8569b4bea4d34e5188f94@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784026725;
 bh=QttRmT5yI4+Sw6h/9Ry58wLm75/K2LVobCweapjBhOE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J7Yit3qSN0S1DDjhHvsjR1U1bs2U+d8XvfqbHmH1Na06Q8syoWW1yxgv3w1NkyhuN
 wdLzouekHtG4tvfC4SujfC9nbrv/3pSLQPNV/gTctoKVK2B7rZUg/1/2JBx7TLqxRX
 4WzCd4IU/L0t/kH2h12W5GZTFP8LGhs0i0r3tjwUf5jhrvg/Fs60E1+iH9BWj3QiPy
 ffZl1OM8u/mhnxlOZp2Es7YesNnWunLpvVI6Rf3luaWY8IhbnZCtY//EvWttAG7lK9
 3u5x/Rc/Jvq0+ObQXhIOW4KwJJXsqt5c8u4mDiPRlIQ9UaSS/FWWCb3d063ofQJV2t
 BwmiWTwEZiPDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=J7Yit3qS
Subject: Re: [Buildroot] [PATCH 1/1] package/pugixml: bump version to 1.16
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

On 20/06/2026 17:43, Bernd Kuhls wrote:
> https://github.com/zeux/pugixml/releases/tag/v1.16
> https://github.com/zeux/pugixml/releases/tag/v1.15
> 
> Switched tarball hash to sha256 hash provided by upstream.
> 
> Updated license hash due to copyright year bump:
> https://github.com/zeux/pugixml/commit/710052066cc0a7210d7f554196ae43bd1cd9da3e
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
