Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE17C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:46:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55E1660F5A
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55E1660F5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01BDA81BF4;
	Wed, 27 Oct 2021 19:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FI-mEeZqLSER; Wed, 27 Oct 2021 19:46:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2A23825CA;
	Wed, 27 Oct 2021 19:46:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9C91BF333
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B35F40444
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zE8Om4IJUVSM for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 19:46:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E34F40446
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 19:46:05 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id r4so14485133edi.5
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 12:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0aLeEe40foAXmaQ/Ik0NzoTeFlLy1kjyApgreevZYY0=;
 b=QcWhT6frLJhQR15lEX14Qw7FuRWh0f8hiGqhHOUqXoEGAY6dWPRWquM1Ciy5fme79O
 4IdbXWdinR+Y0A6BMG4o/hSHIvnzKOPbqLXT+iQoXSPe3qOCWkbf6T1GKV+zmbro52pj
 Dlm5rWZsExTutqM7/qynPNi9GfsmiZllxCnXg5tVhRQtffda8UhBOFRK8Uq0tH36wM0P
 2rP6e3TAJfmJOrote7Gg+aq4Av9eXCqDzckEXSMp+c7T8k4g4F6qzpNDeBJ/X1IT5RWp
 s/HJ35NWH4NY1bf5rMs8ZnKYNvVZjJfe+k8p3Sb7agZOzHsKt6D2aEQyKdnSKVkTfvMR
 MNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0aLeEe40foAXmaQ/Ik0NzoTeFlLy1kjyApgreevZYY0=;
 b=Kmrr0+Rgd5jZGEjP7DjULiNEyK55Dne9OwgoaDhnTLNFZL5LWx6l1Ae19pisrK/8d8
 4T3NN1i4yvIVLJ0qbyu8NBMTsUPzD2SGr4GS+YuBmBe7ynC/Bd6NlWA49Tsbh8RWclPz
 fUM6E7l552YvCCC4QEdLZNIj7awMrA/RhZV8cKS/xPxi7xGHsGTvEQF4fNpZ8jj7K5G+
 N7ueBhf5C2dsBlxunZJOyryilZUzz/607saVL1N1jVSDSnlwvKdx2ar1HJ3JdOH5Iuwm
 81AFZ9ClluYhDlDqW4VdvMrulNWoaisgied/Hnpug1XwZzZp5bDZ31Lmgx6Gq+ORGQoo
 3YPw==
X-Gm-Message-State: AOAM532xS+/ZyBZrYVNkMpZO9M/Bkfuf7Ifhm6tlWtVmLN7Z7xrToI/P
 XfSDCiC4+xu1WkRk2vYedGhhGA==
X-Google-Smtp-Source: ABdhPJz3dqQc+GzXHW7r3F5N8gkE9Q9iMFfdRg6ZtvuGia5Zz4URXUUrvc+lgYUuTwP+I20rr3P7eA==
X-Received: by 2002:a17:907:7f90:: with SMTP id
 qk16mr40583206ejc.26.1635363963246; 
 Wed, 27 Oct 2021 12:46:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t22sm497696edt.40.2021.10.27.12.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 12:46:02 -0700 (PDT)
Message-ID: <2c7a8585-d452-4389-0b14-64de95ac4c94@mind.be>
Date: Wed, 27 Oct 2021 21:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20211009191043.1075544-1-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211009191043.1075544-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 0/3] Runtime test Gitlab CI integration
 improvement
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
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/10/2021 21:10, Thomas Petazzoni wrote:
> Hello,
> 
> What prompted this series is the first patch, which makes possible to
> run under Gitlab CI a set of test cases in one go, instead of running
> either all test cases or just one.
> 
> While updating the Buildroot manual about this new feature, I found a
> typo in the documentation (fixed in PATCH 2) but also realized that I
> wasn't too happy with how the runtime test infrastructure was
> explained in the Buildroot manual. So I went ahead a more or less
> rewrote/reorganized the entire section of the documentation dedicated
> to the runtime test infrastructure (PATCH 3).

  Series applied to master, thanks.

  Regards,
  Arnout

> 
> Best regards,
> 
> Thomas Petazzoni
> 
> Thomas Petazzoni (3):
>    support/scripts/generate-gitlab-ci-yml: allow multiple tests in one
>      pipeline
>    docs/manual/contribute.txt: fix typo
>    docs/manual/contribute.txt: rewrite the section dedicated to runtime
>      tests
> 
>   docs/manual/contribute.txt             | 201 ++++++++++++++-----------
>   support/scripts/generate-gitlab-ci-yml |   6 +-
>   2 files changed, 119 insertions(+), 88 deletions(-)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
