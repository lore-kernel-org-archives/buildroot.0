Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CAEFCC067
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC75342134;
	Fri,  6 Mar 2026 19:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wncmZvBDzn4k; Fri,  6 Mar 2026 19:53:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7CC642118
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826809;
	bh=UjKi1jC+ZIomUV1iBeyVhBEMa6uZlyF6bED4zxoVHDg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=djaSexzlMVaqCwZqUGj5tBJEEQrXvNkzG++V15bFrjhc3S6smpyC5iHZJaJ4a5A4J
	 TKXiSgtrvhsWjZMA1gLozECdDIHwyRqovrKyGyj8WifHRxRn/KYUMNpdI/D3hUWdxM
	 c9dveVW+pBCIEwJp3mtaTT5kizknJxGwAAYMua8n3V1BAzFmd3TeKbMV7kAotrpuDh
	 NTS6t79Ww0K65Lg8ngirmM8t62Wf8fMDRb9A8AffqI0DP52/7wMtLoF1Ku1qGD1GwI
	 I0xfzBwoGmmtHPVzCMvdaSqI1+pcWFzNVhr/BIh0lGiR37805Pg/0WIfy3NlRgODln
	 /KwTRde0ZbUHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7CC642118;
	Fri,  6 Mar 2026 19:53:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 701C6223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE74A83D56
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Js1krdGNoW1E for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D331783D75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D331783D75
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D331783D75
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:19 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48378136adcso57543895e9.1
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826798; x=1773431598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hepprZ5d/7OvVr0t46ar4SSyUOOxMAE1uJ3d7+ynukM=;
 b=Vgsq2E8UkpCpanKlsOmfyOr2DSlKuaDxTnKowdc3+NhyMEP2uvmXf9Z5aFJXWqUS//
 JbTMGI1xLiqJ5BHUko7xk+CC1GdjGF7Q2gElrV8uu5k5un+CfUgWrYjfE0EDlOnuDkck
 DdkJtZp0SyNbwYdbnpRNkW8qYxG1DpOnCKj6rtgKr1SJIG0FIEHZB73FAhlk02ANAicw
 5o7puVDxM3VIF+CUf2EMHh95VhpyTFP9nnjJRt+hSSP43m8SU6XorQ+hr/pyeQw4f7wr
 RGH3RKp8RiiA/ZMXndebiivApBRO9mfzoioFLOtJYnmYbHnw2PGJY+FrXzzBkCx3HRs2
 GQYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+LYJ08hk6nZLfHYHZgI11toTJilxq7zi5jOsCW1hCMK2LVn3gZiTFMidpEFC/YjhViGnXhT/ixG0=@buildroot.org
X-Gm-Message-State: AOJu0Yz8qXBDKYQZaQ+Ta8KQb06TfIFviKAz7OqSKMI34rr1YOkPZTwB
 Bx6PWWOgS2H270mJiKk6MScayxs1fBkoz9xp2nmujoyzV1nJjVPudDD5gGdrqZWHTTruy+JBrmg
 +HsM4
X-Gm-Gg: ATEYQzxY18syDO41sKn9C+hOVqjs+q3XszTAUKEScPMrQX13Fo6FgMndBrJbbtKQBTq
 jfCfm6U57A0D/IYa6QWTkSleGPbOzEcRsAKJ4dPgHviRjLn+y/swyrAZaBhecYTm5De5YhzZaKS
 /9rwyTLYvFo9XY7rcxWQFXWOAuKYMZsPWRoCIVowCeZtgG/k8Z47JbRYQ57TgvzL5SRUDNAl/c0
 SEYwhASBUWeXzi+ReqDsOBHSiiFwR12hPj2EfPu6sWp0xHByZoaao95Le3zUiJsxRImDMRxylll
 mx24BMpChMdAsfswah378vVr4MQvj5rgo2kbvituhL3VbSyRYoa4Fxq2HrWYk4fbYr9MNrUiwU4
 dGGUfTqn6sz60n8cdq5YFGEIw/Gq6KUFVQay7fCuzmbf35tmleDak2qXdjNU2Z8rEw1GlZhiGgn
 cT7AgiG5lm51d1r7A=
X-Received: by 2002:a05:600c:548b:b0:477:2f7c:314f with SMTP id
 5b1f17b1804b1-485269306b5mr59184915e9.10.1772826797940; 
 Fri, 06 Mar 2026 11:53:17 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dadac2a7sm6032198f8f.15.2026.03.06.11.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:17 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:17 +0100
Message-ID: <20260306195317.8067-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260301193708.3268222-1-bernd@kuhls.net>
References: <20260301193708.3268222-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826798; x=1773431598; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hepprZ5d/7OvVr0t46ar4SSyUOOxMAE1uJ3d7+ynukM=;
 b=ZPSGf0pizGh6VA3trQi49pHYGsjar6W7sf4+oO7HyWIAn3kMOt5g9NjKqikt7VFQbF
 9LWXAuj7nDeykl4ZnjWV/gk3ZcSqGYG56moUaYcXCbavomr98mbszFol5QZgwsHYMHvc
 TGykq7Y65Z0WJqjcIuutfd8DQKo0piDBn/VC/jWaRWtN8BCFYTG1OjMHGjWvVTPdghBo
 AkfjF7exAf1TbhsUWLJnG0iAsAhwf/c6bTWDBJsYBZrDBWQk094x29rNA4lZbAkKo4Kw
 BX3NkTKi2sZPfA1i8s5WCqszbYcbIdcuy9AxdAhEMAZhEZjjyiiKc9rY/NdHD6cs9t4i
 EIkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZPSGf0pi
Subject: Re: [Buildroot] [PATCH 1/1] package/libvirt: fix dependency of lxc
 support
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
> Buildroot commit ed12e2fbed3d4298ebff9da54fe56b91fa75c41e in 2021 added
> BR2_PACKAGE_LIBVIRT_LXC which selects BR2_PACKAGE_LXC but did not add
> the dependency !BR2_TOOLCHAIN_USES_UCLIBC which was added to lxc in
> 2019 by buildroot commit 63aad8a53e33e3fae4793e05662f47637e9e9bfc
> causing Kconfig warnings:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_LXC
>   Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y]
>     && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y]
>     && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_LIBVIRT_LXC [=y] && BR2_PACKAGE_LIBVIRT [=y]
>       && BR2_PACKAGE_LIBVIRT_DAEMON [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y]
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/libvirt/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> index 5664f69dd8..0f73128d09 100644
> --- a/package/libvirt/Config.in
> +++ b/package/libvirt/Config.in
> @@ -89,12 +89,14 @@ comment "qemu needs a toolchain with gcc >= 8"
>  config BR2_PACKAGE_LIBVIRT_LXC
>  	bool "lxc"
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # lxc
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # lxc
>  	select BR2_PACKAGE_LXC
>  	help
>  	  Linux Container support
>  
> -comment "lxc needs a toolchain w/ gcc >= 4.7"
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> +comment "lxc needs a glibc or musl toolchain w/ gcc >= 4.7"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
> +		|| BR2_TOOLCHAIN_USES_UCLIBC
>  
>  endif
>  
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
