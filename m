Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166FCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB30141892;
	Wed, 27 Apr 2022 19:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6scinKeXDau; Wed, 27 Apr 2022 19:36:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 546C4409DA;
	Wed, 27 Apr 2022 19:36:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1F6E1BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B02F582D49
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXuHdJvTJiQp for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:36:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3BF082CDE
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:36:54 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id l18so5394898ejc.7
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zMchnfvFiNKzFg50iNS51l5Q4EXJptpghdjIkChF+64=;
 b=Smn+pMfRUsz5QMXts4Z2PqK3ozSz8mw0A+XkBi0Krm6YOU9I4PkDgy/JkQOCGPWbr9
 GAJti4xyFzZnsjb9hIPztSo6PFvegZ+yZTkbcDceCtRqfNn9WOH9ko22ynIq0wmS/6dc
 pKA7eBxaiZEz+WrmgEEVU49f4O5oNgdMvldvNHsiJlGsoiS9kHaYIoCpqs3Cb91fRs7h
 upEejeXTqOAWCQElWYSj0fCBVhcZqCVWahtINWS+5l7K6cGcFEseGsdvHxcDjcic2UnJ
 PgyemAKqiK9mHkpqJJrJxQm/INs5ItPJkrztraHvBNswjZVll1XzlYywbzOAUG+UOix7
 rOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zMchnfvFiNKzFg50iNS51l5Q4EXJptpghdjIkChF+64=;
 b=Ch9ShPG7hZcRT9H3G9TY87hXYuYv1Fmf7XLgEaYEmKAdpsB5B4UpGtIpfdLiMY22T7
 BYtR/nEPmx1V+s5CAfo8wrZMHbvs8NRE3IoRv5iijkEA4IT+KjYGeFvANmROeUInR315
 0WMSNQK5fBXf8IFSSbXSIjD3EpMDjPOfY8txLt8MxeIxgdZep+ACNlVIz8gnb219YUK9
 A34jFPQKxbhGhKAmyILuXmYqsVRUjRD0+7V5EU8g2KxKY+ss+2JTSs7T9v1fo8TkQnyZ
 0VPde6zO8+5tAu5A8M9UNvKpJcCk6dSn6f5jvSNMn0hJV1hxJGDQjznhhZkIe0PTnRfh
 t0DQ==
X-Gm-Message-State: AOAM532+PndWCdNNTUpiEh/9c7/FFV8agQvXlRaKojIEyqYEHcwH6To5
 Bu9a3+dV5BOkF+pqGjnJbBmKjA==
X-Google-Smtp-Source: ABdhPJxDObhcaJcaxkqOIJzR+lRRkeO9pS2RejzDA3qGVI3URgIlXCxOfo3DCEHMcUU8Lpo2xflxgw==
X-Received: by 2002:a17:907:6e04:b0:6e0:95c0:47b8 with SMTP id
 sd4-20020a1709076e0400b006e095c047b8mr27715894ejc.483.1651088213064; 
 Wed, 27 Apr 2022 12:36:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a1709064f0f00b006f00349c4c3sm6961961eju.122.2022.04.27.12.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:36:52 -0700 (PDT)
