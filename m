Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3142C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92DC60B6A;
	Sat, 30 Apr 2022 18:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKLVFDvVz0Sg; Sat, 30 Apr 2022 18:53:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B77D060B58;
	Sat, 30 Apr 2022 18:53:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52F3A1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40B3E81D70
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-R8pF9ELDKD for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:53:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29CA38276B
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:53:47 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z99so12488455ede.5
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=T1e/BBqqVYnim492h0Jgi5Cf1whqEcTrs0Xg0h6gjn0=;
 b=H/WkAa1aAAK68NTjkp4r4fdU9jb+SCsCu/j9MYAV/upWAtZ9s+T24XQfTWJ+QMQ3a2
 9HQHwvjuQkQOGr/OlO8kF0D52RkgLh+f9yn8YHSX2EZRD6WIt20WwJbFPXNnb8uMvAA7
 tT0hKUDtSaGd+2lB74VinNbIWbKVmq7q8S3zohXss3ljlEVjhDqWgAruEIjGF8i1oomH
 HqrFU83FHv2kwI/Zno0ncBHLkbRT122YKY7aeEHW1jdqN9Xei17PhyI51CfV9JdBhchg
 fJjbLEeB4qKc6HIY3iIB+w1qmHS9UCuM8M2cjPxoXbY9ZgBEVQeWPhJ3mOtzkvu/Bj4Q
 FnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=T1e/BBqqVYnim492h0Jgi5Cf1whqEcTrs0Xg0h6gjn0=;
 b=KePIvHSJgfEA6yTs7NfnwkO8Vgu+qvy8H64YNCzpUoI4oGHTRKqXameoXQeIhteT41
 74Zmoe8M/tImmb+t8/zgz9riYveCzTaJ6xRUbZrEVZPTKQkzbZppei/EOm/YzFCxFAU2
 a1l2JwOmWj+e8x/8xSkb1n7xHni45Z7qJNTnyMZJCza41wxuqwL4c4AXDCqUX4IkMELC
 lBjiSlf0lOs0W99bXBkD0RrgwgjURhaYtHtrD+n67gFQ+ITtumJrMBofQvbR/aYMZy1i
 xUZUCcTsb4FadqGps7FuVXlYqFqk0jgJTz3txl94jDj3eRPimjhQpRW5/99fd5XlXqm9
 sVxw==
X-Gm-Message-State: AOAM5305iL8kdSZlML7wJGCAq/5QG2vPLn0mFTYuAnTw0NDgUPaxA4FX
 INrPvzvJ825KWwfOuja6KLw34g==
X-Google-Smtp-Source: ABdhPJz/sccGU2GWObMKf/f9BA5SOUks4SDGgkSwqyGMpOnlN6brrOy4kd9bcq8mmqf2s+xwjEYpiQ==
X-Received: by 2002:a05:6402:335:b0:425:e3e0:5a90 with SMTP id
 q21-20020a056402033500b00425e3e05a90mr5426111edw.14.1651344825371; 
 Sat, 30 Apr 2022 11:53:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a056402105300b0042617ba6384sm4401556edu.14.2022.04.30.11.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:53:44 -0700 (PDT)
Message-ID: <b068acf0-a0ae-24e6-58e7-6e6b70d4fa78@mind.be>
Date: Sat, 30 Apr 2022 20:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
References: <20220430114406.545127-1-fido_max@inbox.ru>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220430114406.545127-1-fido_max@inbox.ru>
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.2.1
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



On 30/04/2022 13:44, Maxim Kochetkov wrote:
> Release-notes: https://git.osgeo.org/gitea/postgis/postgis/src/tag/3.2.1/NEWS
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/postgis/postgis.hash | 2 +-
>   package/postgis/postgis.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
> index 12ca18f84f..018e6523f3 100644
> --- a/package/postgis/postgis.hash
> +++ b/package/postgis/postgis.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  7ab9e154c6947c0cffb8fa12d70806add9aa060e62b6c86a2e206f9d4b507cfd  postgis-3.2.0.tar.gz
> +sha256  fbab68dde6ca3934b24ba08c8ab0cff2594f57f93deab41a15c82ae1bb69893e  postgis-3.2.1.tar.gz
>   sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
> diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
> index d9cda64730..b77071d03b 100644
> --- a/package/postgis/postgis.mk
> +++ b/package/postgis/postgis.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -POSTGIS_VERSION = 3.2.0
> +POSTGIS_VERSION = 3.2.1
>   POSTGIS_SITE = https://download.osgeo.org/postgis/source
>   # parallel build issues
>   POSTGIS_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
