Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B14C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25C5C61036;
	Tue,  7 Feb 2023 17:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25C5C61036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycMsZ0kHoX67; Tue,  7 Feb 2023 17:58:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7292361021;
	Tue,  7 Feb 2023 17:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7292361021
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EE0D1BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 625454187D
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 625454187D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VXsV406az-7v for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:58:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C79A40201
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C79A40201
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:58:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m14so14353176wrg.13
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:58:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9GDMjwjyd2EeEXcVtBw1571LM1oFgdT6uBflI1pvbm4=;
 b=KmKQqWxMcHio6RL7d/Kq76NbKmqCxxJ3kKIIT2EMgp/DSjD+bw4sVJFOl3UD5M9Fga
 PlhRZiuvoAtfJ1xVAkVZJzJft0h2l0WrQTfqkNXSq2QpAIzJCYGSN9DBusgHEJJ/TbgO
 ttP6JqR2Wr0tc7++P8pUeKGYdnUMxI4F+Aee6Vnz8l5xPpiHSXHrDQk628WvJDPhSWNw
 77FC4uMlO9MJfNh0Z/JQqk0XQ4S7L0BY5MBb1Yh+z5Xl8bo27gdzp4yTTBd7LJYJZ1+L
 fxHzVGJdns03eqV/kWVzmPGjptdUfBjByX2+SO7NJDDocKg2Iel/i8ZDn+W+P/q5N6Us
 aqYA==
X-Gm-Message-State: AO0yUKUFYRpITa0HtQLqnDHqaJpHZVhXlKrrcIB6aqacA2a6iN5bXSRW
 u4bF6UhLmby++DTo1fWSVkC8xA==
X-Google-Smtp-Source: AK7set+Vp5OA3hK45aTtWFOsgJ1fGixqfSreR5mY/hI72D447yn52Q5awTPzhL3J/aM/KK4R0wEcxQ==
X-Received: by 2002:a5d:488b:0:b0:2c3:eeeb:b2f7 with SMTP id
 g11-20020a5d488b000000b002c3eeebb2f7mr3783459wrq.62.1675792683411; 
 Tue, 07 Feb 2023 09:58:03 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d4e10000000b002c3e4bec4dbsm6835846wrt.89.2023.02.07.09.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 09:58:02 -0800 (PST)
Message-ID: <06c65863-83a5-6002-5a06-56c41611699d@mind.be>
Date: Tue, 7 Feb 2023 18:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20230115114840.9027-1-nolange79@gmail.com>
 <20230115114840.9027-3-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230115114840.9027-3-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9GDMjwjyd2EeEXcVtBw1571LM1oFgdT6uBflI1pvbm4=;
 b=bElU/R3Ab4al5xoc7/XoOLpjxWSxW6tD90sJ7fJg6lNmIoPfdq2rTM4IAcJAhLgMq9
 0swNCiMUf6nR+BxJdKuCwWnfkwp7B9nhAZKzItC2QBW5brX9fNZTjdg0WpoyyyhO1HYc
 u3BlgJ8VF/moym/6DnumBQh5c+LOUwSaDOeas+NcGH95NfGtmGk/ue7bB7GHMo4nSh7w
 WqqbL9SfN3orvKckIsWqCyZjLBD/UyoyW9XxhxmsFB60wYsWs9cgpIHMOAWiiEPpwN85
 sYUAb+DXGUDs+oCIVLflv0N3BnIaATUgQOepm5rwNRMcmQ6gIjynHdYk302TMYeLMsK8
 VGEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bElU/R3A
Subject: Re: [Buildroot] [PATCH v8 3/4] package/systemd: support dnssec if
 openssl is available
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/01/2023 12:48, Norbert Lange wrote:
> Set -Ddefault-dnssec=allow-downgrade if openssl is available as both
> openssl and gcrypt are now supported for dnssec.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> Reviewed-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks. (Still not pushed - systemd runtime tests are 
failing locally, I'm trying to see if this was already the case before the 
version bump.)

  Regards,
  Arnout

> 
> ---
> v6->v7:
> 
> *   split off as its own patch
> *   seems that the change was done at v250 or earlier
> ---
>   package/systemd/systemd.mk | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index f49d34d32f..297cc400ee 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -246,9 +246,9 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>   SYSTEMD_DEPENDENCIES += libgcrypt
> -SYSTEMD_CONF_OPTS += -Ddefault-dnssec=allow-downgrade -Dgcrypt=true
> +SYSTEMD_CONF_OPTS += -Dgcrypt=true
>   else
> -SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no -Dgcrypt=false
> +SYSTEMD_CONF_OPTS += -Dgcrypt=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_P11_KIT),y)
> @@ -318,6 +318,12 @@ else
>   SYSTEMD_CONF_OPTS += -Dselinux=false
>   endif
>   
> +ifneq ($(BR2_PACKAGE_LIBGCRYPT)$(BR2_PACKAGE_LIBOPENSSL),)
> +SYSTEMD_CONF_OPTS += -Ddefault-dnssec=allow-downgrade
> +else
> +SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no
> +endif
> +
>   ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
>   SYSTEMD_CONF_OPTS += -Dhwdb=true
>   define SYSTEMD_BUILD_HWDB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
