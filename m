Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CBBC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6B3F60FB5;
	Mon, 25 Apr 2022 20:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ac0OCH5k9tXZ; Mon, 25 Apr 2022 20:28:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E630360FA6;
	Mon, 25 Apr 2022 20:28:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4E9F1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B143440574
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lgCKAMSixLON for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:26:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB03F404FF
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:26:39 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g23so12835370edy.13
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 13:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=KSCQhn43bQjxRH6we2nN5/0cRgbi8RBRBvw6agxSsw0=;
 b=BOt65XE4f+6N9zKjmQFXzP8zNiTJvMFalsTJUjXKe9fiorARVa2mc+fXt41cWVul11
 BnGBTPHV0BY7W56MYpJWYyYVIypAQBzNSYsErZZKAjBOrN4aOwGubSZ/ki41Qye1fTe9
 ZlK0UT8k+KmCCtK6gcck/ABYxivwee3zXKM/MI8BN5kGZLAGZwtuKTScz81hSObMevUC
 PVQrMzOsf51jdqbFQyRJku+DSMTvfuMPExTyKJ5kS4cYlAAmOZD71vfv4VIgxoCRovKv
 eKUF7TdB2tGvkWGOsqL25/0yPSrvG/YgzCS4KU339+nsnfmV+SvqqPP6Hl9wxUN651pI
 YY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KSCQhn43bQjxRH6we2nN5/0cRgbi8RBRBvw6agxSsw0=;
 b=lIIFo6VxobxjBSa7IDTpbSGnRK4EOTKgu+dKRMKjMhGml1e1aOLvPFUNKMfKLx2DFv
 a1ASYlqswXChddFEPtxkoH6JogISeliOSLYcWHH4WDxViIstg/eGOEfZdh78oHsTnbAH
 hHfF2kzBnCJh3yLlxncAYTGUTyucVVc6jKg8VIbZxf0ousEuszgM6sMn4mL5JRPk+7K8
 AAqosca04dy5pwTu53TxQ+LpOaIaT2yn80lgpY71FZXFu5w30HoDqnh9G6eXXGp6qJ6u
 1RzOQwye2LJqzRfF8cvloOGqtakGihX3muqiPIOtxg4Kg9Z/9g4vMj0Lr4TQGOJJ+8Wp
 36/g==
X-Gm-Message-State: AOAM533kBopG/1fGxQBjpe02vkT5zx5gqeOOQAw8PoGZBz4+8PJJHqcH
 a6+8XMsUnWqrfqKvXu82Z/W0yw==
X-Google-Smtp-Source: ABdhPJzhKQLW6G0dCjh35xUBn/kMRmNN/Vl25PUst9UwPkatJkWRiHIgRljKA+6mrS1upXSKSBmLQw==
X-Received: by 2002:a05:6402:d05:b0:425:b5c8:faeb with SMTP id
 eb5-20020a0564020d0500b00425b5c8faebmr20878569edb.273.1650918398068; 
 Mon, 25 Apr 2022 13:26:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 kt24-20020a170906aad800b006f37988318esm2635636ejb.48.2022.04.25.13.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:26:37 -0700 (PDT)
Message-ID: <c2174e73-5d7b-3ee0-dd71-9eda21056f66@mind.be>
Date: Mon, 25 Apr 2022 22:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220424201615.3421463-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220424201615.3421463-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl_433: fix CVE-2022-27419
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



On 24/04/2022 22:16, Fabrice Fontaine wrote:
> rtl_433 21.12 was discovered to contain a stack overflow in the function
> acurite_00275rm_decode at /devices/acurite.c. This vulnerability allows
> attackers to cause a Denial of Service (DoS) via a crafted file.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  This package is racking up CVEs :-)

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...0004-Fix-overflow-in-Acurite-00275rm.patch | 35 +++++++++++++++++++
>   package/rtl_433/rtl_433.mk                    |  3 ++
>   2 files changed, 38 insertions(+)
>   create mode 100644 package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch
> 
> diff --git a/package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch b/package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch
> new file mode 100644
> index 0000000000..057bf9cf64
> --- /dev/null
> +++ b/package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch
> @@ -0,0 +1,35 @@
> +From 37455483889bd1c641bdaafc493d1cc236b74904 Mon Sep 17 00:00:00 2001
> +From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
> +Date: Fri, 18 Mar 2022 08:09:15 +0100
> +Subject: [PATCH] Fix overflow in Acurite-00275rm (closes #2012)
> +
> +[Retrieved from:
> +https://github.com/merbanan/rtl_433/commit/37455483889bd1c641bdaafc493d1cc236b74904]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/devices/acurite.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/devices/acurite.c b/src/devices/acurite.c
> +index 6879e52da..4f3e83eb3 100644
> +--- a/src/devices/acurite.c
> ++++ b/src/devices/acurite.c
> +@@ -1318,15 +1318,15 @@ static int acurite_00275rm_decode(r_device *decoder, bitbuffer_t *bitbuffer)
> +
> +     // Combine signal if exactly three repeats were found
> +     if (n_rows == 3) {
> +-        uint8_t *b = bitbuffer->bb[bitbuffer->num_rows];
> ++        bitbuffer_add_row(bitbuffer);
> ++        uint8_t *b = bitbuffer->bb[bitbuffer->num_rows - 1];
> +         for (int i = 0; i < 11; ++i) {
> +             // The majority bit count wins
> +             b[i] = (b_rows[0][i] & b_rows[1][i]) |
> +                     (b_rows[1][i] & b_rows[2][i]) |
> +                     (b_rows[2][i] & b_rows[0][i]);
> +         }
> +-        bitbuffer->bits_per_row[bitbuffer->num_rows] = 88;
> +-        bitbuffer->num_rows += 1;
> ++        bitbuffer->bits_per_row[bitbuffer->num_rows - 1] = 88;
> +     }
> +
> +     // Output the first valid row
> diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
> index d1c28adbf5..8326caedb2 100644
> --- a/package/rtl_433/rtl_433.mk
> +++ b/package/rtl_433/rtl_433.mk
> @@ -20,6 +20,9 @@ RTL_433_CONF_OPTS = \
>   # 0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch
>   RTL_433_IGNORE_CVES += CVE-2022-25051
>   
> +# 0004-Fix-overflow-in-Acurite-00275rm.patch
> +RTL_433_IGNORE_CVES += CVE-2022-27419
> +
>   ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
>   RTL_433_DEPENDENCIES += librtlsdr
>   RTL_433_CONF_OPTS += -DENABLE_RTLSDR=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
