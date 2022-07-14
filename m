Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55329C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Jul 2022 08:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B29F784743;
	Thu, 14 Jul 2022 08:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B29F784743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EB1O3RtXG3TL; Thu, 14 Jul 2022 08:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB5A08471A;
	Thu, 14 Jul 2022 08:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB5A08471A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE2311BF2A9
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 08:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6A0D8471A
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 08:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6A0D8471A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4LNt9QG6sLOF for <buildroot@lists.busybox.net>;
 Thu, 14 Jul 2022 08:05:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15EFB846E4
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15EFB846E4
 for <buildroot@busybox.net>; Thu, 14 Jul 2022 08:05:27 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id a20so559885ilk.9
 for <buildroot@busybox.net>; Thu, 14 Jul 2022 01:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KZenXhSwUMlB+ZyDMFYkIZuEUyt2fAhOgyjhQVBr3SE=;
 b=czAK52hMYO+irUb0BJNTC+nc81FCyqR4GTj9jdRKCc64+/hAtaydxff/LnLl8ihbTF
 qdOMH4c0BPccrAMXo7SrYS/TslX8EV3OWRuXjs2tHxTMxe2Zil92vw5Dc2ypxGzeXnBE
 OVLf6Z8mB5tmJtFaJWvW7v2KCzk5dF2i4vJK14HJ+/678UGGXhNDhx3j5u8T/iow3W8G
 xBFXeJEF9o+VjQVIUH8Ji7Mjqe6a7SW9N0jAP1VxvfEJTvPjgsN0AHYdQ7GErdvU135y
 9MzWrzvZbhg36T2COt1yldgQxIaiNN0GU6NXGNrsnrKjcKYAXLw/2kBXC6S3hikYUa3N
 4FRQ==
X-Gm-Message-State: AJIora+mhDSYh2vHYHIhfWiLm7XvGRBBvobPyxXUPWhFNR/3R100Kip9
 ZVK/B/uSJBhgixkTxIHTdlFMJWHqU3A=
X-Google-Smtp-Source: AGRyM1tT/A33ISYeFoXpoeQj/0JgG04/HFANKlw+VmrPCjjpQP9eqH22WfP8NO5WG74E3z/Vev/JnA==
X-Received: by 2002:a05:6e02:1a0d:b0:2dc:9b49:b59e with SMTP id
 s13-20020a056e021a0d00b002dc9b49b59emr4081483ild.75.1657785927149; 
 Thu, 14 Jul 2022 01:05:27 -0700 (PDT)
Received: from einstein.dilieto.eu (smtp.dilieto.eu. [188.68.43.228])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a02aa0b000000b00339ead526e5sm442899jam.19.2022.07.14.01.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 01:05:26 -0700 (PDT)
Date: Thu, 14 Jul 2022 10:05:22 +0200
From: Nicola Di Lieto <nicola.dilieto@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <Ys/OQuHfT2vyOdnF@einstein.dilieto.eu>
References: <55f81de26c9b74283245f427bc7dd7ff4db09c06.1657777745.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55f81de26c9b74283245f427bc7dd7ff4db09c06.1657777745.git.baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KZenXhSwUMlB+ZyDMFYkIZuEUyt2fAhOgyjhQVBr3SE=;
 b=A/A+NqRTHENh5vGffSeXqTQjEFDbB9DiqOWVKH4V7xqd6mu8Ns2GBA51mOTgqsv2n7
 K29g5S4gDAc5hz23h60P/uPv++GZcLBUJarpYD5lQpY2QENC0KZyI/fCR9F8meA5xssD
 RrMsvGOq/6Vvw8+FF20gi0hqVTmZzr4qO3LLj2cqD+6Z9JvmBqyxbnUJChRVFQvq4o1q
 jG5D4ugYaoz6MTpgZAIc8Ov34h3lDP6dk59p12agi4qx8SPWqH0De8Cw2wb9nA/3wvRi
 FXrEIVJuXQMnfIYsiv9rB5SXmOJDxRR1kV3snUHGLBtn+izdttQL6EyFgt2tO2h8F0Il
 EdjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A/A+NqRT
Subject: Re: [Buildroot] [RFC PATCH v2] package/uacme: requires TLS support
 in libcurl
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Baruch

On Thu, Jul 14, 2022 at 08:49:05AM +0300, Baruch Siach wrote:
>v2:
>  Add dependency on crypto back end for uacme itself (Nicola Di Lieto)

This should work. It's perhaps not ideal but I can't see any other way 
to work around the circular dependency issue.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
