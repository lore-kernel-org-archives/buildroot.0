Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFF9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:37:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4499603E5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4499603E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B56F660BB1;
	Tue, 12 Oct 2021 20:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h0ENhMNKduKW; Tue, 12 Oct 2021 20:37:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B48D9606C0;
	Tue, 12 Oct 2021 20:37:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA0141BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B996E825DF
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1PNMeb-n0biF for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:37:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A722881D11
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:37:14 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id d3so1148140edp.3
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=cwLtX7SLsx3WbAY9tNVAe+egmb8yhjxpY18cu5Nrc7M=;
 b=Xt2birdRPdu770xlSTod7/Ip8OaJYD4KDMiqSe9BQBiWh8+9KJJYjeznh3D+RA+tGE
 Jp1F7QimGnjriGDhHPUZz6YVv6lB2h50zzsqdODS4HDSJdN+/aq51LYddYtJF89uhd3A
 6o9Mdm3ITuu/qQ/B2Nyik+jqCFWHRK/BPXEVEc0BfV7kbBSEKfBiLMyXGpk07LJaLGIv
 P9Ui43uFRP0ZMYQumMcEh+PiJIqAIFkkLAdrNsktM5EmRUQy7EuYkqGgwfh/t8o2gw5w
 TsjNMFwcw0zFlJCzRJT3TIyka0aw8SeBrsZbXdYpEushvuOw1S5xJsGUMuI+AwADmcJd
 ZxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cwLtX7SLsx3WbAY9tNVAe+egmb8yhjxpY18cu5Nrc7M=;
 b=eGc394mFGurOHC2BRm6lfsvytUXiHViPlkX8xHlM5qnpLdi7gFkRO3gnfSyU/Ncfg+
 Uxudao5xeE073jdsgzJEHu4JgmIuAoTfURoDyhmZB59ZU0H00LCVC0N0mpurXRpzd/yQ
 315zaXIKxe3/Abe/LiYIaVF7+0L/xfV/95MkB7paSqCfOClZWbf7qGeu+mVaafAfkxCl
 k2sEP/XpY8Va3/YO6aDwZltz5VFAaq/brSiTCOFDxclvqKtp4M7MWtN+bjBFlwQnMAlq
 nasKs1MD143pCYijDPjvS5cAc72lUji88RLt5ki/q03qTur6onZ4hizl4xW+18fXC+Wu
 oXnw==
X-Gm-Message-State: AOAM530SF7F8YMYjoy5MM2haFTOHDGCSrpGikR0J/xJMLhBaQ+hIujSW
 PLM7zN8YGqZOL9YxplxsrMAJ1GVDIqepCZV+
X-Google-Smtp-Source: ABdhPJyD2PAxOMS4xSCsSjq4X3gfwmloeX3oPMf4Box/4nK5PGclCvZVF9+DjNr+kSnAcEkuSgJw+g==
X-Received: by 2002:a05:6402:3186:: with SMTP id
 di6mr2849429edb.225.1634071032919; 
 Tue, 12 Oct 2021 13:37:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gl25sm5461668ejb.81.2021.10.12.13.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:37:12 -0700 (PDT)
Message-ID: <81adc217-a8e3-c167-a771-2574c1e6e51c@mind.be>
Date: Tue, 12 Oct 2021 22:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Yair Ben-Avraham <yairba@protonmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <Ikgah1V9oe_7PeeorzlpddD1VnOnWsFu_szZsuy7cWaHJVctqPB7gDEHv0BgLcpcgYPKxDX5KM_spye9wdQ6-3v0q9kPGzUvJ0k5yTC6fBE=@protonmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <Ikgah1V9oe_7PeeorzlpddD1VnOnWsFu_szZsuy7cWaHJVctqPB7gDEHv0BgLcpcgYPKxDX5KM_spye9wdQ6-3v0q9kPGzUvJ0k5yTC6fBE=@protonmail.com>
Subject: Re: [Buildroot] package/tpm2-pkcs11: bump version to 1.7.0
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



On 05/10/2021 04:39, Yair Ben-Avraham via buildroot wrote:
> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>

  All 3 applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/tpm2-pkcs11/tpm2-pkcs11.hash | 2 +-
>   package/tpm2-pkcs11/tpm2-pkcs11.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
> index 18a225d5a9..1d5bcc7a54 100644
> --- a/package/tpm2-pkcs11/tpm2-pkcs11.hash
> +++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  61e2849c07acb4acbf756bdd6a9fe44f9475343256fa0bdc966b77321169c125  tpm2-pkcs11-1.6.0.tar.gz
> +sha256  078a445ed0e9f5009675a162b4b7b88f3520436cfbc791bb2249f37bd1f475bd  tpm2-pkcs11-1.7.0.tar.gz
>   sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
> diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
> index b26ce374e8..adb5a46f56 100644
> --- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
> +++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
> 
> -TPM2_PKCS11_VERSION = 1.6.0
> +TPM2_PKCS11_VERSION = 1.7.0
>   TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
>   TPM2_PKCS11_LICENSE = BSD-2-Clause
>   TPM2_PKCS11_LICENSE_FILES = LICENSE
> --
> 2.30.2
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
