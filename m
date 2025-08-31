Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1878ECA0FE8
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 17:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C19B7821D0;
	Sun, 31 Aug 2025 17:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgcWeTiO8xdc; Sun, 31 Aug 2025 17:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02D2382267
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02D2382267;
	Sun, 31 Aug 2025 17:18:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07A99D2
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 17:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E18AC4002B;
 Sun, 31 Aug 2025 17:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpDzeNfPOMM7; Sun, 31 Aug 2025 17:18:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E409240029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E409240029
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E409240029
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 17:18:51 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45b79ec2fbeso23876725e9.3
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 10:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756660730; x=1757265530;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MhtsPbUN1XVevW33sFAhHX6JUpYDOkmu4U3u9xMFq9I=;
 b=LYPdFnIN96pLfpd0Ko8jAvu2KhcpeqYOUXbroYi85a59kOJTDgqkgy/PBZNuuNZybl
 ZneOW5Kda5sJMXkc/tjIqQ1HVkio6hQwI900+HSvFBl3uUFHhe2Xfih54go8Aj6bxFAU
 7+eWpsu7ijaD1aXfYwYoFA5lNuv+C1+E/SRF9Yssc1roz+foTpVe2jHRTlTgvHAeFtlK
 rVn6IbcbYBU65Dbml/LRkTMpy8jhSIoHLVnDuqa7R5frdgAvlfCaU/ffm7VzB7On9E1f
 8myqgbEm7Gx8Oj9/TnB07DdGplN5IBKRWpKs1LY6AAA/+IGDrOGX9Ltd1vXY5IYMcTQM
 WXOA==
X-Gm-Message-State: AOJu0YyweRd4vbFgAPpkRjTj8R0mj61nx1GwMuNi/iiijZEGzEjymkdW
 BL3e/fUJvko1/+XiK8rIqNUzJiGk0jNu6Aj608c6IzuRKCp6KEmNN0+O/HrFcw==
X-Gm-Gg: ASbGncta++XfjC0aKxXQpmeNLqGf7Bkwgnxq9+aohVCxmd4TSL9j7hUm1yb9prBFOc+
 QwA+kaAv30BAf64rKJUtbsWRqXX17SiGJWS3U6RPyNfI9uAxDdFcQru7jMPaO1gXH5Wc+4ezIFe
 j+eOqZt7YHZWVTwpw8xjnrryF07Z4SZwfN9DCotYmtX1FnWlgfODtAcaQwTsDEXAZXQQ06LoQPb
 GpriVhH0ltODVRE5pIPvN6aJYP0XaV3nmmrsvn1baU+O5/pc5ZiaLWrWGjOg2gleX/0ir4JGe0v
 x2QZHuqNBVla4T96m6lxI9sx85et3zOxoIwXFDGVHTk9fAribuIwL29mZy9l/q7QGIUzUcBrp2h
 5Ocj9XeAcfPT1eHqfJmTwwW8lXISJOsddfvU8CASR4iI=
X-Google-Smtp-Source: AGHT+IGIUZl20++7K80FlhU6SePGjHDeGyAcmtjqnxBnj7thgPoyY9WE2rFjwUJibh7VQZMX5CNwwQ==
X-Received: by 2002:a05:600c:3b11:b0:45b:8436:1bf7 with SMTP id
 5b1f17b1804b1-45b8554d659mr46805905e9.9.1756660729356; 
 Sun, 31 Aug 2025 10:18:49 -0700 (PDT)
Received: from ymorin.is-a-geek.org ([2a01:cb19:93aa:5000:5537:71ba:cb39:6c65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d21a32dbc5sm6886224f8f.11.2025.08.31.10.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Aug 2025 10:18:49 -0700 (PDT)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 31 Aug 2025 19:18:47 +0200
Date: Sun, 31 Aug 2025 19:18:47 +0200
To: buildroot@buildroot.org
Message-ID: <aLSD92_nTkP2gUBK@landeda>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
 <aLRgApGA1XJONpnA@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aLRgApGA1XJONpnA@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756660730; x=1757265530; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MhtsPbUN1XVevW33sFAhHX6JUpYDOkmu4U3u9xMFq9I=;
 b=j3Vn7oZX6nI7uD8DFVfqzjCFqRkHRas2FM/OOUzxb+00PYxQE0INo2Wbh8wfS/UzBO
 ycWdbfAMBfwFUTDzRlR8+og/2EKVaJe7pPBtfh47L/p2ZveYJb88+VDbodFsSHcphd1L
 6NYueQlDxRn4eq93JRoJoFXPU9nulyUrGzrTy121XlM0xN+l0GXw2wOjMT2FOIPR28kq
 e6c8l7R6jUVIPeGNlK1Tyb8N8bdefaMQc6nJeVsxNG3IKa7QB026E60JCKW6HauHt+jx
 acRFQxKODxldUoswoLs9h/XJbB+NyNHEoIuuA0GtXmwfbczrs+5ZQIqF5ArSL7KGqYmY
 SVJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j3Vn7oZX
Subject: Re: [Buildroot] [PATCH 00/17 v2] system: add support for merged-bin
 (branch yem/merged-bin)
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Arnout Vandecappelle <arnout@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2025-08-31 16:45 +0200, Yann E. MORIN spake thusly:
> On 2025-07-10 22:22 +0200, Yann E. MORIN spake thusly:
> > This series introduces support for so-called merged-bin, where /usr/sbin
> > is merged with /sur/bin, as an extra step after merged-usr, now just
> > requested, but in a relatively close future required, by systemd.
> Ping, any further feedback on this series?

Yes, some more feedback: while doing some targeted-random testing, I
stumbled on an instance of a bin-sbin conflict in net-tools that I
previously missed. I'll fix that and respin later...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
