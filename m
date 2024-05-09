Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6620EC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A4BF60688;
	Thu,  9 May 2024 20:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0jsuaCVORkc; Thu,  9 May 2024 20:31:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34318606DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34318606DC;
	Thu,  9 May 2024 20:31:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1582E1BF98E
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00BB641FCE
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EzRJYz-3g8Z for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:30:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 599B341FB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 599B341FB9
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 599B341FB9
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:30:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AD60FF803;
 Thu,  9 May 2024 20:30:55 +0000 (UTC)
Date: Thu, 9 May 2024 22:30:54 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240509223054.753b943e@windsurf>
In-Reply-To: <20240427153045.2907889-1-ju.o@free.fr>
References: <20240427153045.2907889-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715286655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lx5Urd8hNbWj+hZbYEqNmkVb9qUgNgG1JuIqRl3UR8Y=;
 b=VT5NUciXxbV3MgWQ6ggHBhw+2gXWcYha+5YvELMqIkNukTfHzen+4FQuCnGXc5OIlwR1XV
 YzAP83HyQrBfi6j7LWNaRZhd0tOy4H3Jtr+FhFF2G9mWeeVLAZP12iwbmJYEkecWKHLt4y
 2ZXXezZw7yMz/yP3jpf1ZQaCTiiiBUHFxuHeTmD/q1RqD5d0ZN7E4niJfCfwovdEbrB3iM
 m13Cmh2KlLuxdgV4Oc56dimHc+EfzTvUEB43PxCKk4yQutkB48Vaq4Es0yfe04OKg97yiu
 NDDWMMXYd8qN/IdZtDLtHRKgV7mYthnH0kh2ykrWsVc1q5ONib/fwn2Uz2Xe5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VT5NUciX
Subject: Re: [Buildroot] [PATCH 1/2] package/python-mpmath: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 27 Apr 2024 17:30:44 +0200
Julien Olivain <ju.o@free.fr> wrote:

> mpmath is a free (BSD licensed) Python library for real and
> complex floating-point arithmetic with arbitrary precision.
> 
> https://mpmath.org/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                       |  2 ++
>  package/Config.in                                |  1 +
>  package/python-mpmath/Config.in                  |  7 +++++++
>  package/python-mpmath/python-mpmath.hash         |  3 +++
>  package/python-mpmath/python-mpmath.mk           | 14 ++++++++++++++
>  .../tests/package/sample_python_mpmath.py        | 16 ++++++++++++++++
>  .../testing/tests/package/test_python_mpmath.py  | 12 ++++++++++++
>  7 files changed, 55 insertions(+)
>  create mode 100644 package/python-mpmath/Config.in
>  create mode 100644 package/python-mpmath/python-mpmath.hash
>  create mode 100644 package/python-mpmath/python-mpmath.mk
>  create mode 100644 support/testing/tests/package/sample_python_mpmath.py
>  create mode 100644 support/testing/tests/package/test_python_mpmath.py

Thanks a lot! Both patches applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
