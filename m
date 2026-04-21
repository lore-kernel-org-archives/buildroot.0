Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB0EF8FA94
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 16:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A00361529;
	Tue, 21 Apr 2026 16:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1Rm241RDqjX; Tue, 21 Apr 2026 16:24:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77D026151D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776788677;
	bh=iqIXQBlbOy2NVX3z+FkBN+xCMXAlfNdHgj+cJdnwKgI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pe3vWW5UvTmZuxhgnwY3tPw1PI54dcbcgLk4hGYFGcfcDS7YhIe5JaACl3j4+qjDZ
	 GfqNOajBPruiz1bVpIb1maysCuyXOnE6xDYnyBu+/YUoqYneGKw2FZdkXbNlVvv549
	 GsVnWIITtst+xWcQgIKATu7eiRcdueDpBKu/zw8gxFi5Js9+RdSygyvwrn3zvge2uQ
	 249d0QHABvmoIL+g3WAe1CPm0/Iz515Il8JTFbpk6Bulh3T4h+39VrDhzrSOUh5pQ4
	 PnIl45h3nLqxfnCBuvqTLXTvJpljb3mp1vyzcr25IMM7AXLsNnUAMlS1Hf/mMMUyjP
	 eOIcbuZ5KKl5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77D026151D;
	Tue, 21 Apr 2026 16:24:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A37C824D
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 16:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A074684055
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 16:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aB1LnAurj0Y5 for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 16:24:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7AC3684051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AC3684051
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AC3684051
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 16:24:33 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so30163585e9.0
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 09:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776788671; x=1777393471;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gpCngQMfOCnm3DSrJJceb0OeNIw9IZ26BYj+6heRk4w=;
 b=MR1bGObYUm+EwT/S+nEGxkEUbtESMQSGkzf/lGPb44hMiPAF/gv9l1ZFFO6gKjXpio
 p8H9yMBARLB7VoJxSC4LYIP2bl53GJ/ur3a967hDTXqFKVAvxyNfiLGU5rLOjv7IzcAl
 DsObgV9Hq9+my/HT1Kfu3i8PtAUoOAKOEbIM7tIi+kq5QxJccCnQKo8VrNfxR5DoVq0V
 qlR3WyZXjQvcGLJkg9izDm7hUd+N6vbzeVAoT+QLunv35fZeOr5ev3Q44oDQuA6HBd+h
 X2GwK6xs7nLynAiMfbl/lPx3WhOtYtwzh83fM4VftazdvsD7zU5q981Ed7HVmKK0zi/O
 kMGQ==
X-Gm-Message-State: AOJu0YxPSIGvnmwcQB14OAphGUVXT2U+VcMFaYX0YqLyB2HS7Q1kz3RK
 F1ip4BjYIMkpRXpnjBtMRLmiBWjMSAw4Zs7vq+0/JNe0RqkYhQNDZYtevRon+sq7w3ZXufkYH7K
 AtOxNwZA=
X-Gm-Gg: AeBDiesIzH07D2lSB0guzfY2uhmsYcnpFdS15PqVDnrce6y/ZKK6gHDIJ+1vbVQMoZf
 c5+2v69+3iVdrWvMROBCEdcLih5XmVQbXDMcTh5jKqy/L6qrGmI6r7K0e5jPLLOPywvs2k45a1H
 wA7mtcDOlPsPAM6X4dV5H1+ATT3cLdoaDO0jO36eO3F1pMrwgoXHp+tn6WBmWtLvsiXFG122ml4
 Er1CR0XlKt0FW9qSQ1KhbI9k8Emy8Awg8bhweFa6ckB4SfaCOGelJ86+tHfpqd9GSF1nWTFOi53
 a3awu93wsPM29DTSoUQIoKR/1w0DAPlzKa43bXj7RiIVk+S5uL5kLUMiyk/G/7Schh1RGRjas5x
 wI8nAuNs2pGvFWVtgOsTd0EUQsY5punMzzEkFn63aTZBhPI7XlETPkFaWQxbwB2OyWVPWd7lYNy
 0GFwLjN4cHTyhPJ1wH5aayNdKX/VZ+t2jZULb9ltQ0eEPzEFlpkQ==
X-Received: by 2002:a05:600c:3f0c:b0:48a:563c:c8e0 with SMTP id
 5b1f17b1804b1-48a563cd16bmr42648055e9.1.1776788671174; 
 Tue, 21 Apr 2026 09:24:31 -0700 (PDT)
