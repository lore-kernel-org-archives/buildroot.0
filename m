Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2D0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 104BD404C3;
	Sat, 30 Apr 2022 18:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AUgij2a-765A; Sat, 30 Apr 2022 18:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F36924032A;
	Sat, 30 Apr 2022 18:47:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA9581BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C94648139B
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kzbG8Ty_lgpS for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:47:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63F6881368
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:47:47 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id k27so12471949edk.4
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=n49AOWBd3PpfQ9DP+oO2ak8xymSRiBK3zxPf5N7WRAg=;
 b=gXaMPPAIByzVl0rIRo/ds933MMksJQDg5DcjWeBOeAsc4LxmkxGFBJZ3YqY0roqtVe
 xJimJVdzm3fKoVBEzfPaecHgw6muRK5UAKwLNqcTgj1BX71LCrXdbdPDOmwEDVTPn/RV
 ZmmHKQVT1KwynP7y2wRoUptTHlMzGw5oA20YHsdRmNMisaCb6SBCGMwcMi1+BEgU1VgK
 9VdpfvFfbbhcnnipcGtQHrQv9o288JC/uY8hv+YjxKtaPd2wKQvK/HyMQiMscfv+UwD9
 QXyFuQDABUlMTmiojHFRhs6Pk1lVtcAT8/6gdse2QoMP4UYJBDa1kBtwiXFEsrtN+NTe
 1g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=n49AOWBd3PpfQ9DP+oO2ak8xymSRiBK3zxPf5N7WRAg=;
 b=hS6u9+7Pk6LSMqjGQ35dCKrUSVxEkNZUrZ33JIRxs57Dw4y2F7lxgPYT4F0T7/+8Ej
 s7JHzYfllwLx3tymAFaLS6hpohTi4JqjmCis80jR3KXujLofDzYeVBTupT4fkjUHBBAi
 aKmJzVcZZf65fdY7GkZ5lxyEnBFGMFQKC+w+euud3uiV0OMM5kdTaUmnBQ0R1eG5+gJW
 DaezLE7Hc6ZayUmgnVNGp4BPEs9bRIeZM4n03VvA0JbLWb206+iFVcvMXhiKBFO8ueVN
 uE/B1uhHTiBXJZ4Ag2vaMgKYh+OOAyIqWh9fTgEQPbCJ4RdbFjs/+jWym0ifCh/fb/rR
 e0oQ==
X-Gm-Message-State: AOAM533sl33E6qO6SBPpq8FpTPkv8tyFzdRRZwCyrLP9GBb01tflC8l6
 1cNips9uvvP5POLyn/tFkE5s2A==
X-Google-Smtp-Source: ABdhPJw/5zLDSMqXuKo8z9KKk378M5ep1PUE+FYcyd9f+hoIgbX9nzWPHPI4ydTEPAyEx0oUKhQV9g==
X-Received: by 2002:a05:6402:1111:b0:416:2ac8:b98e with SMTP id
 u17-20020a056402111100b004162ac8b98emr5502382edv.236.1651344465580; 
 Sat, 30 Apr 2022 11:47:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a170907270600b006f3ef214dcdsm1880748ejk.51.2022.04.30.11.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:47:45 -0700 (PDT)
Message-ID: <a1d4681d-8bc8-a307-15bb-ae5a05577b63@mind.be>
Date: Sat, 30 Apr 2022 20:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220427210419.1432804-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220427210419.1432804-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libssh2: fix build with
 libressl >= 3.5.0
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/04/2022 23:04, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since bump to
> version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> crypt.c:71:25: error: field 'h' has incomplete type
>     71 |     _libssh2_cipher_ctx h;
>        |                         ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/47f492ccd4888fe4a150b36e12c88f1e068d46b6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-Opaque-structs-in-LibreSSL-3-5.patch | 27 +++++++++++++++++++
>   1 file changed, 27 insertions(+)
>   create mode 100644 package/libssh2/0001-Opaque-structs-in-LibreSSL-3-5.patch
> 
> diff --git a/package/libssh2/0001-Opaque-structs-in-LibreSSL-3-5.patch b/package/libssh2/0001-Opaque-structs-in-LibreSSL-3-5.patch
> new file mode 100644
> index 0000000000..2e1fd8871c
> --- /dev/null
> +++ b/package/libssh2/0001-Opaque-structs-in-LibreSSL-3-5.patch
> @@ -0,0 +1,27 @@
> +From 7f55a033e5054529e5e69f06725dd02a573329b6 Mon Sep 17 00:00:00 2001
> +From: Charlie Li <git@vishwin.info>
> +Date: Wed, 2 Mar 2022 19:50:56 -0500
> +Subject: [PATCH] Opaque structs in LibreSSL 3.5
> +
> +[Retrieved (and backported) from:
> +https://github.com/libssh2/libssh2/pull/682/commits/7f55a033e5054529e5e69f06725dd02a573329b6]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/openssl.h | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/openssl.h b/src/openssl.h
> +index 3eef02368..c13542481 100644
> +--- a/src/openssl.h
> ++++ b/src/openssl.h
> +@@ -94,8 +94,8 @@
> + #include <openssl/pem.h>
> + #include <openssl/rand.h>
> +
> +-#if OPENSSL_VERSION_NUMBER >= 0x10100000L && \
> +-    !defined(LIBRESSL_VERSION_NUMBER)
> ++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined(LIBRESSL_VERSION_NUMBER)) || \
> ++    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x30500000L)
> + # define HAVE_OPAQUE_STRUCTS 1
> + #endif
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
