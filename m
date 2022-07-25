Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA472C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6565241A52;
	Mon, 25 Jul 2022 22:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6565241A52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIyMIWcbVzxD; Mon, 25 Jul 2022 22:26:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EFF041A4F;
	Mon, 25 Jul 2022 22:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EFF041A4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E6C71BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC99483DF1
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC99483DF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCZ8UkT3H4iY for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:26:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 214A283DB7
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 214A283DB7
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:26:43 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 u14-20020a05600c00ce00b003a323062569so7155551wmm.4
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1BzxSm6bQBytK7yuj+MVGhyjfvJoX3EURY+Hru/rJRE=;
 b=T6TwbIUHqkQVYyEbbMW0vY7NrgoagWJ3eTAP6aq9kWAIqEbk7c18S9ixFXJg+zLAH1
 snWznF7cA+8B2O+VpEytQLwpwUujIfEpQx24G8oP29ekYj8RN29kCmYe5kkW2U87Uloq
 7tgjRfnaf97Np/LNA8f+GBj9tPEUv+7zpyMmD41M+MmtWMjxsyvK0f42AjaJUepVSODd
 Bq0AgtBoAmuMRVDPuzOv1CConT4LzNIsx1CrGSrtbI/m1sZMyi38gYvEysDiN1eO9g0Y
 bVFSmZ9/HeEx/oZjNiAEGujn36TuMF0MVv0VDfzVmoGGWxIuZCWeuG3Ni9IJC7ligh5a
 Hdfw==
X-Gm-Message-State: AJIora84EAYFDNtun6qV661++i5SHvoS9PVtndo7FhOMvFHP3oFKWqMB
 22qrql3Tbz3j9cT792ePqWSsbQ==
X-Google-Smtp-Source: AGRyM1vz58U52zsA1CTfAhSaHGgyeTUCH0OudOkkTwtC5s7nv98z3DLD7OGHfbSIQYD8Clng0FsINQ==
X-Received: by 2002:a1c:44c3:0:b0:3a3:64c3:71fc with SMTP id
 r186-20020a1c44c3000000b003a364c371fcmr3497447wma.185.1658788001285; 
 Mon, 25 Jul 2022 15:26:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c304b00b003a320b6d5eesm18211948wmh.15.2022.07.25.15.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 15:26:40 -0700 (PDT)
Message-ID: <1e9abdbd-4b1e-dac4-8416-1f9699e5a1f5@mind.be>
Date: Tue, 26 Jul 2022 00:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220725191125.16277-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725191125.16277-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1BzxSm6bQBytK7yuj+MVGhyjfvJoX3EURY+Hru/rJRE=;
 b=L9gQSJEPfmWQmUekuHAmsYXcF7fzZPySYtX6wEdfvrFLMfbxivQ1m7EjRpdLO2ZmAU
 afPGpJow2qnV9YJ8M+cjZ6UaBVHikZbcPNPkXtq5F8qLwc5NY9fmVnNYI6uGCWSzOeir
 L8f66URJZw0lLwUTbYv3QNCDTtsVt45KyUMME56Na6iRiDK0XmrVI6vdNOm7sJYSZ6lb
 Zu051ML01phG9VSI0bphULG6KXy90r+b4EOGoMg+wUwhMXi+eHOBP6kOUjYCWpVB8F7z
 IAJiSUijBA0lmfPHs40Ayy71si94j46ULFILG3lZp1HZZLD45+4JJzm3gE3ajv8tGX8G
 wRWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L9gQSJEP
Subject: Re: [Buildroot] [PATCH 1/1] package/netifrc: bump to version 0.7.3
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
Cc: =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/07/2022 21:11, Fabrice Fontaine wrote:
> Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/netifrc/netifrc.hash | 4 ++--
>   package/netifrc/netifrc.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/netifrc/netifrc.hash b/package/netifrc/netifrc.hash
> index d811acc4a2..e92c394018 100644
> --- a/package/netifrc/netifrc.hash
> +++ b/package/netifrc/netifrc.hash
> @@ -1,3 +1,3 @@
>   # Calculated manually
> -sha256	004907e0c3db2d106d6a51d604d79f971f1013fa7642054ad7efe5076e52f7b3	netifrc-0.6.1.tar.gz
> -sha256	da376c9e2244f2a7220767ea4dd88cf423ff5b548e7c2f96b0f3b9dac727748a	LICENSE
> +sha256  ad6578bf0c08eac474fa7b557beda0aed1032bef410a01f0493395cd6568128e  netifrc-0.7.3.tar.gz
> +sha256  da376c9e2244f2a7220767ea4dd88cf423ff5b548e7c2f96b0f3b9dac727748a  LICENSE
> diff --git a/package/netifrc/netifrc.mk b/package/netifrc/netifrc.mk
> index d13dc356f3..dfa1c96bb8 100644
> --- a/package/netifrc/netifrc.mk
> +++ b/package/netifrc/netifrc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NETIFRC_VERSION = 0.6.1
> +NETIFRC_VERSION = 0.7.3
>   NETIFRC_SITE = $(call github,gentoo,netifrc,$(NETIFRC_VERSION))
>   NETIFRC_LICENSE = BSD-2-Clause
>   NETIFRC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
