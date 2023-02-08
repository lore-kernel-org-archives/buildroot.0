Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7B1C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 08:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D506F6109A;
	Wed,  8 Feb 2023 08:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D506F6109A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IJEujpPt3C5Q; Wed,  8 Feb 2023 08:05:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BF87610A2;
	Wed,  8 Feb 2023 08:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BF87610A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB6E01BF5EA
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 08:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A201881F49
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 08:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A201881F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hb2y1FFmMc7Q for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 08:05:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39DE681F2D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39DE681F2D
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 08:05:05 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id bg26so12742021wmb.0
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 00:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6d87QOGJP648yYQ2I8khhnYlA4SHFfdgTH2kLdTBsKA=;
 b=tbp3fUYvxvKeE4UsMeoHdh/yCHVadjmW9owU11AI6BlsYOkI3dhT0dgd/4gLe7MTe3
 1jhTk221OX2AqgPjcQSR83qfpJNrTpZkjVe+ADeVws4ZUtBxXYAVYI6MP/HyA8d1Irwa
 Z+ycm5Q0OCi4jiDOpO/Rjk3lZoGUxRxO3yYQRaVaxEN/RlN1/pyzS7FuRNDHJH/GvVq7
 okmm/Ost5J8GkflsLmL8oP/vexO6SOwPjJrMlYP/xtE7Jv2OQjXLsvSso1yY2EQnATVO
 iLJb95xFVBrbhW2L/4QAdZeKEwnj//IeKRqMnASaDUJVg+nEfDSw3Ckx3E6LIgnqgIKl
 mexw==
X-Gm-Message-State: AO0yUKWMRB7XxM1aGkW9fjVhYu+35NB5aiHJafGpdynLJaiZuIuHcbl9
 UuqwXS4cygNjJ+7OAosbyCG5+zAGEcgyV/Y6
X-Google-Smtp-Source: AK7set8VW0zpqyYCdwT1gSMrCKCWsd/cuYZdB9t4yjEu1w10BkNzvBTy2h4pZGiqcgGCCcTMCmh1OA==
X-Received: by 2002:a05:600c:164a:b0:3dc:5009:bc74 with SMTP id
 o10-20020a05600c164a00b003dc5009bc74mr5540319wmn.7.1675843504282; 
 Wed, 08 Feb 2023 00:05:04 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a1c7401000000b003cfa622a18asm1173673wmc.3.2023.02.08.00.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 00:05:02 -0800 (PST)
Message-ID: <6fb44e39-92ac-60d3-2c87-8c156ac850dc@mind.be>
Date: Wed, 8 Feb 2023 09:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: John Keeping <john@metanate.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230206162617.1907911-1-john@metanate.com>
 <20230207135503.GF4124@scaer> <Y+Ku/Thi5kKP4P8E@donbot>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <Y+Ku/Thi5kKP4P8E@donbot>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6d87QOGJP648yYQ2I8khhnYlA4SHFfdgTH2kLdTBsKA=;
 b=IMHBL31s6q4f+xxsWoYIqABQQRbHw1ZCgrLMV1zQDjbNM43jdNsWtAlSFXMXtp4MVb
 DSHs8yPZoLtxXzHcyyqkO0NfBQjS+5aHNYQcLG3dZ44gmm2+/DnUM7jH27uxQGIdzygi
 v/NqmCi2LBQW8do1e6tN2OFJdI4IDtyYvuOV3cYOfvDVv5aWjqvBxfzX1P0qBf0oRPQZ
 V7RbYBxJISE0k36S0p39k2dGkxELHOSam/aL7GUF8NHFMW2DY7XkJUoSKCp7RZZOdLCH
 qilFoFL1MY5ZW7JvNRwIKo/EVeybteZAtRjfvdi3Zc2AWkxQenDzLhfdZJhniLYSZMJH
 ZfWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IMHBL31s
Subject: Re: [Buildroot] [PATCH] package/gcc/gcc-final: map debug prefix
 when reproducible
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/02/2023 21:05, John Keeping wrote:
[snip]
> I've been testing this with --enable-linker-build-id in the configure
> options as well to see whether it's possible to enable build IDs for
> reproducible builds and this change gets a lot closer - the differences
> are now a handful of files that embed an RPATH pointing to .libs during
> the build.

  Just so I understand things correctly: those .libs RPATH entries get removed 
by Buildroot's patchelf run at the end of the build, but they still end up 
affecting the build-id, correct? And these RPATH entries are of course not 
affected by file-prefix-map, because that would break them entirely...

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
