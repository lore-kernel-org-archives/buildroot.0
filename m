Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ABAC6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 13:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 038E041688;
	Sat, 25 Mar 2023 13:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 038E041688
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eLPhWYTxa6R6; Sat, 25 Mar 2023 13:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0491D41634;
	Sat, 25 Mar 2023 13:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0491D41634
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 774E21BF3D0
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 13:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5038360BBC
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 13:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5038360BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c0a4uDpNjAKG for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 13:34:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6990460774
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6990460774
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 13:34:55 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so7562393pjt.2
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 06:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679751295;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O+6kMpyvI1xABubObS7/y0+W2vxGfhPYMB349hcLSIc=;
 b=QqqbVqCqBK7U70CJm6wFdIKnBj8BxMmIiei3ftXhe+BwvzZlRcs4AC9vsijv8pkW0Q
 5KPmEwzTBi1q1C9tSHejy1FBYpEYdlDzevfIxdvVYJedHb39bnFs9eEigBvKTonaf2Y7
 T/PrHQXK5O/JVbTlWlZn0YcGQrD3KiH6KTBxswq+lmkr3KWDlyoNdHXklCU1fU/u57jT
 wvZ70MukgmQ+t5+S8D/S4ch0LV4i8lnfN3tgZbJXFK/meU9ov3gYZwqQoX2nSm7OzBlT
 OL8KDyiLUIN7WO+Rzf7Rn3XTKaBNKY6vq00lamqtfR/sovfUwLWZ8SQ1b3x6VRw+nybh
 kEow==
X-Gm-Message-State: AAQBX9dudhPHDXGaBmFkbp5L8fbD5ZUQGpgXLZF0P1sqfrQS9HntVNuV
 7/BXhxhytUVtzDL4PuHF4Ng=
X-Google-Smtp-Source: AKy350YUA1dRm46LBI4Q7L8N/FPN4KBmhptWy4Py2LCDKfKpKC+DFCfH8Sx3UQw69THGnoaVynY3+Q==
X-Received: by 2002:a17:902:f543:b0:1a0:49eb:4cb2 with SMTP id
 h3-20020a170902f54300b001a049eb4cb2mr6036481plf.13.1679751294782; 
 Sat, 25 Mar 2023 06:34:54 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-4.three.co.id.
 [180.214.232.4]) by smtp.gmail.com with ESMTPSA id
 u23-20020a170902a61700b00192fe452e17sm1480364plq.162.2023.03.25.06.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Mar 2023 06:34:54 -0700 (PDT)
Message-ID: <275f7c96-36c9-e6be-f15b-ff164d8445c5@gmail.com>
Date: Sat, 25 Mar 2023 20:34:45 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20230215073256.186476-1-christian@paral.in>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230215073256.186476-1-christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679751295;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O+6kMpyvI1xABubObS7/y0+W2vxGfhPYMB349hcLSIc=;
 b=Yntdr2Eg/WGtcGZ0xxfDNLbEjkOAiFVUEH92IZRgsZgDc09KgDRuTtpq5R1/zxKAmy
 7y93OSn6TJ5Oj0ub4QotW+8spOgmx/8I5352EhI4hljm7W4GNF85fyT17glhXKZJ3HlL
 rBu2nO9SRwC+Xlpj/A0NXEWYTavX5DyiYQw+mgimj6ZVa51w90eQvGeROJO7+6vcCsk2
 /r9O7qnrdhG67Xjy6OFJCeRZ9oMV6sMa2h9q9kEyb7IAb5xBuita+5OD/y9K9CYfsMYM
 hN8KpjdoJQ6paEoQhO64B+pL72RnOw6WkrN+ec0mfVqsyfLc6OaVX6/GmJY4F0fgGU0l
 qkoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Yntdr2Eg
Subject: Re: [Buildroot] [PATCH v3 1/3] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.5
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/15/23 14:32, Christian Stewart via buildroot wrote:
> Go 1.20 requires a minimum version of go 1.17.13 to bootstrap.
> 
> https://go.dev/doc/go1.20#bootstrap
> 
> As Go 1.4 was the previous version that could be compiled with C, there is now
> no way to bootstrap go with a C compiler, unless we use a two-stage bootstrap:
> 
>  - build host-go-bootstrap-1.4-20170531
>  - build host-go-bootstrap-1.19.5 with host-go-bootstrap-1.4-20170531
>  - build host-go-1.20 with host-go-bootstrap-1.19.5
> 

I prefer using gccgo to bootstrap Go distribution (on my machine
it takes circa 15-30 minutes since the majority of time is spent on bootstrapping
stage 1). To do that, I build GCC with --enable-languages=c,c++,go
and pass LD_LIBRARY_PATH="<gcc prefix>/lib64" to go sources' make.bash.
I haven't tried bootstrapping using gccgo from cross-compiler, though.

So the bootstrapping flow would have been:

1. Check if Go version (either from Go distribution or from gccgo) is at least
   minimum required version (for now 1.17.13). If it is lower, bootstrap
   Go 1.17.3 (I call it bootstrap Go). Otherwise, go to 2.
2. Bootstrap Buildroot's Go package.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
