Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A67C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3FCD409B1;
	Mon, 20 Dec 2021 22:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bedfZa5iW_Bx; Mon, 20 Dec 2021 22:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF56D409AD;
	Mon, 20 Dec 2021 22:40:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C3A51BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B88960E79
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tiy3y4TeWrE1 for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:40:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95A7A60E39
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:40:27 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id j21so39963310edt.9
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=13EaLZKTnM/4FBh+Oq5RAspTDPj2eczARB/JlWtxXpI=;
 b=Yq7Qzz67ZRM003kaaIT9jtoHfqXt6hSjROXw+rlzH+8fk1u8m63IgSnySkM+E4uH3U
 4+AJhNGhTX8VORJQDf5G0z4Da2ExkHYgFW69bneHSTYStlwkI/YN7XsTNFSgFq1ptMzl
 HRris5q1UwPOwldErj5eE41mbZs3j8j+AUE/A5SC1lePTojfylu0A7VwUb/0wfGkCAov
 29ExbkqlbtZqo7y16SU+Q6kC8S0VWVccoV8x+YjSJtln8f9sQTGNmS1pk2qaHGg96P5Y
 gJBP0daWT6p1JzLxS7EtdW82G7qFIHWKdEcdhfyDYTNQnatVWLuCXz6zf+iF4TSwFMAy
 wgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=13EaLZKTnM/4FBh+Oq5RAspTDPj2eczARB/JlWtxXpI=;
 b=ztOFc/niuqFkUu+6le7t+0EyMRLV3nF3qAaBPT2xvLC46vEke151gLjepQ/w5QBgLi
 9/TfYtwgKvnEXTdkF4PTKiV92Em2+/1oxJ0mcUL3lc4YhQRrXEbQoMP+6zqZda4DcZ8/
 6heRbc+QU0ZuEHoVYUxKpE48VCPjYW5BDUoREKnIboQ2Zh6Q1G8maIS1oDf8SlYdEOwv
 Kp/TGWUmVEXtexChzkpXv9sUO0SpVL6KVIXA2jiNovNbPxEX3KN9HQ7LfTbCgDvzSAE9
 m0jLQIsHMK8B3ZUc7gGB4je6Z4gym9rRVmJ6RuQU4H0nWGIYMI0r+viib7e6sxPUb1Mk
 +lyw==
X-Gm-Message-State: AOAM5306qapoVkG1R6jV/pcOz/R0zXhCJgQOrsNzUxJvhVDhmzGB2Y3q
 Q20td0CQZD3LMyvjSk17fiUOab2m9V7ZJw==
X-Google-Smtp-Source: ABdhPJwsXwH79xoYPtpBv7zx7DaCmZdx0DU5Ce58QfWRVu8ecHwIHGKSQcjuZk02cMgZp2JOPDBvQQ==
X-Received: by 2002:a50:d74e:: with SMTP id i14mr242151edj.243.1640040025907; 
 Mon, 20 Dec 2021 14:40:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p4sm5750884eju.98.2021.12.20.14.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:40:25 -0800 (PST)
Message-ID: <24083358-e9a4-e215-b0c0-dbbaff529544@mind.be>
Date: Mon, 20 Dec 2021 23:40:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211219160627.1360325-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211219160627.1360325-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/sshpass: bump to version 1.09
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
Cc: Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/12/2021 17:06, Fabrice Fontaine wrote:
> https://sourceforge.net/p/sshpass/code/HEAD/tree/tags/V1.09/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/sshpass/sshpass.hash | 2 +-
>   package/sshpass/sshpass.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sshpass/sshpass.hash b/package/sshpass/sshpass.hash
> index 9635a91806..cb8968bca4 100644
> --- a/package/sshpass/sshpass.hash
> +++ b/package/sshpass/sshpass.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  c6324fcee608b99a58f9870157dfa754837f8c48be3df0f5e2f3accf145dee60  sshpass-1.06.tar.gz
> +sha256  71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8dc48717dedc49fb7  sshpass-1.09.tar.gz
>   sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> diff --git a/package/sshpass/sshpass.mk b/package/sshpass/sshpass.mk
> index 6c14f0fe7d..21e10397b6 100644
> --- a/package/sshpass/sshpass.mk
> +++ b/package/sshpass/sshpass.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SSHPASS_VERSION = 1.06
> +SSHPASS_VERSION = 1.09
>   SSHPASS_SITE = http://downloads.sourceforge.net/project/sshpass/sshpass/$(SSHPASS_VERSION)
>   SSHPASS_LICENSE = GPL-2.0+
>   SSHPASS_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
