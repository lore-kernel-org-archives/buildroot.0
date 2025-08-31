Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E84ACA0FF2
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 14:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D32CE8149B;
	Sun, 31 Aug 2025 14:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rl9nCdHoAfIs; Sun, 31 Aug 2025 14:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDCE3813EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDCE3813EA;
	Sun, 31 Aug 2025 14:45:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B2FDD2
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 14:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CE4C4002D;
 Sun, 31 Aug 2025 14:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mN9OilQpzXeW; Sun, 31 Aug 2025 14:45:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 312FD407EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 312FD407EE
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 312FD407EE
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 14:45:27 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3cf991e8bb8so1322383f8f.2
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 07:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756651525; x=1757256325;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6P5ZXcZOv05raJY9K3IwVB7PC8Cx2ZUmWMPdILJNyhw=;
 b=S/+NvmBNA7t49DpyBcL6LCYfEHLKLAMNb/Bw0uhIWW8nV0+sIyjR+UXeO59CevpeNb
 ra0TOglq/Mm50x2Entb7QAXFqHQZuI0MbDxwsZbwXP8JxQGtdUeTp8x4EVzSsLLDjEs5
 39p3gObutkv6kUkf9EiNV2c7fB+/365fuL+Tr/oW9K5ZsEvuAE4u4j3leXDsQMy9hM36
 gbyII1R9k/H3oNWxZuzrRoXs0WZlLpmTk7xzIK+UVbkgxoWxsgIzPxaKh2OJmih7e/a6
 z6/VBfa5VXslyIQEy4MEMekX+f7R3U6MTz0Rd36q5j48ohZ9QbS0FF479nWv4tIHVzUC
 L1Ew==
X-Gm-Message-State: AOJu0YzD2V+J9X83fe6qQv2dCFwA0L0mleEuCbif/IBjzJyAmCxHmBee
 7j33+XqqWbwxc3j9kDzHfZQJ18jwovBItDq/S99dVxDDKBSuD3gJqyCTodrdGg==
X-Gm-Gg: ASbGncsCmFwbQZTC7tXLnyW23DHNvoSY278soPLhR+I9ZGCOsnxvBBwSylntMJyjII+
 js4TykkmniSMCoi8nMTpyLcBE+bkWRFAt5/NIWgdTU06FjpgMkwUclkGS06PH7HD5P9CQUe0B1r
 SUmhAN0ejM/v2MUP/aJECtl+Ic++E7/HXfzFnAjdsA6P/QXsGTGKiavePlS/nBw2nEzzRCtmt8S
 QOJLaQYiCUKd6UPvU5KGX5Ep9y+JRNrRf9KPP+p7aIdxKiEoc6Ekg9SnEayuOcEdKVQWi6qX0B0
 6NPuJ5ZPPhuj3yVHCpmtbcmc1y9w8Gev1kgMdmjhAn76AsST+clcjiD/MQHRz9s4VIPo4/TU1mj
 5E177ExSHdDkaOPk5jH1VPMiifBsoIBiGkpwzmO7l7j8=
X-Google-Smtp-Source: AGHT+IHhiSYsksiUJZaXhrUxKMiI291l3vgUBOGtTBsgy5MhQ/1zVXA15Jl441AYlQvkkX6MTxU33A==
X-Received: by 2002:a05:6000:4013:b0:3cf:3f1:acd7 with SMTP id
 ffacd0b85a97d-3d1de4b90bemr3571634f8f.30.1756651524724; 
 Sun, 31 Aug 2025 07:45:24 -0700 (PDT)
Received: from ymorin.is-a-geek.org ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33add504sm11141749f8f.30.2025.08.31.07.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Aug 2025 07:45:24 -0700 (PDT)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 31 Aug 2025 16:45:22 +0200
Date: Sun, 31 Aug 2025 16:45:22 +0200
To: buildroot@buildroot.org
Message-ID: <aLRgApGA1XJONpnA@landeda>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756651525; x=1757256325; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6P5ZXcZOv05raJY9K3IwVB7PC8Cx2ZUmWMPdILJNyhw=;
 b=fYGww13wtJ3+FPlfO2JAB4XoHlmsYvenYuVBLqukSYa2ce3pubaCbR6uKK44qmcGoi
 6JM9L8QfQkCVI9aeNPYbcuxf0J9gJF04JpbOOuEpwDvxYE97rB/Dl931ntZ0Eukxnjf1
 +RnpO57FR0wE/2JUyp9EbAx5komu+5Wsz45K0xmZK3XIziYq53FFMWohCWnIxeeQ4ngF
 jnUIjm33oI0X8u/49YqAY4OxN2/d07jGEMBf/Ex7yVSuDaWeG4RBtsf0piJ6IefsKF1L
 /2kueH/+yJ/uE61CosopYBHrBRWWd57iORvoKd4ufsAjdYMz0uO78vjsRms+Lq0PEape
 /cwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fYGww13w
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

Hello All,

On 2025-07-10 22:22 +0200, Yann E. MORIN spake thusly:
> This series introduces support for so-called merged-bin, where /usr/sbin
> is merged with /sur/bin, as an extra step after merged-usr, now just
> requested, but in a relatively close future required, by systemd.

Ping, any further feedback on this series?

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
