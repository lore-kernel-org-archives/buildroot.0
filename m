Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B2CEB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 19:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 966E3415A0;
	Thu,  6 Jul 2023 19:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 966E3415A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEYwB3x_14UA; Thu,  6 Jul 2023 19:18:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3C8940962;
	Thu,  6 Jul 2023 19:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3C8940962
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 123E41BF4E6
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 19:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC77A60B57
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 19:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC77A60B57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WArFn1BmJGXg for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 19:18:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55FEB60B3D
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55FEB60B3D
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 19:18:33 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51e35791a83so785888a12.2
 for <buildroot@buildroot.org>; Thu, 06 Jul 2023 12:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688671111; x=1691263111;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ql3SG9YomwzezwTP6CNJhPXsT1OoKQwcW56ikJdUAfM=;
 b=f9Txv+MnP4IZPb3VMqHOG7koAOV8Ncx9mwcxDVbSY3nMdFX2PXEIgSUFFIBBgyvXUI
 zal+29YFsNqehFtYpOR+BhoUmyyoUF4YQ42fr8f8kKPlpIAngRgmGzjrhXLOl6yk/uuG
 XSNU4efoxsMZCPucUbZ+/IetBW+1dlzc7skgwZsMxNjwBLf2exV80JlWva4gMaShvo2v
 NZ1oRdZR77fYYMYEvuz45hq8WnLUesLpa+ymWmmQOWmBCqaECKc10HwriTske+BFkqBa
 BYa683je122wYtApyzTVjPzJ7nlXWZCappOajJDx0NlFcKgdRdKBtzrNjhT6dc9PwvGN
 lkbA==
X-Gm-Message-State: ABy/qLb0m3VmEHO2qa2ZPZTvO8qZjKhYsp+NqFe9eHSH70xO5uHpRxrC
 H2GBv43rdNKT6Jsunv6E3lvV4uNP3EU7yYnFYdg=
X-Google-Smtp-Source: APBJJlH+Ae0jUOcNBGA8CgLu7/2cSryJ4fNauaO8kuDLVaohsi+6//fR2/916wiwFsT9DByzZdctJQ==
X-Received: by 2002:a17:906:6d49:b0:991:f427:2fe7 with SMTP id
 a9-20020a1709066d4900b00991f4272fe7mr1913831ejt.62.1688671111385; 
 Thu, 06 Jul 2023 12:18:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 pj13-20020a170906d78d00b0098df7d0e09asm1142906ejb.205.2023.07.06.12.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 12:18:30 -0700 (PDT)
Message-ID: <eb58a86c-4792-fc4c-cdfa-42487c3347c4@mind.be>
Date: Thu, 6 Jul 2023 21:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <CAOf5uwmYNk+28CEYS-_tcGWVsw7-pWYCY2YCJXQzuijep5A5eg@mail.gmail.com>
In-Reply-To: <CAOf5uwmYNk+28CEYS-_tcGWVsw7-pWYCY2YCJXQzuijep5A5eg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1688671111; x=1691263111;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ql3SG9YomwzezwTP6CNJhPXsT1OoKQwcW56ikJdUAfM=;
 b=RsgfCqfkoSBbBwvh5NYAcAK/rWeRNP6RQ6bT+KjOgt6GkC8nWRvjBj5Y54RwYy8MNS
 TWgF+duyfeXnESGrx4nihrOmFxagy6klQYGiJ/rvlthskq086EV62XzCmelMKM49IPE8
 mhpY4I1LdzA2U7kBLRz8Ic9xwhUlOi6/3xajaWAw6gnFZFehtB1Y9HRrfKQ0mRNG2OtX
 uXv95NBVQ+026p9KAFUNbaeR8mXDlmeNv+U2SnqvIGGmCu8ykiGYI+AyFEgbhfS+aCs8
 3ZhmW7yg7oxpeuZgURMZsVUcQVv/NiXBSwJpWQ/1kFyUGqQndeh+nGACXh4WQFFRNj2u
 UXig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RsgfCqfk
Subject: Re: [Buildroot] external toolchain license collection
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/07/2023 12:08, Michael Nazzareno Trimarchi wrote:
> Hi all
> 
> Is there a way to collect the license of an external toolchain and put
> it in the buildroot bundle?
> For instance we have some packages like libuclic and other libraries
> that are put in the target but even those licenses should appear. Is
> something I miss?

  For the existing predefined external toolchains we indeed don't have any 
license information. For a custom external toolchain that you specify through 
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_* there's no way to specify it either. However, if 
you create your own predefined toolchain in a BR2_EXTERNAL, you can set its 
_LICENSE and _LICENSE_FILES and that should work. Make sure you also set 
_ACTUAL_SOURCE_TARBALL. Note that the license files are fetched from the 
_SOURCE, not the _ACTUAL_SOURCE_TARBALL.

  It would be good if we would add _LICENSE and _LICENSE_FILES for the 
predefined toolchains.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
