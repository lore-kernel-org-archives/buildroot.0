Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33ACC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:36:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9525261211
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9525261211
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D32383D69;
	Tue,  5 Oct 2021 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hr039YmevFDT; Tue,  5 Oct 2021 19:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95DA183D37;
	Tue,  5 Oct 2021 19:36:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98EE91BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8878B83D37
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fT22UCsrEKQV for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:36:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A69783D36
 for <buildroot@busybox.net>; Tue,  5 Oct 2021 19:36:16 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id f9so900872edx.4
 for <buildroot@busybox.net>; Tue, 05 Oct 2021 12:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2HXW4uHFzgH/ilTJXWLHdZdR+4bGf0O3HPGoz7sMlZ0=;
 b=ACrI+Ga0T7XnoMUObTFdMpGT362Qb16+wXnKnrOc4YATjtMhCX9AEqRelq4lWevV6b
 78DmnId78bWoPyAe+ZADTcER4HS2eO+YMy8HU2Ura8xxsvA2OLcAnrJHIU6+q2BXglc7
 jPkNuRELdvhCIRBSL2jXr4sKh/nWJ8Ha6y9hgRdHJ6k6eT8wE1Wxo4m/YElkVp6wPvUi
 o9yDchCiiF0grI+fcvZN1cPLGBh4HyHsoCg8QjXKk2CWSd2urD/fmcZT5kvqTiUqDHe7
 gv1epngQWtwUJkiTzNy1c2n6yCk7C++1w/l66ud74dEMy9meaok+vTFa+9Knv+h6ctr3
 JtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2HXW4uHFzgH/ilTJXWLHdZdR+4bGf0O3HPGoz7sMlZ0=;
 b=Iyuo7Zmf7sO7X1Iu3WCxC1RKLJlXpwWyho/fTI2adnZ6827zEKvXBr6MUI0/rlMW3C
 0EXBJs1Wa6CI9S826wX7E4doJZx6J8lT+xCV/0WUSjXyyyS068zJIV4QJU25pX+m9mK9
 G4sv8fdzPbg6lStkN8z1RXrlHihL7Y4hrk6rmALwomdDNnNcuoKxvaguK3rcME7drTg6
 z0XBeaUjS29PIqCf1sDoPuLhvBN89uU0DGJXCg7NzKR3jGo/mzm+N9bA/NsINFgjw1Mw
 kxEOVQWh4JVs5Q7I8xkj/6epa3cFEtJhmKEcX6w3+S840XkcNBOaXQZeFdqGkWB1u2W0
 D7wQ==
X-Gm-Message-State: AOAM530jOUHq2UgSHKduQfSqzk6hPzvujQbedNzonBeM5oYtiNLwSWY2
 Cgk34WNFgRPSMSN0/bnA3I7wPg==
X-Google-Smtp-Source: ABdhPJz4mdWpImCVt83vc4JncKAWqZl0pkq8XyE/lKw/cVtGHwLt57pZSbDqA5pNpsMM7U9IbhEOHg==
X-Received: by 2002:a17:906:a404:: with SMTP id
 l4mr26383854ejz.175.1633462574727; 
 Tue, 05 Oct 2021 12:36:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id dt4sm8266594ejb.27.2021.10.05.12.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:36:14 -0700 (PDT)
Message-ID: <8bb4a041-b89a-52cb-bab3-b6852af5d024@mind.be>
Date: Tue, 5 Oct 2021 21:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20210927201805.122757-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927201805.122757-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/openldap: bump to version 2.4.59
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



On 27/09/2021 22:18, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/openldap/Config.in     |  2 +-
>   package/openldap/openldap.hash | 10 +++++-----
>   package/openldap/openldap.mk   |  2 +-
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/openldap/Config.in b/package/openldap/Config.in
> index bd39d0d02..7a0b2f4b8 100644
> --- a/package/openldap/Config.in
> +++ b/package/openldap/Config.in
> @@ -8,7 +8,7 @@ config BR2_PACKAGE_OPENLDAP
>   
>   	  This only installs client-side support.
>   
> -	  http://www.openldap.org/
> +	  https://www.openldap.org/
>   
>   if BR2_PACKAGE_OPENLDAP
>   
> diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
> index 8ce50d613..71092c93d 100644
> --- a/package/openldap/openldap.hash
> +++ b/package/openldap/openldap.hash
> @@ -1,7 +1,7 @@
> -# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.58.md5
> -md5  c203d735ba69976e5b28dc39006f29b5  openldap-2.4.58.tgz
> -# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.58.sha1
> -sha1  875416827be3ad63f20004510a354db0aaceb2ed  openldap-2.4.58.tgz
> +# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.59.md5
> +md5  6036a03b3a67b4a1fe1246e0a2c7265a  openldap-2.4.59.tgz
> +# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.59.sha1
> +sha1  b154d06bbf40fafafb34fffc4b116946d931efef  openldap-2.4.59.tgz
>   # Locally computed
> -sha256  57b59254be15d0bf6a9ab3d514c1c05777b02123291533134a87c94468f8f47b  openldap-2.4.58.tgz
> +sha256  99f37d6747d88206c470067eda624d5e48c1011e943ec0ab217bae8712e22f34  openldap-2.4.59.tgz
>   sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
> diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
> index daa409ae1..b5373544a 100644
> --- a/package/openldap/openldap.mk
> +++ b/package/openldap/openldap.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENLDAP_VERSION = 2.4.58
> +OPENLDAP_VERSION = 2.4.59
>   OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
>   OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
>   OPENLDAP_LICENSE = OpenLDAP Public License
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
