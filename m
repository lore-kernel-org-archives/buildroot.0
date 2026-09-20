Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF85C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F27940641;
	Sun, 20 Sep 2026 10:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFIr7uGykV_L; Sun, 20 Sep 2026 10:49:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F04E840809
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789901351;
	b=WxepWOGSSMTgqdpOOlCThIpU92ZHWPD9Dm2xhT1/DQFprGDwn0ZQcu6LC/OK17mmmTi/
	 ZMTPatkLLG8UK28VCH0WgCU58SGkWrW2uC/O0OwNlFqz3KTmX6IEf+i9gA1zP8LtnM68a
	 z37gf0Avmb2I40DgpBE9UCU+uD4Nyts3enrCVtS0QFC7DOuV9HJ8CEOsv/ELVUz580zp0
	 FDDMvt/Sa3yu6IqC9uVi4z21X9tA1BgH/jstU030XBj2ecT7rGnFebjx7yPOtW9uJjDZy
	 8HcSCham5rLsFXS4T1VrPrgs5XSliDB7y8xwOvAH1P2+zAVxZtk7NVbI6DvWp4+OxxA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789901351;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Errors-To:Sender;
	bh=9Jt3aoMDvnVbWjUYx0R4QbDjy0aREtERHTvc6OKQrYQ=;
	b=Uzkv16j/CIIrldDUzqTsvThsvcOeTzXO9HtK3s9S3ogaBq9BrL455S2Gq4M8j8pAxiOS
	 Z5aYJiHayLc2Xq5qzz5UbE8hf2r77C8GRd11xqIfqTeC1eD9badr5V323+Blzt4hP3tca
	 TyjgegdbpdFJl2G+aYanCJXkoamoCHNR26koa36HJghxZZju0iz1WWv8ShJO7gNUp0QwG
	 VKEJ6PN7XOYNdMsOejlPX1x9lhLiZl7NpZyzRWSJLWVwQKS4P3iJjL/hFc2tD3FjBP5SL
	 TdSTP8Jz+Vxv+exhtRC5l/xvszuNkVQzlcq4IHvk3Nm9T6jp+Qrzx021XLNY3aOAT+w==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789901351;
	bh=9Jt3aoMDvnVbWjUYx0R4QbDjy0aREtERHTvc6OKQrYQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pNl13DH1xR/F5C6QvqYkx3MxHRV+zHYQuaUl4So2UwNkVXvrmpHeEQ4IL723dzrTW
	 r9bCc9Dz06ExAyz8IPooaHMBLPy8WP0Y8WbS4+FHMicenfdNuBf4hEKcPGN2TkuXvT
	 bHda8kRAg4sPWGeKw1WAozqz03vXCOus33zIlOf+AhuMrr3Bo5/W6Fw0x4Ooal+yfx
	 OgAc5r6B/gEHIT0LRhBjqbaa2rkelDLkxdTcRXCVWpWrmrVj+PDUpftfpOLbZIDP7b
	 IUyv58bci4AGnR9KiiWdSm9474WiLf9d1EzwFyY5L2EQbGoGjizlz3uwDhETjwrcz3
	 UzHN3mMnV4pXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F04E840809;
	Sun, 20 Sep 2026 10:49:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96E4113D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8868780C77
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uE2XgobUlxt for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:49:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 694FA808AD
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:3b::f"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789901348;
 b=J8XPG0Hfmav9yneeCBKxsMqcWTGYm1U9vnPgKYF4cbf6cDfdTTm5gjHrYqrSO91XYG4n
 ppfAdRS4IxlDZDJ0ZaHrtNr+B3R65SG56g+cGH3Hoq3zIW6mlEFouTQUzllozDfw0NXna
 G5SMCcweHxIuT8QFu/xKG++xGs0g9Hi3ORNsTTe7MKLsz3hjE1xjpR6L5A3lIMX6kmIWu
 NLjr4MY4dGh7yiO6Esk9TNWHzT9ntO6BSoVyXstDNxiQMDLsgVuN+NEkuKfrliq03lojH
 kzmbX6LET9E/xs0/5Bm0ng5y2OKtUqKYuqPd3KfpJq8KarALq/DGJBJNior15YQ7vhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789901348;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type;
 bh=IJ6S6OpupCHTko6dAcnY/XuVERqyhz/TdGY/4lkilX4=;
 b=K1573qsVJNVoYn2qx4GmR8e1hh2A9R0eX8QeSCTVRv9ghw49N/gK7+ih9kyRKLonu+3R
 1hBIlq5Te7xvWBIAmGtbaTKB+JCdP2JhhM17SsSH/d1IslUOvgQYvSqa/Ri8WITHeYhvf
 ptNsUhCeaI6psiw4ucqFBTwUoFOpHu4diB6zwFPfVXhBoCZg8+ep86YfY1kSo39TPJV1B
 qtNjNZuxUHbLZnHQoZe2tXnvzTWHYjxtgaPiL3G/nu5OS4uO4KEE4sKM6udv2zYfcVXpq
 IhJ8g1pxDoVetpxrVXkV52I/srSC4/CmfHNLlf8KMF2a1sCOLKHHvtsOBvklb50ZRnA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=L1VVts1W; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:3b::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:3b::f;
 helo=mail-pz2-x0f.google.com; envelope-from=aduskett@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=L1VVts1W
