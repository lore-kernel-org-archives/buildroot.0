Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B62CD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED8A841BC3;
	Mon,  4 May 2026 14:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcHGEfflbK4P; Mon,  4 May 2026 14:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B42641BBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906044;
	bh=ZuyTy5HqkIr3wSUG6v33K2rQUHPGFjaLcQ+xTbwS03U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JBZmXb+40TN2hFMx+O7D2uxkSNKJVKeQIRdP+TQ/eJXGr8owe8P8pqRjGyJHl4B7g
	 AxDPGbbDR51bc0wGcugtMzSLw2abngkjWBt4DN7ejJ6xoFG6OlnyYi/L+YD2D5mfqI
	 atprKwQFWwaRnzUjbYUUL5wuqvx+ke95aVpnxbu9G+lMtApescXHPhK6nu/lbHn3p9
	 vQUPgWfwk7VB9xB1ZZkrcDYjuwRr3eKwNbkHm4OI87DqLL4gBzND/42O+zFpNCeRbn
	 Tk92krg5AzCjUM8XeKlk27pyGVy52B/+nOHqEeyRiGeILJFXQOAsRAhWkjPeR5KCKT
	 1e08yGydawVWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B42641BBF;
	Mon,  4 May 2026 14:47:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A576225D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A2F861565
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCgm3IGSsHtV for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C5E961376
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C5E961376
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C5E961376
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so29042205e9.0
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906037; x=1778510837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j8+e370NbkKRnkrfe4LQQtn9zwb3Ld3+siXRgVrGOUg=;
 b=SnLRqmB5LrtQh9Vt0f01CdpUMLvo9meIWBwOKSY6zg7377krRGniYsDcy9X/V551VC
 2dcxcpQ9+a2kYtiJynSDXiCL1i4w+oRHYuaC4+olINaDGPKhnhghzRBM1+5QfSKyDash
 iOlfPqFiSo2JP76sosydn3HYTSTcHbAgAQu3QqCTaj/qHDyZVwfLnxAA92HT8/bzNJaN
 PLi3cjuaa1ZCyMFzGZlkWU6VEQBFVt2wCH7G/Kn2/+j4PTJRPPZuBeKp0NJJf5E55zwd
 gGFbCWtmVNZ0jIQvcBbcCNzFbrVAtkj8OfHAdnufGJVj8NXmy5NVDL5damPQIDpOr65l
 XLaA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/8T+CZhvSObKYYhqW6Q6D7vfq+G/0wY4wptaVvP9Fkzb1uOZZlY5SAa6VtOzTVcbRNgRL1LcIwYfY=@buildroot.org
X-Gm-Message-State: AOJu0YzUaKt8sOiewZJW3Bnteg7e+0xuClP/F+LimJfyYkRsn8pRqzCI
 OERQV88jcikyg6CxoyPO800QXpgeAQ9PYXN5IHdfBY9ChmWGQ356p0aNNXYONhtPUEo=
X-Gm-Gg: AeBDieuL6J0deS4SUV0C5me0oY1+xgv8azmnDyMGZbr4WB2qxVjlsVPKzeqOixTvKQ7
 qjoZGD+8zwEb0LsCWLSCYQ0EmhEuw3fjMUkeICqg+PDRZ91+WV/Iw5Kt/tEkqXHfW9x84oqEM/k
 lznhAv1KgyJGoUqJauPrKbsoHhGVyBbZoZzHxATE6ZB5r2ypaK3evl21fIlDIQ9FpP3PQhxU0+k
 cedqcYsivqv2Z5PcwEsdk2kceIdFFYMQQ2T+33muAzKK7h0Gwbi/fVH7e+9Cy11MRoatxazzVwN
 33fUgOxanyXUvWYadRkKOss1MzYEZoKe7sGMj3IO1+NlcIt/ySHLS0DQpibRbeFguhqwtsGZlad
 JEVN+788NCcPwGxNdeiTY3zln6c1CwybK/ajePI6jW7jLYh6xJ/IiwiMCLntCG5bhPn7GD2RxJy
 O6jGvL7vipfyx/zIIlTq79n+J46w==
