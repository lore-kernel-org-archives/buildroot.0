Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5984CCCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 06:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFC3780F6E;
	Mon, 19 Oct 2026 06:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDPmvxv_MGhZ; Mon, 19 Oct 2026 06:02:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C364880F55
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792389721;
	b=SEzXIP45us039RRVK4P8eunpfpI74qDTHDqvSwjUAQj09t2XZtPsG5JpYk0Fopem8HlX
	 gHbweLnD9tT+JwRz3UDpkZ2ZOvaLeMDatrfrbrYVDrBs+mNGfZARSZ2+V0lXoXTQrqK3W
	 RQANvwBCWFfL3n+EwvFpbZy6g0Eyxk9igigSrt1qLROHjAMqLX2v/Nk7gYiUelhn5hfmI
	 P+Fw+wM3kzWqQkev7STWlAXGd6pDQrliaeQToUy8pnUET/MwnoyiRc5KJ7yFUKgLlLXBz
	 KRUiKkmTZnuHXuCVRo72r26TLWblv9hT1UFXGISoNNg7DaYPMh4EJ9lZlvbU6c2Sm+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792389721;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=w+hHSFoAIc3wy1N0M+OFYiZfatuOe9vpFK4r8WN4Rjo=;
	b=hn8gOwdU7ufTeGNEzwYY+mDi6XivDMQKt5QjlWpjeWVr6b9d74WSsoEwa6gcVuy+ROom
	 yGd7whvq7DIeRiUV25P2D0F1lqWixRVBhin/w6L4HGjflV0uW2QS2oiNsad9eWyJ+menv
	 4HvqaGjKhBdB95kcXuB5XeN3mT9woi2iwxn6ddgTlKXPfdobt8KxAduSTg77+mDsgRMBZ
	 oJumuUAqTNpIjnjx9mNKN0X5eSGgwNLFrwDCyuJOQGD3RqqMUCvNMoogV701d3nm+YrGI
	 D4uANA4PAIzYhboci6zGsPfr2N0iYXGOzF1Mv/87nFIVaOaMu1/9S2HI/c4WN8AcQNw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792389721;
	bh=w+hHSFoAIc3wy1N0M+OFYiZfatuOe9vpFK4r8WN4Rjo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LGweoReN/p6O0ZplrSRIam5h0SYL2lboe1QYh+ykFomjREh6bzCkEOEfryzy74bmb
	 OHYpUT9p35T18GE0AC7JbU6hM2Zeo6/dbN9bmUeHpM78W/u5OWImTzYwTCBO/68yQ7
	 4b1w+S+CR4QD3lytIob8xcUUkxwUgaHf8CcOmvIy+6bGO+6mNNjhTHc2Jow6iMben/
	 ajg88ULcJqagflDQh0iN5+lSAZqO1BDTzjbwPJ0AOzhvCReBGteomKI9YHsvLyPKWo
	 XWYQApai9/GPoWjZzRILQe3Vt/cQZBiP8FeU+F19SZHHT2cfoioVkCfwxrqnUN3tUN
	 L6NqbwP6sw1Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C364880F55;
	Mon, 19 Oct 2026 06:02:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42F1F279
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 06:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34BA6406EE
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 06:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKrBGbbYlV0n for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 06:02:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 214CD406ED
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792389720;
 b=kNXnq4MdPkem7nTTE8FIXYwd1/0Yr1U0U8C7Od/vb8rNfiMRp+MklSu4nTkMpej4Mi4d
 mukQYaBHb/JEA+exM37GcZMI6xbMVCGMzeZuQhy7zcBMgtEHhyBU8hdicMe13U99ja2Lh
 jdOhfNsMBgXslNwHX/DGhCqz3yg2mF4BbHfbqGsoME77cztz70gt6Nqqsp93Dv+S7TQi8
 IMSJLdcqtYDJm5q5XESOryGxqHOFT6RExD11lyLoQGN4kDY7xK9TwXfSN41WdO7eHcwiB
 fYI2S3Umm1LMtz3fzc8AXRVtbtiJRamsPs0idH5/Uzxko80Jh/BV/XSMly6JsNjmp9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792389720;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=AQaALSv76OTse0uAgE/F5JS5iQXs0GtPS6SDusGl6QI=;
 b=TCZIxkBC9Uaqw0PrjqoLOMYu16AZ0FI1wzw7tcbP/Mh6YAOXU8HEVPrg9OEYGcreVAUB
 Tk2vENIrc5ursEEch5TwUNi4xHWMnazmfRFQOWKJ8spvzWp2A7A8h2UZRszspJT8uirTQ
 HaBZlbyuRJ+XncqMjs1GiNhFLb/0wQ/TBJpx+tcvO7qEC3C2OQAahlJR31/z+8XUnbNY9
 AsAPbR4srM5IjPv64nXv3FiN4OGXVGlEyjpXaRjowSr3trE7atEtzp1MHMh0mpzhQSqfV
 UD5VN5/3Rdhd2nRpJuEw4aB3kl3DOSWciBqmk192T/G77jdrwKg6QjMVKLPGRmaEgmQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b="pQjmQ5/D"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=pQjmQ5/D
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 214CD406ED
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 06:01:59 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c34bff61551so230253866b.2
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 23:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792389717; x=1792994517; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AQaALSv76OTse0uAgE/F5JS5iQXs0GtPS6SDusGl6QI=;
 b=pQjmQ5/Dqj9WkWt1UnPdz9JOiUcakVaJGHD8zPmrlhwy8zzo/ErL8PYAViDXExURcZ
 fdBo3musQTHP6NmBx9dhvsP87ngn+zOkr8i50YpsiaNH2V+Py/d/35Jre7jd8mEoeQx4
 g/CSv8yeFNJu9wXqifolg4aFN1u9DDdWAS7BSZhK9ECODc/+AsCjBW/Wm6t/YCdeGgxP
 GhdDvOsJH5EuvhCHBv1TaJBvMzeKLbA2zcCmsBee2ZT9SgJXuuhWbcD7Vqeutmc8A1v1
 BUEQLYXpqZArBexRDNoiHkKG+D0HEoWXyb91u9eL0CLTHPZMQvs6ASm81h7BVQqYdjvD
 Mi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792389717; x=1792994517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AQaALSv76OTse0uAgE/F5JS5iQXs0GtPS6SDusGl6QI=;
 b=uocS+OtTZpSxxGmNKD+I3+XLNoYj8NoKh6sJ+W53VkX9u1+6IOdSOrR+AbxuEOM/4t
 66rsdNp0TRR6dA4GlboPfApmyHj6A/IcG+K19KmaglzHdcHwQJpMQXJiZYJ5raINA6vT
 AdjYsKRBGZJ+61DINv0VD+JXd1OSUE9MO3idLdp1tNoQwf8mdRPEhVVwBTBppi5/RxnY
 CosHSIUh7VTz1bau+PK5VZI+Msn+BSAakBtkfRr2HUGSxfjdbWsjLUq6nfpE3XlDmVoJ
 SgZ6IJ5edUxVQJVpRYldl6zbPxYcJxaXSI/STHI8i74Nbd2jFgJIpot327e+Vy1PSRsD
 KCyg==