Received: from mail-pz2-x0f.google.com (mail-pz2-x0f.google.com
 [IPv6:2607:f8b0:4864:3b::f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 694FA808AD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:49:07 +0000 (UTC)
Received: by mail-pz2-x0f.google.com with SMTP id
 d2e1a72fcca58-85469b355ffso1251511b3a.1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 03:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789901346; cv=none;
 d=google.com; s=arc-20260327;
 b=YRzLowKSEGMBUkAQnxgGjyrSy1GWSeJhSseGrwIjK8n5jCByoS+PlJzzCdoici/S/f
 fLeAWdZNQerfYv/qUSc/Ym1tkvrLMEJC4qaYe1cGo0qqX9q4Uxa7ROO7EYtA6/2hTA1F
 Dtz1pQ/Za+IQfTzW6jTUdilhfTZeyUsd4R9vXTpQpSJJpcju28slUPP0vjgY5Jh5NQgu
 ivrsnZN0R3rDzbyd+jblp/FnkgzGFeIf7kgH7n+pHzL3CSi0Ly3b9jutycXvurPrWULd
 BZTl9ek19/Z9LFBZ/fiBwLfaVuirFFzAeKJ7g9iBcYp3jSk/Vk8rlMB3jpgCHNnuZCd7
 dJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=IJ6S6OpupCHTko6dAcnY/XuVERqyhz/TdGY/4lkilX4=;
 fh=kh8pKG+fe6a+B1/3Hq5WDAApo5FiZ3OREVPUrkIGlH4=;
 b=GnPAhPueW9uH6Maq2TnTDLj1wFCTeGLbuutH4HJVsbSv8WxxfwcCd2toImGzB2EqIo
 OLlnnSXiAsLOQs3loseJ3+mW/8qV+8Hrfq77bKkU4fBoRqI4RRFWLkexoh67bVrR72h+
 wUiBeC0w+AHEhR5zIzF4qB03z9lifTSi0KOKtqn8EniP6aDdSnm2kvOSLYhg29UMggr4
 ym1+BwASYshDifMCQPvVpHtez2J0iXcb83yxbQs2SJ78qgdtunwGThrg9ldO5Vo9Ycmn
 8Ekv82+ybVnv0Gs+QPKufm8/FrW3b/1DRzH1x9G5mGqDvlfi4R6Mfu15hRlHjAUSwKBx
 YsyA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789901346; x=1790506146; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=IJ6S6OpupCHTko6dAcnY/XuVERqyhz/TdGY/4lkilX4=;
 b=L1VVts1Wz+N5YGRJDICl64qDg6Pwt3OWDklHW16RKkHSvArFm47H8GfdtsM1opRiv+
 95BnfQNtEW1nWgxScc6IlFUCaRhZBCMU6EGA2Xkfu9zGPRcLMmbnbKh8vGBMLXiD2TGl
 lQYYRLQAbEzHZciRITRz5WWPBAlekyVuan8Rk4iwXPBI42HcVM6AmIKzghEaDmsm4W6F
 PxqwzMyU5iHQRS0Ld6e1GP7JhSl2HRN2+wKGI9Q4BBet5wAXvdstUp0G6EEpeTR4Jz7u
 QthlBfurTyRsqDy9GE59hmfeYgkI54GTPd1yuAekWMMyQcs/slCWaj9ZgM53V72k1DJ+
 QoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789901346; x=1790506146;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=IJ6S6OpupCHTko6dAcnY/XuVERqyhz/TdGY/4lkilX4=;
 b=IelmutETFoaNewlvsGStdTrrtUUEgCFrIkWNjossbwJlfcMTKwoC6o7fXybxwkE6P8
 bxeWZw0OQCL6mlWfs/Sf703kFqU+3REyQ+9Y2FfdGW7Q+qkkesr+iAzLy2B/WZQs+jRJ
 DoeA3ma2nQ/9LBwGZdZSb32W8ymxJKXSZQ+6JQZbLuPGoYwK/3c/YulJMNUNEJgrNTCq
 Zs7hYU8dE6ChzwJ+vpaVS6Mb00m/8VVfHBNUKWzLPmcVp08rLd25ZfZBPYX4eEboyu/S
 wiZgn57kdH4lLYNqBpNRfOkrawRqwcJkoGZkFrrloHTg2z/56PyYE+hRjZAWOSVmKXFC
 DzmQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByb9aBQhMyKSn7Z085DYet7rvEZi2ZMC/BXPfWItPy1yI4+8KVFTAu8HXBzWStaVfak9OtZyxtP2jI=@buildroot.org
X-Gm-Message-State: AFuF++lN/vn/8S5SS1Tit6etsz7JV/CMNsyq5BGVrbfL5nprXrDRGi7E
 /nDXYEeGu9rHua+O6wM8DFGxjn+immcCTO2s6UvKeX32IdEmRW2vNtEWHCgB8HjvphpNTRmoKH6
 axAbbfl7NE12hRLTbFvB8v4VGb2Y+cEQ=
X-Gm-Gg: AYBFou3tD9uyhhSEvqXUKmzkpLGRtOFHdiZXnLaKVCMDM12MYzRTACzGWERPrcSBtIM
 G6vGUMswNN38/Qbi/KbNLtRHfZx86PTpzkw70vkdWQFZ23A0DzvQrcUSSP11ASGtRa5sT8YmHME
 +kilqgye0dqHgsBCMoARQQ/mMaVh4D1lhT8+WxPtdjWIZPRBaTjKRYaz244gx1pncnUaoZjHD5C
 dkS+8qmhlc8REhlZOVkdLwESTXBfzfnwJ+GiJil2zGFUje5Txu+NjFQ1XETuM1UR+3qzJ+foJ3Q
 +xEAF96G0SF9JaTPWltIhHVuk4w8+a44AGZ1TqDZk1KrFEj8PEUdeSRz4P1PKeINhUmkcD5tp+7
 50DRSIrAiJ96DuEE=
X-Received: by 2002:a05:6a21:390:b0:3c3:bbe6:95de with SMTP id
 adf61e73a8af0-3dd8c3d18afmr14204993637.6.1789901346268; Sun, 20 Sep 2026
 03:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-2-bernd@kuhls.net> <aq-xqh_4_J_v2lQ6@windsurf>
 <CAFSsvmpcYXFia=4TuZGKAEpyciugC5nUn4vM6nYTnAQHG_+G-w@mail.gmail.com>
In-Reply-To: <CAFSsvmpcYXFia=4TuZGKAEpyciugC5nUn4vM6nYTnAQHG_+G-w@mail.gmail.com>
From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 20 Sep 2026 12:48:56 +0200
X-Gm-Features: AcwNN1XBBOrN4LcRNJdyPCX6fgVN3T86NdLZ2bKRu2XwHXXOhggIrpLtlQJOaFs
Message-ID: <CAFSsvmouCNMVzccaftqanK-qJhoMXUvWQnRKnQ5LLTWzTQZkjg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot <buildroot@buildroot.org>, 
 Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>, 
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>, 
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, 
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 =?UTF-8?B?Q8OpZHJpYyBDaMOpcGllZA==?= <cedric.chepied@gmail.com>, 
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, 
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>, 
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>, 
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?Q?No=C3=A9_Rubinstein?= <noe.rubinstein@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 David GOUARIN <dgouarin@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>, 
 =?UTF-8?B?QW5kcsOpIFp3aW5n?= <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>, 
 Philippe Reynes <philippe.reynes@softathome.com>, 
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Subject: Re: [Buildroot] [PATCH v2 01/77] Remove mender packages
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
Content-Type: multipart/mixed; boundary="===============4496493943948552176=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4496493943948552176==
Content-Type: multipart/alternative; boundary="000000000000ed6a8d065be7e1f7"

--000000000000ed6a8d065be7e1f7
Content-Type: text/plain; charset="UTF-8"

Again, I want to reiterate, that I have a patch series that gets Buildroot
ready for mender 5.1.0 here: ://
patchwork.buildroot.org/project/buildroot/list/?submitter=43

With zero feedback for over a month. One of them is a simple one line hash
change to a license. Another is to prevent a warning when sync is called.

Why would anyone continue to try and send patches when the response is....
Nothing. No rejection, no comments, no feedback of any sort. Hours of work
and testing only to be ignored is a far worse feeling and more frustrating
than being outright rejected. Not only on the mailing list but also IRC.

So again, it's better to remove the packages completely as the maintainers
have repeatedly made it clear they do not want to even look at patches to
maintain these package, let alone respond to me. That way I no longer have
to patch Buildroot in the external tree, but just provide the packages.

On Sun, 20 Sept 2026, 12:33 Adam Duskett, <aduskett@gmail.com> wrote:

> Hi Thomas;
>
> On Sun, 20 Sept 2026, 12:17 Thomas Petazzoni via buildroot, <
> buildroot@buildroot.org> wrote:
>
>> Hello Bernd,
>>
>> On Sat, Sep 19, 2026 at 05:57:26PM +0200, Bernd Kuhls wrote:
>> > Building the current mender version 3.5.3 with OpenSSL 4.0.2 is broken:
>>
>> FYI, I am not a big fan of removing Mender. It is a widely used and
>> modern OTA solution, and it makes a lot of sense to have it packaged
>> in Buildroot.
>>
>> We have not been the best at merging the patches from Adam Duskett to
>> keep the Mender packaging up-to-date, but I still believe Mender is
>> very valuable to have in Buildroot.
>
>
> I feel like this is an understatement. It's better to say completely
> ignored, including my emails to the original RFC for this patch series. Is
> it worth even keeping these packages in Buildroot when an external tree
> that is actively maintained is available if the maintainers of Buildroot
> refuse to even look at patches to keep mender up to date?
>
>
>
> Its rewrite in C++ in its v4 makes Mender even more relevant I
>> believe.
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>

--000000000000ed6a8d065be7e1f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Again, I want to reiterate, that I have a patch series th=
at gets Buildroot ready for mender 5.1.0 here: ://<a href=3D"http://patchwo=
rk.buildroot.org/project/buildroot/list/?submitter=3D43">patchwork.buildroo=
t.org/project/buildroot/list/?submitter=3D43</a><div dir=3D"auto"><br></div=
><div dir=3D"auto">With zero feedback for over a month. One of them is a si=
mple one line hash change to a license. Another is to prevent a warning whe=
n sync is called.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Why would anyone continue to try and send patches when the response is.... =
Nothing. No rejection, no comments, no feedback of any sort. Hours of work =
and testing only to be ignored is a far worse feeling and more frustrating =
than being outright rejected. Not only on the mailing list but also IRC.=C2=
=A0<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">So again, it&#39=
;s better to remove the packages completely as the maintainers have repeate=
dly made it clear they do not want to even look at patches to maintain thes=
e package, let alone respond to me. That way I no longer have to patch Buil=
droot in the external tree, but just provide the packages.=C2=A0</div></div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sun, 20 Sept 2026, 12:33 Adam Duskett, &lt;<a href=3D"m=
ailto:aduskett@gmail.com">aduskett@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div dir=3D"auto"><div>Hi Thomas;<br><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 20 Sept 202=
6, 12:17 Thomas Petazzoni via buildroot, &lt;<a href=3D"mailto:buildroot@bu=
ildroot.org" rel=3D"noreferrer noreferrer" target=3D"_blank">buildroot@buil=
droot.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello Be=
rnd,<br>
<br>
On Sat, Sep 19, 2026 at 05:57:26PM +0200, Bernd Kuhls wrote:<br>
&gt; Building the current mender version 3.5.3 with OpenSSL 4.0.2 is broken=
:<br>
<br>
FYI, I am not a big fan of removing Mender. It is a widely used and<br>
modern OTA solution, and it makes a lot of sense to have it packaged<br>
in Buildroot.<br>
<br>
We have not been the best at merging the patches from Adam Duskett to<br>
keep the Mender packaging up-to-date, but I still believe Mender is<br>
very valuable to have in Buildroot.</blockquote></div></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"></div><div dir=3D"auto">I feel like this is =
an understatement. It&#39;s better to say completely ignored, including my =
emails to the original RFC for this patch series. Is it worth even keeping =
these packages in Buildroot when an external tree that is actively maintain=
ed is available if the maintainers of Buildroot refuse to even look at patc=
hes to keep mender up to date?</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blo=
ckquote></div></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
Its rewrite in C++ in its v4 makes Mender even more relevant I<br>
believe.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer noreferrer nor=
eferrer" target=3D"_blank">https://bootlin.com</a><br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" rel=3D"noreferrer noreferrer nor=
eferrer" target=3D"_blank">buildroot@buildroot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer noreferrer noreferrer noreferrer" target=3D"_blank">https://lists=
.buildroot.org/mailman/listinfo/buildroot</a><br>
</blockquote></div></div></div>
</blockquote></div>

--000000000000ed6a8d065be7e1f7--

--===============4496493943948552176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4496493943948552176==--
