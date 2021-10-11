Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102E4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:13:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A308660E78
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A308660E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67ED5608F2;
	Mon, 11 Oct 2021 21:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w42mn3Ooen0B; Mon, 11 Oct 2021 21:13:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A61CD608F4;
	Mon, 11 Oct 2021 21:13:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F6161BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E671404BE
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2IWJwc2R6eF for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:13:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BFAD40456
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:13:08 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w19so12715225edd.2
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=nZfuKXFomJkv9JIh5vQ0VbaftXEFv4pe0V/ukwP+Jq0=;
 b=AvS6fIBphiWYYSLKldROS8opEyMcuF3GxKPzfhwWdkxHW+pWyhG2Yo8AU4CzKcL/PW
 9U+5PVtucyQSc+XUTK2XRw7gymFhmI0ntFrlwl5ZvjpO9xqNAPTtJN6cafssJnUXqi1j
 0r9Bt0iVJh9Fib6+yutzP36yWUMaxvyy0BkSxScnC1aPDQHctOLXDv8/kuUzwvo0G/dj
 VzyZhx97xNAQR5/uGeRupomEfkW6keYDxArC4NC9rgPiCSBXengJCtd8lc92w8AbI/4+
 qz9GD9ueIWKrc6v4MO5XuKdBoQMUOAd7IVhd86HuoWzdrnuEQ1gKMJbYcF/MRlUhdd+y
 yzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nZfuKXFomJkv9JIh5vQ0VbaftXEFv4pe0V/ukwP+Jq0=;
 b=WYKZgZ9RK88DqnfcHlF8AGdfEZsP6uwa50KCVLraczvi42r80dJHVcQDXiUFIxduxS
 BztoqRKnDm3atckql+mWPi6/E212/fCF1CQzgPmDqa/z3rpuwsCH4yj9xmjbM8mFSRZb
 jVG7WQ8fdmv5rwwLBM5LnD+26acZOeO9+Q7M2XzskXb4JKeKcDr50uW/Yg51Fi8degMD
 rrLheV/WoPZFpo33OYsExlkyLJDpo5WcjV2pdOBkt1Ct1kUY6SLu3EGbeMa9tIUzyoG9
 hrm2s340n2JgJlVpcDfJ3d5Eb7iqJhRhf8EtZGNzEHBYVVI/wgDiu+51YB3xeBEkka+f
 mABQ==
X-Gm-Message-State: AOAM530LZCODEEtRUeXharVeeKKjrOfALVnAwptNIgC7FJyOHeClKLYW
 3slok4TssFf8wLTdXXZNOiod8V0rnVuktk00
X-Google-Smtp-Source: ABdhPJwLS7iwM58D3F6MozZeH32t+ZrsWfNCSHMWhZTRjopDOHHKfY/7mVxZJQ5qjs7WOSWjxVTqLQ==
X-Received: by 2002:a17:906:5051:: with SMTP id
 e17mr28460180ejk.481.1633986786549; 
 Mon, 11 Oct 2021 14:13:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ca4sm3990135ejb.1.2021.10.11.14.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:13:06 -0700 (PDT)
Message-ID: <7accbaa1-4cd8-93fa-f22b-7182558fd05c@mind.be>
Date: Mon, 11 Oct 2021 23:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 buildroot@buildroot.org
References: <20210928155631.729512-1-thomas.claveirole@green-communications.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210928155631.729512-1-thomas.claveirole@green-communications.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/openlayers: bump to version
 6.8.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/09/2021 17:56, Thomas Claveirole wrote:
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/openlayers/openlayers.hash | 2 +-
>   package/openlayers/openlayers.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
> index e6debd49ba..306996090c 100644
> --- a/package/openlayers/openlayers.hash
> +++ b/package/openlayers/openlayers.hash
> @@ -1,2 +1,2 @@
>   # Locally computed:
> -sha256	c8695a15c3570ca0c8f84c79391f81a89b925a5fcca28dc5cd60942c0dade247	v6.6.1-dist.zip
> +sha256	07d06f17f44399d86ddeac8d8000d39ff9db503257f77c59e5743d5934463623	v6.8.1-dist.zip
> diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
> index c8d2c07ee7..7a4922edc4 100644
> --- a/package/openlayers/openlayers.mk
> +++ b/package/openlayers/openlayers.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENLAYERS_VERSION = 6.6.1
> +OPENLAYERS_VERSION = 6.8.1
>   OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
>   OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
>   OPENLAYERS_LICENSE = BSD-2-Clause
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
