Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF61EC4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 12:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29599415E4;
	Sun,  4 Dec 2022 12:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29599415E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9wb5AvgSn5X; Sun,  4 Dec 2022 12:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27826415DD;
	Sun,  4 Dec 2022 12:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27826415DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2ADAD1BF345
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 12:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12C5581815
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 12:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C5581815
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ce3Ovz83tO4 for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 12:31:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CE3881B26
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CE3881B26
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 12:31:27 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so9003684pjm.2
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 04:31:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VDRffzJ+nKAscj92T8/6hJcp0yexP6DY30q2AOQkNHA=;
 b=l/5IMLEb/OKSzBlrdZwg2qP3BKoV79/+xM4kSOaBkSB0SyoMf4R7IDLXjI7q73/oE8
 Gdc0VkbAZu43p2HgDAO1SpK8wzGdTYge1iWZzJzhxptrKBNScWybwSj4bCSkjzFbHic1
 7d+/63fswvNqUOIhhkH/8t/VEkzvvx00iRJm49fBzW1EyTitWBJfW4k9U+u3LWmo+yke
 cCmE0jcQdSL++uEYZlq5w0b4B119UnkdtRV0wH0qU2CAK6Y0B3a9zWcsLm46mZygvi2N
 cR3u/AxphXjlrUfUVQKE2rtzLBOVFmTNr6Z4Ugqrx6M4c4oO1d2URf3CugdK85aiB177
 MErA==
X-Gm-Message-State: ANoB5pktCXb2gI1uMa3J7Xk45lGBJWq/N3uf7ApT4UoEO0zI3cO+UDab
 RYfb3xMPr5Koz+ZPl359jsIbhX48WnU=
X-Google-Smtp-Source: AA0mqf6MvjV31yckLbfUVGHh/noBfgg7ICn5B0qiP3pwgrMnB+h8FfQDRE+zyNCuqnxz2VyQHm1xcw==
X-Received: by 2002:a17:90a:9a98:b0:219:2f90:4fb3 with SMTP id
 e24-20020a17090a9a9800b002192f904fb3mr36750885pjp.109.1670157086931; 
 Sun, 04 Dec 2022 04:31:26 -0800 (PST)
Received: from [192.168.43.80] (subs03-180-214-233-18.three.co.id.
 [180.214.233.18]) by smtp.gmail.com with ESMTPSA id
 b1-20020a170902d50100b001869efb722csm8721407plg.215.2022.12.04.04.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 04:31:26 -0800 (PST)
Message-ID: <af070396-0597-e1c6-dc6c-956c5453badf@gmail.com>
Date: Sun, 4 Dec 2022 19:31:21 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <38529777-79a9-dfb5-ec42-b7c37e617281@gmail.com>
 <20221203155247.428cb5a1@windsurf> <20221203160506.GD3302@scaer>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20221203160506.GD3302@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VDRffzJ+nKAscj92T8/6hJcp0yexP6DY30q2AOQkNHA=;
 b=PvERQdoM0cdEcT7sb5BVgWGRk4wyOqzdnsz/CnXxWYGMd74DgzEw8JQ/6NpW7IxlSC
 m0c6/EJMu9myv4lITNm/o5UtSYVcOxnBFZj5DjGZJKaptH3h7t/R4EvXgypIK8c76uai
 K83QUuQMfckVztY+Hy92NyNDSHCkoGNdw9AzXXrzcC+JzWYaieE08uZPqKpNpOECF8/O
 /ibjw5DRBurwRyR0cdVCe3dtxRfJi2WauaGpvZqH60nJdvACZYLNHc8128LbaCJzHOE1
 cQYtEmR819xd+pwNh0QIbbCvIWq2E6GDwvn7++VV260EPoPJ00K67FXcPVqlr6kKbFpW
 NeNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PvERQdoM
Subject: Re: [Buildroot] <PACKAGE>_SOURCE with <PACKAGE>_SITE_METHOD = git
 can result to tar.gz with mismatched file extension
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
Cc: Buildroot Mailman <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/3/22 23:05, Yann E. MORIN wrote:
>> I think you're right. We assume that _SOURCE is not defined when a
>> _SITE_METHOD using a VCS (git, cvs, svn, hg) is used.
>>
>> I guess we have two options here:
>>
>>  (1) Detect this situation, and error out, to prevent this situation
>>  from happening
>>
>>  (2) Actually support overriding _SOURCE, but in this case, we should
>>  comply with the specified compression algorithm
>>
>> Yann, thoughts? (1) seems easier to me, I don't know if the benefits of
>> (2) are really relevant.
> 
> I think the only meaningful solution is to go for (1): detect and abort.
> I too do not think letting packages each request a different compression
> would be interesting...
> 
> If we believe that gzip is too slow/big, then we can think about
> switching to another scheme globaly, but that's orthogonal...
> 
> So, yes: detect and abort.
> 

Actually I think we can just do ``tar xvf`` since tar will automatically
figure out the decompressor to use.

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
