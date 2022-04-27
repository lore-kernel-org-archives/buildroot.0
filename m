Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D392C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 18:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CE9940992;
	Wed, 27 Apr 2022 18:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0YSMMAonHQU; Wed, 27 Apr 2022 18:53:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46F0A40528;
	Wed, 27 Apr 2022 18:52:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D97141BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5DE341879
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3y87oxOKJ7C for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:52:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7267E41684
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:52:55 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y21so3018276edo.2
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 11:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=L0tiAEuk36pDEro2vXc8EPhN2H74EIpZhSufW8hUoY8=;
 b=ayPlGGnZ23ghsfZ2WL3bIKIzTanCMyBdW41yBoWxcDyBWDqOyg6Q4AnWHhwKYJOeM+
 D04UnlTM5GhlirQFbxan7oz8YonxUCdRjEugyy1x+4wZ0LLFM0W2/ss/E87T/GFzsWnG
 vRT+BRo/fZ7TOh8uGCkfWAhBbcUVyt2/DA79XFuQo0+jWKpH4Lh9QTZs2gcizGUEc6k1
 s5dMWGGmLfOU9EAx2uHEWtTiwG7XSX4xOyGkzlq53mIvlQZfBLUqCEaOczG3jy7IjEgK
 zlFBZhjVAmdD9qDqsPUg2l5MTXPR6Ht21WloXUg5aakYYtzI1HkStagTEncYtNda9smM
 16oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=L0tiAEuk36pDEro2vXc8EPhN2H74EIpZhSufW8hUoY8=;
 b=0ZzJLZDaDpsEjIUd1BQOhHFEQgTRyHLn8TF9wgCphhbONBLJRDoi9xZtQqUHKeMS4x
 /pjFzgCD/TeEQNtU+lW0sEoNO6zFMRrDuXn5P2/iY0fV7nappy+ucJ0WxIMZWcgU8uL0
 iPflJpktM2kaaMyicZQL/iIM1ZlPKPHq4BBYLq0UzEdqoEqJtYKJuCATapuT2h0gSy7c
 JHXjv7XkUF2WZRMXgvdZ9grMf4BJ9RKQFScxVRxP7nPCD0FGefDJvfpNcx32gVr3z5n3
 8Wmut0NC5y8dtx2S4tSusd0KGMe3lgNq64zJgL9RQUN6ku39HGQHH5tQSFiTmNbVSTF1
 bpAA==
X-Gm-Message-State: AOAM533OGDWTm24zEhynTguaYdhW+RlpViCdwYZbP8XDgYQKGQmiWwTH
 bncg1sm4HOnjxGwQyu0Li3HAaXlAfLz9mw==
X-Google-Smtp-Source: ABdhPJwseNAXNM4rob34kKib766WU9cODvP/tLdUH8Gw5XXEbMAzMydZiBOo6wSpHi+RYcdlxS4n4A==
X-Received: by 2002:a05:6402:1450:b0:425:e43f:7ccd with SMTP id
 d16-20020a056402145000b00425e43f7ccdmr19157571edx.299.1651085573571; 
 Wed, 27 Apr 2022 11:52:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a1709066a8500b006f3bdf3a2f4sm2436477ejr.105.2022.04.27.11.52.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 11:52:53 -0700 (PDT)
Message-ID: <0c74e8da-aa22-257d-9b75-cfa69abd9637@mind.be>
Date: Wed, 27 Apr 2022 20:52:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bartosz Bilas <b.bilas@grinn-global.com>, buildroot@buildroot.org
References: <20220425190455.543451-1-b.bilas@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220425190455.543451-1-b.bilas@grinn-global.com>
Subject: Re: [Buildroot] [PATCH] package/python-esptool: bump version to 3.3
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



On 25/04/2022 21:04, Bartosz Bilas wrote:
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

  Applied to master, thanks.

> ---
>   package/python-esptool/python-esptool.hash | 4 ++--
>   package/python-esptool/python-esptool.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
> index a916f9a09a..3ca5b211ee 100644
> --- a/package/python-esptool/python-esptool.hash
> +++ b/package/python-esptool/python-esptool.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/esptool/json
> -md5	84aa6ffb4723b1f59a2c83244a9ad918  esptool-3.2.tar.gz
> -sha256	9638ff11c68e621e08e7c3335d4fd9d70b2ddcf7caae778073cd8cc27be1216f  esptool-3.2.tar.gz
> +md5	ac499eaa99df9b536a98a6f99644f8f6  esptool-3.3.tar.gz
> +sha256	39b92e1848e352183188f149f3e876cde4b8a1c095551e7e545a28e5c11eea13  esptool-3.3.tar.gz

  I also updated the hash file to use two spaces instead of tabs (check-package).

  Regards,
  Arnout

>   # Locally computed sha256 checksums
>   sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
> index 77291e252b..28b5075e72 100644
> --- a/package/python-esptool/python-esptool.mk
> +++ b/package/python-esptool/python-esptool.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_ESPTOOL_VERSION = 3.2
> +PYTHON_ESPTOOL_VERSION = 3.3
>   PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
> -PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/60/a4/33907f5b735f9179061bd6b6cae7123d4a2d0cdf46c879fa55e66edef24f
> +PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/63/85/1a7f65d3f89c112c721c6ec013ecd948112df17640e453ddeb1921b05aab
>   PYTHON_ESPTOOL_SETUP_TYPE = setuptools
>   PYTHON_ESPTOOL_LICENSE = GPL-2.0+
>   PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
