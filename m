Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29277C53209
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 12:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA9B3605F8;
	Mon, 27 Jul 2026 12:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id airIuQNtK-gn; Mon, 27 Jul 2026 12:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E135060617
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785156463;
	bh=GGh6Fti3tT9q8zKQh6E+MMSxNOIZYf9h2vQbRvGZ1vQ=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dC3Hb//s5aRfKlQ5oWgTjUJ5/Q5NuMvjjH5lmf1/KQpnNpYngyIG0J77HCIWhhFh9
	 QfCu9s2kj82K7V3Fiskkmr/bWiqzqvWT1SpaZJuZ0+T1GKc8i+6+dcGBRgQthHGYT6
	 +F4tpZUhhN1edkC+jZZ0xe3lfZcxGM0ZEbdUwV27ImxTs13j5jHyB0ZgOJOEGuw+v6
	 8TsbVP9Vuo5b10QREx068dDEpUW/8D+Ujwy5i/K6dUupavYTp/1fJPl8LEH03zApmB
	 HEsT1bMGtsor7PjblS/L3H6u8vxLyEp6QKaIiTBNvNqZ8h8erTmEIi+qiXJ3NURwmO
	 zqJd8of1Myg7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E135060617;
	Mon, 27 Jul 2026 12:47:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A55804C4
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 12:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A296380DE6
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 12:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1fta8FFtqhc for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 12:47:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A12C080DE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A12C080DE4
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A12C080DE4
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 12:47:40 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4954c0833b4so20006575e9.1
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 05:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785156458; x=1785761258;
 h=content-transfer-encoding:content-type:subject:from:to
 :content-language:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lZuTFxEmW7CUuABarwP7qo8Q2kDRYTdhJGgTWmn56s8=;
 b=tI0KNSJYZaova0YkCsrd7KsCium2ab5BViApjqhgga7VR3YHuxET25t1HycWp93UCG
 QVNX+bTUYSmV2vXzRRbKAdxvrPiYYvvxZ+4pQNal+LZq5mUd6mh40x//1dYcrNhf6+Pv
 SGctsZXtjKXEfpxj+ofwjMKc/Fskk7CNekSF1s8MHwCJZ9bWnfLlaKvrJqq4DNIDWKOO
 hDFbrWgObHIHm8Rl7CvQYLBxmklAqfikmZ4Hxqlb+aX/1CcwsA9jT2eswMIoYFez9PCN
 wqms0xCWE1IiZCySxnCXOhGnvSW2BfZEdmZhmmWJqSraP0tGuHNp6j/8cXhPf0mpXyA0
 9/jA==
X-Gm-Message-State: AOJu0Yzh5Zt8rbJeYFz9LpbOYXm3Kg4yttoOiwHGecxbVT+Oz948Ne5m
 b6lTIzzK/CslIT+jw1BsAVTMA2hXBtujnC96uwRE4EY70gqkSjSAKuP71LS4w0D7mIuUZ4iiMwy
 o48Ej
X-Gm-Gg: AR+sD12Y0aB3AoOs1Ln/I+L9eXnuFKwS1o87hjRudoQ/rA2K/Nw3Z+wOcFxyDxXTfKh
 rkknBUCEXxz09kqsm+1s6WsIk2wv8heJep1zoH9R1TRRgLTU0rjhpfM7lHWBeiR/+lw4GE9uopL
 GA471In+r12yZmQpLfiloA0PEG0ooI2Flb/DUjTsM3ndzIsYItMZ+3oQ9ngT/v/53E+treo84cA
 kRJXhszWNYn0cNnJF22c3S0/N8B/ekaUB43OYCN66gn8yMcpDLE3O/5OaVzNImxYjyP15sQDRF7
 pFXgdTG6v0CdCEuqbS6QOE9MZF7U6yXTqQtMhYK7meZq4nr5iX0t0NMA1e9ZoBSIfl24AqESjAP
 yR6ycSQsWiVjKd22DdYRme/JnLJ5plJM6Cfk42tHT7L1zNU8V6qfGcDg6APBVz5rIF+4GPKlTQ3
 mupmZjiq2K4yQ9TuDUNG1W9KbqD6XO9Tlrd44KyqLGP98Q526HsJy8JI8yMzs1pVU=
X-Received: by 2002:a05:600c:8012:b0:495:680a:ed19 with SMTP id
 5b1f17b1804b1-496b57297c4mr103857875e9.32.1785156458294; 
 Mon, 27 Jul 2026 05:47:38 -0700 (PDT)
Received: from [10.0.8.144] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496b4866813sm253855305e9.8.2026.07.27.05.47.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 05:47:38 -0700 (PDT)
Message-ID: <f12b3f4f-a280-4b45-8d8f-3af71e0eef14@mind.be>
Date: Mon, 27 Jul 2026 14:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785156458; x=1785761258; darn=buildroot.org;
 h=content-transfer-encoding:content-type:subject:from:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=lZuTFxEmW7CUuABarwP7qo8Q2kDRYTdhJGgTWmn56s8=;
 b=dZMHUh1CTl1kCThsFh704pmx+HNBmZ02BqIBtfWaEL1edSaM1P8yJUF0yYu8oEvyna
 0FIa9KKNbqW77n5XE5lSsFsuiXCjwOhKZc8w+aXHVmBKzNNm1RqHznZ+peouQ3Nl8BZv
 Z/miPTYmJZ8v8fJDsKniXIgKflRxLj3cWFhu9eBujSe7fblR0DmlDVkjHsVGHqunkG2z
 NyMy0tON74VHkmW2LfwBoTsp4K9X3vQUIVHopZsc8cBLm/zq9AHqdEbFD5Owltp7TiiW
 mFqxNFaG2phCwceANMFuIB1JA5s2G2tPSTyM1xS6MqxS52c3wfqtjGJ/IxVWs3UJVj8Q
 IG3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dZMHUh1C
Subject: [Buildroot] Buildroot Developers Meeting after Open Source Summit
 Europe, Oct 10-11 Prague
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear Buildroot community,

The 2026 Open Source Summit Europe will take place on October 7-9 in Prague, and will as usual include the "Embedded Linux Conference Europe". We definitely recommend anyone working on Embedded Linux to consider attending this event!

Not only because ELC has great talks (spoiler alert, some Buildroot content coming this year!), but also because we are organizing, directly after ELC, a Buildroot Developers Meeting on October 10-11.

If you're using Buildroot, working on Buildroot, contributing to Buildroot, or interested in contributing, you should also consider joining our meeting.

See the event announcement:

   https://elinux.org/Buildroot:DeveloperDaysELCE2026

Note that we are looking for locations in Prague to host the meeting.
If you know a company, hackerspace, or an organization that would have a space for those 2 days for ~10 developers, please reach out!

See you soon,
Titouan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
