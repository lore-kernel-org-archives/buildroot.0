Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A83C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1945A40D22;
	Fri, 18 Sep 2026 13:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3aAAJEj8erY; Fri, 18 Sep 2026 13:09:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 326B740CEF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736947;
	b=VLX5UmCeOoe2jCPpukhqkAuovKhNYjhlSKnTbfeNOplz9A92bkx10VwC/OvnU4Ri8NN9
	 HhGoy+jRhBuN7/O1tELiCzCAglNR+mEoD+M3/K5uhgneHnxQMPqEx0hKTB4jZzZ8obdE+
	 bT4RcJBUzDF8w7cwOe6x9T46F8N6KnXix3t8/9pSEGAbzAzGNe0PHXKLsuvABefAN+zVG
	 XjEgyMx/PnXoiBCk1soO1uaNn2Xd2mdB3yP7iyJTlhmp0qRmjJhJjb9rBWXDEjPenkCd+
	 x31ogsQ4Y/3KvcjVcQfFhZeUoYHXUIyZXm8pssbFDQBsIOuDI9SYDI1iljHrddFUjSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736947;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zlknAYQsO1BtY88jqWuzrHW2YNZk1UFhdTskbrHhRmY=;
	b=OfJeg3O+Lequ6R6QPmERPlmG7C+HjN2hejF23K2XhllU1ccAWOTbueUncJh2WSQZgYG3
	 nNm2E2r0Nk37SH63NCvPC2VxAL5f9aBKU5viDaINUWwFP8Lf+kNynPfXW/flQWSSc7Tye
	 9lm0PKBn0PpFBqL/650Br+mUmjfraoEpX18G1pHU7vWw37wEtHVan/muudL4cEzws1cIO
	 k4uv+yhHpGAH1T7mqrbqykeYqLB60JCDjVNrFFnmrL7/gL0xLQm+5cLJJ7GUoVJA2p9BJ
	 drkmLYyUFNZQam5YcbL6k4DEOOPPlqJuq4Z+FtXTjXIEF9/Rrf6d8bUHmTlgPqBPAWw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736947;
	bh=zlknAYQsO1BtY88jqWuzrHW2YNZk1UFhdTskbrHhRmY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q7OThqwTY+K/jDLvZ1vKLKMscZhw8sfErVW+OpH4Sj1taA+IfM8X9ECBOjZb/EXE0
	 0b+hOf1NBggfGCjn+BIF1JPRtMN5+q8TNS1tgLxJXy7+rFzv1aVcxMERxagjtpL2rU
	 9rdAULrowfZDGfpkE9F2jj8CtRmaxFYBTQ97rTY7alFWxXzTvk/NySdsElBSBsAB23
	 oO8e+e9UeJMurq+AFS5XQ3ILpZz9hRNY26ua3zfA0iFfRIRiB3qBXIor7xjhpA7hEX
	 qqzoyVh5lpAcnVK+H97Hnjye5VPy4DCPsN96sqMHUss9arVO0M/wVRTD5s43ItOlkN
	 3ERvILL32FI1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 326B740CEF;
	Fri, 18 Sep 2026 13:09:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B9AC29B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21C63811AC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEk3n4kDvRKI for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:09:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 143748116B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736943;
 b=BBn/3m4PnuAqYyBCyuk1SlyxQ1JXubGYXCAzUz0IHj9fkJsSya3Ix6BmvhSirRWOg3CY
 YC9pm+vfTTQvQV4OOD/VzAjU6/y86wiBP0Erk0uDW4TY6rtlY+k83OQcgIgKOE5gVaK+p
 iVq118vfnNn/iDb2aP0dMm1tXQmZUCcd1ZGWbCojQtY9lZZRePQHNSFxmo+0FnCQG4wCS
 +4T57CZyWeHGMQktyUKW0pLXOYgFQjeLhNcnJtgaR83M7QUefWYJZ9GvgvSdbeH/vyNWe
 Q9yJ8YIWy6SmOBMJXTy+1sEhvOB8FtYl9ITrYM0WB+SBd2dfIzniiVCHXuwXSB8BUBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736943;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=QON0AaPkLLlcIy+Zkc8oEhFH24TqXKO0L4ngVrsI0HU=;
 b=ctTHKfYejshNKwlIU5H+vSKwkuh5vfvYafniyWj1BILwMcXBIgY/mQ/bbHRrZqMBxLvZ
 vHJFVfD5s6sTe5h+SxRKgURL7/vrnF5NMvqc4IhDn6gPUjdRgp/qcGJn9tuzC6+W7HLZv
 XE0ohet8bNZq7uusVqBQWarD5f45DUQRII6g3bS2dEV0O/EWo8w2mD0wlr02tLGU38+5l
 eUxSWH52dXMgQKBF2+pobCjnOAzm+TDFSUKXaYiqpiOre1Hx9UT2nXoK4eiYS3Ib8o4JI
 eSQjRFTb7IaJIvm/iNE002L1PLXNVHqFj9fPjoALhI4Oy9Q4p63RhXPK2/SZAbiOz6w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=V4Ou2dxM; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 143748116B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:02 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e83a388f8so4651805e9.1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736941; x=1790341741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QON0AaPkLLlcIy+Zkc8oEhFH24TqXKO0L4ngVrsI0HU=;
 b=AtspXbbl646hX8jbGn01TAKfO82sZfvJIWZPS0+AVPr8lIPjldOgjC3NhNJQNEcxTw
 jo04CjZAahQ9KhB1tDChXn3H6/90JZau7clo3tjG+O0rDQG80zIrF106eFNthL2T89k8
 JpAGli4vZSSFAWovM8+LLHQV1EI1jIu4Mi9vPPLUozt6qKpldHGIIm6nE/g3JGT9qI8v
 mMMYAj+CC92Zk/DqX2uBVjYgc0TV5/xsqn2wkSpVwUhm2Eq2aEBoRtxmk3hOLLa9Tjy0
 QFJwuq2QkWd8IgPChI2EELtI0zePiVPB4EE459PBAUACnD0DohQ75tsGOM4S2aB72rjh
 niRw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwqC7VzGa/VBiC0RgKmn9Q0mZFV3P++1U/B7leB0PEj0OUQSdXTUQ1f43nPKGXPfOJHRAxpalU7t2A=@buildroot.org
