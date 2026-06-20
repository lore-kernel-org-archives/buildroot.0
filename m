Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E01CDB46B
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9225D4EE45;
	Sat, 20 Jun 2026 09:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fn1S7xcOy7O; Sat, 20 Jun 2026 09:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A61604EE4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946653;
	bh=N9eN0BLu7u6wV5JNRcDhE49rFxaeMhdwM4lCDUUBhjI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FsIg7NY7moFAN4GIrls27XUnG6o8r0CQ5WmOO0k2lu5YyVuNq1MyTjZ+RxFitOl95
	 wCkGkrQjaJjvribmY1RnhUSr+SsbLQIVCroqjKDAglOKMA/Lccri+l5QH5LUjhGHC6
	 WHcjrebUMLusr82CUKa5vmBORhvw37ZeoOk8Q9aCRQR+ZER3faTHAzmwS2oWst4jWT
	 odHbt3W15+Y4YdLqu4w6f5OggJ9iHbkmNKAtDlF9mqP13sFxSWNrR2lukzQP27M1ct
	 AFzgeo9HY/I3YV+xOoDAzTdGSKRfzUoi6bZ+p/FveCUwBKtBomDLI9vdZsgeWHxE6p
	 HhPCUer1XipnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A61604EE4E;
	Sat, 20 Jun 2026 09:10:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EECA7367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E03426FB04
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPCyt6fS-xQo for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C836860E78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C836860E78
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C836860E78
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490b3637b90so21283805e9.3
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 02:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781946648; x=1782551448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2tgptd70ZTIuLE1yfeqxvma8GdQIDMwkg1XxVGhfPq0=;
 b=n4p8YVRnfMEtvc4Wj0wrEo9JohPhVmVvrbvDV9aDSyPyLw++RpAjGPgnq4ukacFQWx
 RqxSnP4b/BsnqCYjfB64L5ohn6g3j5CwCGzmm6JZdZOlV5SMRBJ7YZeZTbDiYu7aZEua
 PLoA1IXB5L16ZP5+MAaNPKesFvi/BsZ4ZoT0G1blJrLDWu4S1kJsxpKoc0ikpqMqzs0I
 Gl1QUp8A0W3K+oTKoe3BHIUV2YxkIh2IPpx9p9AEUbTaUELK2sd9KpH4ngXidxMIZqCi
 ek3SjJ6NnkT/Khvve5vZJlDXfFuMcHVRnxnoq6w5bt7BXjpZffZuAVpJ0hMmM992fS8r
 3ARw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/8VHGUo/kQl6L8NOb//Qg12hiyGHX+VuVtojhap6EVwz46HRxkXtvcA41qS7r8zw4kxR6Od4VRHxo=@buildroot.org
X-Gm-Message-State: AOJu0YwpqRCcOanRaAfdA3Fs9yA05bmeGOJhRgUuPBQLpgnSQCJesGe7
 WkG6bHmOW4jhvZBmydvAevxX63ysK7z4cWTKr6skWM9DIc18sFiJ+sL0SAsKtHTX1ss=
X-Gm-Gg: AfdE7ckJglEIFiyuYnjapeS5i48mIjQfBpZeZCX0/LKm4oDh0SG4ZnXy/HDsJRqJrfu
 9mgkSfmKnWDCBBAG1WhlEJxU5h2WCF/RDR5aNH+lJ9QTHLBW/XXYi4xyJXmgaqRkJasIyBERhpm
 EWZEzdqK7G+M2Zy3D3rp+j0PX0U/IP69Ncz1c2dK0AWK0ffjpB2TjWmqpbcOoZx+Y6cllrEqLUY
 /bB3LET0I91WTKkx5jnJ98AAwXYdUHj+Eammw9wx8GCI03lAVO7XrD4xQVBjaJTuuxgvSVsWyZR
 7hkzNWSWtYKN1nAAWFU97Y8nP0lENbNEFj96NgvMyQNqpOYAnlFyc/7CJKf1FIQarlZ4aKO3xuJ
 i5+mfIc/2VS17MfAZori3T/mAJ/51i3YSWS847rQJ7VaMfEXIb3fdbCVHRBM6J7tYDscpQfOOTw
 +gfqIr
X-Received: by 2002:a05:600c:1389:b0:492:1eed:3e67 with SMTP id
 5b1f17b1804b1-4923f5829aamr113963155e9.26.1781946647779; 
 Sat, 20 Jun 2026 02:10:47 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49249238900sm47020205e9.4.2026.06.20.02.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2026 02:10:47 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 20 Jun 2026 11:10:46 +0200
