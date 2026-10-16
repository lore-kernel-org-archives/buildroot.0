Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB38CCF2C4
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 21:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A572040A27;
	Fri, 16 Oct 2026 21:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1i6-Pq2ljFjJ; Fri, 16 Oct 2026 21:29:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B8F8740A2C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792186171;
	b=Fvr0cmbehyrASwbgIEzgg83sxEykYjkLSllcajIzettuurpNIm4wpZ+gsRBea2EClQP3
	 UZeYMgropvWxuK1iEnIqjFG64vgxowS+jr3YvUPtxBx+59xA2jLXfPdRbiVe58Lx9DqiP
	 pQ6aeeQnS/4WRJof615tL7w2nNoTKqmg8D0n8P4JlALWjjjHkoZ0cb8l8MGZErz2HYNfR
	 Ba0SyUi6CaDDy1Tyo1njSAIvOAP7tNnmrHm6u1o4LJZSDqRJEzGjAdrkbqBx8t41OQaE9
	 rR+4O4bXKG4MY+CVOVW9NrnqeS4hwI9Y31zyrffqVLwGaNoMszk9q9uchN9ASk+Pq/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792186171;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Reply-To:Cc:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=B2nK28dyJGcZOPfAS1u0UuRQef6eUq8YMcB0WubYPaw=;
	b=O3sfZuqqA/iAxuCEX9VpqnlBkIWJufxju8gtmIzTuNnXb75TQ/e3vCCNpmxRxXNDjAeJ
	 gwUICMTcr1qPVpiu87BgkQQgOPnsTb5NEHsoAc/S5jnanpaOWYwMXOI8uoT022nqwU6Jq
	 +zufcDuxIEsrnsmeLKeWJyNzwWgIinAQI0rNmbZZDO7mRdv/Cq9HU0LnNUEnr6MfuSrUV
	 kJ+nIWtULVj9OQ2zUpF0/C35p/IyQQj4YpOSiFQ1aD4q2om7F1ieDP+4Jgei9+OhS/ZRF
	 x7+9AGr23w4FmvYYtksx9YaQo8ysEMdcbHr+mtqiq3KbULmaX88dH4QAmEWwesGsb9w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792186171;
	bh=B2nK28dyJGcZOPfAS1u0UuRQef6eUq8YMcB0WubYPaw=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=HYExxqKGcotsW3K0QwrGW/TLxb12MCU/htZR4IGFkP1G67xfUNdP9ubKkZFJvzUlA
	 EaAF16KusvG2bJnjBWvqnvdrS/rdd/5sj4O/P5hF5i96O9zL6x+bHRBg+zp2pc5sz3
	 8b0U3+ihbYFDto2hXIhvaS9qBLyMD2paTnkbFfRM7sPHzXk+l6AsPHUkx1oX029jYx
	 XJtoVWSiY+J+ufXAZasHHpZYGPuB0Qm8QHwuhebPiGJHykBHVvJd25iIkMhEvV8FPv
	 6Cgu/V4wFIyHAa3rCn3GtM0cIE7m3JIqlLU2HIUx+lMWvva0jI7lUlW24DnRiMsqHE
	 hKzG/bxZ/BERA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F8740A2C;
	Fri, 16 Oct 2026 21:29:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC77075
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2ECA406E1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xdY0tgn0f0x for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 21:29:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 89841404E8
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792186169;
 b=APU5YBgY6DZ/XUJV+x81BopVt66lLfR8ARC3/KcLUb4Wq00s/Z29sp3lPISQOmwTcX3J
 LeCQYL7UKabnMRPTTKoeHNrvfL78ypU1mPuBJsK6b+L3IjkGCGnQPO3C5TERKgb9qfHrn
 769p55ynDz/5L+d8sXvkEI+fDIFcwa2bMkFH78ogMyBh8kxT3nydeFLgze7y7RyhvdxDS
 0j1854XuOhymNT2dOh+STahR9e0q9iSdUvQlltdYp+9euWZEC0ccmxmjrgrkoQeqivwUA
 oT89pRtdfhAf8mY7QQxHkOr6alsIpmnwTmxucObDeiVqEg9WzKFve15HMKwruAF4BbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792186169;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=99ou6TmIDRZI01IMhtpzSkV/39ZQz4LWEKfrSYpT5OM=;
 b=oDvDUcs/7jg3KklR2+asiBQN/VnnbSX54sN2fwCuDjnrjDDZhEVIdYAHupn/PXsR00ro
 8ZA1gzYGfvTUESVwHvvTo2BFgapI9HoGr+6llEPh52vnRLZ4dKoMoSlW9CAbqmr4IWRZk
 h7TbzGdPCCzm0n1gionTlqm1KQ/r35qTHADhOwQ9Cg7T1ZdIhqg2KdA16ZEh4WawX8987
 fuDzlAESHhK8mDF/9usfcNVdMqthpLmPmvXEliTi2+ezYLlAf8pjE/mE57pNnhBfo789o
 uEo7D4ZpIs49DM2FKx5Wc9duOIpdYtvGG/xVGSXxBFKrlpIUVySleaKY5J4Il2SZELg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Qi4S5voZ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Qi4S5voZ
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89841404E8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:29:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48afcfc4bf5so207143f8f.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 14:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792186167; x=1792790967; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=99ou6TmIDRZI01IMhtpzSkV/39ZQz4LWEKfrSYpT5OM=;
 b=Qi4S5voZC5hB7Umz7Ega8oJfZlxP0WLiawekLrlOnD0wH1fPPUaYdt7pmcnjPxFaUG
 UiEBggLAmXP3naOWQqd4sbbOrFIESwE+ydegIGNvwUd/JcpNuCU2R0oll1nrHOXY4R1G
 fJXsq+q+dDV2ve3lW6nGIwmePvf+pYVXZSxykHI11KCiBpVy6h66IdLfPNoCPT4N0WW3
 yEaC7cKMAXm01VzIfo+wechJZL7o1ejKZ9hTxpZc+tQw19W8EJnBS2dmUFKnv9lgKpl7
 XBYAAC1XaRWuotev6UZEBcJOKUqnOCSoYr2O6gUFS8gPxnOWX9DwYJKScHzrBQ+hpUZa
 yWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792186167; x=1792790967;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=99ou6TmIDRZI01IMhtpzSkV/39ZQz4LWEKfrSYpT5OM=;
 b=RJV+ROH/SgYx8JwsIVYvo9Zk0U294f8/trQMGiWM3faD/n5Ap7RdcvPaaiGzle7Slg
 IrDeiJ+bKtYV4fcAHiGVMI7/KEnCpw6+gukej/CrlyT0Ts2Wxchpl46s1BJg2hVW4c2o
 uHFBswfW+LCRI+zU0kwiRgZc6WEKYkYB/EQLZRk8cage/gXmj8tmzqT4O00MyNAKUtEb
 OlalFhAiRubvIyWjzeSuGjDPZFUHmDE/Gu3s1iQLqXiOe0dUxzAgu+nLb5TkBjSktsRh
 jLbFBil/vHdgr9WX4q99A5H5IdOBAD3D/Ipczzkva1OF6c/DALAgufs23Wv/M+pCxM0R
 Rfdg==
