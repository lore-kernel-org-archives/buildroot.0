Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C6CC761A6
	for <buildroot@archiver.kernel.org>; Tue,  4 Apr 2023 17:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DB2F8133C;
	Tue,  4 Apr 2023 17:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DB2F8133C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OdNakO9_18B7; Tue,  4 Apr 2023 17:30:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA83B81348;
	Tue,  4 Apr 2023 17:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA83B81348
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DC2A1BF834
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 17:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 570EE8133E
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 17:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 570EE8133E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7N8-FvmukOW for <buildroot@lists.busybox.net>;
 Tue,  4 Apr 2023 17:30:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B3CB8133C
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B3CB8133C
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 17:30:03 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so36894025pjp.1
 for <buildroot@buildroot.org>; Tue, 04 Apr 2023 10:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680629402; x=1683221402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9+FJGlNcznSNOzvDK9JA1Qm3tbohtaWwW9YYoQz0kmQ=;
 b=nxAK4rLkA2fbIEeDC4FuiZPDSpUa7dfNUIFJEnLpnAKzQD9Re6jC3GAlOfVifXxjUq
 w3ffX7SFiwTKAvloASpuGrUL+PkYUaxzn0IEkEUTKBw9CxGLrmKiwstZx//sCfDIY3x0
 QBvv0ZIXti8TC5Dzwu8pNP7/YmD4n6lQ8k77yrlyMY6/UBOscpi2XId6aFPJoV8nx3y3
 bhoYUcsCw5JfQ50XSOsGtP50X+ifdPstpw0CG31IuD2YmhOMqUfpVNBKMTNurAxQwRS3
 e4K1qu8mDYiyv8H5k1g/KOGK+z5SiRZ2eZVT9Ud6kP3KRP1adAfL/Ne0o6gl7lNT/JVG
 VT3w==
X-Gm-Message-State: AAQBX9cJClrl2uB2VrMJwAItpGdgMK3s1H1NNPXjjEgP8OZfncv2tq18
 1UVz19wpsKCddOkOv7eNSdV1SoiIsERm4A==
X-Google-Smtp-Source: AKy350YxmKZTX/4sOkmHfr7SkKbQEk9ha1BBXXebn2wSMmSPA+lgNzIqDVmLglqQMJ742wCZNUTDdw==
X-Received: by 2002:a05:6a20:8c9d:b0:db:22dc:23d with SMTP id
 k29-20020a056a208c9d00b000db22dc023dmr2959567pzh.5.1680629402137; 
 Tue, 04 Apr 2023 10:30:02 -0700 (PDT)
Received: from [10.69.71.131] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 c22-20020aa78816000000b00627e55f383dsm9068343pfo.3.2023.04.04.10.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 10:30:01 -0700 (PDT)
Message-ID: <96efd54b-7c01-dd82-1916-87f6dd2e3b57@gmail.com>
Date: Tue, 4 Apr 2023 10:29:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: buildroot@buildroot.org
References: <20230328212711.3721-1-f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230328212711.3721-1-f.fainelli@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680629402; x=1683221402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9+FJGlNcznSNOzvDK9JA1Qm3tbohtaWwW9YYoQz0kmQ=;
 b=DH/rliNWCy9NQ0WE8JcUHm9LMgmq1opIlh8kSsdlsqykIL8Bu7kYI4IltTZcPbuMpo
 aAkAMVSs7WfG6Y8umpUSAYL3WoA5yGwIxghjuT8iy3XcafHJPDJlmv265ThHHlerIdEz
 a1//ocJjFPmI1AWPLA1KJK3ac82vFs/ENQg/gXFSwyO+4DY3YwvlWWKRazr/2x1hYXkE
 XvGtYAQEbxiNFWzFYol0BpLGXTGUkgEltArStBT5M51/yoZZ0ABYeFvQVmC8bBW4tFsT
 ADcDOuZLQSqs+tEZFryxJqrbtCrwGBVf5q64xPH90ubqCJGM1jge0YuFaXcTe1h/h9tI
 jMsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DH/rliNW
Subject: Re: [Buildroot] [PATCH v2] package/bluez5_utils: Fix builds with
 musl-libc
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
Cc: marcin@bis.org.pl, d.lang@abatec.at,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 3/28/2023 2:27 PM, Florian Fainelli wrote:
> Backport upstream commit ca6546fe521360fcf905bc115b893f322e706cb2
> ("shared: define MAX_INPUT for musl") to fix builds with musl-libc.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/3fd24a604a29eff70e20f82690e3f058f04903f9/
> - http://autobuild.buildroot.net/results/bd57f1813be699cd5ce2ae94f5f511a71fe10428/
> - http://autobuild.buildroot.net/results/90d528cc18a367af2f68e1c0673d962fe399e1ac/
> - http://autobuild.buildroot.net/results/552b700ee129e1c7f651de13f6766eae5325dcbc/
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Ping? Builds are still broken without this patch.
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
