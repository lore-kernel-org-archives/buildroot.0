Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47824C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:03:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B372260EFE
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B372260EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A98E84A6A;
	Sat, 11 Sep 2021 15:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9s4yZaY34KLw; Sat, 11 Sep 2021 15:03:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA4183F73;
	Sat, 11 Sep 2021 15:03:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 122C41BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F347140122
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ZXYNoyNgmHk for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 15:03:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA191415A7
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 15:03:24 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id r7so7044761edd.6
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 08:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=59MzqLIZ2cBLtAN9S49jEmfowaxPZ/3CafXKeHs88wQ=;
 b=VgWogw6ouMChQ/nYlnFzRVs4StTCKsSs4bSIIddfbFtb30qZwYJt6pW95tfNEm98AQ
 ZdqD6Tf5XYVk1jaiiL+Xj9kJGLx/UmQ+NfN3G0mKXu0c2KK/sZ3EcEC/WWQzzTuz4yoD
 2Z2lpTEAF89y0qCcsW4XvUYs/dNiTqjkwouLtzRHEnK/4+m77dOK3xwTx3DUAZPhXuP8
 rfbri29Bn1wAtvts304uxKl3O7ODHVKdcfVEVgoKJd1zBt5rxpE9oV4MIr7CirjIB0m2
 o4pSG1x5oPVeRqByc9XSbbKxLz7AnyHM5uP76sWmiI8DE5CBiKNFxZXwWie5Sj7gox3V
 pvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=59MzqLIZ2cBLtAN9S49jEmfowaxPZ/3CafXKeHs88wQ=;
 b=4ex4V2rrpC0MeujPXzL9jhYGJot5JmWOPv6XTUMrCfJWWoGDMciWIQfD86wHdLWg2/
 QUdic3FNjsHZJNywVLjriDlc0n6GFw0yJRmVWckzwK6bhQKWibdkcAxtSMpZfIzGUUxm
 PmS89MphZ6jwxAcwdq7acB5Osrs+qmn2iEeCk+fmsk8dvoUOXPQxJb4nXi4BrC4/Grg4
 SeuNa7zwOkY9G3aI/RJgkI+TyaB5bByfmYzEXG20C4xtiN9J2AKf6oAWVK3Kp7Uka+PQ
 RmedN+7CvflkCQY7F1v6IHNIlsKRlZOQMlfoqxUCmvI/Oyy130z0J+OXhHod5o3MBbT4
 WP+g==
X-Gm-Message-State: AOAM532TZ5uR/5y/ZKNgOZDspFic40xnMnc4S4e53PHISxLk7ZtcqjiV
 PkyLY9cCI8dywgk72ffjnMv2orcGgvByeA==
X-Google-Smtp-Source: ABdhPJywTCJUomJJon7TPu/2I2KRGVzeeWHi9FxAFn4QH8WSvidE2g4iNQqWQcNrflz49x8C5G4C5Q==
X-Received: by 2002:a05:6402:18ec:: with SMTP id
 x44mr3543691edy.331.1631372603022; 
 Sat, 11 Sep 2021 08:03:23 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c21sm869740ejz.69.2021.09.11.08.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 08:03:22 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>,
 Matthew Weber via buildroot <buildroot@busybox.net>
References: <20210827205430.39745-1-matthew.weber@collins.com>
 <20210827205430.39745-3-matthew.weber@collins.com>
 <87o88z5jgl.fsf@dell.be.48ers.dk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <85dd14fc-98ae-fc48-2121-d6614da8ca0f@mind.be>
Date: Sat, 11 Sep 2021 17:03:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87o88z5jgl.fsf@dell.be.48ers.dk>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v3 2/3] fs: new OCI filesystem type
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 11/09/2021 15:29, Peter Korsgaard wrote:
>>>>>> "Matthew" == Matthew Weber via buildroot <buildroot@busybox.net> writes:
> 
>  > From: Sergio Prado <sergio.prado@e-labworks.com>
>  > Add support to generate OCI (Open Container Initiative) images.
> 
>  > An OCI image consists of a manifest, an image index (optional), a set of
>  > filesystem layers, and a configuration. The complete specification is
>  > available in the link below:
> 
> Out of interest, what is the functional difference between this and just
> doing docker import output/build/rootfs.tar <my-tag>?

 "import" just creates a filesystem. An OCI image also has an entrypoint, an
environment, exposed ports, and a bunch of metadata.

 Regards,
 Arnout

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
