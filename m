Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7810CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4D7F60AB2;
	Sat, 10 Oct 2026 09:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ieQgahr04kY; Sat, 10 Oct 2026 09:22:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D834260AB3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624166;
	b=GJesG+H999B379r85jlOMHHYfRYjZKmV28r34zWpX/kl4qnLiIMKzgyOpUrZtQRCIMsF
	 1zGgDDKBY09K08OrOCpllS4O7+Kim+zvmcji5wNNCDipt86Ucy5xEtkcqAttEk2x/3No1
	 B3qxWodzg4qlsADv14olIkhYvN4ydX3os4Z5QHQ3fWZpvFdp1AlATVRP5kjaUjoKVbnLe
	 WRaO2QDZedI1byISQfZAiI481gUIDzGTn9VmSoRMnp8CnHIOGumIhSY1LXN/2iqyWSSsh
	 sBSPG8a2cvTb1nRdXva6ayu8nPYJJgEXyUXMsPAAX5Jx2eUeoSdNKIWONOhd6AgkLDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624166;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=F6Q+d9rSwJC9U9MQrmb4yKLcXUKi/Q7psaFuj8mKZm8=;
	b=fUg0KEbi04l6YQkSGJskVZC7QeOfNYe0uvoEWMNe0MurQ15KlzEB+6cbvRjWuoaIgRqk
	 bzA6ohVQhafN/aMdTC5cvBVeBHMGBlCaOswa3hJbZbozOc+qQqKsZty6a8Y0F78TU1mWA
	 aeTtRPte0LCVmZrVrt7TAy2HpCZQky+cvFKNW6vyaxfix5bnSp6ntWLA7ZjmvpKSAYCjl
	 +PAMpoJZu76Fj+P38RNkog8GrtrTV6lZm+WbI9PL+YambZw1RSyBSJUKQCAT6yRRrh1Fb
	 k1GUJvfVRvXWHZo/VouOqC2PxR/OMsHRpU2p/upSkSOXgQY51L8dCMU/XULdIs+mAZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624166;
	bh=F6Q+d9rSwJC9U9MQrmb4yKLcXUKi/Q7psaFuj8mKZm8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=POYpcLd56e5puRaB0WSRYeLbBP964utD6XPxD5u9aMUcYM7SQM2J3X9FjtKqy+dVL
	 odYE5/vtPPSRZmOAhxMROGSs1YWaPaijZENzuSsYjS5aAhAtNTV7ajISTYcpQnATsN
	 eZwF6IZ+h6zzBIoUoljdyMsogyK6ODMGkba5PtIIa0PLn+eo1Pz9SUanFsnqB6MVPd
	 gfwH0uRWj73v/t9qpPqI3X04h8b6LP2MGnPg+FNbPis38TTMXdRTB+HeyVZbDXv0zK
	 tS5iWbxmXAsY5kJGZ7Nok4xCJOmj1j0mxPXv07wZ5nfgQqhqpR8No8Z7ZBR7w16hA1
	 rRpBd22vdVrAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D834260AB3;
	Sat, 10 Oct 2026 09:22:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C84275
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E684660AA1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwBlqRnIegrW for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:22:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AECAB60A9A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624159;
 b=OYtRfRT0fIL0jqPRNpRgnpqCV28Yd92RkloMoI5sJZt6wAtnMFUxBbc3fWm4GrXTuro6
 dcLlA5wPjDx/yrDs4/huiEBz4g1RXyUvL06zrE3sYsVif88NfpFBQ5aYUd8eYP8GjdqFF
 PNss1JMKcr7lIScU3zauzjSJNr5hnsOLJLrLDpkvGeQkp1KJ2sHmcWQy+sM+kVxpZD8I5
 Z2wgwOcKcvogzjlEzQZyXtvixdPmspvzUB18xmEPT/E3fxT01Dp6hTf0yShsNMqQZevvD
 D0QCaLDg5und/uvEypvy4bYPUPW8SyTFOl3inYMefwwrMkYN4jKnl+DDrG5L4eJFzrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624159;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=D9PVaTQg0w/pELl+GyVgeYM2+By1yZlS87zfDe8IhhY=;
 b=TxihmE64WH6hrlJaYBZgC8C946pYrDHObHrYmgllHkX/2SgbAL/vJZurK4gTxiXcCsb6
 Wk+9flAV5Pd2vlJ0LiKjWQaj+/S/e0iBq8o6U4gbYshkbu16XKkaUnKgzEX9e5rZgEswv
 g/9WA+ZekoEy16ZtSfmmW03FblhsG7wImJNuBE6FNjxotVnO/aV8YSVDXNm8OIiHIjT+b
 7iTCdu65seUP6qCIeqAuIeBQvxm3BRdIMV2UiYP06wDclXH1tJwa6rXymZGiNHgmF6K4R
 Mee4TX1a88c7Hzn4UXy+qxt3VfzA/mlvRSUrH477RojjFg4USRRoxgXfgHi/BLFC44Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JjXQgsWp; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AECAB60A9A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:38 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so5862355e9.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624156; x=1792228956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=D9PVaTQg0w/pELl+GyVgeYM2+By1yZlS87zfDe8IhhY=;
 b=YUp/bmqLppQAS3lKPCcy0UUIRnA3C9OHcVLCWZpDsPtQpDEMvm23RT+K0wKjJutrg3
 98CYaAsZskghPS4DQj1XKrXBA6eR/slHItFZb/LlFjc9QquWVNv1gzybI5GYGOa/rs51
 E43asQ8V/LTIhxNFZErxFbY+uyRlVXh5n/UgMWdNjBxDNa6+Y6VR1smw0lo//3QCEHOd
 1lkTCE79UQbYIevTe7cR7NHFjZEMd7ZpQKXJc7pRp9d8Tondhu0ZbCUHRLDFgG/eJJXD
 QAiuslN2Clwn6zUUgHGV4JQoaLFZgNu6wi94/Cnjm/I5pajbeVUqFvGuouwwOuslMSf9
 aXDA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxwgWHq3+hER8RIA1/ctiwKrfEUyBdLC696daQs7vjqnn0SheropciAhixD6KSpiv7HTjouEi0Y5Fw=@buildroot.org
