Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0798C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:29:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07F1D61181
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07F1D61181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC97C60BC3;
	Fri, 15 Oct 2021 19:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8rL0051MON2v; Fri, 15 Oct 2021 19:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B6F6060B;
	Fri, 15 Oct 2021 19:29:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 332CD1BF41F
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F8A14022E
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:28:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tBeyuW-kXQMF for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 19:28:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D444E4021A
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 19:28:57 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id w14so41835648edv.11
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 12:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=V+WPZIJTy9zgNp91+hwDt9aHrMQBRVE/SUEXbGwTifA=;
 b=U+NgQP4ecbcPbzbAPKlc2xpolghjKWOrtAx40G7gp1bSu8JbR+RtcNNnAC/VY4yB2F
 m2CSmrYetpVgnPWApxy+79V9Fb7i2QU+5yM0xaG243Z1Dr/cvB+zmD6wWhgw73yGwDQE
 FVcjZCm1KA2zaCbNYy/BRx577lZZUpHUY/ro2uBPxHI7rJhKuR8GVi3Q+xd+zCRvKIuX
 pGcBLAWBcgi/KX4mhO9FfoNMfJ34pw0DhJV1cWANYlnRjn3pUEvEn5icu+lh4V5KbtlU
 aeLkZD5IRBxp9Br4+nJ6ekpu+UQUjCRM/TDOJ1xgNtdwPMKfUQqqEbCryEQ8klOVlEBO
 lkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=V+WPZIJTy9zgNp91+hwDt9aHrMQBRVE/SUEXbGwTifA=;
 b=rPTtnVlUGvVzFWj5AtHmz6UrXtTBple1fIgkb7AdATpzkoUJTz17qnQAzPpO5Ld5mw
 bII4QbAgWdVjXc+MVhkEY8vg+Dtpfo4ZZX2tEmkgmPFknKWNKALME1kP2fYJ3+dndKDE
 XDLVBitrpvF14nSnDZtSYfGb/N9qf7ParMeON8CRPylFcbb5Jp4FLntz8KDYpeDEO8Lo
 NhU7TLXYDISu7D7T+QfA/y/tlusaU/dXIGvoFX6p9wdNwFd/FwCg0O9D1S+NB835vz+X
 s1Wj86W0G7F37Q6Wdjn5ruEmjrLaYS8/ky5cWMC0d/+aMWcOo77I85aTR4SBEdrcthbX
 Ge/A==
X-Gm-Message-State: AOAM533YMjVQ4Pc6qmcrmiCl6uOZgTfI6gcBNnLIJX4VuaoxYxovpQ6T
 1Zyn5w2XUqf1t0q5Hg5rsXhMpw==
X-Google-Smtp-Source: ABdhPJw1pf0xI7TaSYV9eTNaHNMs0+gvbXD307lU2VIARXefcZ7sG/KLGnqtTe/6qz410lrE7o873g==
X-Received: by 2002:a17:906:85d1:: with SMTP id
 i17mr9254446ejy.489.1634326136026; 
 Fri, 15 Oct 2021 12:28:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r19sm5206367edt.54.2021.10.15.12.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 12:28:55 -0700 (PDT)
Message-ID: <d4c5c28f-614b-ae16-2813-b8954f5e5cae@mind.be>
Date: Fri, 15 Oct 2021 21:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
 <20211006204135.2813745-12-chris.dimich@boundarydevices.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006204135.2813745-12-chris.dimich@boundarydevices.com>
Subject: Re: [Buildroot] [PATCH 12/12] configs/nitrogen8mp_defconfig: modify
 device trees
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Chris,

  "modify device trees" is meaningless. Why are you doing this? Why are the 
device trees specified by Gary no longer OK?

  It's particularly surprising that the device trees for the Nitrogen8MP board 
no longer contain "mp"

  Regards,
  Arnout


On 06/10/2021 22:41, Chris Dimich wrote:
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>   configs/nitrogen8mp_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
> index 3c52c526ab..94f4554071 100644
> --- a/configs/nitrogen8mp_defconfig
> +++ b/configs/nitrogen8mp_defconfig
> @@ -54,5 +54,5 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/lin
>   BR2_LINUX_KERNEL_DEFCONFIG="boundary"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INSTALL_TARGET=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-nitrogen8mp freescale/imx8mp-a0-nitrogen8mp"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-nitrogen8m freescale/imx8mq-nitrogen8m-m4 freescale/imx8mq-nitrogen8m_som freescale/imx8mq-nitrogen8m_som-m4"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
