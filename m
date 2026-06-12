Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C46DCD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40E61610C3;
	Fri, 12 Jun 2026 11:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3SqW4eQ6ZpnD; Fri, 12 Jun 2026 11:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA1B46107C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264279;
	bh=5lsXDktFEhbb+2wKw936XgOSBmZICzyJo5ysV33fSpk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bJ7oNdphZS1Z/zRzVKFcMa4YeicQbXGf1iA+7eO3MmB0g7aobTfxdfqtGikep2nsT
	 Tke/UFSp2KwP2K0xOQNJugidxCkd5xa/7UAKkHJyae9MVhb2eatmr5ggUzo4es9qpY
	 ASug4hSRqB0RsQnhNZ1GPimvk5Y0789eJ8OrP0gYDBOFFcwHbE2nQTHKtgUzpyE2bE
	 89I6pxx1bTgoVMBafh/K65eH0ctsjAdfv46xI3K/QAH2wibzIjCz1PlmIJNyw7APZl
	 2DG5xeldCDWmkt+jp/gwKuGIXjnt5wU/pm+0vrHjEuvtBvMNoRPdy49kEveQsi5j7S
	 ZpunU51nSsHMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA1B46107C;
	Fri, 12 Jun 2026 11:37:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75A3D321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70A2660F8F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIZI2xNf37tO for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E23160F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E23160F3E
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E23160F3E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:56 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45ef41adbc1so649761f8f.0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264274; x=1781869074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wGVCIHbGy3gFm2nFG9UC6zcJkzuiL1l9pEjwK806n8A=;
 b=fy+wdR3UQyjqm52fHz9blbWZZ5LmiiB2EYJqzXBXURF9D313fXyqsOc/OeVwUmfQG9
 aTf4/jdJrpQg0m2y7spFxDtFqBcvh1msyik3gz/BBzixiooa0CnrcILhYh6pfYUJdl7y
 L6lw0AYXoDL7vuNMQMQYOk6cmKjmnD0LSMC41ZnQpHz+aa5jTAn2iXP/XTGTvMGfYaeK
 8E0/fuNYMgMAMbDEqeZ4YhsYxcWSc85cOOxz0j7CMFRbhJV/79q+sc5xnk6NbAdFAdeY
 RJy8AaM67KNUOIlHUx+XyDnTjCjnwcC+fnCFOvjEpb6CXdiPyqu+i0g16R36TZlaRtOB
 v8xg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/KlsR7sTO4N3Gj9I2VRBcVzRnzzlVbgjcVZE67mZu7/n1wTMiJ6NAaovY7CKvxhjQwvvc/G3RWa64=@buildroot.org
X-Gm-Message-State: AOJu0YxSormPgyO0rYrMkX19jFwwX+NT+RVaaob7Hcu8oYjuHitBRBZq
 fZhihlFtiFFH/QB79ur2Z3/ND/lDdfOOmVZAErVaz1Mn+lOUHWu7LjbrDR4ios9NxC8=
X-Gm-Gg: Acq92OF7GKiuZhBHdymJHE8p8bWRHeQuo4sGl5WdXID3mdvqtJRFjQC7uYNQ4mWvr40
 hXKvhVmCkbQUdzjDTeXnFaDVwKqYikJWRJMJ7VyfOREkLs18Ystz0g8o7z8ahLW5YD7GDMSJoYo
 nFKcjF9D0sb2JVbVgJOEJNk1+9EaCPjXODtRMaIW9KhBuKRA7timQxYpu3NglTelIbBV9ZcIqB0
 dzqDhUZxeGcN1lkzJc7J1Opl5s3yXiIok1pOEmcqo4IBilkFrt5/pi4LLikcu8P88tUcCmoiXNs
 J9tOxy8y4oxkrt2lqzqZmkEMjtMCpj7Irk5FsDAeUXjdHwWbxBOAq2aPCQzLP2w3hd9L710lHq1
 tvRmtcU8HZQSnYOcsh3aNEu5ypW7JL9lnJI1MN8Vp4z4UhYZAM7/n7wNVbbxbnyO9CDhvC7ncBR
 1X22hYMAiS7eYOYdk=
X-Received: by 2002:a5d:64c6:0:b0:45e:6518:21ad with SMTP id
 ffacd0b85a97d-4606da5f607mr3996835f8f.3.1781264274338; 
 Fri, 12 Jun 2026 04:37:54 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0c10sm5204824f8f.21.2026.06.12.04.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:54 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:53 +0200