X-Gm-Message-State: AFq9FYLqYwr+Ib2lnIwf6TCfpSGom7bvw6S9tTvs6GIf3jQ308XOqTM2
 e62FStMOEtScPN22OZZVw5G2PzS6rnA0u7cSfXnqDmz/SAjY+AwDGQ4z
X-Gm-Gg: AYBFou2T+1So4VpOkFJQUKtFBLzNQ0xqN+EhAAKP0ZoJXTRCBLbNMxhkJorAZkRBIOx
 OIFKdc/8WB/CjiPe0/RQbBjpT95+ALHkQp9gyCsJfQEuHVVU8F+UmoiWu3zZhOQl+0dt6EH8oaK
 Qrww2IknacAUqbWX/+eCBdgVZrt2VJZRMOvOL6W5KM+F0z17wjP07Mk2ay0IIJCHyZVJOMnEkEv
 JOKpTVvxsn/a3pJrLtMAf++36xDuHCEGGWvJdEEkBMsoidwW+GyoiiKvG+bsz1O4GJl/4+3L8vy
 2pr81ECE9PWaIkSxOpE23dEFJHSvhzwgnN1twT0TJgmAddNs/5yNi1KdWLqjn52Y6P8E5pK9q0N
 lA+g+WhUvSGZ/qOzSL1LuCUZUiiL9nmGa1iH3gMyIqBVZMMsCYhpf2gPJvIiWe1uurQhxrNU3aX
 jtR6Qoc8neuNW1WYvkA/HGD6GwpOCTWsS+F9p4XisyqHcS6d6sD7GGGfn5n93xrg1GFnYo/eTBp
 7CVNZuyeUIDvu0/yVXBKF0hndlnonHH4jWm34rBsL7ikg==
X-Received: by 2002:a05:6000:24c3:b0:488:57ad:d5c8 with SMTP id
 ffacd0b85a97d-48e079759cbmr1752152f8f.3.1792186166587; 
 Fri, 16 Oct 2026 14:29:26 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd5038b8sm7491896f8f.48.2026.10.16.14.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 14:29:25 -0700 (PDT)
Date: Fri, 16 Oct 2026 23:29:23 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20261016212923.GA331129@pevik>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
 <20261011191210.GA129909@pevik>
 <734360bc-1e66-4584-b04f-f5405af3be1b@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <734360bc-1e66-4584-b04f-f5405af3be1b@mind.be>
Subject: Re: [Buildroot] [PATCH 0/7] Update kconfig inrastructure to Linux
 7.2.9
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
Cc: ps.report@gmx.net, yann.morin@orange.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

> Hello Petr,

> On 11/10/26 21:12, Petr Vorel wrote:
> > Hi Titouan,

> > thanks for this work.

> > I'm having a trouble to apply your patchset. Could you please rebase on current
> > next or master branch and push your fork somewhere?
> I just rebased on top of the latest master
> (f43af4ef31cd40270c7db94b98c0ff9f212e6448) and pushed there:
> https://gitlab.com/essensium-mind/buildroot/-/commits/bump-kconfig

Thank you! FYI Now rebasing to current master requires resolve another conflict due
5177cf9c2f ("package/openssl: move libopenssl/libressl options out of the choice")
(Not difficult to solve, but if you rebase you make it easier for reviewers.)

Slightly problematic is that output/ format changed. Therefore
without 'rm -rf output' make config fails:

$ make defconfig
Config.in:23: can't open file "(BASE_DIR)/.br2-external.in.paths"
make[1]: *** [Makefile:1050: defconfig] Error 1
make: *** [Makefile:83: _all] Error 2

Obviously this part in Config.in is wrong:

# br2-external paths definitions
source "$(BASE_DIR)/.br2-external.in.paths"

bisecting shows the first bad commit
121d3e6800 ("*/Config.in: use the new $(VAR) syntax")

With removing output directory first everything works.

$ rm -rf output/
$ make defconfig
...
#
# No change to ...buildroot/.config
#

I wonder if we can ignore it.

Kind regards,
Petr

> Kind regards,
> Titouan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
