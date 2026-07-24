Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D8FC531C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 14:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6969160B75;
	Fri, 24 Jul 2026 14:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tST3Y6WAopJG; Fri, 24 Jul 2026 14:14:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C51260B86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784902471;
	bh=mD+EJkRCcZmDt+kdxfmSbL8kEvq42ZDrVUPxVcebg44=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D1TjBLXzStAbttElfIhDfutHgAx6yzF56NP14WBVzkPiAMXEa9e15Gj0h1+FvkALF
	 6b1on7E25/GGdQJu784B0k8xbyArCAtJLsjnB0BWB+Z3cA+mk8oelaKeA2Yal597xT
	 2+Vu2JvY2y07kMAxEUfksvjNuqgZ/804jWMGzf5+DWu0v6kz0uRPYgE703EaEyK2+/
	 NaiISebOPMnuKiLwaFcB2PH+RcIWkH2hIite5QOrwG5ImldNYSVto4tZMuk6d50GRu
	 cyN86ctBJozvJBVHo2rq8ScDFqE8V9aMYRZ0mS9C2WLB5QaOwzcThWfIrhEcU9g9a7
	 takL7P3UiYqQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C51260B86;
	Fri, 24 Jul 2026 14:14:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 267CA3B1
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CC9360B86
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mceK7qbPWowW for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 14:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C24860B75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C24860B75
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C24860B75
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:28 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-47f81a3ccf9so382532f8f.0
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 07:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784902466; x=1785507266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ioYOr18th8mcPivBXTtfoCHciIi/89Foqd0tLVWrNc8=;
 b=TJA3vb/XIhesF+8l2tmhF8xJFs1Sn5WApyNW841eqZ9l4E2egBUhGbg0j5yxZ5jdmN
 2rf4arG4hPE0KqU36uPa484BKtpYLbSw69wq8+FNEVbKRE4Ikl6YYWeiiZwgxCwnCVkY
 aimse0/FmeYWdrm/B9CixDG7TRFugceC51jlcNBP/0pz7pTzz/XCmuKw6eK92At2va+U
 jOgJugNHCZVzKygqCq6JvA2RUDASn71p06+TUm2/pYBV6M6Ap4xxGzXlVxDnLYM4lWz0
 1guCZzjXSSM3+OW1u4eTYZetUYgyd3RkQC044NC48qbyTuCqxlvhRsXkUPpYSKN9FClb
 9+QQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RozmQQHDKwC6Vh7TLdE8mjXKfO2zoGWncw/gorSmVd35Z8QePHIfWi09WqIqA4A9CgrzjDozOHvtz8=@buildroot.org
X-Gm-Message-State: AOJu0Yzr3kMoxDbqSIAfiRaUcDriovPPC7j+qdG3oaKiLa47WX+CN7JB
 ha4eTJTGyfefMpcMR+X3H1St2JZ03oCUVmYZ3WBdR+ZyNet6GAqPjmILLMKisYq8h8lPtm+goqj
 UBlhc
X-Gm-Gg: AR+sD11mwxWKvVJ0Qhmi2YSJCLd9+9YSyQPJcxz9wBuGUhJ2yUz4FiL+BYEERjLfARN
 xCF45OQMhnczCZEli79SRF/KBsQu3a9h8epy7jLbKQtQb6seP86Q7KyZwqpYDWuTNGXm9+noAJ3
 d2sb4VKTuiBXXjy3c/zXpPNkbHCOKfCGDbtujSSbNzIrESrOU1L9/0N7St77oYmDmCy6RQLIFrn
 WOzvnthvWeg+JKxi0jinWcSwYxS9yojjmrY8LhV1rmethN/BG4YvV5XJQGBMSR4r0dpWkm+ax2+
 F2M6KYZ867CEwcYKKe8iWGqYvcuK210/DKS6Ut5s96ZOoLQ9aXHmB6B73SXMGmytzS3pBs83RMb
 e45j2w8dmhwgKKqQqYQ0+eJoHZwljtzfQqPOl9Upv10VbiQbHOfaK6LQOQ1lRxxZOEl4ilCStnw
 p5ctJ+4w==
