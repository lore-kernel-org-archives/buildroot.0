Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A644C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCBE88194A;
	Mon, 20 Dec 2021 22:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6cWUjzdUhD8Z; Mon, 20 Dec 2021 22:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45CF6818AC;
	Mon, 20 Dec 2021 22:38:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D1531BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C4CE40493
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncJCS7Qvr0FO for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:37:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A353740469
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:37:58 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id x15so44428387edv.1
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=JvwrVB731sTyv/GOb2qP+bo+w1gh1FM/kz5CewIy2M4=;
 b=WgZyTGOl1WXA2T2qWEIqoer6WF5TCeiYqTdgrkQ/izoy+r71f4wt0QQA5s7/mvGvTy
 v8oGKhDpAZilUTPz09HJja7XJSEGSEeUPLcUBtrDt6ghjIZbL5X7/QCnu7LKHu/+IjVS
 DUgA0La2t4QtzpW4n/NAGdEa95GE6hlXmxkOXR30w/VR79eWDvBszGtDrMCC3P1eKTQ/
 I48A1VjaJcm69m/IopEfp1zvz/L042gwBuzFZDkbNrcuDAZzLdHa4tOBvkuAprtvE2k2
 Gyzg38Ivb0phAfHheHIgMxcXSZVenxz8a6b8t0LSsY0LjSE4vLo7i5ooyZF2I31En4oz
 +X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JvwrVB731sTyv/GOb2qP+bo+w1gh1FM/kz5CewIy2M4=;
 b=CA6PtlbNNlkwUYAsk3Xqm+FIlJwoQvDsX7aWK6HFKgJd/H0QgA5ej9V1V/SBFxwaaS
 OIzhnZKCtSkihw7esh0M0bQqH0Bb2ukgh9dkrrdKrDjdh4SmbKlKEgMW7EWNCi62PuDF
 cXvRwz0YlIsAx6CPLOtEwvhx8tyT8t08WIMzV5RybKYI9XoWwDVLQB+S1cVUNxfr5tV8
 PY31D8ONb8MeboDHPhyIb3qp4Ee6yh54c0QjlDWekAHGm3kze4sA2raR4a20pdoHaamg
 he+CDJlPETOdViSquhr3PZbiQ/WMnqWu/cvZpadezdUxMgdZXS+Y3bHxHEOCDUibLX4Y
 0XBg==
X-Gm-Message-State: AOAM530xlLiubkGAxXlO5TI4hPZy0XOWQykiM6JqNKf5KcWnLBLMDG7d
 Iw92Wa/OEOATWdabnZgQ8s3E4w==
X-Google-Smtp-Source: ABdhPJw6T9rIC14U7B/4RrdN8G2muqhvVh1qPLT0btVYrzF27j4Gd3f7TT9OvevaanVvaYLl7FqwAA==
X-Received: by 2002:a17:907:da4:: with SMTP id
 go36mr218761ejc.581.1640039876948; 
 Mon, 20 Dec 2021 14:37:56 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qk9sm5550648ejc.68.2021.12.20.14.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:37:56 -0800 (PST)
Message-ID: <c324c2a4-87ee-643f-3517-301a37ae55b4@mind.be>
Date: Mon, 20 Dec 2021 23:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211219152953.1084462-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211219152953.1084462-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/guile: drop unrecognized option
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



On 19/12/2021 16:29, Fabrice Fontaine wrote:
> Commit d8bee3950aa851620d6a954aebad1f984caa105a forgot to drop
> --with-libltdl-prefix
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/guile/guile.mk | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/package/guile/guile.mk b/package/guile/guile.mk
> index c74325252f..0f245fca76 100644
> --- a/package/guile/guile.mk
> +++ b/package/guile/guile.mk
> @@ -64,7 +64,6 @@ GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/bin/guile \
>   	CFLAGS="$(TARGET_CFLAGS) $(GUILE_CFLAGS)"
>   
>   GUILE_CONF_OPTS += \
> -	--with-libltdl-prefix=$(STAGING_DIR)/usr/lib \
>   	--with-libgmp-prefix=$(STAGING_DIR)/usr/lib \
>   	--with-libunistring-prefix=$(STAGING_DIR)/usr/lib
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