Message-ID: <20260612113753.252234-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531214400.1996805-1-bernd@kuhls.net>
References: <20260531214400.1996805-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264274; x=1781869074; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wGVCIHbGy3gFm2nFG9UC6zcJkzuiL1l9pEjwK806n8A=;
 b=d2j9FOoqKqXFnJhp38Ef2Nnk+HsVOLfRC/2EhFrCu+yLyWrLfzZryiPosM6uXyK50t
 HwdEVwdkIeio11G0aap6PaTonKgoaYyKkV6yzup9m9EdObWL/v4rujrysBtOYrIwVMpm
 /VuriMpBSNlMM6eG8HRXgqIjAmzXHqTQV/a86u5mQzVhPpKeOyPN3rqgsRQwC8V4W2oa
 acNNumv/F7klW99q0SH6heV3an7tGDoxmOTn3uQ0jEeWq2weOOUCHiCW7fd+bdOg2Sc8
 EIee1OReJjW7duNq9Ls6qpmTvLnPzbkAtEy+Hm99oPhhj0lxTC/KlAq0hEzCCfmQRiA0
 CCNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=d2j9FOoq
Subject: Re: [Buildroot] [PATCH 1/1] package/poppler: needs zlib
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
> Buildroot commit cdd1c5ca55620a4bdd1574d41fc5538d50f7359a bumped the
> package from version 22.12.0 to 25.10.0 but forgot to change zlib into
> a mandatory dependency. This is necessary due to upstream commit
> https://gitlab.freedesktop.org/poppler/poppler/-/commit/7d87c7d2c6ca4f814f87329534a17dbf30203313
> since version 23.07.0.
> 
> Fixes:
> https://autobuild.buildroot.net/results/85f/85fb6c2945101b8d4ee86dbc32700293e7b35a86/
> 
> CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:290 (message):
>   Could NOT find ZLIB (missing: ZLIB_LIBRARY ZLIB_INCLUDE_DIR)
> Call Stack (most recent call first):
>   /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:654 (_FPHSA_FAILURE_MESSAGE)
>   /usr/share/cmake/Modules/FindZLIB.cmake:242 (find_package_handle_standard_args)
>   CMakeLists.txt:309 (find_package)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/c5f713c318de45dfb6d096e8b3998bde0ff76615
> 
> with the exception of bootlin-xtensa-uclibc which fails to build poppler
> due to an error unrelated to this patch.
> 
>  package/poppler/Config.in  | 1 +
>  package/poppler/poppler.mk | 9 +--------
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/package/poppler/Config.in b/package/poppler/Config.in
> index 21c4d86cf6..208126a327 100644
> --- a/package/poppler/Config.in
> +++ b/package/poppler/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_POPPLER
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
>  	select BR2_PACKAGE_FONTCONFIG
> +	select BR2_PACKAGE_ZLIB
>  	help
>  	  Poppler is a PDF rendering library based on the xpdf-3.0
>  	  code base.
> diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
> index 08214d38b4..535c2b7b10 100644
> --- a/package/poppler/poppler.mk
> +++ b/package/poppler/poppler.mk
> @@ -7,7 +7,7 @@
>  POPPLER_VERSION = 25.10.0
>  POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
>  POPPLER_SITE = https://poppler.freedesktop.org
> -POPPLER_DEPENDENCIES = fontconfig host-pkgconf
> +POPPLER_DEPENDENCIES = fontconfig host-pkgconf zlib
>  POPPLER_LICENSE = GPL-2.0+
>  POPPLER_LICENSE_FILES = COPYING
>  POPPLER_CPE_ID_VENDOR = freedesktop
> @@ -95,13 +95,6 @@ else
>  POPPLER_CONF_OPTS += -DENABLE_UTILS=OFF
>  endif
>  
> -ifeq ($(BR2_PACKAGE_ZLIB),y)
> -POPPLER_DEPENDENCIES += zlib
> -POPPLER_CONF_OPTS += -DENABLE_ZLIB_UNCOMPRESS=ON
> -else
> -POPPLER_CONF_OPTS += -DENABLE_ZLIB_UNCOMPRESS=OFF
> -endif
> -
>  ifeq ($(BR2_PACKAGE_CAIRO),y)
>  POPPLER_DEPENDENCIES += cairo
>  POPPLER_CONF_OPTS += -DWITH_Cairo=ON
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