X-Received: by 2002:a05:600c:548b:b0:485:3c2e:60d5 with SMTP id
 5b1f17b1804b1-48a97098a19mr165842945e9.2.1777906037139; 
 Mon, 04 May 2026 07:47:17 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8fe845f0sm122965075e9.1.2026.05.04.07.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:16 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:16 +0200
Message-ID: <20260504144716.9122-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429141129.248078-1-titouan.christophe@mind.be>
References: <20260429141129.248078-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906037; x=1778510837; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j8+e370NbkKRnkrfe4LQQtn9zwb3Ld3+siXRgVrGOUg=;
 b=Ws/S3J58izvxqrgq8uX7hUnKjs80dsQIb6xHGCo1ob62JLeCOiFaZQK46mznJ+TWWw
 CCjC4CIvvit8AbbjgL02R6i7HNssHiFvBGll39fTsMOJ4kgyK81Y8fcpNPLzffLjGRDv
 lCpKmPirJhwlGUxYvwwHN2XrIiNmZGQ3W/z9Vn9vJ+0iYJ8H1teA3jROSnx3cePiqh8Y
 slx720DDBtnokvE3MZvanVu7lxXc0KOvCD0sX8YL/GSuLOqPw6olO/cKpFXkWrqQFDhn
 XAaL+/GdZ0GytV9ctggEKfS5I5PpoMI3oGV8/L88lgC822TQY1eFkHJE4iZPtt6lfrt6
 Zx0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ws/S3J58
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/libspdm: add patches
 for security issues fixed in libspdm 3.8.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...ulnerability-in-GET_CSR-parsing-code.patch | 65 +++++++++++++++++++
