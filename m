Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBBCC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:20:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B708360C4A
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B708360C4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8938E608B3;
	Mon, 25 Oct 2021 20:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3XhQ-_EavoZI; Mon, 25 Oct 2021 20:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E78136089F;
	Mon, 25 Oct 2021 20:20:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34A651BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3032A40237
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PpuZF6mbpJyB for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:19:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43DA54021D
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:19:55 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id a26so4288223edy.11
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 13:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KYe2qsjXVw0A9R4heKxE3QIKrEFD1/+5b79l8DLghcg=;
 b=guDdPoULWXom+wYWxbtFQ3KT4XLOP7sqnXiX05yKpLj1y6gsFRirj3wJNp7mmfFdxd
 CWmydtqAYOlBItK9fzkYNOkzbdyG5FrVW6X9yeBqDL7pbStfHKZquovZKnwl+gq9+7h7
 EuTGtU226Atfn8kIK42MjDXKZ2DH5BbqJM8Gprcm90s/mo6GGvpqOa2Gcw2vsahNnszK
 Z4Y6UT6a70u8kTuXMSvspZjMe3YvTLPzbiiGfPjdCIf948JGvMRFJllD9h/vHSPNT/Ky
 3B+4F9MYQ3OFqFM7deQqNTFmuB25MB0xy1L5SixftapHYP3mTWCYf2nl9HQKI7h9vaRC
 Mk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KYe2qsjXVw0A9R4heKxE3QIKrEFD1/+5b79l8DLghcg=;
 b=wBKBUHbTPJpE9g3l5TmLH+jjAYvkjKDbAhbRmrriIrnwfVM84k95xsZ+dp9c3S0ton
 WeYy3GTT8/sDjaDuXaXO+tE1kcbc1bNstO+RVIrg9+iH4ZR8aL1U1j08VwJ0M8twH4qO
 DnBKCs27Q/Z0Mzd3cEqHlN3BKVPdWXgOiSy0EF2fhwZY6AkxaKqLqiRI3VB2uEjlaq/U
 QyYC4ze+eBJM6FVoMkn+XC2eat0nW+75Q0l5yKbtEVUhooeDYypYkY/cdJ/o/nRNzDsi
 pD9cONmiE6Hh8Bvv/PvK7k+2FYfDRRgQrHWXYc+1haQYJXjSHMAHi/I4IWYDnb89gR1a
 3Jlw==
X-Gm-Message-State: AOAM533PQip2dGBB+oH9YB5V4KAKP666KRN+Fm3lyx1BOTe+wmyGgPtz
 Ah4zBbI6pMgmfjrLn4EyGbhogrvzAJP6hQUS
X-Google-Smtp-Source: ABdhPJz3CYBNU1P3SwLxVH0NwdBYJ9gv2TtP/iaDwaN272GozgqX0zJCmcuHm4F7ZYNGiFVJ/rm+jA==
X-Received: by 2002:a17:907:1112:: with SMTP id
 qu18mr19805978ejb.339.1635193192501; 
 Mon, 25 Oct 2021 13:19:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y22sm10374302edc.76.2021.10.25.13.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 13:19:52 -0700 (PDT)
Message-ID: <6ea1c190-a20e-9be2-09c6-3e050174c090@mind.be>
Date: Mon, 25 Oct 2021 22:19:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211025200049.381077-1-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025200049.381077-1-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: bump host gcc
 requirements: propagate to all reverse dependencies
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
Cc: Romain Naour <romain.naour@gmail.com>, Martin Bark <martin@barkynet.com>,
 Daniel Price <daniel.price@gmail.com>, Anisse Astier <anisse@astier.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/10/2021 22:00, Adam Duskett wrote:
> qemu now requires gcc >= 7.5, however, as there is no BR2_HOST_GCC_AT_LEAST_7_5,
> set the host gcc requirements to 8.
> 
> In addition:
>    - Propagate the host gcc dependency to gobject-introspection as it was missing
>      to begin with.
>    - Propagate the host gcc dependency to nodejs
>    - Add a missing comment in package/qemu/Config.in.host explaining the host gcc
>      requirements if host gcc < 8.
> 
> Fixes:
> http://autobuild.buildroot.org/results/32b7fee1f8cda2290fd4bd8ac9fe78bacb25b652
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>   package/gobject-introspection/Config.in | 3 ++-
>   package/nodejs/Config.in                | 6 +++---
>   package/qemu/Config.in.host             | 7 ++++++-
>   3 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
> index bacf44363c..15b6bc3bfa 100644
> --- a/package/gobject-introspection/Config.in
> +++ b/package/gobject-introspection/Config.in
> @@ -13,6 +13,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
>   	# compile errors with locale.c. As such, require 4.9 until this
>   	# can be verified.
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	depends on BR2_HOST_GCC_AT_LEAST_8 # qemu

  Ha, Yann just applied [1] so this will need to be refreshed...

  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20211019052531.1604264-1-fontaine.fabrice@gmail.com/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