X-Gm-Message-State: AFq9FYLKIofOzt5owQHcc74BFroE6C/ix6MevTX7ZA+rt5r77CjHnzZr
 DclC1SNNHjmgpK7PlxbZmj5UwJrzn7/e5Q3WqeoF+OT+IQCjUHyiZdmeSjxTvHnbGjg=
X-Gm-Gg: AYBFou3XSA7uHSD7d3+yp86xEiM0IoKQazPIsWGFyJw2UJOC1eUKkbu08zdbzhZvu6O
 cPNaMtikq89KSl1P+8tcvwdGCZO3T9BcJfPcXUGcKN64PHkI2oaIQKW/6jYHCItNXV39ke3RZzh
 RiVd0penny7zeBVeTcYhxad0wXWWVxqRydOnHDFK2CCbLwfJzUkxOsLh2EUXVvuUqlFBofKSwvM
 /K6CiUS0BDFkZaQGhcZycjUHr2yJ5BKHQlmqSLLftV9NYDNCw/4GgXtxJJ4pkp3y4RRYzBICsys
 n7nZWkILVTl5lcgJOXRodlVVjJ4Ae6ao1JbZUBpfRwUKvLQpnDBwfnIxclpn+byOe0dBjPDr0y/
 /GC4H0KUEFC8CrWgctDwrYTPIFTkwwNmCGKC+APlj1RZWiJqHWl4GJUK2Z2RNueTBlmf8f/WTSX
 KWHrswWtBNA/iLNJkboiJSP8f8fgvqgzArw9rOa7zR5uSCyW04ac/x7bvhtp3B+JE2T3421acxS
 JUl3jgJ+gulqRfFo98VQ+JdToCRH2SPd6lvHLOMafT8nv4jzPWrKnHl
X-Received: by 2002:a05:600c:190a:b0:4a1:746e:589a with SMTP id
 5b1f17b1804b1-4a18e4aea54mr90095995e9.18.1791624156344; 
 Sat, 10 Oct 2026 02:22:36 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9aac6a4sm8287363f8f.28.2026.10.10.02.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:22:35 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:22:34 +0200
Message-ID: <20261010092234.138582-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929175300.1838821-1-bernd@kuhls.net>
References: <20260929175300.1838821-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 3.6.5
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
> https://github.com/openssl/openssl/releases/tag/openssl-3.6.5
> 
> This release incorporates the following bug fixes and mitigations:
> 
> Fixed DTLS retransmissions of handshake messages from a stale buffer offset.
> (CVE-2026-84782)
> 
> Fixed excessive memory allocation in relative CRLDP processing.
> (CVE-2026-35189)
> 
> Fixed QUIC unvalidated amplification credit may be over-accounted.
> (CVE-2026-35191)
> 
> Fixed potential CPU DoS via O(n^2) fragment reassembly in QUIC.
> (CVE-2026-42772)
> 
> Fixed a timing side-channel in scalar multiplication for mon-NIST EC curves.
> (CVE-2026-54872)
> 
> Fixed QUIC STREAM fragment metadata DoS.
> (CVE-2026-54873)
> 
> Fixed non-constant-time SM2 scalar multiplication on ARM64 and RISC-V.
> (CVE-2026-54875)
> 
> Fixed out-of-bounds access after SSL_set_SSL_CTX() during a handshake.
> (CVE-2026-72897)
> 
> Fixed QUIC connection-level flow control was not enforced for streams.
> (CVE-2026-75804)
> 
> Fixed a NULL pointer dereference in CMP client revocation response handling.
> (CVE-2026-75805)
> 
> Fixed an unauthenticated and undersized DTLS 1.2 AEAD record causing DoS.
> (CVE-2026-75806)
> 
> Fixed a timing side-channel in SM2 signature generation.
> (CVE-2026-77696)
> 
> Fixed an unbounded RETIRE_CONNECTION_ID backlog in QUIC stack
> implementation.
> (CVE-2026-84784)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/f2fb3fc5fbd3c7cbb489326ff677d209c1f4036b
> 
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 46ac5589dc..b7083cc3d7 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.6.4/openssl-3.6.4.tar.gz.sha256
> -sha256  9bffaa1ad1e07b354c21bd3324ec02fa15579f45a7d0494b3e74bc449b7333ef  openssl-3.6.4.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.6.5/openssl-3.6.5.tar.gz.sha256
> +sha256  a2157c2830efdec3788939b00c9b0638306d3f0bbb76dc4832ee503bb397df98  openssl-3.6.5.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 9b3eec4baa..4aad749eec 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.6.4
> +LIBOPENSSL_VERSION = 3.6.5
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
