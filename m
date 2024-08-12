Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91929C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59BD3607FE;
	Mon, 12 Aug 2024 20:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cm1QdPSx0ylj; Mon, 12 Aug 2024 20:04:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 703D660808
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 703D660808;
	Mon, 12 Aug 2024 20:04:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 305DD1BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2ADC260808
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTwBaokT1nQB for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B084607FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B084607FE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B084607FE
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:04:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13B271C0002;
 Mon, 12 Aug 2024 20:04:35 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:04:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240812220435.34932367@windsurf>
In-Reply-To: <20240811084424.754299-1-bernd@kuhls.net>
References: <20240811084424.754299-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723493076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugmEfRWKj0kxwwbp+I7LpseZsyXvgLQmJGcEFLqPUwc=;
 b=J9we5f7DrOnvAX92q5K5gqrBahymFdVKMZkIcg9dnIpadJ6E/4Fx/SAkBsHG316ZRVYdNn
 syXS4Z5EeV6GwMp4qlgQcUK47q6/kCGWR58QwSHhjKrCWoOf0jl9hyabsl/0n3yQmU0T8g
 I1RBrm+jq0FU7gkRBoqremqDBHVH5g/Hk20VMUoWQPehJzO3J4y1HZn7wGtnOD4EGE4jQU
 yXFg3dF5YT1ufHXOarSJJxArSKsvjF9u8mFa6eZHflUp6lQxtVmr9IbZu39VE7ulsAqQSO
 6rZWVRI68zLUiyBbpz6+s0arnLbM23JHvlc6Pg0xgyT/zRMl6IvwB0f76moh8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J9we5f7D
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: link with libatomic
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

On Sun, 11 Aug 2024 10:44:24 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Link with libatomic if available.
> 
> Fixes:
> http://autobuild.buildroot.net/results/7ab/7ab583edb135b4b6948fb47e598d1f74e81fea7d/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libdrm/libdrm.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Thanks, but this really should be handled by the libdrm build system
itself. It already has a bunch of logic related to atomic detection.
This really should be improved there. Perhaps report the issue upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
