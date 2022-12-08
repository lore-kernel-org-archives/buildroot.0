Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EA5C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C38A400FE;
	Thu,  8 Dec 2022 21:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C38A400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pa5Dx_juPzE0; Thu,  8 Dec 2022 21:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31B0B404EF;
	Thu,  8 Dec 2022 21:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31B0B404EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 81EC81BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52C444193F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52C444193F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHyRxO404jC5 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:19:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DDDA4182A
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DDDA4182A
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:19:23 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id m18so7006216eji.5
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HWHoRF4NaznwMV5MkYsn7lB+TGydWSSt2rva+nUm+bM=;
 b=1/wqfsJrLUXjbA6edTzRZdorBH0uJe9goVcejeIhgUjNnDV85TUUZxtE4hZu4DGAO+
 9MSefoLg9QVVV6OEaFAdVgmMn/KtHYMYn2cvBX7RPIMnmwgqO0wrGjxxwOLBQFT3yNog
 Md8wAw2qvmboeY1HgKcRd93Y9KsZH6KKivhPJ9546QbQediY67p38KoDyU6ilHZMR3Pp
 AXc6WF6DiWKuT6e5CWvZ7Mj94B6cP9eyBEaOd/07bfpVhNgTCumpW+mYyxOIpOg0D8AJ
 Ba01FfvhRw4VkY6WKP1WSq3IPgsKtaCb4N7B2YMRJdyKSgQ6ebW4of7b+BWRY6Mmt4gp
 U13Q==
X-Gm-Message-State: ANoB5plqNDjEEoA810fDRqVvqWWPzSbpQwKbl2j8hUeuG/AWExer7PSg
 O72+n9qOEpgkoIqY5xV4DWy4aeJhMl3IGGOYc70=
X-Google-Smtp-Source: AA0mqf5OXSDqWAYACPnpJoZKGJSphzqmiAX7uLaSGgQOS/Tt1HQ7iRnZGviSJT2MUo07DK193qWEJA==
X-Received: by 2002:a17:906:1146:b0:78d:f455:311d with SMTP id
 i6-20020a170906114600b0078df455311dmr2698893eja.69.1670534361550; 
 Thu, 08 Dec 2022 13:19:21 -0800 (PST)
Received: from [10.0.0.222] (5.186.52.63.static.fibianet.dk. [5.186.52.63])
 by smtp.gmail.com with ESMTPSA id
 7-20020a170906318700b007c0aefd9339sm9154329ejy.175.2022.12.08.13.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:19:20 -0800 (PST)
Date: Thu, 08 Dec 2022 22:19:14 +0100
From: Stephan Henningsen <stephan@asklandd.dk>
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-Id: <2KCLMR.A41GGA1OVAND1@asklandd.dk>
In-Reply-To: <CAGm1_kvZRbdiG_cN0q+j2uotkH1JiQ7G0_8jh5DOMRGFzWE-Bw@mail.gmail.com>
References: <L7LIMR.275SNWR6N2GZ1@asklandd.dk>
 <238d6047-b2c9-244a-2301-7faa93f3057d@gmail.com>
 <CAGm1_kvZRbdiG_cN0q+j2uotkH1JiQ7G0_8jh5DOMRGFzWE-Bw@mail.gmail.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asklandd-dk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=HWHoRF4NaznwMV5MkYsn7lB+TGydWSSt2rva+nUm+bM=;
 b=Z/YV4vCxKwCQtTozPepoWmR14EDbqDA8OJAlrDn7sXgcVzbG5wPdpN8zLOxidgbfX3
 TxQbrjBzyZIFqxIxHligLZkTPIVJ0dlw6i20OHP9SfT2IYKHS8BcD8wo9YZRxxhmlMHR
 sIzdKGT4Ns5Dx1w4wP2CJRYbYw/GyVMXlt6rqlJn06jogILssiavjDaSy3pFuEZWtn0s
 pfSfldleLaCLjXiS5lVImfwlt+Sm5PQTo4nO2WU4WEzjxkLrd5tI18i+NGoB2abplOg9
 J/2HLt+fYLOdnvuxTQkjah1Pub6luMBXYhu6V+yKYW0+1KtIpadbbdCK9hFQ1WUCFMxu
 Mkeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=asklandd-dk.20210112.gappssmtp.com
 header.i=@asklandd-dk.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Z/YV4vCx
Subject: Re: [Buildroot] patch: linux-firmware-20221109
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi,

Thanks for your reply!

Good suggestion. I've split the patch in two and sent them separately 
as they're technically unrelated.

I've tried but I can't figure out how to use git send-email.
But I did send the e-mail as plain text this time, so I hope it works 
for you this time.

-- 
hhjj,
Stephan

On ons, dec 7 2022 at 13:56:06 +01:00:00, Yegor Yefremov 
<yegorslists@googlemail.com> wrote:
> Hi Stephan, all,
> 
> I would split this patch in two:
>> 


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
