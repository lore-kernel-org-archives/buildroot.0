Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5915DC32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC30A408D3;
	Sun, 18 Sep 2022 09:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC30A408D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LpozLk0c3JW8; Sun, 18 Sep 2022 09:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1B32402F2;
	Sun, 18 Sep 2022 09:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1B32402F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CA951BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBE3C84284
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBE3C84284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYosVtWRljvg for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:32:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0012B8427D
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0012B8427D
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:32:51 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 c2-20020a1c3502000000b003b2973dafb7so2594503wma.2
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 02:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+waUau+9YX2mLV+SSL3QslXd0L3KLzkWc5PclqH8U8Y=;
 b=WE8lqoQ6pNI9aVneF2GPB2Ah6vwpGF/dkQWlH/hBfMFnI3NTw4g2ddZQO+2zBSSxO+
 H7Ja4Yj5QpFxCBP20fG9FJvtBSCKBcn+fQmTbVi8A5ieYaU22Z8RPm5t9/WGFenfXH2H
 2w0A5+KN+9MX9GqbLatqE1R6qMlSnJLZxy1naWhB5thsZovH1Vy0h1j8CpLu15lXUNbb
 x4mzzoJstUVn5T7pUZoD68T8mHrKyZF4FLflmCmOw9eL4U4qv3oQSCnZHl8tqR4D9nwz
 l+73jIsPA6yUVEZqEy1Jd8aA7NjvpSnxwzePg1I2bNiwQZ9HSSDiqSF1KNnCA+tI2xO0
 fxuQ==
X-Gm-Message-State: ACrzQf1ZlkujXrOZrM5IzffyY64MWMGgVb8C/19fkCwJGy+fmcF+g6Yq
 uy/kPC3bFA5BJbhWbhG7Z5ooOQ==
X-Google-Smtp-Source: AMsMyM5BB0a9eTb4/PeqAXK7+VApqPpUmMKAm51n3E5QpvgWjMA8Rt+sIQ+gZzn/tuiU93cumCd9Ag==
X-Received: by 2002:a05:600c:294:b0:3b4:794d:fb6a with SMTP id
 20-20020a05600c029400b003b4794dfb6amr8822008wmk.128.1663493569956; 
 Sun, 18 Sep 2022 02:32:49 -0700 (PDT)
Received: from [172.23.97.104] ([79.140.217.34])
 by smtp.gmail.com with ESMTPSA id
 26-20020a05600c231a00b003b47a99d928sm8975387wmo.18.2022.09.18.02.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 02:32:49 -0700 (PDT)
Message-ID: <a0a97522-6f29-9e5d-4c22-64c909a65746@mind.be>
Date: Sun, 18 Sep 2022 11:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: James Knight <james.knight@collins.com>, buildroot@buildroot.org
References: <20220622212045.573-1-james.knight@collins.com>
 <20220622212045.573-2-james.knight@collins.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220622212045.573-2-james.knight@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+waUau+9YX2mLV+SSL3QslXd0L3KLzkWc5PclqH8U8Y=;
 b=E1roFaji7LShk7DqmYif4eMF2ZSbH6+/FJ44/8x870KERWwZb46QFBIZQDv8cXpweb
 RQ3/yOQxHeedbVgg6pIDvuDTNiOVCAjjgkSvzbV16jz5FWjpCVHdvXT/SNSZdPlzau3M
 vlhnB0FnGbjhVqe0feqTEsK0w5JsnQ1AqmIN5YpL0RetRMgCYqh9GkM1tqmtgHCOkC2x
 NlT/8sZJQ0PZ+gfMA12p3g3ZwquKcKUK1/bH7iiMLRZNkUsx5189r4WDAhmjWR+QRlir
 tt8N4+8WbnK6Bj2o3QT6jy866CCWWSg6bB1vnzQrqzfPU5j19oValpWmTSJ/Yc5bQJGn
 lPWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E1roFaji
Subject: Re: [Buildroot] [PATCH 2/2] .gitattributes: default lf line endings
 for text files
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

On 22/06/2022 23:20, James Knight via buildroot wrote:
> Default the line endings for text files to be LF. The building of a
> Buildroot project is most likely always invoked from an environment
> using LF line endings. For developers working with various environments
> (e.g. Linux and Windows), defaulting to LF can help improve a
> developer's user experience. For example, with a clean checkout on a
> Windows environment, a developer can trigger a configure and build with
> two commands in their desired VM/container, without having to worry
> about configuring `core.autocrlf`:
> 
>      make O=~/buildtest qemu_x86_defconfig
>      make O=~/buildtest
> 
> Signed-off-by: James Knight <james.knight@collins.com>
> ---
>   .gitattributes | 2 ++
>   1 file changed, 2 insertions(+)
>   create mode 100644 .gitattributes
> 
> diff --git a/.gitattributes b/.gitattributes
> new file mode 100644
> index 0000000000000000000000000000000000000000..74dcc97d294192e61f4b241dbf4aa10449de5626
> --- /dev/null
> +++ b/.gitattributes
> @@ -0,0 +1,2 @@
> +# default lf for text files to help with cross platform development
> +* text=auto eol=lf

  We do have a few patches in-tree which have windows line endings (because the 
source has those line endings). For example
boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch

- Will these still have proper line endings when you clone?

- When you add such a patch, is it complicated to make sure they have correct 
line endings?

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
