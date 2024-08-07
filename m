Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F033FC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 19:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B38FF80BE0;
	Wed,  7 Aug 2024 19:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kctgvLCz--TK; Wed,  7 Aug 2024 19:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1402081431
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1402081431;
	Wed,  7 Aug 2024 19:41:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70EC51BF2E3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B0FF400FB
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_So0uusMzxb for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 19:41:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3999D400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3999D400D1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3999D400D1
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 19:41:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDED3E0005;
 Wed,  7 Aug 2024 19:41:19 +0000 (UTC)
Date: Wed, 7 Aug 2024 21:41:18 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240807214118.5087b015@windsurf>
In-Reply-To: <ZrNtL/si1xlTqM46@waldemar-brodkorb.de>
References: <ZrNtL/si1xlTqM46@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723059680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTw3V7nGNWi36kQZjJUJj6G3GhRaeMRNXTjPO40jXvM=;
 b=L1IWamzaSUA9EZmF9Uqya/ujMls5xgm0dms7uKHC1KCfTtx8ObLEuhpM+jwHyCzMQ1D0IM
 WQZ58DOVONGzavmh48pcCWMFKxDO6O/dJzEIrUFIsKqw0TIu6LfKdTsmI8R8BUXlwAdw8j
 vyxkZmffSsIImEBcHwyxCw1+nx0wPHItk6h+KUlOaE4AfLhK3/k/hg1Nl4UIS5h2RSgdVd
 QoSZWOXqNKpNelr7t52Xck5+vV1FFrSrclDJ9Z+5ltN46RmdSgeglqPPchxhM3nOEx5UEg
 BPr7ZzZeTh2+WuBJPku0EH0lrDgmVgO6riI05hstcO2HlwyR10u6P9EgWxIsPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L1IWamza
Subject: Re: [Buildroot] [PATCH v2] package/libjcat: fix linking,
 add missing intl library
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 7 Aug 2024 14:48:47 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> For musl/uClibc-ng toolchains we need to explicitely link
> libintl. The problem exist since the addition of the package
> in commit e52605c092d8eaa926da8720ae498a38eddb5205.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/58c/58c7ecbcfab96ebbc7a20291d4712cf64094b9f7/
>  - http://autobuild.buildroot.net/results/5d7/5d7c5dea0213f5a24489c397c5703c0601b2f12d/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>  - use $(TARGET_NLS_LIBS) / $(TARGET_NLS_DEPENDENCIES) for more
>    correctness (suggested by Thomas P.)

Thanks for the v2, applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
