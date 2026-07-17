Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06B3C44525
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A76BA40B64;
	Fri, 17 Jul 2026 15:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpBbMIv0W-Fd; Fri, 17 Jul 2026 15:47:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2401640B5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303257;
	bh=esSBFzmBnbCnRLY3/wzNmqeF9F/btowXB6OcBHJoRDU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qr4B/zp5yqg59cH/3iy7FbdMRrqiwYDfL4v0/hWddUvIhrqmTXjZWgIJi9RSSBClp
	 JMfagGmfwc0ePLznMZeZe6e3dydpvqeFDcU9eYHyHtPjEKwyDXxoWlMPMdccvPxhyL
	 435WoTfFBqHjwiQY/UTnKVB071n2ui3+TtsjBilyJzKIsLnOSzoIpC8KWUOcbwy5Uc
	 psfpaHmiNJ5K+GkGv1nsSWJQ8hYQHpklRwasKYlOAr1yokz7AiwClwp7VyidxqTL5U
	 GvatMVh1QA6AsAnjoSAOKEtWISIkj7VBlS5tjGNPV9lIoTUweotJHeKMLsRhiIV4P1
	 0NUA/8d9jgzIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2401640B5C;
	Fri, 17 Jul 2026 15:47:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB92E1F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9155C811D7
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgr0UmYw3a2c for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85066811FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85066811FF
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85066811FF
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:33 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4954f5e8020so618795e9.2
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303251; x=1784908051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YNDffuDWjIPDyDgnfkgMBk7rsERB6o3dO0u6I4I0L/s=;
 b=GiQsrLvfiob3SKYHAFUIicyCi6AVydZ4Z6yhk55Aa+Boe0f7kRTLJKMoAHUtDS8nwz
 P9lz9XC3arnVrqQFQwbkEHHRld7/K+/5Lk0xUHzo9zvPl2bBMDCCY69KHlrjznQMTnOS
 EGAy9qdLpbJPIv2GXvjW7KpzsrkFJn4L9uGnuj381m6OjymUgRGE9Y/MUAi5Z5vjaCwB
 /NfFq6lRWohqO+0QpJaq57C3CaeQbLnFYnxsNjMnURZYCGboUuaLrHQv/gBX2N5HSCAc
 Q3EJ+aAtPkvxZGPFf8FFfcz0RzHG5xV8BWc0FIZWFbS83wt9jqHZnH+sCCIc9qNTuE0h
 C2Gw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rof+O1QRNLXoW3FkMvKjB12ygY/2XECe9VTTl0HkIYm28eAiEk9oGR+zRJzmld7X/kAtwAPBVc/6hE=@buildroot.org
X-Gm-Message-State: AOJu0Yxq2MK3Yc5hNIGBrN86aFPlWkaPHyVvQn0zaR/iRUELv62Foh1G
 MaBDaOQ13AIF08b5Z9P4RvdV4W2yPK5sVhLnA01wwowXum+zwJKouuKbbepqZdcZrSkL/JLtMiE
 3J2PB
X-Gm-Gg: AfdE7clG2bbB2QJGgmY/cGRexDVRvcJweVHsyjXfzBkRP28hjOMqxsjJfzmgrPBFYAS
 ey7ayyUbXeR1ewrFjsItVGUfE8s1wlNkyIy22vftBKNDfNsQTKSjLGAnfdplGwwlxzMdfknyaa/
 zk0kuyJb7siWFUpNpF+dJ7lOkHn36rKJqfOwRAUHRYOuY51skQhah9YGt4OqJoAoxLh5tXJxVam
 L0RHjQN3JctIde3R1NTVMsot2iuZyBri2Jau5PCMjnzOiTsbnlkvatJercuanOuBs7xXs//Zoix
 YAfivkHaCj7hnowPsbeI7+yHhyAIm6DVgD2z0mbaMowJUr7zd0rNzj5PpkdGgA13sFf7lssJMje
 isEMqWFDC6qeVm4Y8JLV36pheqBqLD8NxQ5K3RsN6NHcNqcGGKbCulSjlJZCFvaIMs9SUmY0=
X-Received: by 2002:a05:600c:5493:b0:493:f80c:5455 with SMTP id
 5b1f17b1804b1-4954a3d0cb1mr38749685e9.5.1784303251524; 
 Fri, 17 Jul 2026 08:47:31 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954a2e850dsm63185505e9.9.2026.07.17.08.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:30 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:30 +0200
Message-ID: <20260717154730.191943-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <akqN5nYTLz7l3S9S@waldemar-brodkorb.de>
References: <akqN5nYTLz7l3S9S@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303251; x=1784908051; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YNDffuDWjIPDyDgnfkgMBk7rsERB6o3dO0u6I4I0L/s=;
 b=LT4NaT/NrnT6VWF9VXWM5CgbD2UB9tMA460mViPkyrh2KUhM/oe7yv7tH7c36ig090
 4jn4G49Afs+DNYbhA+Mlh97e7RAtant13s40UYUYOng5+hXH5WENR3gTa0YAbpwO3czR
 tgZrNyBuOpzixxWnz9AM43+5ak+XG1jwgmttg7xXGndUbIoCGN6tBKZd1hhXEmoQCRAN
 13ahVSHWjoCZzLkW622G8n9KeLZZOr3bb9tkLyZmH1iCfOdzWtxAiwKq6GA8NCq5uL5n
 d3wphOwx/va+MBVYJ7IPM3n6H4R2nbHvZJo2z3zcFR2sRzk9ts3EfsCPE/Za5ZQsaw9U
 YyWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LT4NaT/N
Subject: Re: [Buildroot] [PATCH] package/stunnel: update download site
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
> Fix the download site, which seems to be changed after
> a new release. Use the more permanent /archive.
> 
> Fixes:
>  - https://autobuild.buildroot.net/results/a1a/a1a88bea6fdf5ae28d813f0a12d08e504b2fad06/
>  - https://autobuild.buildroot.net/results/b3d/b3d0588fbc02ede6d5f82fb5d2fefcf610a69299/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/stunnel/stunnel.hash | 2 +-
>  package/stunnel/stunnel.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
> index dc61f6d5b9..572f226861 100644
> --- a/package/stunnel/stunnel.hash
> +++ b/package/stunnel/stunnel.hash
> @@ -1,4 +1,4 @@
> -# From https://www.stunnel.org/downloads/stunnel-5.78.tar.gz.sha256
> +# From https://www.stunnel.org/archive/5.x/stunnel-5.78.tar.gz.sha256
>  sha256  8727e53bb8b7528f850327a2a149158422c02183bc120d1d733cc65b1e2c349d  stunnel-5.78.tar.gz
>  # Locally calculated
>  sha256  716f18b10eac3f1875ea2205418dd1b0084bd210bd17d615df6b180cfc4d65b6  COPYING.md
> diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
> index 59321f910a..ef93dc6073 100644
> --- a/package/stunnel/stunnel.mk
> +++ b/package/stunnel/stunnel.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  STUNNEL_VERSION = 5.78
> -STUNNEL_SITE = https://www.stunnel.org/downloads
> +STUNNEL_SITE = https://www.stunnel.org/archive/5.x
>  STUNNEL_DEPENDENCIES = host-pkgconf openssl
>  STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
>  	--disable-libwrap
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
