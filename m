Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42452C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:19:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45676105A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B45676105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 742B982CD3;
	Tue,  3 Aug 2021 20:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-62oONlGbCk; Tue,  3 Aug 2021 20:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C993A82A26;
	Tue,  3 Aug 2021 20:19:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 81E711BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EDC74038A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id alMp7KrJsJa8 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:19:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F1FB40384
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:19:50 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id cf5so681572edb.2
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 13:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oxhlWveZL+ctTQBZmhOKwwPBvhTOBTTwIa83V7KkbNU=;
 b=G7vpInu8h/UFUo9DmztBToeY+mXWMjJEbkqOh+7gABAa9PgUze4lIaXRIsZqUiaQik
 oaZCXLGVYq7EmqhlshKh7j0/e8slQOPzTFNbszRZrUmigDr0cvtH5z/JhrIu1jm0UCO5
 X2fxD/6bVclDOmEk0e/gjVF3rlSsyN/aRhEBdzebrtSHPg1sfx0SALOHf1YcdE18a8LL
 faunoaocrCCysoT3HtRFKZy7VWsnVxphxLAHTByMi7gwhY41Ehlvt6hedzhZblDyMmVs
 blkjzBSJ/Cg7QgQL8YOb6kEiC/KihknxJpOiGoF+jAT+9Tq8fjhzkdzUu3vfrddo3XQ3
 x3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=oxhlWveZL+ctTQBZmhOKwwPBvhTOBTTwIa83V7KkbNU=;
 b=Log+5jFEdlTVx33rAU9W67J66vaCiA3yqG3HUs9lNkcFqTcifWXEbT88kMSCKZlZNs
 dicOuvmz7uVEYcLWX0IxP8VboKraE9jyqx6lVAbDso8WIlhqOa3gRX34vVstfEhB9q0H
 q3BpQPTGzI9cd2JnX6+sT/zK/xXlB9vOAmq7MBXz/7e99C7V0fzc4MlS0m6QCaPmAB+U
 TmmskXcywRq+rV3dnwGeXqjPKdRy4C/eZH+ilxtYe5joeEg8/5NH20Qpy0VI/gqAk4Gn
 /uZoCxOFL2lUkW/d/w2Ya5uHhJg3voQh2PNUqg2y8o97oCbx/dV5w28rtvh73O4Thesf
 DFSw==
X-Gm-Message-State: AOAM531ZGMdyQpoD+AfyXukwWdTOhhB9DkcwNGznGhDcF6YRP2BFMDeT
 7A8i7j817n4CYayw4fuwf7DJ7Q==
X-Google-Smtp-Source: ABdhPJx7g8mW/8/lWMldfpv0T7IWyWp1BKupX/z3OcbWlNLQat/VbBWhjEu1CEdeQHJqERVr2gM7rg==
X-Received: by 2002:a50:f1d8:: with SMTP id y24mr27678187edl.275.1628021988546; 
 Tue, 03 Aug 2021 13:19:48 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id p5sm6731622ejl.73.2021.08.03.13.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 13:19:47 -0700 (PDT)
From: Arnout Vandecappelle <arnout@mind.be>
To: Dominik Michael Rauh <dmrauh@posteo.de>, buildroot@buildroot.org
References: <20210528152936.368915-1-dmrauh@posteo.de>
 <20210802092426.1259479-1-dmrauh@posteo.de>
 <5401c9d8-558d-b6d7-1c2c-55107f606ca6@mind.be>
Organization: Essensium/Mind
Message-ID: <2e1b995c-89be-ecee-efde-8f80fe070071@mind.be>
Date: Tue, 3 Aug 2021 22:19:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5401c9d8-558d-b6d7-1c2c-55107f606ca6@mind.be>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v4] package/libgdal: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 22:09, Arnout Vandecappelle wrote:
>  Hi Dominik,
> 
>  I still have a few comments. I could make the necessary changes myself, but I'm
> feeling lazy today :-).
> 
> On 02/08/2021 11:24, Dominik Michael Rauh wrote:
>> GDAL is a translator library for raster and vector geospatial data
>> formats. As a library, it presents a single raster abstract data model
>> and single vector abstract data model to the calling application for all
>> supported formats. It also comes with a variety of useful command line
>> utilities for data translation and processing.
>>
>> https://gdal.org/
>>
>> Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
>  It's really nice that you add this package, because when I added postgis
> (contributed by Maxim) I didn't notice that it had on optional dependency on
> GDAL, which wasn't added yet...

 Turns out that postgis with gdal actually doesn't build:

checking GDAL version... not found
configure: error: gdal-config not found. Use --without-raster or try
--with-gdalconfig=<path to gdal-config>


We'll probably need to add --with-gdalconfig=$(STAGING_DIR)/usr/bin/gdal-config
to postgis, and LIBGDAL_CONFIG_SCRIPTS = gdal-config


 Regards,
 Arnout
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
