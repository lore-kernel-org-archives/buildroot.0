Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA180FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D1E5614F3;
	Mon,  4 May 2026 14:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30zP88L6LYk6; Mon,  4 May 2026 14:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 800C4614FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906061;
	bh=UFB2ghETrAqoqw61FRF7j9A8dlWcmYXn+zpa/GB+eOQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iu9XpWi6/t8rQjjlvNCtGTcUoLgJvkDqBLXtG/q8xiW2DXaDnporQPLO1t9DxeRHu
	 HQcR0RuYge2+okwPAZRW9EGZaw9bTyzH5bx6N3G5REEXHcCeboHSuytVgL60jPBdon
	 2zTRULJThUjW0oFjpajZqrTwNpKTQ/6Csflm03UHmoba2tzvAPn16MqN3Avfg69PMk
	 arm1KnG/0Ny4m8Qko0jxObElydufUjxDAUCi3fm202af5dHnLx14ijt2bZDwSsmvdA
	 dAd0TWGFPUG1+LT+lRI96eTsfoOoYKREtd250hGU00G7GiKD6F0lLmPpcNKllTi7fe
	 N+zNyTtyUmuUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 800C4614FA;
	Mon,  4 May 2026 14:47:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6099325D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46F3241B37
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IoUVAy7MYHgI for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1360E410D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1360E410D0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1360E410D0
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so21093665e9.1
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906056; x=1778510856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rIjt7oDcvFDrG1VZGR+9M8QCKbnrYqswU4fuyxAVCpo=;
 b=cDk4bXviqkK76DlRxBznQquhUMzKSi7yYRPsTZ/1MbkjT3ueKwGPjnbLcNASooY+5/
 r4ddXFzzKTMwLSy0J9RKH+KRkgFSn2odqACAguPucKwjQ/O07E7iu8JzTYxjBHbxupnF
 4sVKq/tT6PkEnYoLVNU4CdpPJKYgVfcZqNM6tcR005W5W6hnEmVq1cckaM0Yn2SP7tcK
 1seBDcM244eTd874WCIj+HBPggZrnqPfbMSyGfijRrdrRx80OIL2s4IkHqiGD8LopcFT
 Bf3vntd0rYYkD9eNpyV5HB4E/8y6d/RWrWB93r8fWbFYD6Rzuyp1ynRU0hyjxgwfYU+9
 vN9w==
X-Gm-Message-State: AOJu0Yw8EwiZB8vdFzaxcDsWkrRZUHfScY6tIJWS3+Cp9ACRFh4N36TL
 l9sVmavfdb/DBS6GED0vWyuVH2AhGJafSyl7cX0gSD/j7qhu0U3FP0h/d4we4gH3SPpwj3rGfSV
 Lxv10
X-Gm-Gg: AeBDies0sc+3pWHrOIKffBQ+JYCtX5C1J/SYHBlUGOHmDdnBi6KOU5WA1C/Xy9BmkKT
 QZvyU/a32yu1P0IURHqgUyL6XCMzoMp9meqfMjwLCfmVE+wlIL2DZR53X1Ggv09W4TmCoyjITT/
 bXQd1suxlzyTlFZWbmcR9MEm03L3rFA1KbSak1PnN4Blq9XWXMFkPraUztb9eQYsSRoWA6HjdDS
 GVncFjuJG2dYZ5+SEdTWbBupafSOQtZLipwsIP8TMPnDUxs8diy+Y9gS1n3S5jaN28MCDnUKINZ
 b64QaZ9//KPOl1zSeSYlBz9dEMHAWyl17FZbcHerC3QhLFqKPvQXiNoa5C9qh3LdSYtPbokyYpe
 TT/8jsJ59SsZ8eMCOqIHVHuQAvietGqZLHcthIoyIlJ9vF2K6bUarwY9xqVbMiERbeErHwokhvW
 GCsadKj6wU3tOjfuGwBs0LTyMdiw==
X-Received: by 2002:a05:600c:859a:b0:48a:7f90:2231 with SMTP id
 5b1f17b1804b1-48a9865f859mr116713165e9.19.1777906055866; 
 Mon, 04 May 2026 07:47:35 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8fee6ee5sm105742955e9.8.2026.05.04.07.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:35 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:34 +0200
Message-ID: <20260504144734.9733-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260420202031.210609-1-thomas.perale@mind.be>
References: <20260420202031.210609-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906056; x=1778510856; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rIjt7oDcvFDrG1VZGR+9M8QCKbnrYqswU4fuyxAVCpo=;
 b=iILcZTN+VZVibqX0LC+czJNX9XUOqYGEFghhqVbZLQ/caj2UK91r6+2VQuOHDwWULs
 yCbG3pnuvE7vGLDTWoG7P2b7rZ+8tDo1QhKKTv/nEkytifUVkEVN1PpE8GVwK5YHhkjB
 nZBz7xneGx8q5eXAk12mEaCgYGSF184tHjXpzJqOW3WHl6PEYj7z8GVUsBcuZtZ+KN/a
 7tvMg/w1lvKOYvGY80W4XJD45asYhleIIHysoHzAGb746rf6Zw9k7dmtdQu/K7wQ8ntO
 Vr7y79xNx06LaSlfI+ybfl58sjJnJwUXU4U4vACIVbR5sPAS1zBwgB41szuzo7Yx2Fsu
 jUqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iILcZTN+
