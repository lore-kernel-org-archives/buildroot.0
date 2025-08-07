Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425EBCA0EC0
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18BD04055E;
	Thu,  7 Aug 2025 18:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NEeBZroMt2lq; Thu,  7 Aug 2025 18:24:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4761A40577
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4761A40577;
	Thu,  7 Aug 2025 18:24:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 976E74C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E3586063E
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEFF4PguUcpB for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F6E160604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F6E160604
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F6E160604
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso942186f8f.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591060; x=1755195860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L8qtE7khw0Mmkn2niyMjW3S0UChKPT9Hw3ZK5Io1664=;
 b=DY3ESiKzBgcon+bOh6MSesZJVXPr2SIptxI2Bsu97eaxmpKAs24f21GTDTviOQBxE9
 Tn/5zk8ApMG5Wded4qaSf4WJ0RuhbaJI0XvkYHX/K+oLXC3KA2SHTLL5gk7sWs+PecaH
 2NhLYcVU/1ktMpiYpj3utsd0pMa2IkkFVzHfB4O1f8Z8evKeDAd4P+pfzXZ3z5OyBfwP
 VWzPX/pzk/CtHWGqsJZbUdLElabaAErsgoWybyjKwTMTFXFZvp79xJCmNS1chxgR1bXB
 YAv+1qWnn7i1iAkj30JkDNdmO/PTP9n4zbJ1l3ErR3/ARM/VuhBgvGF26OkBhSo1fLcP
 DxaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUignMgvSpAf0mPlgKLutb6jkAvByFxcaGVj4yd+NmLAY79UdJhEBy1F98g84CuN7hlFMmbH+bTHg4=@buildroot.org
X-Gm-Message-State: AOJu0YxGISKTeNzkKBk7TRnNlhRFUnYk97joCmIYyoGiV4ztogC0afQ+
 yM25qY9c6/Fe4XOHgNoaviVDx+9E4Aym7+krmvz5BNWSo9qKiDwrIS+bXhQXYzuO398Ee+zs137
 Imhrf
X-Gm-Gg: ASbGncsg3XQM9VS3PK3Z29XPakk8DALqMoHsvkX+hypxqmzXSlbooHoAMsFt/qOzcSY
 cXKs/N/qYNTkv3nCzoLF4Yb9+i94+srDnxw7VYqtoUaAGy5lFUEw+tfy/Shv39V+k9E7XbPKx1K
 6r/0IkxsyheQDcmubhmkqAwbGZ+co707tfEsjtflV//Q+BAGqS8byNljCZvT8MayUFEdFcGGIYd
 UVwQHBU0NHLURozc3a7vN7o/9qlGdBQ+M/CMpj9DiQSYE0U/Fap4bpU2zGuFP3QXcznr7izZbrf
 beoUPGiDgUB1UCNVaKt1tc7e0DQLaM52lA3V5Nl5gcjxgPQ3iyohNVAzkIyCj/Z6VnRRyYL5UxS
 JfYvtUe/yrPD/oUKHTeKa7lOM
X-Google-Smtp-Source: AGHT+IFAjBoKYX9EHwkSl8mr5ByMQlelNB+XuvLL5Y/YAE6bPLbdJO59FkGiDBLII2g50zCqUwkfWg==
X-Received: by 2002:a05:6000:24c3:b0:3b8:d4c5:686f with SMTP id
 ffacd0b85a97d-3b900b83c71mr172903f8f.39.1754591059650; 
 Thu, 07 Aug 2025 11:24:19 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dc900606sm167391295e9.15.2025.08.07.11.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:19 -0700 (PDT)
To: Nathaniel Roach <nroach44@nroach44.id.au>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:18 +0200
Message-ID: <20250807182418.724971-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721120820.3901333-1-nroach44@nroach44.id.au>
References: <20250721120820.3901333-1-nroach44@nroach44.id.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591060; x=1755195860; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L8qtE7khw0Mmkn2niyMjW3S0UChKPT9Hw3ZK5Io1664=;
 b=HbRrzjyyWCI5IFHuBHzVxj26bM0pAIbCMGKpY92gPNfiLpxw6nmTEfI8Z54Jcvqsjn
 1A6exdRvJ2U6NGkfol1uCbjoXRhQpyE2gaDqxuoxRAWAVoOJ6s9QEPEtjDVvkLO0wUat
 IJwvb9JkLw8jy8FV/Mg90LSelmd5qYXYcZEib1+2jqpFSSXv4yre/HtTx98DGmPgDMRt
 +Mi2TJwe5usAlcwcbJdBnSFvRNUCtgCTRcSHmRq1YKFeZm37Kl6bn/R/uzbTc3wyP/Pb
 3hPCXUa50GRMhcPz+qHgZUDJKGwTKrw7TLYRoPPDn0e/z4I0CX2MdmuOP6hLGT94SmwS
 sgRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HbRrzjyy
Subject: Re: [Buildroot] [PATCH v2] package/sudo: Enable libxcrypt with
 glibc, allowing hashed passwords without PAM
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
> Per https://gitlab.com/buildroot.org/buildroot/-/issues/27 , on glibc
> builds without PAM, sudo will "fail" all password prompts.
> 
> It was found that it's simply checking the entered string against the
> raw hash, because 'libcryp' isn't available. On glibc, we need libxcrypt,
> so enable it and ensure sudo is built with it.
> 
> musl and uclibc do have crypt() functions, so this is not needed.
> 
> Relevant code from sudo:
>  https://github.com/sudo-project/sudo/blob/v1.9.17p1/plugins/sudoers/auth/passwd.c#L139
> 
> Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>
> 

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> Backport to 2025.02.x, 2025.05.x
> 
> Changes v1 -> v2:
>   - Update makefile logic to depend on libxcrypt regardless of PAM (h/t Julien)
>   - Update description, backport notes
> 
> Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>
> ---
>  package/sudo/Config.in | 1 +
>  package/sudo/sudo.mk   | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/sudo/Config.in b/package/sudo/Config.in
> index ee5ea542ab..85bc4859b8 100644
> --- a/package/sudo/Config.in
> +++ b/package/sudo/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_SUDO
>  	bool "sudo"
>  	# uses fork()
>  	depends on BR2_USE_MMU
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  Sudo is a program designed to allow a sysadmin to give
>  	  limited root privileges to users and log root activity. The
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index f57a86805a..0aacd8207d 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -37,6 +37,10 @@ else
>  SUDO_CONF_OPTS += --without-pam
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +SUDO_DEPENDENCIES += libxcrypt
> +endif
> +
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  SUDO_CONF_OPTS += --enable-zlib
>  SUDO_DEPENDENCIES += zlib
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
