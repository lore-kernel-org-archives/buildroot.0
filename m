Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DD0C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:07:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6A0A6104F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6A0A6104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74D5F400D7;
	Thu,  5 Aug 2021 19:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jye0p7t6Bfuw; Thu,  5 Aug 2021 19:07:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 495E340287;
	Thu,  5 Aug 2021 19:07:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D54B81BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCB0440287
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTruigO0khsF for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:07:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FAB9400D7
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:07:21 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id yk17so11227412ejb.11
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 12:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BYUKB1CW23r7l0H500RrPnY4NHpKKNZcf95q9P3XXWE=;
 b=JFsjdwCosxVrlFuUs+BjcHmKQetoZ0l3Ipkd/7zu/VCgr+0TUrQ/EQQJQisTaRbVYa
 TFPl0BSlkITAj6beM2RV9xCa4DPnQoaKlfkccmoYH1WPUwWkj1JiQbX4ar1tHPtiy/x1
 XHSGm8Us6x85HNcyjdI65vMe0fhFZK2Sm7ZTGwD8V2YMWfcJ1AURpN2kIpQJiC/lyGcb
 ljPV1raVikARhLLX3+zmgj24b+oy1ze8PENpS7u4gdZDFowAg42fniA8jQk+1mCMhuDn
 MdbzlhvaVrmU/quihWSrvW5meRmSK/Jlgml8sDNERxIJMvGilm6U0KmGBcyvNV0cUemF
 bPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BYUKB1CW23r7l0H500RrPnY4NHpKKNZcf95q9P3XXWE=;
 b=HLNJNyMAG90Z0v4B+JNTr8Y3Si27jHzpbiL/YtCc2vZnluDJjnE6NcrbV6JmjTC8cJ
 MuEt5SzYEjnIM9jWtwU9onNUg3V47P/w9Ewmpl0Xh05hFUJ65z3Mm+iU/Owvt80Ocdgm
 UF9GStr0EcgJNwUnJDm5eIvgLuyYftBpXkg4b+NJOvlEKopQd7XqXUKiyfZ9F0bnkdPT
 0ipi2N0h2kRVACoAyGgRFx8wGuppsVzEJ2CePXpwuj/bKXTqCP4nbUAs0So1nId/GWMe
 /22k4n6V7q4r7G+KteCvGlY8YMBDnrnyle5cJKYBDSDSxOyqvBYe4vKYMU8z9VMTgFN1
 qDsw==
X-Gm-Message-State: AOAM530QoFeFKOSxcYFzuHmoKFgH5M0S6GW8WN4R7Uox4gkG6NBJ+erv
 TzVw3ab0+dxQN2jq2vTkNk1qxw==
X-Google-Smtp-Source: ABdhPJwMdLpEkzfUHvmNuTkhofEnkwoHZAQy5vUSMy1TMIxNAXlw8CFwLPsW6rLGinTFX6n5VxQAbw==
X-Received: by 2002:a17:906:2642:: with SMTP id
 i2mr6360766ejc.323.1628190439583; 
 Thu, 05 Aug 2021 12:07:19 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id c13sm2645555edv.93.2021.08.05.12.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 12:07:19 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210805090920.2107925-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <ce997f7c-4c63-2523-7b2f-7ae01d6df612@mind.be>
