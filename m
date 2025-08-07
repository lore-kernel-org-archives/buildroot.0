Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B046C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21CEF807A6;
	Thu,  7 Aug 2025 18:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZbjE3vBoDov; Thu,  7 Aug 2025 18:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD51E80D9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD51E80D9C;
	Thu,  7 Aug 2025 18:24:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E85710A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B05F40563
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwQp3lmqMV8F for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EEE574055A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEE574055A
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEE574055A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so990715f8f.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591055; x=1755195855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6JlJCployyw/Gr9A9aLFOCaMB6cp3ut3dAj3rug+qI=;
 b=DvHsx/pSI6ZZRuB3bJ5yhPudqD71hltn/rW57Akfq608c76Nu6XBYIWLvw7B+ZGPkV
 U8Nml+TwHVjUh+uzYWkzBDWloqbTqKZdp9kV5I71A0AOYAOqft7v7cb+6MgtYmDs4k9G
 XAvuUt//6O813xri/ATF06rZpnhpBJD1HTg7Ay4x03BduH1t7WNa7pLWiBJiWzvifUAS
 A9XV3+p8UCYPMvi8v41NYXfd80uLhL3cOo8MCpBU0GYZaMDAWqdi/q343tJwAtJCgOJY
 2Tke8zOGNrTQvy3nl6I9yEZs2Qx44MD8s2N+423V4+hRNL9bgyAqVfI1hQ4jxbCYHNkV
 8Wxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo3IQP6juGDT/UftHTOcnT0ggryAT8fQ5DtwIc//KGG9U63f+TKtNX2cxDU2QxeHpZpckngThTyu8=@buildroot.org
X-Gm-Message-State: AOJu0Yx+m9uwQPgtQn4lPs63totR/BNVbfDf4njkODG1DAQPyUGOERmN
 MM/V0G7pnrmTusEnhWmhZTh1CNNSUIkxIOeeLbpEZNtoyXpYD4VH9oVDxDRsd5WMPJr+/UNwmOO
 zcbpv
X-Gm-Gg: ASbGncs5TYCXPMldQbUeo3/0L3lMEoyl5BMxgS0bzqkqr+Ofx/fnJbeAinXflG636/9
 jQtZNvBxb95mE4lOOwnRHt3PIUfjvJofiAD/pcvllqo1aBzMQxK6Gx66ZfmKthIhLhm++jBhmkM
 blURtwbbXd3piRqIn5Mgjfj596bQaf5B/u+UeUzhddljB2H0sIZ/XCi8Pg/F6zL8gORUoIc6KxB
 /RtIXAcAD9fQVl/wLpphlDpejBb+M438Y5ayFY5H+g9Q1izvFWHcDugF2tkqfnlT+5BxQYwfsUt
 P5uzR1/2iToV4spyTawxkBJU4TXW7SqTiKcoH43FoFpQ7y4h7Ohf5NZj3H/6bXr1liHmAmvJ2l5
 gNdDMsNzKBPO3Fg==
X-Google-Smtp-Source: AGHT+IGHT1m4AFe7alxo3MWD+QkFCaRomXoesJMPZE2VsHBBYaM2eHR77XYw3rQh//Ov73MSCmyETQ==
X-Received: by 2002:a05:6000:220f:b0:3a5:783f:528a with SMTP id
 ffacd0b85a97d-3b900b81c2dmr171429f8f.59.1754591054928; 
 Thu, 07 Aug 2025 11:24:14 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459de0d4cf1sm164775825e9.13.2025.08.07.11.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:14 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:14 +0200
Message-ID: <20250807182414.724714-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718145745.79845-1-titouan.christophe@mind.be>
References: <20250718145745.79845-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591055; x=1755195855; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w6JlJCployyw/Gr9A9aLFOCaMB6cp3ut3dAj3rug+qI=;
 b=YtAa5ELdXpN/W6zejUZf1ttwR0Lnfi/sqeImXR8CB6ZHj74Vi8t0PERgBt77qKocEv
 VZHQP/XUU936nS8wv1zZGLBXPciRwWyH0sIHM+u3SwybKT153Pm+sMdlUupMncmetMpM
 Jtnb77QI85hQE+WUBWpFzh/PygU0ov1dgKdJyMNNFFghfsPjT8PAz9JMIod0c37DZ2P2
 zl4VvK2TUhe1aT3afqJG5/qY+vORJMKCUatk4p/OACEY2nL40c8POi2g0iTXaTs5x0bx
 rYlAZcCYEZLqr1MTwJBYdZcU5un4ynRYZEejtiEn+zFvC/X+p9/Huwg48kqW0/MlJBtl
 d2lA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YtAa5ELd
