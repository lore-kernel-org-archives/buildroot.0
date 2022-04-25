Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57055C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E429829BB;
	Mon, 25 Apr 2022 20:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_S6oq7qzxA3; Mon, 25 Apr 2022 20:22:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C13F828F7;
	Mon, 25 Apr 2022 20:22:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 021791BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3CA9415C0
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h6qaZnljUjOH for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:21:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A01DC4088E
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:21:58 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id w16so10600230ejb.13
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 13:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Z5RQHemnFUSpjxQOKmxjREJn9vMnSz+ArFAmaUqXluc=;
 b=Kr+LkjBKnbApESPHUuOkx8n2KzxlftP0gWM30r3VM2NJjPnzR4lEge1DwXDWVX7hsg
 mUemj8HpHtsJIQ4u7jHW1PnVed6jvXze/6v5C+VWBbT//DiVU0o+MXP2in01u7p+ku5S
 OBGDMcqAaiUA09uyevkqTYhzqbbSYcqc/V2gP9pyJQ040PuWn9m3RuHjdaYABJEGYW1G
 F3BqReqGBcbSHujMHh5oxb+MJUxA2oBFisSLWBF4GMoUyRsgMez5pHwJIdN8a8DrLcf7
 ZhF1fmXbZMyVVUd5z+eBRuhtNmBqrNABOBOYNgQcwqbCTBiaJvqPxOztwrE6VIwNy3I7
 gGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Z5RQHemnFUSpjxQOKmxjREJn9vMnSz+ArFAmaUqXluc=;
 b=WGkqrDerjxM7I4RQshN1G+F2AtUL/G6LniULgVTOevqGQ1cXc0++LJkZWnfACcKJXY
 bUKyYwyXcabDNSiwAxN1NVin3Rfi2ieV4LFY4L8it7ueycwJ6LiUcMo6y9xJJdvjok2o
 grM5XXlyuph2MREJtdRD3OEneyKptradZPfIw0dZX2/FkjNYLADJoGaQsdFTbpuZKNP6
 uPwE8/iuodsU+FbHaZL31NrUri4hS3JgMeTJRGh4jx1rgwK3Yip5qdEJlEqwZysjf7PS
 g53cDSSkx1+/ixnJO+e4SbKdNbMUCAXU+rI8R1yFu/WOP3o2eaiJWSGRJtiTfLX3J/Bv
 heXQ==
X-Gm-Message-State: AOAM5301gi4ortwhudTaeYvSi82jnO5u1cdJppXEVSs6MxnBbK8+YvHy
 aI9PYPZCkgONMd1b+1yn/F3xSYEodYkWzw==
X-Google-Smtp-Source: ABdhPJxYEp5vxv7kUcDpTQvPqjdDp9c8UCX8E8cR8QpFqNzLDNiR494rpDueQytJiECdmRUdiWTnqg==
X-Received: by 2002:a17:907:6d8b:b0:6f0:2533:72fb with SMTP id
 sb11-20020a1709076d8b00b006f0253372fbmr17681906ejc.93.1650918116849; 
 Mon, 25 Apr 2022 13:21:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a508d53000000b00425c9fd2b10sm3945463edt.68.2022.04.25.13.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:21:56 -0700 (PDT)
Message-ID: <5429fafa-4b40-5559-ce6d-bd8adb18f315@mind.be>
Date: Mon, 25 Apr 2022 22:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220423153310.2443908-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220423153310.2443908-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/netatalk: fix build with
 libressl
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



On 23/04/2022 17:33, Fabrice Fontaine wrote:
> Fix the following build failure with libressl >= 2.7.0:
> 
> In file included from uams_dhx_passwd.c:35:
> openssl_compat.h:15:19: error: static declaration of 'DH_set0_pqg' follows non-static declaration
>     15 | inline static int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
>        |                   ^~~~~~~~~~~
> In file included from uams_dhx_passwd.c:33:
> /home/autobuild/autobuild/instance-2/output-1/host/mips64-buildroot-linux-uclibc/sysroot/usr/include/openssl/dh.h:195:5: note: previous declaration of 'DH_set0_pqg' was here
>    195 | int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g);
>        |     ^~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/fc6e308f346570f8198542602bc8c1bdd0a4869e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ..._compat.h-fix-build-with-libressl-2..patch | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
>   create mode 100644 package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch
> 
> diff --git a/package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch b/package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch
> new file mode 100644
> index 0000000000..05913862f6
> --- /dev/null
> +++ b/package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch
> @@ -0,0 +1,43 @@
> +From 58ddc137021a938f37c3794305a839f8df449d3f Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 5 Apr 2022 23:59:15 +0200
> +Subject: [PATCH] etc/uams/openssl_compat.h: fix build with libressl >= 2.7.0
> +
> +Fix the following build failure with libressl >= 2.7.0 which added
> +DH_set0_pqg with
> +https://github.com/libressl-portable/openbsd/commit/848e2a019c796b685fc8c5848283b86e48fbe0bf:
> +
> +In file included from uams_dhx_passwd.c:35:
> +openssl_compat.h:15:19: error: static declaration of 'DH_set0_pqg' follows non-static declaration
> +   15 | inline static int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
> +      |                   ^~~~~~~~~~~
> +In file included from uams_dhx_passwd.c:33:
> +/home/autobuild/autobuild/instance-2/output-1/host/mips64-buildroot-linux-uclibc/sysroot/usr/include/openssl/dh.h:195:5: note: previous declaration of 'DH_set0_pqg' was here
> +  195 | int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g);
> +      |     ^~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/fc6e308f346570f8198542602bc8c1bdd0a4869e
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: not sent yet]
> +---
> + etc/uams/openssl_compat.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/etc/uams/openssl_compat.h b/etc/uams/openssl_compat.h
> +index ded377bc..5cc8de34 100644
> +--- a/etc/uams/openssl_compat.h
> ++++ b/etc/uams/openssl_compat.h
> +@@ -11,7 +11,7 @@ http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
> + #ifndef OPENSSL_COMPAT_H
> + #define OPENSSL_COMPAT_H
> +
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000L)
> + inline static int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
> + {
> +    /* If the fields p and g in d are NULL, the corresponding input
> +--
> +2.35.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
