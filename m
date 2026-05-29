Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8D6CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D08C84398;
	Fri, 29 May 2026 08:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTeqs8xHK1pl; Fri, 29 May 2026 08:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B6C484399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043462;
	bh=8kcSFzMPSRxzM+n02N9ykeUWVAxJ60uddZmFQQEeS9U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cns66gBCisJ6tIbiMBV7RmEzJwPOsNNKto3plznfi1xNyk0gSqJAizActFfSdtO11
	 ckzQgqcTRYogDn5Wj/Urac76rPmkdQNeKuo/taPHl9tUewP8ysGzw1/Yj6wn8bai5a
	 fbcSKo/EV6mr/MlE5gQHbc0i7tfxdjGQziiJJVQKD/rg8u55MmXOCc6vQOpLHDghKt
	 GUBhXKITbT1NcLmXh7rc980+lu2Lr0dk0CXiwH5TC6+5sXnHbiMzLpJUcQJQA1yP5O
	 H7l769nRSAGR2yTE/MO2Tq+747Qqzm4ciLorvgL5gFD8ns2OYUu5EMjvPFza12yLZN
	 Ox3zcDp0IqsSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B6C484399;
	Fri, 29 May 2026 08:31:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65580288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 543A84070D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcsfIDTBUAs5 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 517F8406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 517F8406F3
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 517F8406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:43 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4909e3fa4b2so2784105e9.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043441; x=1780648241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8TN28LjxrZEvxzURqSxoR7kbBRvHjUkhwQfCfN4acFk=;
 b=levtqNjOfwJWuqkcsNHZ0NtLLKOyGrgJ4Ci+IyjudhQsDcYnMUWqDadJsBfDvu0BPS
 FRbhVu9bu/pvIB/bEBjzs0ox9TX7wNyhcLHYN/N0xzXyIcx5fwUdRe22jlpQPwYTY6Oy
 84BodY80DMEtz3QHDqhL5s8T+GpOneyvJZS5eBSb1uL12ZcLeO64dAAA/G9k6J2wc0M9
 an4sspwEQcq82H3KaKVF7wjiKeQhjSW3jOkMOsMKHwlaLSFHgud38SmTlBSZxEsnVslb
 tmu/WzqBb3Uah/3mdthLGU2LvS8y43vcIBY97A49Ix4LDv31df2hy9qeC6nRNX/ngzJL
 W+5A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8xT3aRlr4OmvBibK4TWWndkeXYqq+ct6pm3firFTpV9KnVRhMnhpBTLZu2ktEcDolLMKWNg06AAAk=@buildroot.org
X-Gm-Message-State: AOJu0YzU1xX0tR+Y0p4/fwFqohSEnD/IR5wyF/aebgHrjsITeRSIw8VA
 LdfaluiTnrrU5snFc6vBA0+xLvxWOhKx1PvfesrI1VZgfIeI2vHIlHOYnrhkcdcVWWLk9RacHYB
 hhQ4U
X-Gm-Gg: Acq92OEBvuTtw+LJk+5CrJiz+o583xLkIvZKVfADMOPsGVAckmjiN9H5Y9kU5Z+rmhv
 76qV5vhAdDjOBW0ZelqAiRG4YFQVCjgACpm1/bIKmOZ7TbmpECYU1/Ni7IRts4+4CRWNB/NnO3K
 YfUALMarBECG2mKpBVNIRgAwJ9/whe74IrFrLNjkFaW7d/alyAz9IsbTkgnlAkt5mXwk6kc/ttb
 jKlPBCy8s5E8N9C+6GSVdBMihtZO0X75oi/VYYgmDZ3fnuMurKnvnXJXw7jP3MmPqzAdWzorgjS
 9B+qyRvypEE0pjVGZqmHzrJBrQMT+n6KgVPr0bKwxOQ7ClmQz2LxYJMZRwKIsc8kHGwRlRVSNOw
 yFu1Yf6eR50NfXeHeAY655EO1mpbUS5Jgsujp1PeP+b5fkkxVpgqeg471SHWVVLSl1QzHp5t6pQ
 DGku6ztZl8u+5qkkcIQ34s3gljSGBoaEno26iTsPNsjBcPSaV96m4+xUmb/y7mBQHjouug
X-Received: by 2002:a05:600c:5697:b0:48f:d5e8:758c with SMTP id
 5b1f17b1804b1-4909c0b3493mr22138385e9.16.1780043441229; 
 Fri, 29 May 2026 01:30:41 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909cabfd6esm30368715e9.15.2026.05.29.01.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:40 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:40 +0200
Message-ID: <20260529083040.60382-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524174645.3772462-1-bernd@kuhls.net>
References: <20260524174645.3772462-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043441; x=1780648241; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8TN28LjxrZEvxzURqSxoR7kbBRvHjUkhwQfCfN4acFk=;
 b=Qvxc6EAktf5QeDNAS+mqwwEsKTUvVNaKHj03rCakuCIwmE7rvr/IkUU2FNGegh4oG7
 bytWcKUD9VV+asrYbT+uyXmlWsZdAgkABfQFqXFsM8YZvq/OGsACZ9N51x/TNeEwiK0b
 X1nGslsBGU0+pUycaBZbGwGxAJ/qdvPrqObGBAV9zUFjcU5WE3B1/eb9rjRwtImJJrFI
 gCLZkw/gxgralGy4i7MgwhrssVPOlxgotfzD05JA45x2zQzC202SnPQM86Xx8p2Xv080
 +CNznasRW/wuUHCih/vxR/FGSX9m8HW5NMbb7mUT/or67KuhEY1gS9T9kJqz3cklBYzp
 2IVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qvxc6EAk
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: security bump version
 to 1.25.1
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
> https://nlnetlabs.nl/projects/unbound/download/
> 
> Used new signing key to verify the source tarball:
> https://nlnetlabs.nl/signing-keys/
> 
> Fixes CVE-2026-33278, CVE-2026-42944, CVE-2026-42959, CVE-2026-32792,
> CVE-2026-40622, CVE-2026-41292, CVE-2026-42534, CVE-2026-42923,
> CVE-2026-42960, CVE-2026-44390 and CVE-2026-44608.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/unbound/unbound.hash | 8 ++++----
>  package/unbound/unbound.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
> index 19966d889e..46b88900e6 100644
> --- a/package/unbound/unbound.hash
> +++ b/package/unbound/unbound.hash
> @@ -1,8 +1,8 @@
> -# From https://nlnetlabs.nl/downloads/unbound/unbound-1.24.2.tar.gz.sha256
> +# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.1.tar.gz.sha256
>  # After checking pgp signature from:
> -# https://nlnetlabs.nl/downloads/unbound/unbound-1.24.2.tar.gz.asc
> -# with key: 948EB42322C5D00B79340F5DCFF3344D9087A490
> -sha256  44e7b53e008a6dcaec03032769a212b46ab5c23c105284aa05a4f3af78e59cdb  unbound-1.24.2.tar.gz
> +# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.1.tar.gz.asc
> +# with key: 231018690C4D903EF419146AA144323DEAACDF45
> +sha256  0fe8b6277b0959cfd17562debac0aa5f71e0b02dc4ffa9c60271c583edab586f  unbound-1.25.1.tar.gz
>  
>  # Locally calculated
>  sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
> diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
> index a702f4762d..589b286c26 100644
> --- a/package/unbound/unbound.mk
> +++ b/package/unbound/unbound.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UNBOUND_VERSION = 1.24.2
> +UNBOUND_VERSION = 1.25.1
>  UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
>  UNBOUND_INSTALL_STAGING = YES
>  UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
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
