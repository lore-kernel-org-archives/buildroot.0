Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC45C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EE8D81839;
	Sat, 23 Apr 2022 15:05:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVQ6JAwMSHH9; Sat, 23 Apr 2022 15:05:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC7228142F;
	Sat, 23 Apr 2022 15:05:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 156171BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02E5A41974
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qegOxnQ7Shut for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:04:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93D304196D
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:04:59 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id k23so21601233ejd.3
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DN9f+AZmA9AsULcardDdXdEk9E5lErwxGpM1INFZ4mg=;
 b=EXWlW1loMpVZJ3lZjieYsoYTvBWhUi23IJVucvagcv+kQpY3O+PrNzLwYMfqf/CDZq
 gvsW08CoGyxpHIvnFIjbWLWvXRiQBi8/YEML+O8srkeoMee0DgC+Ezxo/M0hqJDi0NYW
 W7OwgbyZ+qJ4KKINtGs0Y+6qthqE5I170sT5y0pMG4YTEkMn3Lmy+qhDAQDJV+rLyc6f
 jrzqiqcmj0x80AnELu3UjNuNANLy6Jap56F7i8WSBv8clR+0RCCwHhPe0EhHk4m3wVeL
 CZRERhvP3LfR2uuDsgjI4Is53xhtIkczGi5zGkK47ycOT/uoCrwq0SBA1ETFbBlJGsoN
 owCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DN9f+AZmA9AsULcardDdXdEk9E5lErwxGpM1INFZ4mg=;
 b=Wei2I5uZf4k51+0eckqqWH43vE/ZkbJikadxO5NNBficyM319vKh8zR8R1N/hc7vdw
 BI8v5zMp3jN989Bkh/2EhaIWC/iSnxQwZEN3JHAXhFKfKBO6N/4I+CjTpB+iJf9vZY/W
 kt1RHd2RgD8AqwmizESmsT1CwdonHu/fJHloGvvThhlxGZDHjLogV7OznysJxr3naGZ+
 mAfHCTp1RumfZeL/qWXragd839YWr4M2RghifEFdoj1hFT7RX5KFaYsZJycnGbSh1hW8
 G6aIiivGyHsp+7bKxKHQqTMEkfiSYOe0oWcX/yPhR3iuvChEJakoP6gl2dKTRPoQVK7v
 uEsQ==
X-Gm-Message-State: AOAM5309wUtMJJN6vFH8lAOdwmGFslkmmsKJV7OHYAfGk1o4FZtmyHVZ
 cU7rE6FLUifLTE7hmCLa09SZfA==
X-Google-Smtp-Source: ABdhPJwy101SUon3XD3CXB4dsKGPPwH/sIYLa16pAOn6eGiEc2HSwvpInAcU2gzYSZJRTIEg9oPPjg==
X-Received: by 2002:a17:907:7f09:b0:6f0:2991:9c76 with SMTP id
 qf9-20020a1709077f0900b006f029919c76mr8538533ejc.170.1650726297726; 
 Sat, 23 Apr 2022 08:04:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a17090630cb00b006e83fb1e6b1sm1762174ejb.100.2022.04.23.08.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:04:57 -0700 (PDT)
Message-ID: <263b91bc-aca7-ccbe-1cd5-11b235c5a162@mind.be>
Date: Sat, 23 Apr 2022 17:04:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 buildroot@buildroot.org
References: <20220419085411.125022-1-thomas.claveirole@green-communications.fr>
 <20220419085411.125022-2-thomas.claveirole@green-communications.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419085411.125022-2-thomas.claveirole@green-communications.fr>
Subject: Re: [Buildroot] [PATCH] package/vuejs: bump to version 3.2.33
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/04/2022 10:54, Thomas Claveirole wrote:
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/vuejs/vuejs.hash | 2 +-
>   package/vuejs/vuejs.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
> index 9dd0fb548b..c53364e97d 100644
> --- a/package/vuejs/vuejs.hash
> +++ b/package/vuejs/vuejs.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  770ff74851f7454977f084becd76b05b3fad4d52f048df5405d41849c125956c  vue-3.2.22.tgz
> +sha256  042033a2a8e6d45f750924953f03c34058d5afd9cc1571fbaf1827eaf04f6943  vue-3.2.33.tgz
>   sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
> diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
> index b74002e932..d544124bbc 100644
> --- a/package/vuejs/vuejs.mk
> +++ b/package/vuejs/vuejs.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -VUEJS_VERSION = 3.2.22
> +VUEJS_VERSION = 3.2.33
>   VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
>   VUEJS_SITE = https://registry.npmjs.org/vue/-
>   VUEJS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