X-Gm-Message-State: AFq9FYJpPtf1OY0IQ06gM4YCxoJcriTQ4T6eoYAAXGzRq2HSwY6ojnE8
 JfOe2tcGx0LtMthXATmO2ichvgPf428k9BZlt96h+TlqXOTKRvwtqbpxWFWffA==
X-Gm-Gg: AYBFou0igDkmJHP+B2m1Wt0KoPDc6aUkmmfo5RQkk9kM/cRLhSvkXbQKGe3AVhTwvsc
 bB506Kav36aP2mhjj0mUCXmohApRMgYrUlV9NF5qI12jk++NuBAphRzeOVsqcwnXP+UOMGQVkVb
 BDT/j/+IFj0mD1M0rRQRqI6ghkM4ee9u0XYfMLNf14/ztdMgjUjhj/FUua0GYEgSK3MTW2bUNom
 mKuk+hwr4D9u5b4vkZxQ+ws8EEh4pbOUsea7f/BV1FclwtfpElc5+ZR2LV0nKykgCYntBIICeJ6
 tKIVq7f0M8iJr+GST2elBfR15nf4Hr1JkDPspGQly6ZA61kA6rxn875+JUCGs/2kf2Z1uUOdcpk
 Wtc/UyzEC8YOF40po6NqZT5f0wDCe1TcXmuEcoI7+AJ8V45LOsNTA7BU/unmPwqbB5tGfLSMhEa
 qWVqx5lfsno8+hJMs4nAww4PKHjq1mUvErGu77MRcX4JTIoBrwkDCG/2bglWO1QC5Mcf0LCb3bi
 pp+Zw+eVCcVkhdd/8aAIhxpygHDdHIIGrInjVsaHYOGeZw=
X-Received: by 2002:a17:906:478c:b0:c31:7495:e5b with SMTP id
 a640c23a62f3a-c419d05ed13mr447342566b.10.1792389717150; 
 Sun, 18 Oct 2026 23:01:57 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c40913c4806sm325179566b.44.2026.10.18.23.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 23:01:56 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 08:01:55 +0200
Message-Id: <20261019060155.1095583-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <atUydCZOiuRB85Kj@windsurf>
References: <20260903114721.984785-1-yegorslists@gmail.com>
 <asp4qInIYNj-7JlB@windsurf> <atUydCZOiuRB85Kj@windsurf>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ncftp: fix cross compilation
 detection
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
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Hello Thomas,

Sorry for the late reply.

On Sat, Oct 10, 2026 at 07:42:09PM +0200, Thomas Petazzoni wrote:
> Instead of patching the generated configure script, have you tried
> using AUTORECONF = YES to fully regenerate the configure script from
> the configure.in? Or perhaps this is hopeless as the configure.in is
> ancient and any modern autoconf while not accept this ancient
> configure.in?

Yes, it's the latter. We actually used to regenerate it (running
autoconf -I autoconf_local in a pre-configure hook) until the 3.2.9
bump, where I had to drop it because it stopped working. With 3.3.0
it still fails:

  configure.in:53: error: AC_LANG: unknown language:
  autoconf_local/aclocal.m4:415: wi_TRY_RUN_NATIVE is expanded from...

The macros in autoconf_local/aclocal.m4 depend on autoconf 2.13
internals (AC_LANG used as a value, AC_FD_CC, __oline__, ...), and
upstream even ships patches against autoconf 2.13 itself
(acgeneral-2.13.m4.patch, acspecific-2.13.m4.patch), so their configure
is produced by a patched 2.13. Making it work with autoconf 2.7x would
mean porting all of those macros, which is far more invasive than this
small fix to the generated script.

I've just sent a v2 that adds this explanation to the commit message
and also drops the now unneeded host-autoconf dependency, which is a
leftover from that time.

Best regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