>  ...ibspdm_rsp_measurement_extension_log.patch | 29 +++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 package/libspdm/0002-Fix-security-vulnerability-in-GET_CSR-parsing-code.patch
>  create mode 100644 package/libspdm/0003-Update-libspdm_rsp_measurement_extension_log.patch
> 
> diff --git a/package/libspdm/0002-Fix-security-vulnerability-in-GET_CSR-parsing-code.patch b/package/libspdm/0002-Fix-security-vulnerability-in-GET_CSR-parsing-code.patch
> new file mode 100644
> index 0000000000..6d10f33564
> --- /dev/null
> +++ b/package/libspdm/0002-Fix-security-vulnerability-in-GET_CSR-parsing-code.patch
> @@ -0,0 +1,65 @@
> +From 704bc9916ccd8c034f912f13b75fd890a19eb3f3 Mon Sep 17 00:00:00 2001
> +From: Steven Bellock <sbellock@nvidia.com>
> +Date: Tue, 27 Jan 2026 12:02:37 -0800
> +Subject: [PATCH] Fix security vulnerability in GET_CSR parsing code
> +
> +Signed-off-by: Steven Bellock <sbellock@nvidia.com>
> +Co-Authored-By: Nicholas Carlini <nicholas@carlini.com>
> +
> +Fixes: https://github.com/DMTF/libspdm/security/advisories/GHSA-j54w-759w-xj3m
> +Upstream: https://github.com/DMTF/libspdm/commit/704bc9916ccd8c034f912f13b75fd890a19eb3f3
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + os_stub/cryptlib_mbedtls/pk/x509.c | 25 +++++++++++++------------
> + 1 file changed, 13 insertions(+), 12 deletions(-)
> +
> +diff --git a/os_stub/cryptlib_mbedtls/pk/x509.c b/os_stub/cryptlib_mbedtls/pk/x509.c
> +index 65eff62bfd5..1b5d60d4f92 100644
> +--- a/os_stub/cryptlib_mbedtls/pk/x509.c
> ++++ b/os_stub/cryptlib_mbedtls/pk/x509.c
> +@@ -1768,6 +1768,19 @@ static bool libspdm_convert_subject_to_string(uint8_t *ptr, size_t obj_len,
> +                 (libspdm_consttime_is_mem_equal(cur->oid, internal_p, obj_len))) {
> +                 /*Concat subject string*/
> + 
> ++                /*move to string*/
> ++                internal_p += obj_len;
> ++                ret = libspdm_asn1_get_tag(&internal_p, end, &obj_len, cur->default_tag);
> ++                if (!ret) {
> ++                    return false;
> ++                }
> ++
> ++                /*check total space needed: name + '=' + value + ',' + '\0'*/
> ++                if (buff_len < (int32_t)(cur->name_len + 1 + obj_len + 1 + 1)) {
> ++                    LIBSPDM_DEBUG((LIBSPDM_DEBUG_INFO,"the buffer is too small"));
> ++                    return false;
> ++                }
> ++
> +                 /*for example: CN=*/
> +                 libspdm_copy_mem(buffer, buff_len, cur->name, cur->name_len);
> +                 buff_len = (int32_t)(buff_len - cur->name_len);
> +@@ -1776,13 +1789,6 @@ static bool libspdm_convert_subject_to_string(uint8_t *ptr, size_t obj_len,
> +                 buff_len--;
> +                 buffer++;
> + 
> +-                /*move to string*/
> +-                internal_p += obj_len;
> +-                ret = libspdm_asn1_get_tag(&internal_p, end, &obj_len, cur->default_tag);
> +-                if (!ret) {
> +-                    return false;
> +-                }
> +-
> +                 /*for example: AU,*/
> +                 libspdm_copy_mem(buffer, buff_len, internal_p, obj_len);
> +                 buff_len = (int32_t)(buff_len - obj_len);
> +@@ -1790,11 +1796,6 @@ static bool libspdm_convert_subject_to_string(uint8_t *ptr, size_t obj_len,
> +                 *buffer = ',';
> +                 buff_len--;
> +                 buffer++;
> +-
> +-                if (buff_len < 0) {
> +-                    LIBSPDM_DEBUG((LIBSPDM_DEBUG_INFO,"the buffer is too small"));
> +-                    return false;
> +-                }
> +                 break;
> +             }
> +         }
> diff --git a/package/libspdm/0003-Update-libspdm_rsp_measurement_extension_log.patch b/package/libspdm/0003-Update-libspdm_rsp_measurement_extension_log.patch
> new file mode 100644
> index 0000000000..c1a0f7eefc
> --- /dev/null
> +++ b/package/libspdm/0003-Update-libspdm_rsp_measurement_extension_log.patch
> @@ -0,0 +1,29 @@
> +From f55cf6d48ec69b4ac60a63903e9c6a2cb0fd155d Mon Sep 17 00:00:00 2001
> +From: Steven Bellock <sbellock@nvidia.com>
> +Date: Fri, 3 Apr 2026 11:00:07 -0700
> +Subject: [PATCH] Update libspdm_rsp_measurement_extension_log.c
> +
> +Fix #3584 in 3.8.
> +
> +Signed-off-by: Steven Bellock <sbellock@nvidia.com>
> +
> +Fixes: https://github.com/DMTF/libspdm/security/advisories/GHSA-m4wc-xmvg-369f
> +Upstream: https://github.com/DMTF/libspdm/commit/f55cf6d48ec69b4ac60a63903e9c6a2cb0fd155d
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + .../spdm_responder_lib/libspdm_rsp_measurement_extension_log.c  | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/library/spdm_responder_lib/libspdm_rsp_measurement_extension_log.c b/library/spdm_responder_lib/libspdm_rsp_measurement_extension_log.c
> +index 6dcb3a54bac..c5f2efa8c88 100644
> +--- a/library/spdm_responder_lib/libspdm_rsp_measurement_extension_log.c
> ++++ b/library/spdm_responder_lib/libspdm_rsp_measurement_extension_log.c
> +@@ -125,7 +125,7 @@ libspdm_return_t libspdm_get_response_measurement_extension_log(libspdm_context_
> +                                                response_size, response);
> +     }
> + 
> +-    if ((uint64_t)(offset + length) > spdm_mel_len) {
> ++    if (((uint64_t)offset + length) > spdm_mel_len) {
> +         length = (uint32_t)(spdm_mel_len - offset);
> +     }
> +     remainder_length = spdm_mel_len - (length + offset);
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