X-Received: by 2002:a5d:5e87:0:b0:47f:6fbc:dad5 with SMTP id
 ffacd0b85a97d-47f8d72b391mr9146328f8f.26.1784902466246; 
 Fri, 24 Jul 2026 07:14:26 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85bdac28sm23175372f8f.16.2026.07.24.07.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2026 07:14:25 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Jul 2026 16:14:25 +0200
Message-ID: <20260724141425.477482-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716053350.11727-1-bernd@kuhls.net>
References: <20260716053350.11727-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784902466; x=1785507266; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ioYOr18th8mcPivBXTtfoCHciIi/89Foqd0tLVWrNc8=;
 b=SDXvafTFE+och3rC9xZlwxKBSVAeCuPbGCzIPgV1dVC2BKv1e8nk7FoOS9pz9Zu8ps
 8V72nn2tRI32zhnrQ4aNmUMHukDih9svvObe1p4NwfoVRk5rM5tl7Nv77s19QLE0JikS
 zYDXE3VvavM+c73NuLjouUX68qwKrv1UiA9Swu3FOtM2vicyluAnWToYQFqlycjSvHIi
 tgrfGQQFKizcCOSpWEY/pXCKk3W3j8Wf4ulE0pGck9XKDrc9xTgC+S1YYmavlUNLG0CO
 tsf++fChUteR80FIS1NVYl3cX/vLPvPEB7VEcB0HVNNrA63K+QYbEdBldWPTWxPeni2E
 KRIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SDXvafTF
Subject: Re: [Buildroot] [PATCH 1/1] package/ntfs-3g: security bump version
 to 2026.7.7
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
> https://github.com/tuxera/ntfs-3g/wiki/NTFS-3G-Release-History
> https://seclists.org/oss-sec/2026/q3/152
> 
>   Multiple vulnerabilities have been discovered in ntfs-3g.
>   A new version 2026.7.7 is now available at https://github.com/tuxera/ntfs-3g
> 
>     (ntfscat) Fix heap memory corruption when processing a corrupt or maliciously crafted filesystem. (CVE-2026-42616)
>     Fix heap memory corruption when copying index data from root to an index block in a corrupt or maliciously crafted filesystem. (CVE-2026-42617)
>     Fix single-byte heap buffer overflow when decompressing maliciously crafted compressed file data. (CVE-2026-42618)
>     Fix heap buffer overflow when copying the tail data of an index block to a freshly allocated block. (CVE-2026-46569)
>     Fix out-of-bounds read when processing symlink reparse data in a corrupt or maliciously crafted filesystem. (CVE-2026-46571)
>     Fix heap memory corruption for maliciously crafted or corrupt index data descending to an out-of-bounds tree depth. (CVE-2026-46570)
>     Fix heap buffer overflow for maliciously crafted or corrupt index data during a node split. (CVE-2026-46572)
>     Fix heap buffer overflow when building inherited ACL data. (CVE-2026-56135)
>     Fix out of bounds access when clearing an index root in maliciously crafted or corrupt index data. (CVE-2026-56136)
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/e74561d67caed572396db1839ba0826405cfe43b
> 
>  package/ntfs-3g/ntfs-3g.hash | 3 ++-
>  package/ntfs-3g/ntfs-3g.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ntfs-3g/ntfs-3g.hash b/package/ntfs-3g/ntfs-3g.hash
> index 3fcba6af4d..6c68f227a8 100644
> --- a/package/ntfs-3g/ntfs-3g.hash
> +++ b/package/ntfs-3g/ntfs-3g.hash
> @@ -1,4 +1,5 @@
> +# From https://github.com/tuxera/ntfs-3g/releases/tag/2026.7.7
> +sha256  d67b769025d32860549d35c2147e45024d172f81c540d750390ce3602c059dab  ntfs-3g_ntfsprogs-2026.7.7.tgz
>  # Locally calculated
> -sha256  f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c  ntfs-3g_ntfsprogs-2022.10.3.tgz
>  sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
>  sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING.LIB
> diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
> index 62c515d50f..b44ad86290 100644
> --- a/package/ntfs-3g/ntfs-3g.mk
> +++ b/package/ntfs-3g/ntfs-3g.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NTFS_3G_VERSION = 2022.10.3
> +NTFS_3G_VERSION = 2026.7.7
>  NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
>  NTFS_3G_SITE = http://tuxera.com/opensource
>  NTFS_3G_CONF_OPTS = --disable-ldconfig
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
