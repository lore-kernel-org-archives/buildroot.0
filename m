Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114BBC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 23:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFDBB83A75;
	Wed,  7 May 2025 23:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOMeqKONg7Mh; Wed,  7 May 2025 23:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1D3583D40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1D3583D40;
	Wed,  7 May 2025 23:04:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86B0F151
 for <buildroot@buildroot.org>; Wed,  7 May 2025 23:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C50D40E09
 for <buildroot@buildroot.org>; Wed,  7 May 2025 23:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzL8-Udjq9BW for <buildroot@buildroot.org>;
 Wed,  7 May 2025 23:04:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 80F8140DB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80F8140DB4
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80F8140DB4
 for <buildroot@buildroot.org>; Wed,  7 May 2025 23:04:41 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-7369ce5d323so402491b3a.1
 for <buildroot@buildroot.org>; Wed, 07 May 2025 16:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746659081; x=1747263881;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u1+4LZ2gk63bPt9BT05RUEGqAp1ImjWKABV73I4SzF4=;
 b=NOD3zR1xDJZLD2OmK2QAawYahgsA6kCltI1/CEU3ky9iiHpcT2zPBmxWpygPFojgTt
 9PqGi050D31Ltu9vguXbBTWpXC/rMgBYdDfTnUH+sdeC9xYTU9qPnxoCrHka/RjJZDhu
 v136sYFeCf2+DgIns4eggOg88IL3tkeoeP0ygXd2xg6mpDfeFCbTO+qP/QwpZDPiM0ht
 kYQq024tZOgmX20i48Qs8ivA94/nxXqtRdanopmwWzDZLZFhRB3X8a9FgZ9U1Ej9F/sG
 5cCYs9EFnM2XkVVY7MQXpMQvg7A7of6S01r92o0IzEA/blHdThIAz/WuFlKoVuWJHGjy
 CsMg==
X-Gm-Message-State: AOJu0YyBqCY01wlf/OkvEdpRNx9bnVN0Mc8rTv5yBl6H3JhH23+a8vYm
 dwu9n+4Y6+o4MzXDtZFsW30nTPa0lHk6bWzvUhKUpczi/vvWx65EHwDjSaajP1A=
X-Gm-Gg: ASbGncs4TZcTxlkj2EOnUqOMM6MVnX9NcP3O1qxKafsFVEF0LXfS564sSMQIXwRayyU
 0jidZc8IHSDt3hOsE27e2MIffgeYqJrxwDYPdArPIUMx40G+NvT8mfEcpKioV9z3p7eyDQcbwsu
 +3ACe0uKo/lcQYEdUIqhQO+YvU2wjhDbsljFZnhCBTLZcEmYmMTs15dDo7d5xQfYEVq94KyYuQy
 nUpbw/z4bJTNvFtS4T+r4WFG7rOzlMjmdCT5adWNPhy/AUL6aJMEQBXePL8XsUnvEqnA2VMnWyV
 yt+Vw95K9ZGL6LM/oKmSasaTpamT6ktBu230
X-Google-Smtp-Source: AGHT+IFvrUmYTKHXvNNvYjg16LapqS3HsAm2KT5bxAwpwK9tGMZTOOcbGVoqz6t0QesbIo5iisz9qw==
X-Received: by 2002:a05:6a20:c681:b0:1f5:7d57:8322 with SMTP id
 adf61e73a8af0-2159b01c9e7mr1453243637.26.1746659080897; 
 Wed, 07 May 2025 16:04:40 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:a06c:2581:5189:32ce])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7405902104fsm11836859b3a.115.2025.05.07.16.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 16:04:40 -0700 (PDT)
Date: Wed, 7 May 2025 16:04:38 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <aBvnBpv-OtHJaH-Z@ghost>
References: <20250430-uprev_pixman_46-v1-0-c1608b4d4bd7@rivosinc.com>
 <20250430-uprev_pixman_46-v1-2-c1608b4d4bd7@rivosinc.com>
 <20250501150906.76a26650@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250501150906.76a26650@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746659081; x=1747263881;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u1+4LZ2gk63bPt9BT05RUEGqAp1ImjWKABV73I4SzF4=;
 b=sq7uB1DFF5qTRoNObr5cBYadCrVVNLC5tbjbmuoPygmagSGMJXReGQim+0Kw8WuuZs
 NwilxiwWtK8MoWCLG438Y29v9s70sQhQpsVejAQJxYqQLg1RfOiBIIQkKGxNahZacRMe
 UpyPzJl9Mny9fuZnRIUhlHgs1V7qXk12a9J0CGAO1SMKMIMy+Ma91t/ylcfUTqvj1i2B
 ajr0t3Ba5QXKJY2JqYbqOjc89m+wkiruIiG9/fx7o3fYVyPVmokglOeq1eEqmu5yGGl8
 NjN8my6kzNKKvaWcdAkKVQreAaw1xc/n3+l1XK855GPazyxQZNO49Sbsn1CfCEcf0GlJ
 BupQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=sq7uB1DF
Subject: Re: [Buildroot] [PATCH 2/2] package/pixman: Uprev to 0.46.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, May 01, 2025 at 03:09:06PM +0200, Thomas Petazzoni wrote:
> Hello Charlie,
> 
> On Wed, 30 Apr 2025 12:10:36 -0700
> Charlie Jenkins <charlie@rivosinc.com> wrote:
> 
> > Version 0.46.0 includes the patch to fix building on riscv without
> > vector support so drop the patch from the tree.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> Thanks for the patch. Just a very small nit: we normally use the word
> "bump" instead of "uprev" in Buildroot:
> 
> 605f8f54320cf098a17c4931dee47952bb57e465 package/fluidsynth: bump to version 2.4.3
> 5dab98d721e978e65afce44ee2ea92fcae2d2b67 package/libjxl: security bump to version 0.11.1
> 77674c6cfbd40e174048897255658d31e3ead15a package/go: security bump to version 1.23.7
> d577c1c339649d54b0dab41949a192006c86a3ae package/python-sqlalchemy: bump to version 2.0.38
> 84eed2762945f0287cff2cf604947b65c0408c8f package/libglib2: bump version to 2.82.5
> 5a1515b5976aed8f1b15eacf513d40ab70b908a8 package/armadillo: bump to version 14.4.0
> 6faa08a9e3f3ad170b70439a14bf8da6256f887e package/python-dbus-fast: bump to 2.33.0
> c8eb4c63a77131e83ab9fed8c9e5ba2dc76a83d9 package/postgis: bump to version 3.5.2
> 1e8955e12c10e68d9eb119ebae99692dd2432fa0 package/jbig2dec: bump to version 0.20
> bee34e7bd0954634ba3a9534104482c6dd5e6229 package/timescaledb: bump version to 2.18.2
> 0748e761e2962e085ecc266bd79bb7991ff71462 package/libmodsecurity: bump to version 3.0.13
> f683440eddca647170b310a1ed549d768a6560ae package/mongoose: bump to version 7.17
> 
> etc.
> 
> No need to resend just for that, it's really a minor nitpick.

Thank you for letting me know! I'll keep that in mind.

- Charlie

> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