Date: Thu, 5 Aug 2021 21:07:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805090920.2107925-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/qpdf: fix CVE-2021-36978
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 05/08/2021 11:09, Fabrice Fontaine wrote:
> QPDF 9.x through 9.1.1 and 10.x through 10.0.4 has a heap-based buffer
> overflow in Pl_ASCII85Decoder::write (called from Pl_AES_PDF::flush and
> Pl_AES_PDF::finish) when a certain downstream write fails.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  ...to-be-safe-if-downstream-write-fails.patch | 86 +++++++++++++++++++
>  package/qpdf/qpdf.mk                          |  3 +
>  2 files changed, 89 insertions(+)
>  create mode 100644 package/qpdf/0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch
> 
> diff --git a/package/qpdf/0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch b/package/qpdf/0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch
> new file mode 100644
> index 0000000000..70017350f2
> --- /dev/null
> +++ b/package/qpdf/0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch
> @@ -0,0 +1,86 @@
> +From dc92574c10f3e2516ec6445b88c5d584f40df4e5 Mon Sep 17 00:00:00 2001
> +From: Jay Berkenbilt <ejb@ql.org>
> +Date: Mon, 4 Jan 2021 11:55:28 -0500
> +Subject: [PATCH] Fix some pipelines to be safe if downstream write fails (fuzz
> + issue 28262)
> +
> +[Retrieved (and updated to remove updates on ChangeLog and fuzz) from:
> +https://github.com/qpdf/qpdf/commit/dc92574c10f3e2516ec6445b88c5d584f40df4e5]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + ChangeLog                     |   6 ++++++
> + fuzz/qpdf_extra/28262.fuzz    | Bin 0 -> 40395 bytes
> + libqpdf/Pl_AES_PDF.cc         |   2 +-
> + libqpdf/Pl_ASCII85Decoder.cc  |   7 +++++--
> + libqpdf/Pl_ASCIIHexDecoder.cc |   6 ++++--
> + libqpdf/Pl_Count.cc           |   2 +-
> + 6 files changed, 17 insertions(+), 6 deletions(-)
> + create mode 100644 fuzz/qpdf_extra/28262.fuzz
> +
> +diff --git a/libqpdf/Pl_AES_PDF.cc b/libqpdf/Pl_AES_PDF.cc
> +index 18cf3a4d..2865f804 100644
> +--- a/libqpdf/Pl_AES_PDF.cc
> ++++ b/libqpdf/Pl_AES_PDF.cc
> +@@ -238,6 +238,6 @@ Pl_AES_PDF::flush(bool strip_padding)
> + 	    }
> + 	}
> +     }
> +-    getNext()->write(this->outbuf, bytes);
> +     this->offset = 0;
> ++    getNext()->write(this->outbuf, bytes);
> + }
> +diff --git a/libqpdf/Pl_ASCII85Decoder.cc b/libqpdf/Pl_ASCII85Decoder.cc
> +index b8df3e87..9d9f6704 100644
> +--- a/libqpdf/Pl_ASCII85Decoder.cc
> ++++ b/libqpdf/Pl_ASCII85Decoder.cc
> +@@ -119,10 +119,13 @@ Pl_ASCII85Decoder::flush()
> + 
> +     QTC::TC("libtests", "Pl_ASCII85Decoder partial flush",
> + 	    (this->pos == 5) ? 0 : 1);
> +-    getNext()->write(outbuf, this->pos - 1);
> +-
> ++    // Reset before calling getNext()->write in case that throws an
> ++    // exception.
> ++    auto t = this->pos - 1;
> +     this->pos = 0;
> +     memset(this->inbuf, 117, 5);
> ++
> ++    getNext()->write(outbuf, t);
> + }
> + 
> + void
> +diff --git a/libqpdf/Pl_ASCIIHexDecoder.cc b/libqpdf/Pl_ASCIIHexDecoder.cc
> +index f20a9769..7845268e 100644
> +--- a/libqpdf/Pl_ASCIIHexDecoder.cc
> ++++ b/libqpdf/Pl_ASCIIHexDecoder.cc
> +@@ -97,12 +97,14 @@ Pl_ASCIIHexDecoder::flush()
> + 
> +     QTC::TC("libtests", "Pl_ASCIIHexDecoder partial flush",
> + 	    (this->pos == 2) ? 0 : 1);
> +-    getNext()->write(&ch, 1);
> +-
> ++    // Reset before calling getNext()->write in case that throws an
> ++    // exception.
> +     this->pos = 0;
> +     this->inbuf[0] = '0';
> +     this->inbuf[1] = '0';
> +     this->inbuf[2] = '\0';
> ++
> ++    getNext()->write(&ch, 1);
> + }
> + 
> + void
> +diff --git a/libqpdf/Pl_Count.cc b/libqpdf/Pl_Count.cc
> +index 8077092a..c35619b8 100644
> +--- a/libqpdf/Pl_Count.cc
> ++++ b/libqpdf/Pl_Count.cc
> +@@ -27,8 +27,8 @@ Pl_Count::write(unsigned char* buf, size_t len)
> +     if (len)
> +     {
> + 	this->m->count += QIntC::to_offset(len);
> +-	getNext()->write(buf, len);
> + 	this->m->last_char = buf[len - 1];
> ++	getNext()->write(buf, len);
> +     }
> + }
> + 
> diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
> index ec3d3f89a3..c96bf6bf2e 100644
> --- a/package/qpdf/qpdf.mk
> +++ b/package/qpdf/qpdf.mk
> @@ -14,6 +14,9 @@ QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
>  
>  QPDF_CONF_OPTS = --with-random=/dev/urandom
>  
> +# 0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch
> +QPDF_IGNORE_CVES += CVE-2021-36978
> +
>  ifeq ($(BR2_PACKAGE_GNUTLS),y)
>  QPDF_CONF_OPTS += --enable-crypto-gnutls
>  QPDF_DEPENDENCIES += gnutls
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