Received: from [192.168.129.33] ([109.136.97.112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc177dafsm468594145e9.4.2026.04.21.09.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 09:24:30 -0700 (PDT)
Message-ID: <fa7ab75f-67bc-4f0a-9fd2-cfbce7d6a58e@mind.be>
Date: Tue, 21 Apr 2026 18:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>,
 thomas.perale@mind.be
References: <20260421143310.2795827-1-titouan.christophe@mind.be>
Content-Language: en-US
In-Reply-To: <20260421143310.2795827-1-titouan.christophe@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776788671; x=1777393471; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gpCngQMfOCnm3DSrJJceb0OeNIw9IZ26BYj+6heRk4w=;
 b=K5/6uxMrf317VvdMmeB0Qx51kHukhNPjOddgnThE9XBqB6WsEXND5n/MO65iCU+z31
 MkcATbIwFZuFJbIgg1uwmsc3ceTP6I50crkj/ZVJuHFS21b2MDs/qtFPheGNE/0Ddjtf
 SBLBkM7aJXBxJhyx5VGy8lHyOQthIjxGvUeOCRxJSPiK2DXjVPrGZbXyDZWcfIAzc2cU
 5q1XWLioE3mgYQP1bTTTvVzB38kCkKmz5KrHiBmAo4mJjC1eMzDiI3gOwBm41WX1JtpY
 djEYy2F1DOgtoq5I4EffnJFMv7K0ysoqgJLpNvNArtb0CE3ysCKkDA4ja3csjTj8IQiU
 1nXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K5/6uxMr
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/strongswan: add patch
 for CVE-2026-25075
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas and all,

I forgot to add

# 0002-fix-cve-2026-25075.patch
STRONGSWAN_IGNORE_CVES += CVE-2026-25075

in strongswan/strongswan.mk

Could you please include that change when applying the patch on the LTS 
branch ?

Sorry for the annoyance !

Kind regards,
Titouan

On 21/04/26 16:33, Titouan Christophe wrote:
> This fixes the following vulnerability:
> - CVE-2026-25075:
>      strongSwan versions 4.5.0 prior to 6.0.5 contain an integer underflow
>      vulnerability in the EAP-TTLS AVP parser that allows unauthenticated
>      remote attackers to cause a denial of service by sending crafted AVP
>      data with invalid length fields during IKEv2 authentication. Attackers
>      can exploit the failure to validate AVP length fields before
>      subtraction to trigger excessive memory allocation or NULL pointer
>      dereference, crashing the charon IKE daemon.
>      https://www.cve.org/CVERecord?id=CVE-2026-25075
>
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>   .../strongswan/0002-fix-cve-2026-25075.patch  | 48 +++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100644 package/strongswan/0002-fix-cve-2026-25075.patch
>
> diff --git a/package/strongswan/0002-fix-cve-2026-25075.patch b/package/strongswan/0002-fix-cve-2026-25075.patch
> new file mode 100644
> index 0000000000..82e07fba3f
> --- /dev/null
> +++ b/package/strongswan/0002-fix-cve-2026-25075.patch
> @@ -0,0 +1,48 @@
> +From d4b3c39776f06948d875614a0eddea9561159f2a Mon Sep 17 00:00:00 2001
> +From: Tobias Brunner <tobias@strongswan.org>
> +Date: Thu, 5 Mar 2026 12:43:12 +0100
> +Subject: [PATCH] eap-ttls: Prevent crash if AVP length header field is invalid
> +
> +The length field in the AVP header includes the 8 bytes of the header
> +itself.  Not checking for that and later subtracting it causes an
> +integer underflow that usually triggers a crash when accessing a
> +NULL pointer that resulted from the failing chunk_alloc() call because
> +of the high value.
> +
> +The attempted allocations for invalid lengths (0-7) are 0xfffffff8,
> +0xfffffffc, or 0x100000000 (0 on 32-bit hosts), so this doesn't result
> +in a buffer overflow even if the allocation succeeds.
> +
> +Fixes: 79f2102cb442 ("implemented server side support for EAP-TTLS")
> +CVE: CVE-2026-25075
> +Upstream: https://download.strongswan.org/security/CVE-2026-25075/
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + src/libcharon/plugins/eap_ttls/eap_ttls_avp.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
> +index 06389f7ca73e..2983bd021ded 100644
> +--- a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
> ++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
> +@@ -119,7 +119,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
> + 		chunk_free(&this->input);
> + 		this->inpos = 0;
> +
> +-		if (!success)
> ++		if (!success || avp_len < AVP_HEADER_LEN)
> + 		{
> + 			DBG1(DBG_IKE, "received invalid AVP header");
> + 			return FAILED;
> +@@ -130,7 +130,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
> + 			return FAILED;
> + 		}
> + 		this->process_header = FALSE;
> +-		this->data_len = avp_len - 8;
> ++		this->data_len = avp_len - AVP_HEADER_LEN;
> + 		this->input = chunk_alloc(this->data_len + (4 - avp_len) % 4);
> + 	}
> +
> +--
> +2.43.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