Message-ID: <20260620091046.22356-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610064754.3170578-1-peter@korsgaard.com>
References: <20260610064754.3170578-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781946648; x=1782551448; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2tgptd70ZTIuLE1yfeqxvma8GdQIDMwkg1XxVGhfPq0=;
 b=MNh7sGyO+ZPwdsT8TAWFitKsUm8umkSgLQuWGeUSK/JDuDjcF7CfW/QfBKLPzb91fZ
 Z+SRcJXlCyXH3IRuGTaFHCfCPp7StdPR4QaJbBz4HaFkhg5b+WHJ8C6HETYadhbfggJl
 GYa8CnPd3HO30dIgEetQSJxKxWJDSnDfpK9F8uns6E9Hh5NU4sA+NS1wregnMuSuvR1+
 B9s7luzqa3dM1WdrReiRgIGNH573LJugLkLV3T6qJbjVVmaAZawE5I5OWds6VsEKJ5rC
 aKIrj2yJmJ0jvSaUrAh5sNj9aAxXB73/SI1D+Ezjpy2MOxPDxWXEc8Pma1k8TflWVcHc
 b2aA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MNh7sGyO
Subject: Re: [Buildroot] [PATCH] package/libopenssl: security bump to
 version 3.6.3
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
> Fixes the following security issues:
> 
>     Fixed heap use-after-free in PKCS7_verify().
>     (CVE-2026-45447)
> 
>     Fixed CMS AuthEnvelopedData processing may accept forged messages.
>     (CVE-2026-34182)
> 
>     Fixed unbounded memory growth in the QUIC PATH_CHALLENGE handler.
>     (CVE-2026-34183)
> 
>     Fixed double-free when checking OCSP stapled response.
>     (CVE-2026-35188)
> 
>     Fixed NULL pointer dereference in QUIC server initial packet handling.
>     (CVE-2026-42764)
> 
>     Fixed AES-OCB IV ignored on EVP_Cipher() path.
>     (CVE-2026-45445)
> 
>     Fixed possible heap buffer overflow in ASN.1 multibyte string conversion.
>     (CVE-2026-7383)
> 
>     Fixed out-of-bounds read in CMS password-based decryption.
>     (CVE-2026-9076)
> 
>     Fixed heap buffer over-read in ASN.1 content parsing.
>     (CVE-2026-34180)
> 
>     Fixed PKCS#12 files with PBMAC1 are accepted with short HMAC keys.
>     (CVE-2026-34181)
> 
>     Fixed NULL dereference in certificate verification with OCSP Checking.
>     (CVE-2026-42765)
> 
>     Fixed possible NULL dereference in password-dased CMS decryption.
>     (CVE-2026-42766)
> 
>     Fixed NULL pointer dereference in CRMF EncryptedValue decryption.
>     (CVE-2026-42767)
> 
>     Fixed multi-RecipientInfo Bleichenbacher Oracle in CMS_decrypt()
>     and PKCS7_decrypt().
>     (CVE-2026-42768)
> 
>     Fixed trust anchor substitution via cert/issuer typo in CMP
>     rootCaKeyUpdate.
>     (CVE-2026-42769)
> 
>     Fixed FFC-DH peer validation uses attacker-supplied q.
>     (CVE-2026-42770)
> 
>     Fixed incorrect tag processing for empty messages in AES-GCM-SIV
>     and AES-SIV modes.
>     (CVE-2026-45446)
> 
> For more details, see the release notes and advisory:
> 
> https://github.com/openssl/openssl/releases/tag/openssl-3.6.3
> https://openssl-library.org/news/secadv/20260609.txt
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2026.05.x. Thanks

> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 05777cdac2..fc1a125521 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.6.2/openssl-3.6.2.tar.gz.sha256
> -sha256  aaf51a1fe064384f811daeaeb4ec4dce7340ec8bd893027eee676af31e83a04f  openssl-3.6.2.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.6.3/openssl-3.6.3.tar.gz.sha256
> +sha256  243a86649cf6f23eeb6a2ff2456e09e5d77dd9018a54d3d96b0c6bdd6ba6c7f1  openssl-3.6.3.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index bd4b889c88..e9f795832a 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.6.2
> +LIBOPENSSL_VERSION = 3.6.3
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
