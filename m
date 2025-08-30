Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7CDCA0FFF
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 17:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34F3C607C0;
	Sat, 30 Aug 2025 17:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvUbYXjq-8jp; Sat, 30 Aug 2025 17:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3480D6063F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3480D6063F;
	Sat, 30 Aug 2025 17:23:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED88810E
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 17:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEEAB4048B
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 17:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryLwA3q7kJ8H for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 17:23:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12ECA40471
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12ECA40471
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12ECA40471
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 17:23:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3cb096c52a3so228346f8f.2
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 10:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756574594; x=1757179394;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3q7FlCrUKGi6jAhk6ia4ZcBwR2lSUw1EO7dM/vfBjzg=;
 b=Nl57aGXZG6jnFFGMN76eRQldDQEOjS5CmOb/5IbTmRhTjZ+o6YZiNDbs3xe4dc5F9y
 ZPtD9TEjgwiCYI6kXvCKTY5+v0Ac7AvFjwYvv2XZnGTCkM52ucBGmJ5sdtByxCZIQx2S
 1lhEFuyeFdVilE5Mdixx8MYBIb6ILbL2Mv96dRczWDUfhmyW7joGusaT6+pDqDX3sgBr
 pY5bD1hBe6SykIAaw9ZCVlWFLnzeNNzTFvyScm91DsK2PqQpyYA4jIbthwR3+lAGaMkT
 B+OvBy9fYIR7GYDYCHdUchpT0UdNpShrvOF/gxCtlD1+/0kIEy8jiWQGgIH5ivajQhiu
 UUuQ==
X-Gm-Message-State: AOJu0YwHT5dKCXVGJo21nyDCElOxHqQxaOTxRS/Svj91rwFBUccoeEnx
 WuWi2K/zAadGq9NkssVFhdezSIIgDVF+Hu/5NQwL38HlKceNdMxm/s4l
X-Gm-Gg: ASbGncty3yn1p1Lj6+bJlPzw5WCtvD0IbhfeWS1db6TxKOZFLkMYnPevmC+e/7z1pG7
 IWczs2ub3T9k90drMh6D9BjpHCvJSBfA8LB2N4PM+XWy3OoDRecIPXgi8VDNqz7hr1RZz9DzVPi
 xV0WMNHzm1JZuEHavLk3/S9qcL+gx+k03P9UcHcPVvEJStkGLiiled7VmGjN9fUImYvp8iuR4DQ
 ggc8SUpuprL0u5eGhFIoW8s6/rNt7zx+1YUKV4/CL1TERzpIKrBH68KyR6vHQJdPrJY7MLhYWce
 ZOuhNmDBjCiR0i5/9J856V0cdWk5R9yvMCx/LAleWZ364z0Ahs5n4diA2VvTuHm+e8Lfz+4yE6W
 ElgHuSd5t1+IOGuk=
X-Google-Smtp-Source: AGHT+IG6yAs3GVW4ZR52257W1DRwD3udc+ShwzOLeRlRSs6sD10uC6plQkJYoMmDdd0nahUZS4ovlQ==
X-Received: by 2002:a05:600c:8216:b0:456:4bb5:c956 with SMTP id
 5b1f17b1804b1-45b81f9320fmr22222885e9.7.1756574593798; 
 Sat, 30 Aug 2025 10:23:13 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:1070:b6c0:5550:91d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e7d1319sm92770475e9.5.2025.08.30.10.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Aug 2025 10:23:12 -0700 (PDT)
Date: Sat, 30 Aug 2025 20:23:10 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <20250830172310.kvhc47ksn2soqeqv@skbuf>
References: <20250811165531.1533913-1-olteanv@gmail.com>
 <20250811165531.1533913-11-olteanv@gmail.com>
 <bada87874fe4b95de25bd6ed667598fc@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bada87874fe4b95de25bd6ed667598fc@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756574594; x=1757179394; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3q7FlCrUKGi6jAhk6ia4ZcBwR2lSUw1EO7dM/vfBjzg=;
 b=DT0UkhaGIYzphIIHfk8QgGxcvuSONEMq8lNWaqbf/EQ4WxCqg3+T8hxFsEzcu+Bc4D
 47Orb233pDpP2Tr3iD+gkBd6oouZIZlbNEK+x7T6WJVlxdp/EmyXx8ZbswJVxzQQswSd
 meWLS1bQCEVYM/+MW5M7RtkQnr+YYjM1Diofa7Zn+hocgBSo0hCRMmU3pw92jqbOK9fZ
 F7Bkf9RLQpEtMU1HHh00fwy2drQeqyQrCGP3RN5mZEiqpV4FBmw3sVSETpwxTdzYN9dE
 y1DfXX4oKW6yEFFVYmmDIh1mg8iQL0wpkzgoQMfbnHURTf/ncMKJ4w/qoyyCUiUHeLWT
 8EmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DT0UkhaG
Subject: Re: [Buildroot] [PATCH v3 10/11] package/qoriq-restool: new package
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

On Fri, Aug 22, 2025 at 07:40:59PM +0200, Julien Olivain wrote:
> Hi Vladimir,
> 
> Thanks for the patch!
> 
> On my side, it generates few build failures with test-pkg, when running
> the command:
> 
>     utils/test-pkg -a -p qoriq-restool
> 
> I'm expecting no build failure. So either there is missing requirements
> in Config.in, or it is bugs in the code.
> 
> Could you have a look please?

Thank you for applying the previous patches with the necessary fixups, Julien.

To my shame, I didn't run test-pkg. I did so now, and it passes 40/40
after a few extra changes. I will post a new version just with the 2
last patches.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
