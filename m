Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CBBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 846E040B54;
	Thu, 16 Dec 2021 19:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WIttUBY7RNVG; Thu, 16 Dec 2021 19:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67E1B4017B;
	Thu, 16 Dec 2021 19:08:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1C2F1BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEDC641798
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dX9fZM_jtVAV for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:08:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00A3341795
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:08:36 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y13so90462819edd.13
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 11:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EU3SU0fwCMdGJzpp3rKd61RsMTAK57RZ2BhkOMHvz5g=;
 b=ZGNFBPa4CjAZo3vppsJTQn9U+DKoGM1j/yvlpukAgSZKcK7Kkp+7hguhwIo7gThImH
 RkhbT3Qwb0Tk4qm+Z59IuaE7RgEEO1c37lCS7lTCiNqTdOTp+ojBtOYBaiLbJhQICYY/
 wX+ltI+ytTInzdQHb+nnNLQYObbDQBfA0fs7ribON48x3SeBcCOK8N5feIa7ydy7X1fi
 Gyb1vJmm15QqZx4zKIHozUbYk1FhMKE+dZt8p7vPUh4dazLopRKV5M8LVZ5LCmAeVZx4
 D8iSAvVKtpFE6gtZc5WiuOygSCwof8aij1XtNfeFa8KL7TVLvK7MF8xwJPOI39j5gHck
 Ty6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EU3SU0fwCMdGJzpp3rKd61RsMTAK57RZ2BhkOMHvz5g=;
 b=u7lLN4etjcc4ZXx5OTLf90lTbo9KQ5LRt9rTKoPgSFzeNfO9o1RC/W4hA62DaViHhd
 pkR8NLdKOBj3wasn+pGpHt6gJDmib29s1OgHz9dk7UaKd51Y05VyTkk/vaMQnCFS1jDh
 M0gYnZKBME94SocMmO2hELw2N5AkXqRy797j2aTefTa7Qglu+Cqt3zUcsE+PSnBZ5/DQ
 xPSyNxY6Rh3ogTV/CasWCNGgtxh/UFcJ+6tYBEZT66kFX7+rnmvZUL92mH+958448mOQ
 ye1AtGISOxaCG8xdcffTddKgYnbbDQRGXg5uwpQU3BYlo2mLSqSfoJb5hDXVSYWTOEfc
 j7WA==
X-Gm-Message-State: AOAM530J3jQC9Exz+NHxU8w3VinowcPOlCljvyRcK7QrVp9Gi1MGwy9w
 trUOtqzChPrJmsgtQL0rqduEQ1TtZpyRFA==
X-Google-Smtp-Source: ABdhPJyS62NVcJF+ydP99GZR8hnWihaPyeRWXZLBYUqK1oyEce9T7on4EU+w0Ugl9s639x/8OqZk9w==
X-Received: by 2002:a17:906:dc8d:: with SMTP id
 cs13mr17131546ejc.109.1639681715241; 
 Thu, 16 Dec 2021 11:08:35 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e19sm2674459edu.47.2021.12.16.11.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 11:08:34 -0800 (PST)
Message-ID: <c99dc64c-bb75-2c2c-1b5c-1e799e6be72a@mind.be>
Date: Thu, 16 Dec 2021 20:08:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20211215164719.31742-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215164719.31742-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/xen: add XSA-385, 386, 388,
 389 security fixes
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/12/2021 17:47, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - XSA-385: guests may exceed their designated memory limit
>    https://xenbits.xenproject.org/xsa/advisory-385.html
> 
> - XSA-386: PCI devices with RMRRs not deassigned correctly
>    https://xenbits.xenproject.org/xsa/advisory-386.html
> 
> - XSA-388: PoD operations on misaligned GFNs
>    https://xenbits.xenproject.org/xsa/advisory-388.html
> 
> - XSA-389: issues with partially successful P2M updates on x86
>    https://xenbits.xenproject.org/xsa/advisory-389.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/xen/xen.hash |  9 +++++++++
>   package/xen/xen.mk   | 17 +++++++++++++++++
>   2 files changed, 26 insertions(+)
> 
> diff --git a/package/xen/xen.hash b/package/xen/xen.hash
> index e30db09516..10a778053a 100644
> --- a/package/xen/xen.hash
> +++ b/package/xen/xen.hash
> @@ -1,3 +1,12 @@
>   # Locally computed
>   sha256  a3dad76a772393a1875e8f44a6059a95fea4bde40f97b800966969ac6f3a498d  xen-4.14.3.tar.gz
>   sha256  ecca9538e9d3f7e3c2bff827502f4495e2ef9e22c451298696ea08886b176c2c  COPYING
> +# https://xenbits.xenproject.org/xsa/advisory-385.html
> +sha256  831e86c3adfec532b1a48a0b967b7c58c37db3733aee8d78216eb9d535b34f12  xsa385-4.15.patch
> +# https://xenbits.xenproject.org/xsa/advisory-386.html
> +sha256  f2f83c825e249bba9454437b48bbd8307fe7a224f56484388a67af124dfd279b  xsa386.patch
> +# https://xenbits.xenproject.org/xsa/advisory-388.html
> +sha256  6917267482101a3f8f1d13905e14994344a0af81370c7a2b92275fb176b321a0  xsa388-4.14-1.patch
> +sha256  d5886e046c69f34f98f7e1fc6ffcc36d92f8fc79242b9dc88412c39aa79b4ac3  xsa388-4.14-2.patch
> +# https://xenbits.xenproject.org/xsa/advisory-389.html
> +sha256  b243284679b32ab8c817a2e41562d8694d9781fa8096c268bb41b0cd91684baa  xsa389-4.14.patch
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index b635996afb..cfc166dc4c 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -11,6 +11,23 @@ XEN_LICENSE_FILES = COPYING
>   XEN_CPE_ID_VENDOR = xen
>   XEN_CPE_ID_PREFIX = cpe:2.3:o
>   XEN_DEPENDENCIES = host-acpica host-python3
> +XEN_PATCH = \
> +	https://xenbits.xenproject.org/xsa/xsa385-4.15.patch \
> +	https://xenbits.xenproject.org/xsa/xsa386.patch \
> +	https://xenbits.xenproject.org/xsa/xsa388-4.14-1.patch \
> +	https://xenbits.xenproject.org/xsa/xsa388-4.14-2.patch \
> +	https://xenbits.xenproject.org/xsa/xsa389-4.14.patch
> +
> +# xsa385-4.15.patch
> +XEN_IGNORE_CVES += CVE-2021-28706
> +# xsa386.patch
> +XEN_IGNORE_CVES += CVE-2021-28702
> +# xsa388-4.14-1.patch
> +XEN_IGNORE_CVES += CVE-2021-28704 CVE-2021-28707
> +# xsa388-4.14-2.patch
> +XEN_IGNORE_CVES += CVE-2021-28708
> +# xsa389-4.14.patch
> +XEN_IGNORE_CVES += CVE-2021-28705 CVE-2021-28709
>   
>   # Calculate XEN_ARCH
>   ifeq ($(ARCH),aarch64)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
