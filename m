Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D9DC43334
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C5D560E96;
	Mon, 13 Jun 2022 20:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rq7aahW_SQ_3; Mon, 13 Jun 2022 20:23:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3944E60E84;
	Mon, 13 Jun 2022 20:23:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEB271BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC54182D07
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9EDgaqTiFOHJ for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:23:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D94F182CFD
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:23:05 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id o10so8776806edi.1
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 13:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cRQVjo7EXoH7PNgXNURD8q0FSe5xtCC/Mk/St29Baa4=;
 b=VuOsUdeQvM9/iZDPJUD8Zuq5mLtEWXwKzlMLq+fYmH6fuYfmiIw0zAURHforuSRGqv
 wlJRUnduhRiTFAp8BGoNbSRNudXpGt9Byoocx+wB7q2iYVgjir9YvvlJFzhTun+juAHg
 62hKZnElqbtkPuwh0Ka9oGRg9gyyPDYhCSnT7Xtex6vt5zt4fV1GjzBedv69pYTGdxQ6
 G8yB7OSLIKDoZZA79yrrGOx8F4MhDkkL15kOJzgNCkSuMAiVlDEePfw1VlZvC78khOqD
 vw4DJj8zh45Hj8GFNq+6o1X1nVKWvbClTWsC2+xogC05kw8PF8Sj4K9Yj1FwwcmRge8O
 9Zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cRQVjo7EXoH7PNgXNURD8q0FSe5xtCC/Mk/St29Baa4=;
 b=rN7y9l+lo+nZs8FVa9SAXcizGBOMi+LYeyub1dCCXQtyGTw+DwdbJpT2689vIHW0J+
 xUTew8nKudgDesNP+5abU7WjKpDz4CUDXh1eAcev6x3MYDfzwE2yGvlccsDq2Rt+gkCh
 mLrlfngrcBC3N5wG/e6VfckVcthuv7eB9XunWjbC8/fa3rL4N1+r0Evt9+/6JDyHQMiK
 A1iHkOScpVG0m6UWYcpDk3FFOeQWW1zra2hVg6TW99kuW0YRWUTe9o87Clwh/Dlk0mdZ
 xwlOWlVP2frHN5ovewVggHcgWLI0vq1BB47PcSTsJRbXLYr9uXbx6VYqwlcZqhWX/YyA
 lAlA==
X-Gm-Message-State: AJIora+mmzNp0SwpbarRKvYYHmzbEbY8V6yzOLwZwnGq6LnUiWFvORFe
 QCancWYJAXMx8UvH69Udbpzpeg==
X-Google-Smtp-Source: ABdhPJwmLmsHaElZKdWhJA6uj+7JUUP3e99yAUiUtIQOYfcL6OcpBR0Vavx8pf6PbCQS6VnwYfnuuQ==
X-Received: by 2002:a05:6402:35c9:b0:431:3b5f:ecc1 with SMTP id
 z9-20020a05640235c900b004313b5fecc1mr1690533edc.349.1655151784114; 
 Mon, 13 Jun 2022 13:23:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a170906139600b006fec3b2e4f3sm4173910ejc.205.2022.06.13.13.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 13:23:03 -0700 (PDT)
Message-ID: <58ef80d0-17b6-109f-4395-b41277ee4701@mind.be>
Date: Mon, 13 Jun 2022 22:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220609211454.2939854-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220609211454.2939854-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: add
 host-pkgconf dependency
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
Cc: Marcin Bis <marcin@bis.org.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/06/2022 23:14, Fabrice Fontaine wrote:
> Add host-pkgconf dependency to fix the following build failure (e.g. with
> BR2_PER_PACKAGE_DIRECTORIES):
> 
> configure: error: OpenSSL not found
> 
> As a side-effect, NSS_{CFLAGS,LIBS} can be dropped
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ea16957e8f048b713f5d2713aa5f0c157b62f574
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.


> ---
>   package/ecryptfs-utils/ecryptfs-utils.mk | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
> index f087e81a42..737c5b0ebb 100644
> --- a/package/ecryptfs-utils/ecryptfs-utils.mk
> +++ b/package/ecryptfs-utils/ecryptfs-utils.mk
> @@ -11,14 +11,10 @@ ECRYPTFS_UTILS_LICENSE = GPL-2.0+
>   ECRYPTFS_UTILS_LICENSE_FILES = COPYING
>   ECRYPTFS_UTILS_CPE_ID_VENDOR = ecryptfs
>   
> -ECRYPTFS_UTILS_DEPENDENCIES = keyutils libnss host-intltool
> +ECRYPTFS_UTILS_DEPENDENCIES = host-pkgconf keyutils libnss host-intltool

  In the future, it would be nice to take the opportunity to change it to one 
per line and alphabetical.

  Regards,
  Arnout

>   ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap
>   
> -#Needed for build system to find pk11func.h and libnss3.so
> -ECRYPTFS_UTILS_CONF_ENV = \
> -	ac_cv_path_POD2MAN=true \
> -	NSS_CFLAGS="-I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr" \
> -	NSS_LIBS="-lnss3"
> +ECRYPTFS_UTILS_CONF_ENV = ac_cv_path_POD2MAN=true
>   
>   ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>   ECRYPTFS_UTILS_CONF_OPTS += --enable-pam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
