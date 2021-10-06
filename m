Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE905C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:26:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 975BC611C3
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 975BC611C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5071B60F2A;
	Wed,  6 Oct 2021 19:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rum_MugViBcf; Wed,  6 Oct 2021 19:26:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B446C60F25;
	Wed,  6 Oct 2021 19:26:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A22A51BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F19360F34
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESQAtx7fO1DL for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:26:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D68660F08
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:26:24 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z20so13783699edc.13
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=XEZlM08fRLvAQ0CpfrAGfW5pqR9X9vbvojjjk/0xnO4=;
 b=JVOMCE/S82pCttgccbkCrnJkxt3lqmFXwTFxwD4KElKGo7u343SjkQJ6vJDPhcGxOD
 HzBb6W9tvcHZrlMWiZdSPtIppv/ka1mm1rTzTvv5kfqIrLOaITrF78l4hm/q3LF1wSDE
 VXGI5W5a69M4PW87BsVCmmfYfjy7fV/XdtRwICQquK02eO7TrrdynOFR9dyt49yiC8JQ
 DvXQWYbSx14w2rvZD6bzAMqtYy3YlSwz6EWOHHATHyAmd9jOed26IcLjAmxKiV7x+SlM
 BbQ7V2FQSGyY3ZBih+hvwIC/cMahpnHfb4uQPshk0t/p7qSUVL+LI1KZlXsW6OMVj+nq
 Z3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XEZlM08fRLvAQ0CpfrAGfW5pqR9X9vbvojjjk/0xnO4=;
 b=NaMpkQ2bRQV/WU23xXUERwS8jMewjcQ+WrRG7o3ZRe0KnYO7pVrC+GPo/zna1BIupS
 TthWVBV9ow+9QF3j8E/3z5z9E0dtmpTuvllyZ9609CQPC84CAAyLS77KEUeUcYlfF+0O
 MErXCiscizFMik9J4RQvh3Kg5ju1GqpOf9kTJaUAWepRgwRiTeyxMu9H0zpZudwrhJUn
 EwbzBB3ekm0GGeoqqC04Q6ypnRYR/2hQ94eHHR5fl9P/VI0wEZQj24VDwE+OkmiBmLcC
 zEVJCLhunlOuVJuFhS+ZZNnxAHE4lqfpVrzbvyTtblTgV0ektc/n1NIZexAK/j7pK3zX
 tTXg==
X-Gm-Message-State: AOAM5327ZGaeBf2vFY3e12ILKnCD2/Bma/9Xkm+/Hult0/LBladEqFuz
 f5RmtEPnhwsiGMsWKaeROOA2Y3c78tXsTZBs
X-Google-Smtp-Source: ABdhPJxNedhVGRe/Tl1LcA4DfJnce7HmqqaVNdqUu4wlz/JQo5tzdc4aB6qr/NrqZcsSn2TVTIwI3A==
X-Received: by 2002:aa7:c619:: with SMTP id h25mr68865edq.260.1633548382595;
 Wed, 06 Oct 2021 12:26:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g10sm9179906ejj.44.2021.10.06.12.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:26:22 -0700 (PDT)
Message-ID: <9de2436a-09d8-9fd4-faae-911c8f9e5990@mind.be>
Date: Wed, 6 Oct 2021 21:26:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210923221555.1409302-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210923221555.1409302-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/nmap: add zlib optional
 dependency
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



On 24/09/2021 00:15, Fabrice Fontaine wrote:
> zlib is an optional dependency since bump to version 7.60 in commit
> c4faf1d4d11764da769abdd252dd3925d83378cb and
> https://github.com/nmap/nmap/commit/0c142333bb356b6ff15fff5c95522c4cfc410a9c.
> If it is not disabled, nmap will build its own zlib version which can
> result in the following build failure:
> 
> /home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `libz.so.1.2.11'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/da9469e24390c94fe74f133152dc320c21872159
>   - http://autobuild.buildroot.org/results/53034d8dd506bc033dc92343f9a37cd4ac8b2142
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nmap/nmap.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
> index 13414a56ee..34cf61ff0b 100644
> --- a/package/nmap/nmap.mk
> +++ b/package/nmap/nmap.mk
> @@ -44,6 +44,13 @@ else
>   NMAP_CONF_OPTS += --without-openssl
>   endif
>   
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +NMAP_CONF_OPTS += --with-libz="$(STAGING_DIR)/usr"
> +NMAP_DEPENDENCIES += zlib
> +else
> +NMAP_CONF_OPTS += --without-libz
> +endif
> +
>   NMAP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
>   
>   ifeq ($(BR2_PACKAGE_NMAP_NCAT),y)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
