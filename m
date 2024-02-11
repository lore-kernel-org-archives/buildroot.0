Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8534AC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5102984046;
	Sun, 11 Feb 2024 21:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QvM2s9nVE8gW; Sun, 11 Feb 2024 21:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55813850F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55813850F1;
	Sun, 11 Feb 2024 21:36:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E4781BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18E3860C1E
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Foyz27EaS69 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F125F60B12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F125F60B12
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F125F60B12
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:36:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E669FFF807;
 Sun, 11 Feb 2024 21:36:18 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:36:18 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240211223618.7ec20dc6@windsurf>
In-Reply-To: <20240211173323.2755976-1-bernd@kuhls.net>
References: <20240211173323.2755976-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707687379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NRh1QnL2pdVa/bb1qhCiHmtit/l+qrRz6Oqa1ct3azQ=;
 b=bLolGiR7bgtlwWv7qMuPrnVNDmJ4Jub0tdBYBmP6IikMX6udi4Vdhvqix0HP5HX42gByiN
 BF0BJBG3fUNzCc3pEotEOemlW2PDroWDQ57B16uOcKgBnk6oreW75Ce4zR1ympVfa8cPoZ
 L7wEieT2+pUpp/oigGz/zkKIQPGvV92quhT/E9TFMWeGLvcRkMJ23qwrADq8vwpXJ8ITOB
 BH5MJeDdnpjdMinxOU0Fx4Qhpaynr5tqxzQ9FeV9qCIDw5LBMDY/gvDDbkt2uQWtel0IGj
 Rf3KbWyGVIrs9JRGihrZFNf1yN4G573Q/ZA0//dHe4nmQi5BpilJNiPyPJTVBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bLolGiR7
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 24.0.0
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
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Feb 2024 18:33:23 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2024-February/000747.html
> https://cgit.freedesktop.org/mesa/mesa/tree/docs/relnotes/24.0.0.rst?h=24.0
> 
> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
>  ...e_description-fix-unknown-linux-3.5-.patch | 68 -------------------
>  package/mesa3d/mesa3d.hash                    |  6 +-
>  package/mesa3d/mesa3d.mk                      |  2 +-
>  4 files changed, 5 insertions(+), 73 deletions(-)
>  delete mode 100644 package/mesa3d/0005-util-os_same_file_description-fix-unknown-linux-3.5-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
