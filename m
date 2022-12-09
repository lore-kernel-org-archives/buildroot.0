Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92FEC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 10:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81EA640C89;
	Fri,  9 Dec 2022 10:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81EA640C89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BR2Em40bf2UI; Fri,  9 Dec 2022 10:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D045F40482;
	Fri,  9 Dec 2022 10:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D045F40482
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B90C1BF34F
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 10:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E44F660BF8
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 10:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E44F660BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Sdd2X0m8Umc for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 10:24:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CD5660BFA
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CD5660BFA
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 10:24:07 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id a16so2476928edb.9
 for <buildroot@buildroot.org>; Fri, 09 Dec 2022 02:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kONVuuRsLsncsiNTc1lEBsIcrm1FQdY65wjBuUUdz5U=;
 b=INEgK3T/zS85cD93bvrS3Yh/0gy3YZwvM9Fk/RoCK0VIKrxRN6rnaU6RPIgdPp8kMI
 3Mg13bu/h8mmSdfMJv8VGyGotWzTGuh94PiSvHChLutb+XzcDmj6bKAK72eRRtcStdVJ
 PQkTA8f7bYmra3ITDsfRTpTI8fl2bC9qxJ3E373/3CGyltBd5C5V3TCqXQkC95wbUlZZ
 p17k2Xyzxobz0JqxwzzckQTZRKGtfnDj5lXm0+oZ/MMBlwI/sHItq2rMwEPNbm+sfReq
 gYEXPpIJeIyIDFO/OlG2FIrwdj8eGqBY6vSLOIqV0qKMdcVShqdgu8mG5FBUjslow4r5
 kdjw==
X-Gm-Message-State: ANoB5pkQjg1LV7Ou+UB34yg3MxiydJ/qW8bltVVNNuK8zKGHAAfonXrX
 qztcoB8/Ob8eyekYkElkvoQ+Xr0OE5w=
X-Google-Smtp-Source: AA0mqf6mb8LOmeOAvRy/prXt0CWcoa9uShIXg5d0UoTjq7KwPFkmnMxdYTdTvwQDIGgp4Qx+wKqF+w==
X-Received: by 2002:a05:6402:7ca:b0:46b:aa:8564 with SMTP id
 u10-20020a05640207ca00b0046b00aa8564mr4001009edy.30.1670581446163; 
 Fri, 09 Dec 2022 02:24:06 -0800 (PST)
Received: from ?IPV6:2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a?
 ([2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a05640212d700b00462bd673453sm462281edx.39.2022.12.09.02.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 02:24:05 -0800 (PST)
Message-ID: <97b952a4-2e1b-363c-36f0-0fe2c0da26b7@gmail.com>
Date: Fri, 9 Dec 2022 11:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Nicolas Carrier <Nicolas.Carrier@orolia.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20221013163432.18545-1-raphael.pavlidis@gmail.com>
 <20221205215558.GI2855@scaer>
 <883c29be-2a05-00f6-76d6-cf894e497da5@gmail.com>
 <AS4P251MB061200F650240CFFE6FEF439841D9@AS4P251MB0612.EURP251.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <AS4P251MB061200F650240CFFE6FEF439841D9@AS4P251MB0612.EURP251.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kONVuuRsLsncsiNTc1lEBsIcrm1FQdY65wjBuUUdz5U=;
 b=Fek3vRydHL3QsI99EN8CqcugixL+IuwU+v7Az11BIPb6ZB8grcyO26AT0rsyx1nEhR
 Dl0u6DnYis5iyHBk9j2XRkwZnehv+UBblkrZ3bLU12+4W8T4D61NCAxMzsvwomnFrMIw
 LUvaUkdubPzM13dodTURv0AgxjOCGTAUw3yCQAgBxklX/MQjDnjGuLHLfXJcVW/Gz2UD
 fl1Igupn6dMvBOYp5xrBa0QQlQSnkOGkSODEo9UNdNRLgoKNyJ3rDC4OMX6Uw6MPlHYG
 a17+seu27U30PpF4THEDOaTcm/0ooTMnhleL35gnCuzPaYOmSYIZ5pSjxofLxFemmS2S
 i1yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Fek3vRyd
Subject: Re: [Buildroot] [PATCH v3 1/1] package/shadow: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nicolas, All,
thanks for the Test. Should I add it to the new patch then? If yes, what 
about the authors of the patch, should I add you to the authors? (Is it 
possible to have multiple authors in one commit?)

I already apply the comments from Yann. Therefore, I would like to 
create a new patch. :)

Regards,
Raphael Pavlidis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
