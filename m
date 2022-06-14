Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE565C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5171340A17;
	Tue, 14 Jun 2022 18:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KV451-p758YZ; Tue, 14 Jun 2022 18:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62DC040A67;
	Tue, 14 Jun 2022 18:44:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA2651BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C771760E81
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYKCPEz8PtS8 for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:44:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E19B260E70
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:44:27 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u12so18863866eja.8
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=VXndNiWKMetPzppVJCwHAPqu7DrNJy00pn7XfqWwIO4=;
 b=Dk8RQfVeAUPT+e1WyiceSIPa5bhBtJqUaDmnkG+Ux+L1KJnjoAbgx6/gP3TuxIekNl
 su20d6ZPT0CDFao0xht5fuvb5ox/+761zmgJ3aAMWjKFGOPilj+EdHr7M+1cboj4704i
 7AQQ6+a+fqaL5Zs/rI1hm6ncmjhwVRMX4FscW537lY80S7w3pdKTwkVIdiIXVZ2VFikO
 WS43496Owbk76rzJbSYV02hqYrXD4mlACelhjPb5OQlf8lFZi2XkdkObsLg4s1f0wfsp
 WGzIPu2HGp2Tf9gWy04PJb7vEjQQOPYU7ddaFaBeOIFnQ6gEAd+K8qXIU5AbmYmSPfn3
 FNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VXndNiWKMetPzppVJCwHAPqu7DrNJy00pn7XfqWwIO4=;
 b=E7y4pzDJDlQwgYV/Lw3mme3zf1XPOAKKyA5U2L5WtWu/rCXgTR1gwO6OboXT81xoU5
 jPZi5hTpsngbtrNHbsU4oH31j0MeJG84WwBg9zZLXOaYxJQvZ5tPY2yARv2juMSbnlli
 mntsR+8EvetrBNBElF+tkvd9AgAXd6yM+5f3Urfen4uOjV59xgQclgUpRRrFhZT7fhn4
 fYqsuSQ7MyEQURNytxeofPEpO8obuwLl8CuwW+d4FfpBSlKSDhi2CbP1po+o1cNmlpIW
 iPKaW7NAOSyhZNkEwP3XU1rY2wSx+kcmBIR0WmBbLIEirrlWqdIawo+TppYQfRNEc7d2
 0MFA==
X-Gm-Message-State: AOAM531jwTpi3T6lydtDaY1XVEv5BPHnKhimUxVmBqSVh1cTsrbU9F++
 s2C1L79151dGxP2EE95BD7BjNw==
X-Google-Smtp-Source: ABdhPJymHQSHAFSKs6dQxsRtBShwXdD9CdFDJoeas2imyNH9rd+eemTL/oFqMWGMomHoxAEdZpRB3A==
X-Received: by 2002:a17:907:8692:b0:711:d49f:994d with SMTP id
 qa18-20020a170907869200b00711d49f994dmr5443430ejc.578.1655232266093; 
 Tue, 14 Jun 2022 11:44:26 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 p9-20020a170906784900b006feb8cebbbfsm5367982ejm.6.2022.06.14.11.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 11:44:25 -0700 (PDT)
Message-ID: <9475bac0-4bff-cebe-de63-a51d75761666@mind.be>
Date: Tue, 14 Jun 2022 20:44:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220611121614.1172869-1-bernd.kuhls@t-online.de>
 <20220611121614.1172869-3-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220611121614.1172869-3-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 3/3] package/php: security bump version to
 8.0.20
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



On 11/06/2022 14:16, Bernd Kuhls wrote:
> Changelog: https://www.php.net/ChangeLog-8.php#8.0.20
> 
> Fixes CVE-2022-31625 and CVE-2022-31626.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/php/php.hash | 2 +-
>   package/php/php.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index e0aca101b4..2e9aa6880b 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>   # From https://www.php.net/downloads.php
> -sha256  ba62219c4b0486cbb2a04f0796749a46b0ee1f5a142ed454212b4e2460cb0fab  php-8.0.19.tar.xz
> +sha256  973fec765336ee01f47536a5db1c2eee98df9d34a41522b7b6c760159bf0a77b  php-8.0.20.tar.xz
>   
>   # License file
>   sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 5053f34b85..f649a9bb8b 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PHP_VERSION = 8.0.19
> +PHP_VERSION = 8.0.20
>   PHP_SITE = https://www.php.net/distributions
>   PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>   PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
