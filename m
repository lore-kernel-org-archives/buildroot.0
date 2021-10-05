Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBB1C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:34:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 721A261211
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 721A261211
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F38360C2F;
	Tue,  5 Oct 2021 19:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ej8MFe8z8xJB; Tue,  5 Oct 2021 19:34:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E52660C1C;
	Tue,  5 Oct 2021 19:34:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26A281BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23AF380D01
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cWTbCs3hFKVd for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:34:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2386F80D19
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:34:08 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z20so699506edc.13
 for <buildroot@buildroot.org>; Tue, 05 Oct 2021 12:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=QlZjdUnE++5G1wF0dRo2LK39xFttfxJ6DDo925fT8PE=;
 b=FeDPH3r+fZch/iI5Tm1UUzIRKCKG6ThrOE7l70GvVYvddtspRP1bnzE0iCRgSV1CD+
 kMb9/Yg3tKpE3CJ1g78GYTsFc585rml8D/jU3nWORDEpuhi47LO93/gZ77QBUB8He5sh
 HpXmH2NAO7A467caHyJRuij+MJAqG23pTgOhtrP4VIYO9uSkFEZD69cgapLE4zpTw8Ev
 wc/KiPBIsh7theblaiq09applUmcJb7r0CU4k+WwympUU4tCTuhMbjt4igguikgFvrmQ
 hGbI6Tm/r8599yN1beigE4LbSXgRjVxHhpjkq2Rf/DbTgGPMwTeVZeJukJD4eNIhn3cW
 oDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QlZjdUnE++5G1wF0dRo2LK39xFttfxJ6DDo925fT8PE=;
 b=Fp/w2LUFczBqQFEZB4ikjpvNv3nEZL7mGfhMKdNuXALq6nKpTx4c62WE5wPAEDpNqB
 o3Uar4vBXBqsmalTWMeYzb8wSwYJl6qCgGTn9+7zoXPh/9CDvb+2nrQeQOB+hZZQPsqC
 RxbHavz0F+y0+Eh9uq6fmdfDaFlZQ2dlTyR3KcYGoarIduWj5JTpnAeqLz1q99cgJcBs
 gRkdun2vmtJM7KRNKnXdODAbo/j7UN8vyldl+rciytN7ovqNM/E6RkD3HDbyP+T2doMW
 HIjJbdHFeu7TJGDt0N8XJ1Bjg8Pg4CmZBFakzR4KVWS1QNovSokwmTCXhMlMh2oZRrgZ
 6HrA==
X-Gm-Message-State: AOAM533DQBwFuWJyuMm36JARqu/C1lrjnUTxbHS2BBHC2tqNwr8qV6OR
 ehuVpQKOxOBCnq/xtPDR+V50alezFYM7IiaE
X-Google-Smtp-Source: ABdhPJx4XvK8N9J4/mavBWlBCxxDSaGsLKamTzlghJHmK61YS/QKJ6UEMVyxcEyQDYUwttWz4NA2wQ==
X-Received: by 2002:a17:907:1b1b:: with SMTP id
 mp27mr26675193ejc.538.1633462446337; 
 Tue, 05 Oct 2021 12:34:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h10sm9280889edf.85.2021.10.05.12.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:34:05 -0700 (PDT)
Message-ID: <187c01d8-1477-7300-5dfa-f18bdc430672@mind.be>
Date: Tue, 5 Oct 2021 21:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Ash Charles <ashcharles@gmail.com>, buildroot@buildroot.org
References: <20210927190655.48426-1-ashcharles@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927190655.48426-1-ashcharles@gmail.com>
Subject: Re: [Buildroot] [PATCH] pru-software-support: bump to latest
 version 5.9.0
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



On 27/09/2021 21:06, Ash Charles wrote:
> Update to the latest version of the PRU software support [1]. Compared
> with v5.8.0, there aren't code or license changes, just some extra
> release notes.
> 
> [1] https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package
> 
> Signed-off-by: Ash Charles <ashcharles@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pru-software-support/pru-software-support.hash | 2 +-
>   package/pru-software-support/pru-software-support.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
> index 8345c2724e..a2c78e7a1a 100644
> --- a/package/pru-software-support/pru-software-support.hash
> +++ b/package/pru-software-support/pru-software-support.hash
> @@ -1,3 +1,3 @@
>   # Locally-calculated hash
> -sha256  e9256533a6901d31cd12b4ca1c1638b795d316a966967783a8d573e75a6f9d77 pru-software-support-package-v5.8.0.tar.gz
> +sha256  4a6b1b2b8ca892c442fd7fce7ddbf6b74e0619def2bb19f3ad67c94720b7ca3a pru-software-support-package-v5.9.0.tar.gz
>   sha256  62a2f56498cd1bac2d4ea6ea1c941affba1e4bb65bfdf2dcffd8e5079fa34399  PRU-Package-v6.1-Manifest.html
> diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
> index 7c1b520290..cff3fb54ed 100644
> --- a/package/pru-software-support/pru-software-support.mk
> +++ b/package/pru-software-support/pru-software-support.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PRU_SOFTWARE_SUPPORT_VERSION = 5.8.0
> +PRU_SOFTWARE_SUPPORT_VERSION = 5.9.0
>   PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot
>   PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_NAME)-package-v$(PRU_SOFTWARE_SUPPORT_VERSION).tar.gz
>   PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3-Clause, Public Domain
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
