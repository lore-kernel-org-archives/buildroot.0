Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68478C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37FF04068C;
	Thu,  7 Aug 2025 18:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khksMqM6Mlg6; Thu,  7 Aug 2025 18:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 533B440677
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 533B440677;
	Thu,  7 Aug 2025 18:25:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34C324C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19B5F80F17
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMfa90TiCqpz for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:25:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3123380EEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3123380EEC
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3123380EEC
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-458baf449cbso12998565e9.0
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591109; x=1755195909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z55IBV8gAMVxUn/01KwuShz2uWbA1rphvoN79xoSPRs=;
 b=rfEVJYondDKReE1dhPSZP62JHNzBBwq/o6LrODg1Cb8Q6K2+gSdSpjChJrI++vP4P+
 /hFJ2vxWbNbdCD+tKuZp2uBDR+4py8WZKjFsTtZHJ88LiM2vyA6t8V/QRLD/xHKH3MNb
 1tnOq7GLzIRef0BwmUIuf/C2+uGovEdRHtfmC0lWDrQyQMj2Q/U3Kxa00V4D41TelDLo
 nUCBpA8T8tq6fq6ucBMxFOocc8zS6T5nhTFI5grlwzfs/VC/cSDnc6G9DSOZ8qqeHc69
 qP2SCcOxEkvg6iYJR5EodCbU4qOdb+34Cmad2U/bm8PgFhLKoZSNb/oXnlNCVeA8pabO
 dhcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUINL1FQn6b0FR4Mvkif60BpF469Y321imAX1DcZjHihWY1TKMVdmYuygtP6bkXD6f92JdNVzJi28w=@buildroot.org
X-Gm-Message-State: AOJu0YyYYXnxNS4ICJrQV/QgMp0stm0UlEmVJf1LbcZaQ7P1yNIJoUxP
 TT0ctPSpcsQOq/rHWHmGxwy4fFi6NN5fUwBIZUfkwj1XqpsDT6neZGkzkpCzdQh7sHa73clg0nZ
 iRa3o
X-Gm-Gg: ASbGnctzFMFLxWvPv3OKUKRNVIeCk5TUYbJXB6X8nK6ab0UGihz1EvAkJCONV+eY5Ey
 wQ98OUQthB7muJVeUhrMTvNDh8sXPZ5YM7JckDmgI2XkKM8RvcOfV+Sx5SD/Sy02NIhyGYzD7TJ
 y0+ucLstFjdwwxSKrKgwxkzdv/iKTknJZ6RgybEUDzHMvMgCD15cxMxxmd+kVLE0+HumwwU9o9+
 6HQXnRblFI+iZl7Q5wQwVzEpNXpQWc+SS7PyXCcDmhNFp+x7Vb2XagsJgS6mLC6/13P0B96xrJi
 xtNqwlnlZjYSY6DpUhLbG2rmEFy9cVQlFNnS248N0mgpMULoMaksHWkWaEWLnfawJrzUNqL1+xt
 DT7ADQxI6rP2vNA==
X-Google-Smtp-Source: AGHT+IGzvRLwpNp0qPQ72P6WxrOKVH5UKtd2Xs8Z8IdLdxh9lgpqZabqF9e9FpEw8BkamJFwi7a+DA==
X-Received: by 2002:a05:6000:188f:b0:3b8:fb9d:248a with SMTP id
 ffacd0b85a97d-3b900b507e6mr200238f8f.24.1754591109193; 
 Thu, 07 Aug 2025 11:25:09 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453328sm29118058f8f.46.2025.08.07.11.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:25:08 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:25:08 +0200
Message-ID: <20250807182508.726769-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <725a89cbad59708b94cac3eddb422dc5a0d305dc.1752554987.git.yann.morin@orange.com>
References: <725a89cbad59708b94cac3eddb422dc5a0d305dc.1752554987.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591109; x=1755195909; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z55IBV8gAMVxUn/01KwuShz2uWbA1rphvoN79xoSPRs=;
 b=Kidh8VU0DMeZ/ulQ6S/myoB2x0mg/ifJVS6+t8JipwN9jSShFLShMZxy2C3i8NyGyJ
 AmH6ykPeyk6eyoJ+asHAzTBQOKdmzDwrE8hleARju98KEDm8HNaS4A54Er39bYvwZ0B6
 PS9kdrF4CNM2xfOkkEEIWLRChLD4mWhBxfjzpknE2COk+N8t0lOmZrkba1IAJfdW1LIG
 2kaktyygJaZVeTnExlOa7qgUiYGDfcKeQn+v0FVqBqUFwFPyV0hEwHYgmdXvQHTYjS3P
 zhYlbl8sMirhCYebuSzLaBJOSE29bYJ0sndmluuiQj+Sj1bZ+73v81ve4bd6is6574D8
 jvow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Kidh8VU0
Subject: Re: [Buildroot] [PATCH] package/passt: needs headers >= 5.0
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
> Upstream passt only documents runtime dependencies; and they advertise
> being able to run on kernel 3.8 or later. However, they do not document
> the build dependencies.
> 
> As reported by Julien, since 2024_12_11.09478d5, upstream requires
> kernel headers >= 5.0, as they make use of linux/vhost_types.h, only
> introduced in 5.0.
> 
> Add a dependency to kernel headers, and propagate it to podman's passt
> backend.
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> 

Applied to 2025.05.x. Thanks

> ---
> Changes v1 -> v2:
>   - only hide the passt backend, not the whole of podman  (Julien)
> ---
>  package/passt/Config.in  | 4 ++++
>  package/podman/Config.in | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/passt/Config.in b/package/passt/Config.in
> index a2d2f4f1fe..a93a088670 100644
> --- a/package/passt/Config.in
> +++ b/package/passt/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PASST
>  	bool "passt"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
>  	help
>  	  passt: Plug A Simple Socket Transport
>  	  pasta: Pack A Subtle Tap Abstraction
> @@ -17,3 +18,6 @@ config BR2_PACKAGE_PASST
>  	  hence not requiring any capabilities or privileges.
>  
>  	  https://passt.top/passt/about/
> +
> +comment "passt needs a toolchain w/ headers >= 5.0"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
> diff --git a/package/podman/Config.in b/package/podman/Config.in
> index 6bfd477f38..a6554a3ddc 100644
> --- a/package/podman/Config.in
> +++ b/package/podman/Config.in
> @@ -72,8 +72,12 @@ choice
>  
>  config BR2_PACKAGE_PODMAN_NET_PASST
>  	bool "passt/pasta"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0  # passt
>  	select BR2_PACKAGE_PASST  # runtime
>  
> +comment "passt/pasta backend needs a toolchain w/ headers >= 5.0"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
> +
>  config BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS
>  	bool "slirp4netns"
>  	select BR2_PACKAGE_SLIRP4NETNS  # runtime
> -- 
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
