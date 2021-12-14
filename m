Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BB0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E941281427;
	Tue, 14 Dec 2021 19:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgjCfAuef4ZO; Tue, 14 Dec 2021 19:40:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CC898142A;
	Tue, 14 Dec 2021 19:40:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF3491BF94B
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD0DF60087
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:40:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YThVILSSvWuU for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:40:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AAE760008
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:40:50 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z5so67453228edd.3
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 11:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=odrFtZQ/xSVPNkQO4Cla2Svvh/jTSbP2UjDzCHkS3fU=;
 b=DCdYHsFwrQAvB6AORPRsnvk0XpBi5e6Hucx8zjOMN9pA6uV/PoFTAiDagcogMqIf23
 7MQqfy4lAzghwYuyaIZV+CgmlkQC2Kc6BkuEbXXrAQRE37ahbpbWm/bn1QBWox06uXiE
 KIc+kGztdq3u4ssYarpLT4HVn9GGleII/V65PF5fGTdsIiyOKbfNu9cxlzRmNhLHJ2Sm
 0HxsYmTv5WK9MaFULS9gPMsSoPBK6Xu/PHOoQsSZOixbqxFf5wsExbEuk5iKJNRQIcfk
 oTTTYTRIJW/AAo0rc6Ehq6fmO6cWU5bPWl3vPkjV9Wa6Th2NBETBJSejb49yQn79irJv
 gg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=odrFtZQ/xSVPNkQO4Cla2Svvh/jTSbP2UjDzCHkS3fU=;
 b=O1V7nr+FQ7NK5kVsKEiXAH55GpqfusHk1sxFC9cZK4RhadHdhf4e45ZM/bgrCkUbPc
 DF1X89saRcnB0/qiLU25yzLCpIjskH++9QxIlct2kIumJ8M0LBK3h/uLFQERSpl//QmF
 tHCS8IGMjTdUNG4961YSYqR9A08le7MUjJxzqgiDidp9Yf4bOkvNyXFRiqqy32Z4QEvD
 udFa7Uo3NyxAHH71Bpyi4q2olnQ/eD24ZfvjSOGmVyuTf1NrCyO2TIyzNE0jC7mElXYE
 i2lw51Kd1o/QvEZpWo3zTrLT3le49Mmu397hVRt6EnXvJpyAWHX3Diy6Xv9PXeaSEjoh
 U9Og==
X-Gm-Message-State: AOAM530PgyLLiedHPH6WnrX3FfjwrYNU4DA1YAApAjvjp65OpN0OM40j
 ymkxvP1yySPYJ8FxRJGUg6I5Fw==
X-Google-Smtp-Source: ABdhPJyle/aM7pXb55OYDV0F52FUITlAhiyd2FGhGK3P90DF5UpzclgG4UbVzdIk0JyVUZqcby+fbQ==
X-Received: by 2002:a17:906:c110:: with SMTP id
 do16mr7984700ejc.584.1639510848280; 
 Tue, 14 Dec 2021 11:40:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a17sm289226edx.14.2021.12.14.11.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 11:40:47 -0800 (PST)
Message-ID: <605abb6e-082d-7c2e-12ba-41d4c067e08a@mind.be>
Date: Tue, 14 Dec 2021 20:40:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211212174922.668065-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212174922.668065-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mutt: bump to version 2.1.4
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



On 12/12/2021 18:49, Fabrice Fontaine wrote:
> Mutt 2.1.4 was released on December 11, 2021. This is a bug-fix release,
> fixing a performance issue when used with DavMail.
> 
> Mutt 2.1.3 was released on September 10, 2021. This is a bug-fix
> release, fixing some of the fixes in the last release. IMAP and
> QRESYNC users are advised to upgrade.
> 
> Mutt 2.1.2 was released on August 24, 2021. This is an important bug-fix
> release, fixing a potential data-loss IMAP bug, a couple QRESYNC bugs,
> and a few other issues. IMAP users are strongly advised to upgrade.
> 
> http://www.mutt.org
> https://gitlab.com/muttmua/mutt/-/blob/mutt-2-1-4-rel/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mutt/mutt.hash | 2 +-
>   package/mutt/mutt.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
> index 1b58c50065..dceae57b65 100644
> --- a/package/mutt/mutt.hash
> +++ b/package/mutt/mutt.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  4ae6d60f7f19854c375cc1c27b5768b71e9f450c2adc10c22e45de8a27de524a  mutt-2.1.1.tar.gz
> +sha256  3361b682ea23df88961fa9835196698aefd2ebf0aba494599b29d1c4b1b4db79  mutt-2.1.4.tar.gz
>   sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
> diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
> index 66616f032c..44d7864eb6 100644
> --- a/package/mutt/mutt.mk
> +++ b/package/mutt/mutt.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MUTT_VERSION = 2.1.1
> +MUTT_VERSION = 2.1.4
>   MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
>   MUTT_LICENSE = GPL-2.0+
>   MUTT_LICENSE_FILES = GPL
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