Subject: Re: [Buildroot] [PATCH] package/mbedtls: security bump to v3.6.6
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
> For more information about the release, see:
> 
> - https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.6
> - https://github.com/Mbed-TLS/mbedtls/compare/mbedtls-3.6.5..mbedtls-3.6.6
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2025-66442
>     In Mbed TLS through 4.0.0, there is a compiler-induced timing side
>     channel (in RSA and CBC/ECB decryption) that only occurs with LLVM's
>     select-optimize feature. TF-PSA-Crypto through 1.0.0 is also affected.
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2025-66442
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-compiler-induced-constant-time-violations/
> 
> - CVE-2026-25833:
>     Mbed TLS 3.5.0 to 3.6.5 fixed in 3.6.6 and 4.1.0 has a buffer overflow
>     in the x509_inet_pton_ipv6() function
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-25833
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-inet-pton/
> 
> - CVE-2026-25834:
>     Mbed TLS v3.3.0 up to 3.6.5 and 4.0.0 allows Algorithm Downgrade.
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-25834
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-sigalg-injection/
> 
> - CVE-2026-25835:
>     Mbed TLS before 3.6.6 and TF-PSA-Crypto before 1.1.0 misuse seeds in a
>     Pseudo-Random Number Generator (PRNG).
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-25835
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-rng-cloning/
> 
> - CVE-2026-34871:
>     An issue was discovered in Mbed TLS before 3.6.6 and 4.x before 4.1.0
>     and TF-PSA-Crypto before 1.1.0. There is a Predictable Seed in a
>     Pseudo-Random Number Generator (PRNG).
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-34871
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-dev-random/
> 
> - CVE-2026-34872:
>     An issue was discovered in Mbed TLS 3.5.x and 3.6.x through 3.6.5 and
>     TF-PSA-Crypto 1.0. There is a lack of contributory behavior in FFDH
>     due to improper input validation. Using finite-field Diffie-Hellman,
>     the other party can force the shared secret into a small set of values
>     (lack of contributory behavior). This is a problem for protocols that
>     depend on contributory behavior (which is not the case for TLS). The
>     attack can be carried by the peer, or depending on the protocol by an
>     active network attacker (person in the middle).
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-34872
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-ffdh-peerkey-checks/
> 
> - CVE-2026-34873:
>     An issue was discovered in Mbed TLS 3.5.0 through 4.0.0. Client
>     impersonation can occur while resuming a TLS 1.3 session.
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-34873
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-client-impersonation-while-resuming-tls13-session/
> 
> - CVE-2026-34874:
>     An issue was discovered in Mbed TLS through 3.6.5 and 4.x through
>     4.0.0. There is a NULL pointer dereference in distinguished name
>     parsing that allows an attacker to write to address 0.
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-34874
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-null-pointer-dereference-x509/
> 
> - CVE-2026-34875:
>     An issue was discovered in Mbed TLS through 3.6.5 and TF-PSA-Crypto
>     1.0.0. A buffer overflow can occur in public key export for FFDH keys.
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-34875
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-ffdh-buffer-overflow/
> 
> - CVE-2026-34876:
>     An issue was discovered in Mbed TLS 3.x before 3.6.6. An out-of-bounds
>     read vulnerability in mbedtls_ccm_finish() in library/ccm.c allows
>     attackers to obtain adjacent CCM context data via invocation of the
>     multipart CCM API with an oversized tag_len parameter. This is caused
>     by missing validation of the tag_len parameter against the size of the
>     internal 16-byte authentication buffer. The issue affects the public
>     multipart CCM API in Mbed TLS 3.x, where mbedtls_ccm_finish() can be
>     invoked directly by applications. In Mbed TLS 4.x versions prior to
>     the fix, the same missing validation exists in the internal
>     implementation; however, the function is not exposed as part of the
>     public API. Exploitation requires application-level invocation of the
>     multipart CCM API.
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-34876
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-ccm-finish-boundary-check/
> 
> - CVE-2026-34877:
>     An issue was discovered in Mbed TLS versions from 2.19.0 up to 3.6.5,
>     Mbed TLS 4.0.0. Insufficient protection of serialized SSL context or
>     session structures allows an attacker who can modify the serialized
>     structures to induce memory corruption, leading to arbitrary code
>     execution. This is caused by Incorrect Use of Privileged APIs.
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-34877
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-serialized-data/
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/mbedtls/mbedtls.hash | 4 ++--
>  package/mbedtls/mbedtls.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
> index b86c66af3e..f1be074e08 100644
> --- a/package/mbedtls/mbedtls.hash
> +++ b/package/mbedtls/mbedtls.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.5:
> -sha256  4a11f1777bb95bf4ad96721cac945a26e04bf19f57d905f241fe77ebeddf46d8  mbedtls-3.6.5.tar.bz2
> +# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.6:
> +sha256  8fb65fae8dcae5840f793c0a334860a411f884cc537ea290ce1c52bb64ca007a  mbedtls-3.6.6.tar.bz2
>  # Locally calculated
>  sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index c1aa9f0850..e8bb0a71b9 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MBEDTLS_VERSION = 3.6.5
> +MBEDTLS_VERSION = 3.6.6
>  MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
>  MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
>  MBEDTLS_CONF_OPTS = \
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