X-Gm-Message-State: AFuF++l36o7uqJ2e09COcJuhe1/RP07LmHbcVRebZsMgdnxW1puG3bIG
 6B/ZxkOao/0SVUhJle+lFhx2PDN0vp4F3sM7h6Git1uXrLepcWiOzvPEqmsHP7Hghm4=
X-Gm-Gg: AYBFou35bWvfYBdVVhC/qJdvAuCmxacX1IzwywwrcZyvuiBrwqGOFfGCcDYawIR8lrR
 ERZIsFytjGGY+7knCfMI4Js/zVUqVS4El3bsWjtOinAy+ciNObxKw2ICFhW9t+ARZdA4vJ1D2oD
 Louxo31LwQA9uTqQw2QID8Yj6hc2fgyrCKpuPZR5zBHziuf0dGKojSlF66XvBAgRRGSEMcq0x2N
 JMzCvGh7BNVCg84Rj7NBCVM1lGpWvEYl5ZtIKH9kUeFKDUGLnkRGUyHBEbCe9oWhjm2ZscBM3d1
 Sn8bG7ZorgO9aY83yzz0iRdjHTOCaF61TtsoNvgnk7/p6/hy3gouEPEpc/Lz59CXn9UrPBn5PeI
 mfF7Zh1a/4EDO4wyXilD3NSPSsrHVfEdzplRNAUtIa8PekUvHHyB5JVZfyLoryqdWdfmgT1O1Fr
 AgtT90mEiPmGom1PfPOcS32fO1Czv0Wx1Pmxvt8NSMJG3bQe/OBT44Slh4cMwQBgHgVkQp4755q
 0s=
X-Received: by 2002:a05:600c:a085:b0:49f:bd3c:bc23 with SMTP id
 5b1f17b1804b1-49fc5747887mr32183665e9.30.1789736940704; 
 Fri, 18 Sep 2026 06:09:00 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc55cd8a8sm56615495e9.0.2026.09.18.06.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:09:00 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:08:58 +0200
Message-ID: <20260918130859.162811-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913120729.1647806-1-thomas.petazzoni@bootlin.com>
References: <20260913120729.1647806-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/kodi: propagate mariadb
 dependencies to BR2_PACKAGE_KODI_MYSQL
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
> Even though kodi itself has architecture dependencies (expressed
> through BR2_PACKAGE_KODI_ARCH_SUPPORTS, the option
> BR2_PACKAGE_KODI_MYSQL selects BR2_PACKAGE_MARIADB, which has its own
> architecture dependencies as well. Make sure to propagate those to
> BR2_PACKAGE_KODI_MYSQL, which doesn't require adding a Config.in
> comment as these are purely architecture dependencies.
> 
> We haven't replicate all dependencies of BR2_PACKAGE_MARIADB because
> all the others are covered by the top-level BR2_PACKAGE_KODI, and
> propagating them would require adding a Config.in comment for
> BR2_PACKAGE_KODI_MYSQL.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
> We don't have a super clear/strong policy on whether dependencies need
> to be replicated to a sub-option when the package top-level option
> already has them. I haven't done so in this case, but if people feel
> like it should be done, I'll be happy to send an updated patch.
> ---
>  package/kodi/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 08a7caae2c..0b13136d82 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -202,6 +202,7 @@ comment "nfs support needs a toolchain w/ threads support"
>  
>  config BR2_PACKAGE_KODI_MYSQL
>  	bool "mysql"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8 # mariadb
>  	select BR2_PACKAGE_MARIADB
>  	help
>  	  Enable MySQL support
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