Subject: Re: [Buildroot] [PATCH] package/mbedtls: security bump to v3.6.4
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
> This is a security release of the Long Term Support branch, see release notes:
> https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.4
> 
> Also update the download location, because upstream changed the tag naming
> scheme from v<...> to mbedtls-<...>
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2025-47917
>     Fix possible use-after-free or double-free in code calling
>     mbedtls_x509_string_to_names(). This was caused by the function calling
>     mbedtls_asn1_free_named_data_list() on its head argument, while the
>     documentation did no suggest it did, making it likely for callers relying
>     on the documented behaviour to still hold pointers to memory blocks after
>     they were free()d, resulting in high risk of use-after-free or double-free,
>     with consequences ranging up to arbitrary code execution.
>     In particular, the two sample programs x509/cert_write and x509/cert_req
>     were affected (use-after-free if the san string contains more than one DN).
>     Code that does not call mbedtls_string_to_names() directly is not affected.
> 
> - CVE-2025-48965
>     Fix a bug in mbedtls_asn1_store_named_data() where it would sometimes leave
>     an item in the output list in an inconsistent state with val.p == NULL but
>     val.len > 0. This impacts applications that call this function directly,
>     or indirectly via mbedtls_x509_string_to_names() or one of the
>     mbedtls_x509write_{crt,csr}set{subject,issuer}_name() functions. The
>     inconsistent state of the output could then cause a NULL dereference either
>     inside the same call to mbedtls_x509_string_to_names(), or in subsequent
>     users of the output structure, such as mbedtls_x509_write_names(). This
>     only affects applications that create (as opposed to consume) X.509
>     certificates, CSRs or CRLs, or that call mbedtls_asn1_store_named_data()
> 
> - CVE-2025-49087
>     Fix a timing side channel in the implementation of PKCS#7 padding
>     which would allow an attacker who can request decryption of arbitrary
>     ciphertexts to recover the plaintext through a timing oracle attack.
> 
> - CVE-2025-49600:
>     In MbedTLS 3.3.0 before 3.6.4, mbedtls_lms_verify may accept invalid
>     signatures if hash computation fails and internal errors go unchecked,
>     enabling LMS (Leighton-Micali Signature) forgery in a fault scenario.
>     Specifically, unchecked return values in mbedtls_lms_verify allow an
>     attacker (who can induce a hardware hash accelerator fault) to bypass
>     LMS signature verification by reusing stale stack data, resulting in
>     acceptance of an invalid signature. In mbedtls_lms_verify, the return
>     values of the internal Merkle tree functions create_merkle_leaf_value
>     and create_merkle_internal_value are not checked. These functions
>     return an integer that indicates whether the call succeeded or not. If
>     a failure occurs, the output buffer (Tc_candidate_root_node) may
>     remain uninitialized, and the result of the signature verification is
>     unpredictable. When the software implementation of SHA-256 is used,
>     these functions will not fail. However, with hardware-accelerated
>     hashing, an attacker could use fault injection against the accelerator
>     to bypass verification.
>     https://www.cve.org/CVERecord?id=CVE-2025-49600
> 
> - CVE-2025-49601:
>     In MbedTLS 3.3.0 before 3.6.4, mbedtls_lms_import_public_key does not
>     check that the input buffer is at least 4 bytes before reading a
>     32-bit field, allowing a possible out-of-bounds read on truncated
>     input. Specifically, an out-of-bounds read in
>     mbedtls_lms_import_public_key allows context-dependent attackers to
>     trigger a crash or limited adjacent-memory disclosure by supplying a
>     truncated LMS (Leighton-Micali Signature) public-key buffer under four
>     bytes. An LMS public key starts with a 4-byte type indicator. The
>     function mbedtls_lms_import_public_key reads this type indicator
>     before validating the size of its input.
>     https://www.cve.org/CVERecord?id=CVE-2025-49601
> 
> - CVE-2025-52496:
>     Mbed TLS before 3.6.4 has a race condition in AESNI detection if
>     certain compiler optimizations occur. An attacker may be able to
>     extract an AES key from a multithreaded program, or perform a GCM
>     forgery.
>     https://www.cve.org/CVERecord?id=CVE-2025-52496
> 
> - CVE-2025-52497:
>     Mbed TLS before 3.6.4 has a PEM parsing one-byte heap-based buffer
>     underflow, in mbedtls_pem_read_buffer and two mbedtls_pk_parse
>     functions, via untrusted PEM input.
>     https://www.cve.org/CVERecord?id=CVE-2025-52497
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/mbedtls/mbedtls.hash | 4 ++--
>  package/mbedtls/mbedtls.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
> index cc15958e3a..bf1db1fecd 100644
> --- a/package/mbedtls/mbedtls.hash
> +++ b/package/mbedtls/mbedtls.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/Mbed-TLS/mbedtls/releases/tag/v3.6.3.1:
> -sha256  243ed496d5f88a5b3791021be2800aac821b9a4cc16e7134aa413c58b4c20e0c  mbedtls-3.6.3.1.tar.bz2
> +# From https://github.com/Mbed-TLS/mbedtls/releases/tag/v3.6.4:
> +sha256  ec35b18a6c593cf98c3e30db8b98ff93e8940a8c4e690e66b41dfc011d678110  mbedtls-3.6.4.tar.bz2
>  # Locally calculated
>  sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index 563683e739..b46bbe888a 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -MBEDTLS_VERSION = 3.6.3.1
> -MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/v$(MBEDTLS_VERSION)
> +MBEDTLS_VERSION = 3.6.4
> +MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
>  MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
>  MBEDTLS_CONF_OPTS = \
>  	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
