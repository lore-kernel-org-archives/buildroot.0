Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652F7C4451C
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D1CD40B86;
	Fri, 17 Jul 2026 15:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1as-JQrnnJw; Fri, 17 Jul 2026 15:47:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDDF940B64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303254;
	bh=YqN3zS+gGwcK4apCAuMfIdS5TeYBH2hpbDyyS7K1H5c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BEjBzsD8nuHkDsVOine0bbsqHbMM3G5KHUz9SkvvNnNCtdAHkZzXvCyi0U4YCz4Vi
	 8TQJYnqGCzWjch9OAdjOA5zqVNJDgMd77JVfjhlkplAA4ZBlR09S4mzPk3g245AVDu
	 tqpFVugjTMoL7T5f8IhDxa41QggxYr146m+2f2M6T3WXFH6l73IgXp2QZz2sRzYVN1
	 Pkvcm+F5tiMuWRRL5Og/q5bv7VjU0rIXXQ+LppL24ukzopZHI65zMXrNHlg6mjUsXx
	 eNA9fh1NNdp7YjNV5rkLvI3/bSnT1XViwW4BmbcAEqZx7H4aHciIUT+vpZMrPRADFY
	 JlWMdw5tnWJ6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDDF940B64;
	Fri, 17 Jul 2026 15:47:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7235B1F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63EBE811F7
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CO25hy1ZvTny for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4502A811D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4502A811D7
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4502A811D7
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:31 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4954d29264cso2392865e9.2
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303249; x=1784908049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=53HNbuzXptAjhlvIwJsR2xOA61Zb8fkmdl9twem9MtQ=;
 b=ZNVA/1hXInSCizTqvo390s5aRhV2fU1ZUcskcZmgr6bTfevDb4vkSA+SmjAE4lH2ng
 VflRNTso/dvsE09nuozUmlTlIUIP4TzhbPV2UilBNP5UQHkYz6GSEUn3e3Yc8XA3i/UK
 nFe9/9qKKzEAGLG0WP3vilQ4j6XKRfuBfIFGgfmwHIWH5516U2vxg2iKjIyR/jdjdShJ
 2Zg8RQ/yqvmkVdPjADHf/KsD7/Zj3ADdhq2O3NVN/I5GQxdTKcqQ6FD8lpYH0i6iuy1e
 3HebjgSwZA2cYB7812Sl2gMCvpN2E5I00XgH/hHBeOwWjbcE/AcnYWQvthMXz+cdALn8
 IjuQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrfpT9lOgNS+Ry71yvPEmZqqNI2qs/NY/ZoCKOnkIbeHIecXwwHBKHzcyCJaj6sw8VifJapzcdIlfc=@buildroot.org
X-Gm-Message-State: AOJu0YxR3KIrAuz3cfbLDDU6u006J75Mrfvn9SqruEv/HPV+AvMFK/qF
 AXukKo2JLAIkR2zrEM/pg1k7OZkY6ME0bgrF25PdXEpMW920a/nR2fdyWyJ3W4YJGgI=
X-Gm-Gg: AfdE7clJ+ehdNzA8yWHzm6zDmfpVCQ61eLasi8K967u1sZm1xlLXrEFZpCS8Ierrf7v
 fUh9k+l6CJKxW2+rGK7+Rck2CIhonaSAoEZXTBhbqbYlQLpHmTB/o2iTXHrj9Kx3FWedYLp5oeX
 kWKX5TjvQwm0ptOeM3M35d2pC79uvNCcwj0eBHT6vt8AfZSxzl8ECTWDqhY77LuInzLdkdR/JiO
 fWUSJ23RrBHSNRzyvqdxAcnuTSLaKDUtFHZPNC2ILSR4C+MeuN+3tMky7C0LE1OmRiu0ql5x2vI
 VY+r4aLExD5MaUdCBe35r59phKKt5eypOuwBPI2lV5j2iUm4FkQ9F8vLiZ7ioqSJ7okXPvQOA9Z
 C37m/2T5pvcGJ3uVEslKqQ2HD32vqezQUiRcVdQ+B9KGApXbvK0CAt4mXtwpdmonVe6FJtYc=
X-Received: by 2002:a7b:c344:0:b0:494:282:106c with SMTP id
 5b1f17b1804b1-4954a3f5295mr26796555e9.16.1784303249083; 
 Fri, 17 Jul 2026 08:47:29 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49549c9c929sm53847805e9.12.2026.07.17.08.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:27 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:27 +0200
Message-ID: <20260717154727.191821-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260620150203.4036943-1-bernd@kuhls.net>
References: <20260620150203.4036943-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303249; x=1784908049; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=53HNbuzXptAjhlvIwJsR2xOA61Zb8fkmdl9twem9MtQ=;
 b=Iyz9ijwqA3YNemyVu4oGdo9hGcSTFODEWNBa1eOQRmMLoAJ+T3eQJnQRCB45gHNEZk
 r6sW5cmzpcrrSgI9eSkcru6U/ixY0CAd9Q+Ij1+Bqqrl/WD1MMAQs3eUtFaPFf/nsKNf
 YTTFVHap/HnGyKMct/kKTNql8sOPR9cUwiB/fdplVAFnVpKip86bB3SwHhEJ5PkeO28G
 ebTF0cJw4bLdKeTz31t1+cKlbUViOoEd9fMgimMPxnFB0EOTOZ0X+82Zk4t+41k1XIi0
 lLW6CZibDJu1Gdwr/2jPl4vs5LYXcQrNjFX6TedAGelGjbLvwE6J7IWdR5f2+vJbuADS
 ibdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Iyz9ijwq
Subject: Re: [Buildroot] [PATCH 1/2] package/cifs-utils: remove NO_WERROR
 hook
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
> Buildroot commit 18bd541dd02b153427fb4f010a6426c8e91bef1b added the hook
> to remove -Werror after upstream added it to CFLAGS in version 5.4:
> https://git.samba.org/?p=cifs-utils.git;a=commitdiff;h=dc0dd017a856185422d2f3691062737a9e93ecae
> 
> Upstream however removed -Werror again in version 5.6
> https://git.samba.org/?p=cifs-utils.git;a=commitdiff;h=74edf24d9780900f3ce15d2403c6e331b031d454
> This version was bumped in buildroot with commit
> 839546dd3aaff56f26536ea7373978e32563c473 but the NO_WERROR hook was not
> removed until now.
> 
> The tarball of version 7.6 does not include Makefile.in anymore which
> broke the build of the package. As this hook is not needed anymore it is
> removed.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/f73f3d6fa47e362d38c258e823b6bbaaa559e616
> 
>  package/cifs-utils/cifs-utils.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
> index 9e1e822c4c..58ac594b20 100644
> --- a/package/cifs-utils/cifs-utils.mk
> +++ b/package/cifs-utils/cifs-utils.mk
> @@ -25,12 +25,6 @@ ifeq ($(BR2_PACKAGE_KEYUTILS),y)
>  CIFS_UTILS_DEPENDENCIES += keyutils
>  endif
>  
> -define CIFS_UTILS_NO_WERROR
> -	$(SED) 's/-Werror//' $(@D)/Makefile.in
> -endef
> -
> -CIFS_UTILS_POST_PATCH_HOOKS += CIFS_UTILS_NO_WERROR
> -
>  ifeq ($(BR2_PACKAGE_CIFS_UTILS_SMBTOOLS),)
>  define CIFS_UTILS_REMOVE_SMBTOOLS
>  	rm -f $(TARGET_DIR)/usr/bin/smbinfo
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
