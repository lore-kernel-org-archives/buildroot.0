Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D2BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:37:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D79FE60FC2
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D79FE60FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B069A40664;
	Mon, 27 Sep 2021 14:37:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dl0HGVAVgN1C; Mon, 27 Sep 2021 14:37:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B2A8404B6;
	Mon, 27 Sep 2021 14:37:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5286A1BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DA0A4036F
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Avi4xYuhay3a for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:37:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56D084021C
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:37:33 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id dm26so36073188edb.12
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EyY6A38Xrg4h1Jykyab/85K9FndR5offf5rh1KTsoXY=;
 b=WDVzfNg085EmiuvrTSRsgfDK8FgzBuzl0/1GvJQvgmI+V8aIH4AmiiKA3+QczEtDYy
 8U6g0slNzJnrZ6jWovOSc4RYBdTVueZ+tZ8IhtIOxr754OCjJ0wlZVrjbKrKKkLmIhU6
 YxERWZBfTR8Kcy8wWuHtyhx2JyAEDgl6Uiqt8EfsL1I/+RGlwpGpJ8BLT4Z6TWMgZnRJ
 JYqA1bwp5dAkUmkQj4ZBRBYYOFKnMlKvSXI4V8DwyggMpVYJVBhf2vxecXgUDJRTJINm
 PRdH6bXQeVsL8YLFC/Tokca92col0MX7/v2p1nMN5mzSl5XtCNfE0cVw31aaZTR90vdn
 aOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EyY6A38Xrg4h1Jykyab/85K9FndR5offf5rh1KTsoXY=;
 b=uDXmjsd5kFHJiXtNeNawgWAUY2WFV7DHb6zILoFSF7LovbwbQQ+YPu21xAMIEBywlZ
 e925Y2JhB8W93ZuN4gc+tMYKyF2XRXr6M23EsBFfSXteZnxCWYy1L+5tkZcjHj/vwbes
 j2Vi/oCHZovB9BSe5pXjtMFasIg/FCIk7RgD7DBLxPDK1fUVoVm2iKekGTPJ07xz9sxn
 +x+zGR2X5t90IWoDwvn7Y/rpDzCpcQ7vVgUQtQECHhODeeXOs2bM1dBMl1d+9Fy7J53I
 vpb4JKHfd8/7DO07H/E4vYfzFH/QXDl2ZnAYKOmYkNnMKMEY4tg62DHrK5T0ZrzCio0M
 VLRA==
X-Gm-Message-State: AOAM532gk5uQz+GPlM7iErWlRcOgyeF+b4eMgekC4yigGI+0+Yr6Bo+p
 AbhBDVzc2nAeFPUJ8qWRsyeYyA==
X-Google-Smtp-Source: ABdhPJxLRe17N74BLIlN3DZj+J8HHERjhdhXXtAI+pPPQeNo7hK6n9yLMGW3UKzbjaD9F8GB3VNq1Q==
X-Received: by 2002:a17:906:3fd7:: with SMTP id
 k23mr433769ejj.176.1632753451383; 
 Mon, 27 Sep 2021 07:37:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n25sm10941363eda.95.2021.09.27.07.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:37:31 -0700 (PDT)
Message-ID: <5317a392-63ba-b812-5041-8a6066a5559f@mind.be>
Date: Mon, 27 Sep 2021 16:37:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20210927095557.360485-1-christian@paral.in>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927095557.360485-1-christian@paral.in>
Subject: Re: [Buildroot] [PATCH 1/3] package/containerd: bump version to
 1.5.5
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
 Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/09/2021 11:55, Christian Stewart via buildroot wrote:
> Signed-off-by: Christian Stewart <christian@paral.in>

  All 3 applied to master, thanks.

  Regards,
  Arnout
> ---
>   package/containerd/containerd.hash | 2 +-
>   package/containerd/containerd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
> index eb0bafff1b..3840d3ea57 100644
> --- a/package/containerd/containerd.hash
> +++ b/package/containerd/containerd.hash
> @@ -1,3 +1,3 @@
>   # Computed locally
> -sha256  3bb9f54be022067847f5930d21ebbfe4e7a67f589d78930aa0ac713492c28bcc  containerd-1.4.9.tar.gz
> +sha256  3a580cd5f125fd473c10a1ea38178b0f662777144a8cc83d97dba2d2350f2b17  containerd-1.5.5.tar.gz
>   sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index eb5da65433..ea45c61028 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CONTAINERD_VERSION = 1.4.9
> +CONTAINERD_VERSION = 1.5.5
>   CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
>   CONTAINERD_LICENSE = Apache-2.0
>   CONTAINERD_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
