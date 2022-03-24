Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F934C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 053A4402DC;
	Thu, 24 Mar 2022 21:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MSaskWAjq3my; Thu, 24 Mar 2022 21:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08252402AC;
	Thu, 24 Mar 2022 21:13:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35C211BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 333F4844A4
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Rp9TfLfyE2X for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:13:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B4AE844A0
 for <buildroot@busybox.net>; Thu, 24 Mar 2022 21:13:01 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g20so7070950edw.6
 for <buildroot@busybox.net>; Thu, 24 Mar 2022 14:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=d5fAJVDiQIqs3p4UDxTZisqBW+sW/um99VNffX/XMrU=;
 b=PRZ7/s5gI6r04Z4p4tdQmoZ5WPNbLgQNOC5jdnDLKoAcCDZVmlsFmqo/lZ3uiRShaa
 fVPq8iIoiwhC4S3sNRT3E7ImKRN3ewj4z1Z+BAHBSttuqvEOzoF0k+wJv5Ioz8lD1EGh
 h5o3ODdYhDcuSvOWxjxvmbUJjsYxuaxq3cqHcIAEPZiAylhOHXytnG1ur3fQyqQDkOaH
 TiwcRNwLrgnmlBTSTTzZfy3g3EhiqvSLgClIojE1yhnzoONDGjK8dQgeS58oYop/e/Wc
 HXWeRZiqmJ8hUtvaMksLFsInzKyS3DTIIHgdNqo9QtC4AUItBHmYTNbiMOwip+qakD5G
 jF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d5fAJVDiQIqs3p4UDxTZisqBW+sW/um99VNffX/XMrU=;
 b=IMlb+A6B7wuSBIHbPmQ3JbNYFfGpkctknx5hqq72TM1jp+A4Y0j/yoTK/Fo5buXqwZ
 5bNze0wvSJeASV7rGW7tuu26QPxFUv/KOTUz1+UDV9y6WYoGasscuVe4C+ZjzJCeTU8Y
 hI+b42EiAIFxQ59RiqRFb2CAzXTqFPDdB172RzjmQK9hx+nTWi7siiXZvZQwY1ROCt2d
 kCt2U57ZmwTVQ9oFXSyB/dk74L0nEdkYaqQB9y/whhkLrUtq0XBgWo0uYsm3uXGnCpVK
 bTHv5LkMnK2N4cSmVWllt7k4GP+/Sec5QvI1bWVPoQAYYfNpvWt0sIOrf4MvzOV29o0T
 bLHw==
X-Gm-Message-State: AOAM532vXyuYPcZ79GqNXsmf2p5/Xs38Z3ul5ZzSC/EvgmfPf0QIOzVx
 3865/8EbjGY7fCVKAhDGgJSOaA==
X-Google-Smtp-Source: ABdhPJwL1YF22CkMqzkUKDNL/taaTyYu0tsKb5vWtokV6HWC9E4UhSQDBFjAK5PG8tNpQzewkUpGIA==
X-Received: by 2002:aa7:cb93:0:b0:415:d57a:4603 with SMTP id
 r19-20020aa7cb93000000b00415d57a4603mr8971309edt.62.1648156379564; 
 Thu, 24 Mar 2022 14:12:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a1709063a0200b006e05b7ce3efsm1567147eje.107.2022.03.24.14.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 14:12:59 -0700 (PDT)
Message-ID: <78306b4a-a95d-e666-3d86-917abc38989a@mind.be>
Date: Thu, 24 Mar 2022 22:12:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220315173324.1113174-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220315173324.1113174-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/perl: bump to version 5.34.1
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



On 15/03/2022 18:33, Francois Perrad wrote:
> diff README:
> -2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021 by Larry Wall and others.
> +2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022
> +by Larry Wall and others.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks. Thanks for explaining the README diff!

  Regards,
  Arnout

> ---
>   package/perl/perl.hash | 14 +++++++-------
>   package/perl/perl.mk   |  4 ++--
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/package/perl/perl.hash b/package/perl/perl.hash
> index b0f60ef6f..d8344d975 100644
> --- a/package/perl/perl.hash
> +++ b/package/perl/perl.hash
> @@ -1,12 +1,12 @@
> -# Hashes from: https://www.cpan.org/src/5.0/perl-5.34.0.tar.xz.{md5,sha1,sha256}.txt
> -md5  df7ecb0653440b26dc951ad9dbfab517  perl-5.34.0.tar.xz
> -sha1  d461e206a1dca5e79d39e77debf0b564f6d77d37  perl-5.34.0.tar.xz
> -sha256  82c2e5e5c71b0e10487a80d79140469ab1f8056349ca8545140a224dbbed7ded  perl-5.34.0.tar.xz
> +# Hashes from: https://www.cpan.org/src/5.0/perl-5.34.1.tar.xz.{md5,sha1,sha256}.txt
> +md5  7d2ece7f50775ea1ff739831935a24bd  perl-5.34.1.tar.xz
> +sha1  e7dbef3c1ea7caa73e2c705bba9e4bfb92ea98f0  perl-5.34.1.tar.xz
> +sha256  6d52cf833ff1af27bb5e986870a2c30cec73c044b41e3458cd991f94374039f7  perl-5.34.1.tar.xz
>   
> -# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.6/perl-cross-1.3.6.hash
> -sha256  4010f41870d64e3957b4b8ce70ebba10a7c4a3e86c5551acb4099c3fcbb37ce5  perl-cross-1.3.6.tar.gz
> +# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.7/perl-cross-1.3.7.hash
> +sha256  77f13ca84a63025053852331b72d4046c1f90ded98bd45ccedea738621907335  perl-cross-1.3.7.tar.gz
>   
>   # Locally calculated
>   sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
>   sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
> -sha256  df6ad59aefea68676c38325f25f6707f026ddde6c71291b2ca231b6247859907  README
> +sha256  06bab256e2e039c59d2ca3c5853425317b4a0f251fe4e5d5201a987b11fc4f78  README
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index d7f9c58dd..392fb8b6e 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -6,7 +6,7 @@
>   
>   # When updating the version here, also update utils/scancpan
>   PERL_VERSION_MAJOR = 34
> -PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
> +PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
>   PERL_SITE = https://www.cpan.org/src/5.0
>   PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
>   PERL_LICENSE = Artistic or GPL-1.0+
> @@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
>   PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>   PERL_INSTALL_STAGING = YES
>   
> -PERL_CROSS_VERSION = 1.3.6
> +PERL_CROSS_VERSION = 1.3.7
>   # DO NOT refactor with the github helper (the result is not the same)
>   PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
>   PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
