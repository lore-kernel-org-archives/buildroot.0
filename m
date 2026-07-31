Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB992C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAB8660B65;
	Fri, 31 Jul 2026 12:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Us_w7-t2L4vF; Fri, 31 Jul 2026 12:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2395B60B5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499550;
	bh=7DN44px0w6j6VLoVgDm62lD6cJVBJPaoNW3kxQa52J8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cZulHhqCvIuVIMY1mB8pzmkpUjBiqaTFgAy1d//YNUIKv2/Nx0XF1L24/nno6I4Uw
	 YEYJeONX1CwiH3zodqiI4IM5atjKHSFPkRDWJ1DkSoVXvxDrOILbIXVoKyibiklfht
	 6pGWO5N/m6RrLRyDq1NwtSeGDgsvB+lqzm6UaA4nuhggQfSMAxmeo+aSDqVQsQjw+7
	 cBRIJUCG4Gl7qvekAdxh7KKnK+Cp7d3Wvhd4rEsBLtC2UGQE/aNol05lbIAHOqMQGx
	 kb7yZbUcSrc0vVP3ZtFcGlWax4EK2/K2VdZEU++Rb2UVGt0UgMGzDJGJ6nds+VzkRI
	 8NGV6FYkF2IBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2395B60B5F;
	Fri, 31 Jul 2026 12:05:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87F2C27B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76E9460B4B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Mcl1LJ4T4Bj for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28ABC60B35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28ABC60B35
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28ABC60B35
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:47 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-69c1220bd51so1453992a12.3
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499545; x=1786104345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gssJDFbUXIsTThQdS2KOoZNJQ4B/TVWwxjj1Mlqwbik=;
 b=U0vhB1Z8D7eCKt4+xZcX+VFKajGfBsozASUQ0pH7Tqkd9ehHRUDNc/mMmVW6/RYvgX
 nhHx97DoIT/KaXWCo9cFZ2ApWkEtmqMJxCpoXVRtliC6FltdVBecTjwAGQFTTG1dZrKJ
 lcB8cgNc6yAr/1DLE9CZNmvEs+5Et5qphe4J028JcS7Es53h+Y7RN1STU5Ny3omi4WYI
 vXuUj0UldZqbzwfiZns46ZwkD9LP9bcwdypGY+prQB7WxvA8lkSAYUZMYoR+s/7Wcgh1
 Tt2uqMkoMZW7ijzSWeVjhkbi2ZASJGe7a2Lfqm7xTfq9gHv9rmTpY63juIVa27Ms/uxM
 Vc6A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqt8aTif/patJqnxWG05TA7Y44qMPKl2Z9fXOs+pSbSnYNJSymfNBnA0/a7JY7ddj3tSbu2o365ynQ=@buildroot.org
X-Gm-Message-State: AOJu0YwrlXV+8rAVhqsaJNxzQgsKVIA8+3IpiLWvVl+XficX3YHgVzF0
 GdE6YehWDQjbaDTMUSq+gIPJ0ZaMvm2C6Tg2pIvhVNwFQLH/WblT1LRoLo2OLZp25wE=
X-Gm-Gg: AR+sD11iP/KYmvQebZFP8QHIyKnC6AtKTq02ES01KSx1JJrYRG5e+CHR2MK0aaTfxeN
 lB8MPF3TO4pstbGBUfDXuddiTmgpVUBZFiOnBOCvNyhnIshFwe2pcwu/zcQSUSZmq8ED2Xcbxm3
 AjDjeuAekjTXKttTX7lWYr4bMVQwOWu8N8QHdtCN285YMlhFR7IM4NLkYuEorbhYDnk9+Nomjbu
 sQTLdFfOWP6T8byj3iBYmPSyE0YKCET5WarL2HTQICWRRr/83/g6cRO3f9Vf+ReyHek3pSp1OrS
 DvkGxDPsT/cl/yTpFlJhX3oWGt68iN/jfKHJMMY4y7bMDypE1B3YYgHSiuBpOs9O/56KTZH7kfA
 JZ3TiiAF7CIfySjM/fgec1dh+iytwFl0MwlJf/C8pItqhVuf9KAgW/G8QIM5et2nPSf/1U0JlLe
 Fgi8ueSC+W7gjF4IiFmp3h5aBOawrwgxfJA+6XYtPaUBGysTegX275m8HgOeawB/f8SwVwj8Ji+
 /dvxdsCr3ylPDceZi6cB0j49Q==
X-Received: by 2002:a05:6402:5057:b0:6a0:50ba:3382 with SMTP id
 4fb4d7f45d1cf-6a098d1bc67mr870805a12.30.1785499544984; 
 Fri, 31 Jul 2026 05:05:44 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd458bb4esm4537029f8f.30.2026.07.31.05.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:44 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:43 +0200
Message-ID: <20260731120543.3993-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722153224.624762-5-fiona.klute@gmx.de>
References: <20260722153224.624762-5-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499545; x=1786104345; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gssJDFbUXIsTThQdS2KOoZNJQ4B/TVWwxjj1Mlqwbik=;
 b=ZDZLJ50WoOcFo+Ymf45YXObiIbNec/xFIasGffseOqngC9scR6e9ACdRjc/gaFASD+
 xowjnfC7H+Of625a/B9Qe75av0S98a1BQqF5B2zQCtFrV4JbL8vjasR8kiUMt2Ga5TBe
 ffhOTYm6fDHiccVce5Hgevqr4koXY+swOZylwA0ZG4gUnEydJ6XqF1UPI6e6GgKQUsKL
 4aObW8GLvqDl0G7I7rmsaJi2E05dUs74OWE3w1g0WvnM1ZuS9Km/nhokY2ZUXzwsBGL4
 7wW9QAWSftHuGou5HUli5UThZ9g0E3C42moSRbWV6Y675gK98RmhFlBNg0U13qfAOc/1
 BVBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZDZLJ50W
Subject: Re: [Buildroot] [PATCH 5/7] package/urandom-scripts: add license
 info
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The package is part of Buildroot and thus under GPL-2.0-or-later
> unless stated otherwise, as described in COPYING.
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/urandom-scripts/urandom-scripts.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/urandom-scripts/urandom-scripts.mk b/package/urandom-scripts/urandom-scripts.mk
> index 89abdfff72..cc5f28d13a 100644
> --- a/package/urandom-scripts/urandom-scripts.mk
> +++ b/package/urandom-scripts/urandom-scripts.mk
> @@ -4,6 +4,8 @@
>  #
>  ################################################################################
>  
> +URANDOM_SCRIPTS_LICENSE = GPL-2.0-or-later
> +
>  define URANDOM_SCRIPTS_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S01seedrng \
>  		$(TARGET_DIR)/etc/init.d/S01seedrng
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
