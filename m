Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBD8CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD55140F5F;
	Sat, 18 Oct 2025 19:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdNuf3WeeRPU; Sat, 18 Oct 2025 19:53:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F37D040F98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F37D040F98;
	Sat, 18 Oct 2025 19:53:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC3201CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D214F40F98
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2uV0ssjBLRa for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:53:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C580740F5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C580740F5F
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C580740F5F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:53:31 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-63c0eb94ac3so5192599a12.2
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 12:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760817210; x=1761422010;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/eWaSNUhrYqJ6gUUzPtmFrx5p901mPAuU7tWOYJb64=;
 b=FwVZkS2oN/rTWCFsgjSbrxBM8mdl8FfrPgWVgk8m4tdGIVKmHgffJnQCls9c7MIWuB
 xtPf4yIz0NZBrCmBKWlLQyLzkvbCNJx2A+jGhff/jrdGlJm4nCYN3mfy0p5uHgNkmhFf
 J82iiRZ+dHNpJiSj5GFShDbgl8x/ZZ94nDcBBy6kDYn1QLEG7JTRp+fJabdZ8Qv6Y8/o
 iTwASCEmMIqdRbEPn/dEi6N3PMnS/YKQZirTVN/4d7WPzaQgUInmzuhAqM8JU9yNMYiX
 p7MoX08HtMZjIIYLPVMZK0eLiRDH0dnH42+TS/ET9ZgInFyelSoo/gXUdBAUewGLgTLu
 YsDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYsvzK/QwWQGaN/AUwFIM0S2DA86m/RFN59iPzFLTC/KwIP9aFiIBfepDDakC2O11Vo8GPAylwwIQ=@buildroot.org
X-Gm-Message-State: AOJu0YwIRbY03rBftwC3o+SsSSr0lltqYtMHjTBvNM9ZaYv2TqLG7WHZ
 pnBh8R636XvtozQr793ZOUm+ugvUWBfI00z3MoOowABjfS5Bt5VQyxR1M0Ji/w==
X-Gm-Gg: ASbGncsY950p/+amhEgN46ZEC7P1FSpIwfLPhH4ZVKxRSOf10+kHObM3UJedB/YI7mD
 KlifWaTyPbPROHW5E2v+xVWja7KsFuFiZtJjntvAbf8pK0IX5jzzxGp7XJxjWK4lUMboICL4N/3
 Vvg6J6fpzjqkg8wfWMsPd9WCHnabx2Hn40uUza9kh6btrQIw0VwPQAr7tt3K6/n2pBi2BCPhomM
 oGKAQLOhhH7urSEvXxx1PtM9I/xMi9LvelKvMoYKVHMzMNFo1RFkCDSlfuFSg9SxzJ9o9sBTgiM
 8/E2JA2DVTwhd4y0Vdk0qPEI3WQDFrNcSJKItiOBTHCwnb0Vo9oGDInq9bTLBXOwMuONLc88FTR
 r77iorjhFjlpr4UQ/zFBVlzH2pd5uOfDyf4sPgJRVcYDkMJ3AbGDGVJbGMM2xsdFw+K3WU5lVZK
 UqWWIROkHhoUnEUCZ9dYn8jxHGCw==
X-Google-Smtp-Source: AGHT+IHdjGCssQkMT2zrlXF016n92P4a3WHXVcRz9yvTuckoi5c90Ng+5sM8QEYVuZnWZMumRUR2lA==
X-Received: by 2002:a05:6402:1445:b0:63c:2750:ef4c with SMTP id
 4fb4d7f45d1cf-63c2750f073mr7806216a12.19.1760817209466; 
 Sat, 18 Oct 2025 12:53:29 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4949bf40sm2741009a12.39.2025.10.18.12.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 12:53:28 -0700 (PDT)
Date: Sat, 18 Oct 2025 21:53:26 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Message-ID: <20251018195326.GB375409@pevik>
References: <20251018192729.3113082-1-bernd@kuhls.net>
 <20251018195218.GA375409@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251018195218.GA375409@pevik>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760817210; x=1761422010; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O/eWaSNUhrYqJ6gUUzPtmFrx5p901mPAuU7tWOYJb64=;
 b=GmVGwxexTyqNsFkZnmvQH/W0JK+Wv5YGGV+qc7qMFMWD9PZ61WvJha+mMLwY2bagD4
 2J/St7rxhxoonz10oG3xzwz5mB7TIX6/yffviVePU0XOJgG3x327kVazrxZojhNR9Q7Y
 qQrA5hFjZS4MnPRGQnwYdfXjEyzJawecsyLTGkOBcj+CwJkAXeZQ8O4Z1WJVgSt5b9Xp
 CckkPASoybnpM33IQF5iP8A9VCZYzoP90Yhw0SSYnUMQaMlqiEsSCxgviT+P8Ypqz1DS
 Y4MWgQI/KmL0er25TtjWYijLq6Lw+e6OMzvYlqkIpvFwEy7g5lJWV1+K5Zn3G62FUhxP
 R6SQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GmVGwxex
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: add upstream patch to
 fix musl/uclibc build
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> Hi Bernd,

> > Buildroot commit 532d5561f48b6c430e7414ba5eacccf9b6c1bd22 bumped
> > iproute2 to version 6.17.0 which added lib/bridge.c:
> > https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/log/lib/bridge.c?h=v6.17.0
> > and causes build errors on musl & uclibc toolchains.

> > Added upstream patch to fix the problem.

> > Fixes:
> > https://autobuild.buildroot.net/results/951/951e4198b2ba109fd9c746fe2e6316a29085aeeb/

> Thanks for backporting the fix!

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

> Kind regards,
> Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
