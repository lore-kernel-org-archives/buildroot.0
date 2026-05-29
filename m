Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F01BCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F19C7423B9;
	Fri, 29 May 2026 08:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vI3JHnpGsBxI; Fri, 29 May 2026 08:30:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E345423B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043458;
	bh=n2iwghyv/SQ76zFDJsJ6mbr54s0JFaud/fhexek2DIE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NYTHKGfA1lgzndnCt4yn5y2r2KRvKeUx+DN5CV/Pf5y34RM5qQEFubzPjn/QmPZAR
	 Uf+KeRWeIf/zxWa9aiVup9mbXnHIPVgPKPUHKVZiTkv/W03dAbIEZuIuDFp+DH/v3W
	 Jum+I4JjUCOn0zPWyq9u/BRB5hYtynyTDluUFi5hchPyr2mYeipqTFqfGNysAk+aox
	 3Rg0eyHOsLbJ57koaCP6YVvopI5ZnvoETM7pr0a5FKPjv1UN0R+H4CUJ3LRopgvsUm
	 tSanjbhIiNOU9lbf+H+lsqxV5mtVyZtZ/tbRPNFQ8Co3Sg68DeIYTp35DQ6oWs+Lbs
	 90QcNeDZ/ZobQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E345423B6;
	Fri, 29 May 2026 08:30:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3072288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A260361524
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHsSVv5od_vg for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 468B4615BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 468B4615BA
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 468B4615BA
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:39 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45ef29c5561so168118f8f.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043437; x=1780648237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ls8A6bx66pee0tjBUdrojiAjZImkIF4o3GfUuue3fg8=;
 b=eGyQIUsWjy3XU4LTC32V83UUylzw5afvUKhf4RVrHDsIdi4I5a/tLgcqpGk+YodXb1
 XgrygFMsMnmA6dKjtZdEjJKMPbGRfabK/pD99DzvBBfMdQlmCclMrjMXXashsCqdgCuX
 RGQJ0gVAUA9+S1ntOHeCNHGfKXjB6eZLjofLM4py4toqsSdpzQOBuYVFR3sSxPJylQ3F
 0KCs/+YatT1spxEH1oWu3C47G7ikw14Fc5vhtetnxZpLnmpqTRm9LhMqU2dolU3bjgsn
 NBCNRbVtj7pK1qRh2797jGjJdi0Vmhx57h9B1KuOtaqsFuVWSAbWRHcuGAFfBK5ZpXsn
 q2Yw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8qKLY0eUqykpJ3wJUCTKtLdNFVs3i027SZ0Og55iunE/4/MqHi+6HKyCRqvkCuqZh54JCjeQOTI2E=@buildroot.org
X-Gm-Message-State: AOJu0Ywg/kdxDdgQMPrXkmaza+Ty2QUEGZ/0jpI4WGcqO6RGk+LQGYyu
 EggO3uAoNrUn02fJj6BAvN+LR+BtMjC0+2qOiZ3zC+Hnewe2vdjkTyzOYf3Bgc8Gqwk=
X-Gm-Gg: Acq92OFUPPNtIBT3o9iraIXYMq3Gj+38AlN8WdxaU5jj2GuMAXu/U7V0ZY43qagEalT
 NcAX4D/TOc9HFEuBMu8D5X/SmwyNR63sILfPE+ZsiEV8fvTwRNx8xBm6P0SYsHaPr97hT4XgFFr
 Xty3ic1N2WMtQqpKj6VjOH7B4SJRiy/O6rvqMluBVTYtnSC5SNNfLk2Gf8eHuEAexh/k0GdmPa+
 DQ6ElfodKOYs1f6QourHyH3CQW3E9YyPm5KZz1ygqOOA9eOFOp+SanQbgdVHaC/UDvXn1as9wIt
 Z3pxmq2i+lf6fLF8v6cVprjJr1CiH8hrJ9dpdsAhUf1RmTs3ywliDn0ugyonYhWTBdJ/KCnjn41
 Z1CHRyM/P6VFkyvxkkNWufQQ10P1rvZB2D6CAPscQXfENI4zjufcYZjCh/lskRQblC3e7Oq0QyH
 D3rVGhkfr3KJJ+euMqVQWlBSjyUBmQevNxRXJs+oz/ugD0MdveaQoFg3P4/KFQ7HoMCXfh
X-Received: by 2002:a05:6000:250e:b0:45e:db7b:fe72 with SMTP id
 ffacd0b85a97d-45ef141b4a2mr3887985f8f.15.1780043437192; 
 Fri, 29 May 2026 01:30:37 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34b7d6bsm2007341f8f.10.2026.05.29.01.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:36 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:36 +0200
Message-ID: <20260529083036.60152-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520180023.338276-2-bernd@kuhls.net>
References: <20260520180023.338276-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043437; x=1780648237; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ls8A6bx66pee0tjBUdrojiAjZImkIF4o3GfUuue3fg8=;
 b=AvfdWXa8aIrks1LzPOpYEbPn21HEaAUg6GR4EFzrgVvJnGOMl1QK8HytLVpTWkxxn4
 8bnypjHf/ALG8Ra+UemaQXF+aiZ22aM4Nv3jiEgxkuCQf79fhUzmu2/fKWm14eogZRdK
 RnYeLZt2T5uuV+OIA3D+edh070JwlCsppQr00qF9UZAaay8CtGXEZV7J1d1woeYJ32kA
 6mBJqYBlNfs40jTMFdj0MoKCtCEYCiu4KPjcKlt3AG5A3vAbc3h+Lb54PQtkKl4GoRrv
 ymOcYzqGyICeX9TGOlGQ/zbNDT9kO0zOoUxJVpr1u65bruPH45LpNiG9ayapjk0kLbQI
 YDOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AvfdWXa8
Subject: Re: [Buildroot] [PATCH 2/3] package/libde265: security bump version
 to 1.0.19
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
> https://github.com/strukturag/libde265/releases/tag/v1.0.19
> 
> Fixes CVE-2026-45382 & CVE-2026-45383.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libde265/libde265.hash | 4 ++--
>  package/libde265/libde265.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
> index d977af5521..0412936d42 100644
> --- a/package/libde265/libde265.hash
> +++ b/package/libde265/libde265.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/strukturag/libde265/releases/tag/v1.0.18
> -sha256  800478f3bf35f0621b14928ceb317579f3e8b23de4bd2aac29b6cb8be962bbd8  libde265-1.0.18.tar.gz
> +# From https://github.com/strukturag/libde265/releases/tag/v1.0.19
> +sha256  bb19a0b485d2643e0eeb7e91f3ab32d1ad617e7c487dbedc91214ca3dbd8d7eb  libde265-1.0.19.tar.gz
>  # Locally computed
>  sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
> diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
> index aab86ab3d7..8c2fa4a3c3 100644
> --- a/package/libde265/libde265.mk
> +++ b/package/libde265/libde265.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBDE265_VERSION = 1.0.18
> +LIBDE265_VERSION = 1.0.19
>  LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
>  LIBDE265_LICENSE = LGPL-3.0+
>  LIBDE265_LICENSE_FILES = COPYING
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
