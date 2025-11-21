Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1427CFA768
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 16:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7633984B4C;
	Fri, 21 Nov 2025 16:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnMEf4e4OKVX; Fri, 21 Nov 2025 16:34:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42F6484B59
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42F6484B59;
	Fri, 21 Nov 2025 16:34:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3769122
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 16:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C50BC4028F;
 Fri, 21 Nov 2025 16:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJA_q_ye4_fP; Fri, 21 Nov 2025 16:34:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90E3940148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90E3940148
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90E3940148
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 16:34:00 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso24466935e9.3
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 08:34:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763742838; x=1764347638;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tomvEgAEoX55ft50zFUtd07cBhMTXowM09ZN36xjcUY=;
 b=iyOsZY6QF+SGlQd7LLs1i+Q4F6zAvwrdRr/zal7Wbe9szWR0Vf4Bj5X7hu1kC1FvUW
 5KTD2B7rO6lp3N4mTa7TyEDo2m/B8v9qIhff7Q5mcz8YjLWhP9azud16OqNE/kcpkGIJ
 fHJHibm076Kng3jk0KBcoISriqWvuNwzsC3vZ/P6zuWF/PTSvWNMUedZFJgnOodoiPhY
 ZnNPfNEXfM0AYqDW6R+vTcUCNhy3UPmNFEmKqQSEqsRABEFgmOfpkhpC1Z0kWQKqKD92
 RnEzif49PscinUampA5luOHVGx3ZcsCLmSpDz+oDuiW+6rkyGR9SL/YMaVXwqUqyt/hG
 c61w==
X-Gm-Message-State: AOJu0YwFSyB6GQgD+QO5nVFpftOFYfsOUXBeL8bg1Fohzk497Ko9S8wM
 YWFB0v4Z9CyP3gQjBHCnq3Oh4I3R94Up9Ow9thkgHsZK0lZydt+ysYsK1/aNug==
X-Gm-Gg: ASbGncu7yHgNnNf/4u3c5Tsw/95JyP0yiXQkadQC1ojyTvHOdCeFPm5n9+cLK9Bhpcy
 DoCFf/Ys2U/1sSo3OHcRidF4YnfxQDf4q93O4wVGcZuusYOEwCSMwSdvPq3Hzy+OqBX+ja9inMn
 gocZxxAZPfdrdur+Kh17OCsohsUdTfPTAHt86kvejfy1A7rfw3zyJDp/jMXGU8r/ZVF9dWC79Mr
 GJiKy5BiG4/3YtvLOnV8TBnXUUS5cGxZvLi78Ni0hs4R5+YbQnG1XUQPCbdXRD4kZGMr3oBK72i
 9h6zsHfbqPye/KuBXeoOQ5MN/L1AMI5UFRKvW5kz9GD+8g/t7hnOZImQqwawUzcyPhplKuz2NRf
 eDy6SnmED8w/G/Fa14T6WNQwVVGtj2m3I6HhQlg0d7jO2d615qTyS1HGfb7u6fAA07wuAYl08Yz
 1ZVUqJGeCk3mq/cj+nf0l6iU1Vs/p4oL49P/3NoGOmKAQ=
X-Google-Smtp-Source: AGHT+IEq6Orit7CvSoU8zWUl6g+YutwyhS1VOQiFUGn0rseoeb2z4z40oEWVErtwtXNtMIw+sVx6Og==
X-Received: by 2002:a05:600c:a07:b0:477:a219:cdb7 with SMTP id
 5b1f17b1804b1-477c10523aamr38274935e9.0.1763742838085; 
 Fri, 21 Nov 2025 08:33:58 -0800 (PST)
Received: from ymorin.is-a-geek.org ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a96aafb3sm90734685e9.0.2025.11.21.08.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 08:33:57 -0800 (PST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Nov 2025 17:33:56 +0100
Date: Fri, 21 Nov 2025 17:33:56 +0100
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aSCUdO5bL292b8gq@landeda>
References: <20251121135334.470282-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121135334.470282-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763742838; x=1764347638; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tomvEgAEoX55ft50zFUtd07cBhMTXowM09ZN36xjcUY=;
 b=YIjSCB/gG+WKq5iG40v13KltjMZfSNGHNVWgmG3BF87ywJdYWGQ9fZmHc6i7KJbFuR
 rfNzgbmcbPoXvXB6cZGjKJGGQbJhEp731EA1InsYmsod2VXsU/ny+WAiJzvjGYkIiRod
 Onm4ZQMKnqfyjhH/ANv7C/93AGungy0N6bhJzrgheXMJTxHF//AeX1yUBf/kHn/oCLVb
 W+rQCQ0Q3wP6MZhS7QBY0keTXHeTb7Cmo+gYd4vl8xymsHqzKU144alXM3lPjBCNiy4Z
 OYpHwfg5OwOerOJVwh6cprBebx2mXzEJHkLz4iLF8kWIZwRrZXSXO6B8dNt+YODZCN2e
 swZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YIjSCB/g
Subject: Re: [Buildroot] [PATCH] support/scripts/check-merged: use short
 options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2025-11-21 14:53 +0100, Yann E. MORIN spake thusly:
> Switch to using getopts, it removes the need for a new host dependency.
[--SNIP--]
> diff --git a/support/scripts/check-merged b/support/scripts/check-merged
> index bff6ae2b7b..8da4a69374 100755
> --- a/support/scripts/check-merged
> +++ b/support/scripts/check-merged
[--SNIP--]
> +while getopts "t:ub" OPT; do
> +	case "${OPT}" in
> +	(t)	type="${2}";;

This should have been ${OPTARG}, not ${2}. I'll send a v2 shortly.

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
