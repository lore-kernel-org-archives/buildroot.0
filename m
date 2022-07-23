Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CF1C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 08:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90923617B9;
	Sat, 23 Jul 2022 08:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90923617B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qxPhvrgkxqoH; Sat, 23 Jul 2022 08:37:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 625CD617B6;
	Sat, 23 Jul 2022 08:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 625CD617B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBCDE1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92DB8617B6
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92DB8617B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYE1TKw-yh_9 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 08:37:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87590610DE
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87590610DE
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:37:35 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u5so9326598wrm.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 01:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wYWfzoF3KyClq/MwSfVJ6keunsbBWL6yC0MRQ0qaJ1U=;
 b=zW8aN1V5wQ0awQmjNm1BcmEYtuIErjP1M7XMvnMaibTR7JYU/lwVyE15Qh4LpE6/EA
 eH9+xoLDhNKl8V2HmvdAmpkBEdEgpbJwiLyP2khosR0DZdUebYf8M6zeV935sFbYsq12
 PTLqZ/Jk2AW8bnLb7OsrQGi5dYGCLzJFR04LZuyjzA9+F/BwzwGphPgzkekK5c30BbSJ
 CAhiN9NBjhHLw1ZBNanu/K62hJGayqT6hcInRds103BPAA9akexz7Zbnh8DXnX95EBKI
 7AdoQcBvGMRudTSQwXD2GIhc7nmL5h7geaiDNZlYyTCJfnVMt5gwAHpD2bCDFIiV6X9N
 yXnQ==
X-Gm-Message-State: AJIora9eZ0b8tWthAAob8qXYlXSn1VFRqZuAkFHj8/MGVQYOo1p7jCNJ
 RsffLmCoNwu5eRsnkZkyTqDIww==
X-Google-Smtp-Source: AGRyM1to3AC0H3P14FqTff4Xdwt0nRoNJ0VE+bYWUtqTdaGRKIbfgg0ayDr3BSypMvzGePIhnjKP/g==
X-Received: by 2002:a5d:64a4:0:b0:21d:be80:de06 with SMTP id
 m4-20020a5d64a4000000b0021dbe80de06mr2070247wrp.107.1658565453464; 
 Sat, 23 Jul 2022 01:37:33 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a05600c4e4600b003a3188bef63sm7832250wmq.11.2022.07.23.01.37.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 01:37:33 -0700 (PDT)
Message-ID: <573fb332-2652-87f9-492d-17428bd1ef27@mind.be>
Date: Sat, 23 Jul 2022 10:37:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220721203658.2311036-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220721203658.2311036-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=wYWfzoF3KyClq/MwSfVJ6keunsbBWL6yC0MRQ0qaJ1U=;
 b=eFzBOMteXbl9r9bY/G5v7Fngif29dC4BHQpnKWce51ux+hrlqpGQP2mD0/Cm/Eek+4
 UPpoBZ6ZL3d5gh6b6jQA647cINe6cd/ZW3U0RZbY6E8nZU5IImPPBPcPjKw8oCXZifaE
 2eYWIQVKQ+Q9IA5UA+PboHo/ObF+QDZAONAOjbpny0pvu/3aBPDlKwCybOm9PMNilkMm
 Yq0sfPx345ryh38AIsDmpB0r9vnLReHu1ecW24lP/YIAwxgI5LPMj6KdUQEhqMAuX5u5
 FRnzXdlABSLLFwR9JHWbdQCsvp8NRQRg+eOzktqERQ6ozVMy5xr5KYfSDPY8dyLlxElZ
 gQWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eFzBOMte
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.56
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



On 21/07/2022 22:36, James Hilliard wrote:
> Disable new unsupported avb feature.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pipewire/pipewire.hash | 2 +-
>   package/pipewire/pipewire.mk   | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
> index a525c1b212..905608c3bf 100644
> --- a/package/pipewire/pipewire.hash
> +++ b/package/pipewire/pipewire.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  7b47d3a0c3ff2abf9551be6b35cdb4baafbd328290b05dbba2075a6d8cf14b89  pipewire-0.3.54.tar.bz2
> +sha256  bb4662ee4f4036586905268354329228d763fc08d99ca8f0e8ec7e002e46b88d  pipewire-0.3.56.tar.bz2
>   sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
>   sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index bdf99e5789..ecfb6c0ae2 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PIPEWIRE_VERSION = 0.3.54
> +PIPEWIRE_VERSION = 0.3.56
>   PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
>   PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
>   PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
> @@ -31,6 +31,7 @@ PIPEWIRE_CONF_OPTS += \
>   	-Dvolume=enabled \
>   	-Dsession-managers=[] \
>   	-Dlegacy-rtkit=false \
> +	-Davb=disabled \
>   	-Dlibcanberra=disabled
>   
>   ifeq ($(BR2_PACKAGE_DBUS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
