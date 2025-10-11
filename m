Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBD6CCD184
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 19:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3332C403A5;
	Sat, 11 Oct 2025 19:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jStVlYdH4Vz; Sat, 11 Oct 2025 19:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50328405A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50328405A5;
	Sat, 11 Oct 2025 19:34:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60789119
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 19:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 517AB40761;
 Sat, 11 Oct 2025 19:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SGDhBdeXMTl; Sat, 11 Oct 2025 19:34:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D04AB403F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D04AB403F8
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D04AB403F8
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 19:34:16 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3f0134ccc0cso2240015f8f.1
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 12:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760211254; x=1760816054;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qW1204Jx1xULuujottHEEyZp/ITApkyV0848y/BRMe0=;
 b=PS2DXvm9AIHuQVfAF67k8SsXJQtxabzhbxbvAwQjaeTBIMiJjy8FDaWu/2sbNF6AkU
 iK2d/ArQ5CliHrvqvZfq+7CR6eu0A+B0HE0MeWU52MN2ILkC6jRZfSNblfzXwYeFI8mT
 updT0HCykut2Vf1CmO2z5jvxzdl8D3OzyrV2rcNxaV75xURBsI1R2eTwhWcliHAlaEBD
 gdTH/7s8vqRyCjWPpQpFZyRtCs2QiVssNZ4m0Fv62RWxwNjTJiPO7Bfs7qKX3CCDNzB2
 YHrs/01U9RovtJPH01LVlqjW7XsdSPFvrez3HTe1BOJSXuwnH2Iy9zopOJQTBGhs6+RQ
 xj3Q==
X-Gm-Message-State: AOJu0Yyh9GvfvLzXnGk16N0e+8MkBedofIQhAN8iK8PotgYm6xwcfQa0
 RYtogIMKdc7bOHEsfPLj7A0zoUR/oXtfx6mJk7u1numI6ZcQr/vcR4KIZGBFLg==
X-Gm-Gg: ASbGncu1RyOFq+1H51OFpwJQqcw74R1pOodLd1NwLiXiNTAm+d78EA5ZbwP8fc+Rv5r
 DYxjHM6P1gH6F0aSdBmZ6R6BdTQOzD1GwOPQxSo4cI8OrckxYJMeuy7nhuQdaJyMR4Men3S20rg
 KQROR31lt6giOdO3E8UCBRgShNe6EE/ozxFmFUD8sFHAbMIXAqRepmDf31d+/cEdfFWIyGn3Mvo
 CBRdH7l+VOLXHX0QHzQGtFL9ze8nd3UFA8AvOGSZQzt9k6mzKXVceVGGaOLQUgSk0QKjaDCu2ve
 1B0vZCxMT0mlPkIrnj0Yl/i+1CvAzCix+fsOoprOanr6twSa4n0HvL0vSx/aBhMPL9unCeGYRIr
 ALD4h+FWx/QrFyF9xhhIR5OCeOFccgP59Ne4KPl1xknwmQiT+vnaSMR3rTwWHdyw=
X-Google-Smtp-Source: AGHT+IHwoJiS+g2zq/iO9wP0gEtdF0jynMkyj35ZiIUFEK6El4jZvvUrp9mpQFaOzt1RGxSb3/m2/A==
X-Received: by 2002:a05:6000:26d0:b0:425:8bf9:557d with SMTP id
 ffacd0b85a97d-4266e8dd3c2mr10987115f8f.44.1760211254348; 
 Sat, 11 Oct 2025 12:34:14 -0700 (PDT)
Received: from ymorin.is-a-geek.org ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e82dfsm10108895f8f.52.2025.10.11.12.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 12:34:13 -0700 (PDT)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Oct 2025 21:34:12 +0200
Date: Sat, 11 Oct 2025 21:34:12 +0200
To: buildroot@buildroot.org
Message-ID: <aOqxNNXgt70DNu7R@landeda>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760211254; x=1760816054; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qW1204Jx1xULuujottHEEyZp/ITApkyV0848y/BRMe0=;
 b=T3o7rfOLTPyuo+ItkSQ02MsiRH3biX/Z66xoRW7to6xPDAEhNcLQ73QQgwYUHX6ECK
 JMRpS0Sa4xxKkOtqVAUkS2E3+/SPuJHhN5+ynDcLZTm0B50kHX4mSq1Wp7R1NF+S6+K2
 veJ9EerFVziAtTXJ8PW9jImZ+Fkb7qWkSwsIgbKrsuxNd0EDoDkmeYxqkf3O2BnU5pW/
 HLltQFoxiJicLiH8arqZV3kauIFAAcjKqi2Q8rca4aS0nTei8JYcpqXFyr1dzUkRzLVe
 xotTqztby0UUsmvoSYB41KLoy2lHoo3mWJphPnvRN335vJ5cpkjB3SYHqIOOlLk1eyCl
 oISA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T3o7rfOL
Subject: Re: [Buildroot] [PATCH 00/18 v3] system: add support for merged-bin
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

Hello All,

On 2025-09-01 11:01 +0200, Yann E. MORIN spake thusly:
> This series introduces support for so-called merged-bin, where /usr/sbin
> is merged with /usr/bin, as an extra step after merged-usr, now just
> requested, but in the future required, by systemd.
[--SNIP--]

Ping? Any feedback on this series?

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
