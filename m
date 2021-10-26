Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB36C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 08:04:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 647DF60F22
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 08:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 647DF60F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11A2C80DE3;
	Tue, 26 Oct 2021 08:04:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wyq-PfyV0Lk8; Tue, 26 Oct 2021 08:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D0C480EA4;
	Tue, 26 Oct 2021 08:04:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D850D1BF335
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 08:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D46AD40401
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 08:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40uuTH1oZD5c for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 08:04:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B216D403F2
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 08:04:40 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w15so10157826edc.9
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 01:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DheTq2zCgZivlXXE2JsMoxE4/Hk+irRzH1WqfExHGvU=;
 b=L5y34+8wGyshq+Nct1KAOURTeF/39gIBAp2w7F4onVbbtgBqGrziz0kLX208KIXJhW
 00cc0872zaOL4cTLFX0oSr+4tSLYqHyl0Wq1WvMHuyUCJ23GoX5rxUp1oyc9vJ1qtTQD
 ATGoUyHlKDr4OW4xnGpR1f6SZwmTiONca7oS9H2FTdbEBtD8mtJBbW/yXNTbY4whHMw+
 aHmXTMA7jOcDBuSzQG0UpXPF2ewupbFBoEDo01KNJpxzHh1EtZ1RicYPJfpOcgg7JF0g
 FyAfancBpDOkqXhW9LjmTBRTSI4+YrQ91obL9qaHYOdXGlHho//keUylLB78urcFD59L
 aU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DheTq2zCgZivlXXE2JsMoxE4/Hk+irRzH1WqfExHGvU=;
 b=sf1bV3BIJQGPaE9nUAJmkp3wiUqIh+xWDHk8rt0WNcS7PqzmJg5Mwu3e3rhQYC9OG8
 yWCBSALUY1nA2rAVLAVzL96fnRg9DIBfVG7mVXdJftfkVzlYDemgjgl/Kw+fBXE8nuvm
 YyKyZLzhOggT7hO7A8oKnIa20FGV9iqG0gn1SSbCKliDjoooynYDSVM3YfItS4XMvxR+
 0GgL31Gt8vRjHFObwKXMbqZPvR5i3NeCyIg4RF9WDP89YrB2TKQc9K3+k8XHCKTe/OdQ
 z+CDu0BcT8Izit1Rgvm+0gmnLZ8DNGW6Yo4pZ0CRRKcsTt8A+fa7OXKoS7dh2BnbG0Iy
 k3oQ==
X-Gm-Message-State: AOAM530ioLrwfiMLJditxl5FYV7LlSmoWxiV0jiKoPz2cFcSMvFFD78v
 luTwi7h7Q5eqqgNcHncCBj244g==
X-Google-Smtp-Source: ABdhPJz4JwaRNKBvPveXLYeJRV9akjNW+QQX9oXY57iOMu33C9Zlo800QzlmsTuh15ULG8hMGC0D7w==
X-Received: by 2002:a17:907:7da0:: with SMTP id
 oz32mr3794018ejc.2.1635235475691; 
 Tue, 26 Oct 2021 01:04:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x26sm8582336ejf.103.2021.10.26.01.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 01:04:35 -0700 (PDT)
Message-ID: <445d2054-7c3d-b273-561c-b8d7fe00d0af@mind.be>
Date: Tue, 26 Oct 2021 10:04:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211026064125.3800163-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211026064125.3800163-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: add
 host-python3-six dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/10/2021 08:41, Fabrice Fontaine wrote:
> Fix the wrong assumption that six is not a dependency with python3 made
> in commit 95a63a34ac9204c4fe069154783bd97ed48c3ae2 to avoid the
> following build failure with ca-certificates:
> 
> Traceback (most recent call last):
>    File "/home/buildroot/autobuild/instance-2/output-1/build/ca-certificates-20211016/mozilla/certdata2pem.py", line 31, in <module>
>      from cryptography import x509
>    File "/home/buildroot/autobuild/instance-2/output-1/host/lib/python3.9/site-packages/cryptography/x509/__init__.py", line 7, in <module>
>      from cryptography.x509 import certificate_transparency
>    File "/home/buildroot/autobuild/instance-2/output-1/host/lib/python3.9/site-packages/cryptography/x509/certificate_transparency.py", line 10, in <module>
>      import six
> ModuleNotFoundError: No module named 'six'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2b6872eec31362bf3edf88c69b67d681b2f016aa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/python-cryptography/python-cryptography.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> index e21b9db042..58edaa9778 100644
> --- a/package/python-cryptography/python-cryptography.mk
> +++ b/package/python-cryptography/python-cryptography.mk
> @@ -14,7 +14,7 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
>   PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
>   PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
>   HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
> -HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
> +HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-python3-six host-openssl

  Since cryptography is now python3 only, this can be host-python-six instead of 
host-python3-six, I think.

  Regards,
  Arnout

>   
>   $(eval $(python-package))
>   $(eval $(host-python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