Message-ID: <d1393c92-28cf-ad0e-e457-42247041d6bd@mind.be>
Date: Wed, 27 Apr 2022 21:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220426215755.782961-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220426215755.782961-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libsrtp: fix build with
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/04/2022 23:57, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since bump to
> version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> crypto/hash/hmac_ossl.c: In function 'srtp_hmac_alloc':
> crypto/hash/hmac_ossl.c:88:55: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
>     88 |         pointer = (uint8_t *)srtp_crypto_alloc(sizeof(HMAC_CTX) +
>        |                                                       ^~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c346780ed664c9fe8c7112e4c256cfe8080a7af5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...legacy-OpenSSL-to-fix-LibreSSL-build.patch | 86 +++++++++++++++++++
>   1 file changed, 86 insertions(+)
>   create mode 100644 package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch
> 
> diff --git a/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch b/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch
> new file mode 100644
> index 0000000000..68bfb085f7
> --- /dev/null
> +++ b/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch
> @@ -0,0 +1,86 @@
> +From 16483b18a9980575bee23898b2dbfbe2a4675d84 Mon Sep 17 00:00:00 2001
> +From: Klemens Nanni <kn@openbsd.org>
> +Date: Sat, 15 Jan 2022 23:19:35 +0300
> +Subject: [PATCH] Remove compatibility code for legacy OpenSSL to fix LibreSSL
> + build
> +
> +In current LibreSSL, `HMAC_CTX` aka. `struct hmac_ctx_st` is an opaque
> +structure as of LibreSSL hmac.h revision 1.15 (14.01.2022) [0], thus
> +`sizeof(HMAC_CTX)` fails to compile.
> +
> +The non-legacy code path should compile with LibreSSL versions as old
> +as 2.7.0 (21.03.2018).
> +
> +Found while building https://github.com/desktop-app/tg_owt which bundles
> +libsrtp 2.2.0 [1] on OpenBSD 7.0 -CURRENT/with latest LibreSSL.
> +
> +Suggestion to remove the legacy code from Theo Buehler, thanks.
> +
> +0: http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/lib/libcrypto/hmac/hmac.h?rev=1.15&content-type=text/x-cvsweb-markup
> +1: https://github.com/desktop-app/tg_owt/blob/6708e0d31a73e64fe12f54829bf4060c41b2658e/src/third_party/libsrtp/crypto/hash/hmac_ossl.c#L85
> +
> +[Retrieved from:
> +https://github.com/cisco/libsrtp/commit/16483b18a9980575bee23898b2dbfbe2a4675d84]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + crypto/hash/hmac_ossl.c | 29 -----------------------------
> + 1 file changed, 29 deletions(-)
> +
> +diff --git a/crypto/hash/hmac_ossl.c b/crypto/hash/hmac_ossl.c
> +index ee6b0b58..c23c7f21 100644
> +--- a/crypto/hash/hmac_ossl.c
> ++++ b/crypto/hash/hmac_ossl.c
> +@@ -78,26 +78,6 @@ static srtp_err_status_t srtp_hmac_alloc(srtp_auth_t **a,
> +         return srtp_err_status_bad_param;
> +     }
> +
> +-/* OpenSSL 1.1.0 made HMAC_CTX an opaque structure, which must be allocated
> +-   using HMAC_CTX_new.  But this function doesn't exist in OpenSSL 1.0.x. */
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
> +-    {
> +-        /* allocate memory for auth and HMAC_CTX structures */
> +-        uint8_t *pointer;
> +-        HMAC_CTX *new_hmac_ctx;
> +-        pointer = (uint8_t *)srtp_crypto_alloc(sizeof(HMAC_CTX) +
> +-                                               sizeof(srtp_auth_t));
> +-        if (pointer == NULL) {
> +-            return srtp_err_status_alloc_fail;
> +-        }
> +-        *a = (srtp_auth_t *)pointer;
> +-        (*a)->state = pointer + sizeof(srtp_auth_t);
> +-        new_hmac_ctx = (HMAC_CTX *)((*a)->state);
> +-
> +-        HMAC_CTX_init(new_hmac_ctx);
> +-    }
> +-
> +-#else
> +     *a = (srtp_auth_t *)srtp_crypto_alloc(sizeof(srtp_auth_t));
> +     if (*a == NULL) {
> +         return srtp_err_status_alloc_fail;
> +@@ -109,7 +89,6 @@ static srtp_err_status_t srtp_hmac_alloc(srtp_auth_t **a,
> +         *a = NULL;
> +         return srtp_err_status_alloc_fail;
> +     }
> +-#endif
> +
> +     /* set pointers */
> +     (*a)->type = &srtp_hmac;
> +@@ -126,18 +105,10 @@ static srtp_err_status_t srtp_hmac_dealloc(srtp_auth_t *a)
> +
> +     hmac_ctx = (HMAC_CTX *)a->state;
> +
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
> +-    HMAC_CTX_cleanup(hmac_ctx);
> +-
> +-    /* zeroize entire state*/
> +-    octet_string_set_to_zero(a, sizeof(HMAC_CTX) + sizeof(srtp_auth_t));
> +-
> +-#else
> +     HMAC_CTX_free(hmac_ctx);
> +
> +     /* zeroize entire state*/
> +     octet_string_set_to_zero(a, sizeof(srtp_auth_t));
> +-#endif
> +
> +     /* free memory */
> +     srtp_crypto_free(a);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
