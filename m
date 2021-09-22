Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4821FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:12:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A53260F4C
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A53260F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20DE1401FD;
	Wed, 22 Sep 2021 19:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t-CKzrqqo045; Wed, 22 Sep 2021 19:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C48E405FC;
	Wed, 22 Sep 2021 19:12:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7C71BF321
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A924414B9
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsGvbEu4-Ftx for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:12:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AB6B414B2
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:12:49 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id bx4so14026005edb.4
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 12:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JAsgbyBbBueeGGTB2WEHOqK5CfiErKstr8Wkm4r0XSA=;
 b=Y4aiGpFEzkgaWtpYNM0hMbAlLnXrZzYNfrrSLAAfZL6Qy+n3fGMEI8u2OtDf/Dkm00
 YFax/I+jJh/ctn4Xhb553P1TCrVVIruvkQnEA+42BEhVlngimKRHjM04fQJl1kNjIXpM
 Thbryj/UJcoIvntDiu0qygD4/SAJi8ILnjOreFsWaHH/ebheqFl70CHUvKKQr99hiHr2
 nTbOfgZcHKvx8MPsLNW6FWXEqvaPZGAsCH9JxdittRwFjqDfpdGIAuILc+1okmXXroim
 LtCOC+jWP/IrBuvb+QX98F/lBFMp4bk0SQipzM2HWDdFmvuQsi/myjvRM1lA1OsLp5ps
 Bo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JAsgbyBbBueeGGTB2WEHOqK5CfiErKstr8Wkm4r0XSA=;
 b=za8+V3Cf7ae5HSrQhxfN0VE+Y4uVutu142tNVOeRtd7oSPyOBWWqi1t2t7zI6vDcAr
 blydY6UOIDNPW3f1fH9Kp2goIbgd1SbS+IPMKAC3jAq5vjLHr67WRQA0r5bgyMbYt2xz
 /qtT+ID0puiUYpS74g37xX3gdL68n1gJqb44hTRFAPS+EAg3i3krYXniWjWK7/J75lM2
 RdNCtkIBvnzQU7bxm+R/8WfrTfU7gZJ1HcFNd3PZQGFnOzcwSAUiKk7sDpi1nUVhNLht
 d2GGpBQdGjzL+Py2oluUKYwLDfVsyzsSdDMSaQtd4O1HsW/Cyd06fF002rB6ezUIjoy7
 kW+A==
X-Gm-Message-State: AOAM530YHWdTVpVsKa/AlMYS63OHvxnqLdLhjw/T5LZLfnAepDFWCZcF
 ndKzw58jNYw0kLOV+9s4z5oZ+g==
X-Google-Smtp-Source: ABdhPJwG9lETK5/a8RLMyQJ9mRWd5WUeSgremcXyeYpX6mjgl8P4dMlpz15/lUWs0tpuShMishKCQQ==
X-Received: by 2002:a17:907:d23:: with SMTP id
 gn35mr920293ejc.556.1632337968126; 
 Wed, 22 Sep 2021 12:12:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jl12sm1399487ejc.120.2021.09.22.12.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 12:12:47 -0700 (PDT)
Message-ID: <0c6aa3b2-ac0d-5b3e-c427-b0f95df42ce3@mind.be>
Date: Wed, 22 Sep 2021 21:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Knight <james.d.knight@live.com>, Petr Vorel <petr.vorel@gmail.com>
References: <20210921210438.41808-1-petr.vorel@gmail.com>
 <20210921210438.41808-2-petr.vorel@gmail.com>
 <CALAjcgWNGy=1CbbrOMO9Ocu9ncpqxHDaX-+33rC9uToVp2-3hA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CALAjcgWNGy=1CbbrOMO9Ocu9ncpqxHDaX-+33rC9uToVp2-3hA@mail.gmail.com>
Subject: Re: [Buildroot] [RFC PATCH v3 1/2] support: utils: use python3
 explicitly
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
Cc: Romain Naour <romain.naour@gmail.com>,
 David Laight <David.Laight@aculab.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 22/09/2021 05:09, James Knight wrote:
> On Tue, Sep 21, 2021 at 5:04 PM Petr Vorel <petr.vorel@gmail.com> wrote:
>> Python 2 is EOL sice 2020 [1], it's still available on distros, but may not
>> be installed by default (as being replaced by python3).
> 
> I do not mind if everyone wants to make a transition to Python 3-only
> support utilities, but I just wanted to mention that RHEL still
> supports Python 2.x until June 2024 [1]. I am not aware of what
> environments may be using RHEL8 to perform Buildroot-related
> development and RHEL8 does support Python 3, so it may not be an
> issue.

  Even on RHEL, it's possible to install python3.6 (maybe even 3.7) through 
rhscl. So RedHat is definitely not keeping us back to switch to Python3.

  The reason RHEL still maintains python2 is to keep existing scripts that 
*don't* work on python3 operational.


  Regards,
  Arnout

> 
> [1]: https://access.redhat.com/support/policy/updates/rhel8-app-streams-life-cycle
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
