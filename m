Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5031C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:52:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17FF760F6F
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17FF760F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA7BB40461;
	Mon, 25 Oct 2021 18:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aR-GU067kxpy; Mon, 25 Oct 2021 18:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33B9C40462;
	Mon, 25 Oct 2021 18:52:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43B7C1BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3277B80EEF
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IUVUN0VwtYiz for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:52:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAD4180EEE
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:52:06 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id n1so3393518edd.0
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZHKbw2gkPvYASJyiWHvDQKOwGbhp46du1xYJHeFJMus=;
 b=FRT+6PUe11XxCPgT3f0QVccfCdiTvtkvyRMnYj/QzKxyrElESyQvl/M8njgKxotTue
 ihZu107o09TK+xFAE19PqG0D5MjA1wsKskqWmHdPNAr5YWvHBkXeW01LAi33oDLsxuOr
 wWMIvtH5Qe6gf1LOPGcTBPGwLTD6yx9iKoyhFneiXYj32uIa+gOMNxOHB6eMheW8nmDi
 2J8VLK9x3vMEB9mjZths3SHPOdOyOFeaaeq0tn2OhgPnTDBk60NdOsd4RpRTT31V1DWa
 eJKdsRwThA6+HC0Eju42Nthnm1Ic4IBomIjCzsH4gyOg9JjCeU+uWlvGGB+sMb+Efa+A
 LB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZHKbw2gkPvYASJyiWHvDQKOwGbhp46du1xYJHeFJMus=;
 b=dfsiKV5EQtJ7wlFwJGSk5IBtVIXO6nNET1aOFBxoQpRwm63Lai6QuzipcS3ZGL90PB
 qrEPGZeZSUGO+dtSZLjSdoNx3Y92tj93e5Nb+5zXJTStxWqsrzaXloq1ZNUuHpP8NYH7
 mmV8frc7BPHUtFeeBzu4SEPdgSJfvteXQRj3FD/iKK+cwjERvGcoZSVf/RSLpIb2aMu0
 WZmBeqnZqfc0s7JgutWCP4S53cWpHdHInuPADfgW2ZRbrYSX3rAgbuQjOlqEdBJ6tj//
 gc0Bx1Ayugci9eYuDeVKOhGX4VlfFmugXcy6E/kHNCp4LxCuqU49Akh5hY6yV3AlXs1P
 IcNg==
X-Gm-Message-State: AOAM532LwZzc7qUtP3/fWr7xmyclqP6Xv8Ad/qTu8G87C98po7jrcdIc
 +rMfPDxfkKBeH10+juEbDPH3/ydxegR43Gvh
X-Google-Smtp-Source: ABdhPJy0+xEnIHH58871u6ZT3jI3badC5ZsmeCa70fOy4lfqHy2BCAnAAtNXwnaCXd7YBfHVLQ/0rw==
X-Received: by 2002:a17:907:ea5:: with SMTP id
 ho37mr24127628ejc.355.1635187924518; 
 Mon, 25 Oct 2021 11:52:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g8sm1835720edb.71.2021.10.25.11.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 11:52:03 -0700 (PDT)
Message-ID: <5475edad-5452-0017-79a5-793d19ee8e57@mind.be>
Date: Mon, 25 Oct 2021 20:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211013192038.1876922-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211013192038.1876922-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/p7zip: add 7za support
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
Cc: =?UTF-8?Q?Andr=c3=a9_Zwing?= <nerv@dawncrow.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/10/2021 21:20, Fabrice Fontaine wrote:
> Add 7za stand-alone executable as 7zr is a "light-version" of 7za that
> only handles 7z archives and cannot handle encrypted archives.
> 
> Fixes:
>   - https://bugs.buildroot.org/show_bug.cgi?id=14266
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/p7zip/p7zip.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
> index f94b55ecd2..a363a2ac1d 100644
> --- a/package/p7zip/p7zip.mk
> +++ b/package/p7zip/p7zip.mk
> @@ -17,10 +17,11 @@ define P7ZIP_BUILD_CMDS
>   	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ALLFLAGS_C="$(TARGET_CFLAGS)" \
>   		CXX="$(TARGET_CXX)" ALLFLAGS_CPP="$(TARGET_CXXFLAGS)" \
>   		LDFLAGS="$(TARGET_LDFLAGS)" \
> -		-C $(@D) 7zr
> +		-C $(@D) 7za 7zr
>   endef
>   
>   define P7ZIP_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/7za $(TARGET_DIR)/usr/bin/7za
>   	$(INSTALL) -D -m 0755 $(@D)/bin/7zr $(TARGET_DIR)/usr/bin/7zr

  I did a build for aarch64; 7za is 2.6MB, 7zr is 800K. I think that difference 
is big enough to warrant making the build/install of 7za optional.

  Also, apparently 7zr is a subset of 7za, so does it ever make sense to install 
them both?

  Regards,
  Arnout

>   endef
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
