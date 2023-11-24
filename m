Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D716C61DF4
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 21:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6873B42140;
	Fri, 24 Nov 2023 21:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6873B42140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuAnCMXhe-Ix; Fri, 24 Nov 2023 21:59:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9C4542139;
	Fri, 24 Nov 2023 21:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9C4542139
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC0A91BF20B
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 21:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4CFA6156D
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 21:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4CFA6156D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZs73-mAoyRp for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 21:59:28 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCBAD61542
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 21:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCBAD61542
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C88AE0003;
 Fri, 24 Nov 2023 21:59:24 +0000 (UTC)
Date: Fri, 24 Nov 2023 22:59:23 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231124225923.59d08949@windsurf>
In-Reply-To: <20231123173957.2385041-1-giulio.benetti@benettiengineering.com>
References: <20231123173957.2385041-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1700863164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3fC6SvkfC6C99MM/25/oSKFVPWYEiH8U2tmry2IhUM=;
 b=YqsstrmaI+BnTn2v5wwpRAHonPyTLO0NHE9ku3Fr2SbftwyE+pwgN6GyB+EN6pkJTn/cYH
 2iAjJ5aONo/RJv/OVG9jAomntACN9AYGcRrmwWHA3UBsDaNZ2uoTJ7BQ3+pK2kC9Ebn+cN
 lw3QTGuHBkaZvUC1pDjgN64J+miC07fp7B5/bSl1OSiPKUByLwE7s/m3vI+CLeUnSNIWvt
 EHMP8fAyeC9SVGlZSMYS0hpO17ozwqJd5VExgiepIeALNyizeOBMW0unfGgktoBVsb30RK
 59odVZ+d9am8r5cKpWuHXjgAcCVsMvybHwPH06XZ970yrF/GCTJxU5GRj8W8Cw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yqsstrma
Subject: Re: [Buildroot] [PATCH] package/swupdate: workaround runtime update
 failure
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Jim Reinhart <jimr@tekvox.com>,
 Matthew Maron <matthewm@tekvox.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 23 Nov 2023 18:39:57 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> +SWUPDATE_CFLAGS = $(TARGET_CFLAGS)
> +
> +# Workaround update failure showing up with -Os
> +# Reported here:
> +# https://groups.google.com/g/swupdate/c/oHMihNw8ZHA
> +ifeq ($(BR2_OPTIMIZE_S),y)
> +SWUPDATE_CFLAGS += -O3
> +endif

This looks really horrible to me. Is there a compiler bug? Or a bug in
the swupdate code base, such as some undefined behavior that causes an
incorrect behavior when built -Os, but not -O3 ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
