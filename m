Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BA6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69344400C8;
	Sat, 11 Dec 2021 20:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0NyoesrMRN1; Sat, 11 Dec 2021 20:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58AC140173;
	Sat, 11 Dec 2021 20:43:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EABF1BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B1E460A86
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ErtwK-xrzqim for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:43:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6DFD607E4
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:43:52 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w1so40037777edc.6
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 12:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=wCa3ea9a81/c308ZUKQrgLNF/fa9+REGm/6MwCVjh0o=;
 b=DnAGR1frvvsNmEPGKFy+WLijFrLrISu4R+URKg4LIxPw4RsYpDKhjyA2O6eeESBocg
 UY30voV6iwxoMEllv6Ptgv9tbROOcbLby1QUYwXlSV/oeJh5VqOtZMJLzSZUM/6Wh6bs
 PpMqx78JqxKMnu4Plz5LwfSOtAiFLpCC25AYLe7t53+8sJYPiK1JbCkAMaMY5QY4wkAX
 Y30xin2hTMbZDGvx/zvsr/JAhzS8HgbxfKQz1NHzm2o5rW9TO+5JZhnNiMFU0JPZbyqn
 nJzwDrEgwkVU+KjYYs5SjM1d9POLyuY98Szgd2hVKfTh6MX4kOGadfoXOVklPHk2VdR9
 bCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wCa3ea9a81/c308ZUKQrgLNF/fa9+REGm/6MwCVjh0o=;
 b=ppbVEXIEVq3Ux6ObSFYGUmgI16Uqb9JjWoAFRbqXviY5IRayCzIjh/wov9YmjxY1Kg
 9JXcpcx4gUX7W2mM4bUQzfrlic08859xy2jf0nmneDqoe8/3W2NyErkAJjqXn7Vbb8Ai
 8zqi8O0+ZxqFqTeVu/+cuvvbNBVygfY4CqnmcJ0pTOEYmKfWc5qxS26eDOJksVrSm22b
 1RKS1SqsgOqicLqblphMRtp07MujGhAQVVcaGzRYYV806veQwgYbijqL7Vk7CJEVoHCP
 xMTurrBP539zsrXkieUQNZpABBseBQo+ZN3WKBy7T70Q+zVpTmb8pCNjN+R/6+XvGN7B
 Zy8g==
X-Gm-Message-State: AOAM5303DcbKDtWC6CZNfFCXI73Jizk6orHludGVSkUhR3FquhDJwk0g
 Fje8DUwOPlTpSU2yjid214eeDt+oixGQeRLxMzg=
X-Google-Smtp-Source: ABdhPJwSZjT/Y00sbY9JjmH1vWHvLvAfE2Sr4J+adjj5XcwUCd1kCisKUyOyxjFmkj1KQ4wInQ+ZZQ==
X-Received: by 2002:a05:6402:2c4:: with SMTP id
 b4mr47787088edx.265.1639255430807; 
 Sat, 11 Dec 2021 12:43:50 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p13sm3622233eds.38.2021.12.11.12.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 12:43:50 -0800 (PST)
Message-ID: <45485c69-8aa2-6a02-9e5b-877a5b47d740@mind.be>
Date: Sat, 11 Dec 2021 21:43:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Alexander Egorenkov <egorenar@linux.ibm.com>, buildroot@buildroot.org
References: <20211122084809.475864-1-egorenar@linux.ibm.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211122084809.475864-1-egorenar@linux.ibm.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/s390-tools: bump to version
 2.19.0
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



On 22/11/2021 09:48, Alexander Egorenkov wrote:
> Fixes:
> - https://release-monitoring.org/project/10714/
> 
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/s390-tools/s390-tools.hash | 2 +-
>   package/s390-tools/s390-tools.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
> index eafe7f4d7acf..13c68fbf52f4 100644
> --- a/package/s390-tools/s390-tools.hash
> +++ b/package/s390-tools/s390-tools.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  a1e2118152a85201984d2045033d49f7fd92e8cd0ea80ae0a5ebeb0d258cdedb  s390-tools-2.18.0.tar.gz
> +sha256  17dc163e6a1e940f895c64955c130058600e1df834e1ab134410be7266ef724a  s390-tools-2.19.0.tar.gz
>   sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
> diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
> index 6b4351ce83ed..328986bcb37c 100644
> --- a/package/s390-tools/s390-tools.mk
> +++ b/package/s390-tools/s390-tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -S390_TOOLS_VERSION = 2.18.0
> +S390_TOOLS_VERSION = 2.19.0
>   S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
>   S390_TOOLS_LICENSE = MIT
>   S390_TOOLS_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
