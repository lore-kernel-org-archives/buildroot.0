Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F91CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50AA7608DE;
	Sat, 10 Oct 2026 09:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IBZsgKk-PT7; Sat, 10 Oct 2026 09:23:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3D045608E9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624202;
	b=hp//SviUpp0FymdovfLpcCwFaKtJAM4v5fv5+QCSCIf74edWApQ7TNAjU/sZZjAWxCrA
	 /v5h7pMEEtq5S8l291wTvxJ8e9A+bXIC9DlbLVos/y3fbf+cfyyaEJSaT6aHU4Zb6wIFy
	 fcciM3enF1+JAw46mo+3RhTRiGZ0AJz4MNOaTlp704rgehsFqtdQ/zaj7VaZlyQSLKqsD
	 /iczZzgkCM2WLb+4WiAxQJ41XqkFGDwFEuV1gaVN70AuGiNdQnammwO+TWyu7rGX4jhBV
	 AtfzlpKzjcTYKjRYCnDhNApFN3+x62D3e8kRJd64yOvTTk7Q26cdrXMMOKNy2wULE7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624202;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Fawvl70OFKWzCgGcxXrrs92i6dyVasUn6nFyI6r04Xc=;
	b=QnkIlmQx2UsnEQ0XIVMjTc1uKBvLlP3uUBcXEwRkRKyWYobR2y7y7XyGtBIGB5+asX44
	 Hhk3v8UCaMG50q+KoUAgfyXBnR9A1A1WUs7tFRPr+l83sWmCngWHumRNsK0TeeqrrQWAh
	 xCWBsgCVH/fe+iTA5O/8wtlYLjU6weCFOPsMAYTND5px0TkkgBGrC+a8pevUo2OFBJ6jT
	 d5QRs96VzynG666T1zqz1CDANrucj5CAMp36HnS5gMExz0demr8MRhu3/CaY7znokfTTG
	 h3/fWzcVtKS5ML9qhcG45WI3jLgpf7UPSiaXskEjBXQNoXWMPOQgUlXfabIurcKMdVA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624202;
	bh=Fawvl70OFKWzCgGcxXrrs92i6dyVasUn6nFyI6r04Xc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q9ODlfpWD2RcffGyDcuuFdQyFWytUTPJquAbNR+3p8orSklQtaddKQBU15kEqptFc
	 ZWOgnwkLGNAfR5ht14ZVynm+UgrQ1oXDpTp8IlmB+iQVLKlNSOQMbqPnzD1yWmGXsM
	 DjcslDqL5n3ttPWI1IkX0hUeDcLjYq+AbATEjih35GrsbmelIzDLQNTBt4yNV5GtAY
	 HEtQkqkbz2feGSCVk/r/8wp+yYsG0vCZIFoKeoVK8kswVysCwq0hQhwFtwgb2D8EJA
	 K2CLJhATwxDYGm5d5RhC9U9Mx+c9at3Bm324VS6twddjU4BCtZjbN+QC7X907nwrCN
	 FPog9oQhV+Fug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D045608E9;
	Sat, 10 Oct 2026 09:23:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C38A675
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8FEE60A3F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id auWT3tWcEfKe for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 68F49608E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624195;
 b=aLfvpCe1QTB7RQ1LIMvHEf9O7dkchf/8VdIA2lrM5geRFSpsTPxTKLt4kjBDhsJ4p9bN
 tNpL6+qg8FWFC4mPCJe1UtxIfUZy1CB+ccZJ+gUUoYyZa5zLgsCQmH/DAPJ5c7p+aiquz
 FS4gKjEvN8xg8n3+DTskEJp6DX8gPmxuftADQtYBBibzc+843cZKbRhyRzFGl6jbt+Vdr
 ntxWa/bPJ7K1XNKGSYxdXHbio3x2FpIddjwNb9JjjThFkYCfzGEj7Yx6Fv2p8sUKm3n9S
 qs96nSd6/pwppD+Mjgz97WlwGVFYtKuHXku0QRu2J3nyYIQtiyDz0+vP+Ng1Uku/R4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624195;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=QFtoC2pFNDRcIzTxZ0a5ZMQ0h8BEuhzI9/hSyKCY7gg=;
 b=eXAR77SFwSFS1W1jyVqIR3LjTMnEVuDVh0im+aMRE4SKqQui5kfxX+Yq7mfOWqxhPQcp
 TIDjXgrT3Wy+z+tKs0QQbZFruCoXw3DzKCEl9F0rtkvs/rEXj1Tv507hyn6ogMer4ukV+
 GS7Zh4H7S9lDa0pUo/UoqcUNrYTemQqXg4ihCfQeApOSa+gDiPtrc/aBKpdAZkdaOxKLF
 rWMM7DLkMXaEhsVcPIBd25gqLoOvs9k0sU5oEXi7lplLU1jXRAlrVLkzuHs30c7l6ia9H
 4Y/hqajAXQYA8YycQ8UL4SOIL/JTjJJwERyi0FHSQoU5YBZT1WiFcLwzLevClX0yrXA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YhE0ewgM; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68F49608E9
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48c411d6615so235434f8f.3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624193; x=1792228993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QFtoC2pFNDRcIzTxZ0a5ZMQ0h8BEuhzI9/hSyKCY7gg=;
 b=mcCtacApsYTkKioXatM21hoQmfurmVYrZ6sBU8d1dlKIUDrK1xlYhZEKrY5xbthv+E
 Ll2jp1gb0Bn0PGWdVi3hKvZmgm2nFd0N+BYZHWWgemLws63Zeng1B8WPHphSW7tQhEvn
 TZSAHVVrq9E17T8sq/wZwi3otsmu+HKoka0TRAqOT4qc7puw0uH4DUzY9DtB2OQLENXT
 YScNWfdro4QFEk+SCmddajz54EVgG97bt8dDzbrvPQprsOkAv3UjRnJAGNZKQ90+DmUK
 h1LoKjvMYVwuNoAFHmHLalCkxrXl/GkEf50qugUN1EftPaYurtZtP1cKq1IMJvbdkhjY
 G4uA==
X-Forwarded-Encrypted: i=1;
 AKwUvBygwdBR5GrWthquF6n+lH4J4aj+EqjEuScjyjcIacxfuPyFOcVLKF9Fub4W7hpqUFXhj7oHwKUrSyc=@buildroot.org
X-Gm-Message-State: AFq9FYIJiH9t1cxcqjp1bYGefaoQ9iI+J+v8Tca4j62VdGFpPk6kIz5A
 qPZQsWbAmK8IXU6UQOrzMGrIblFjFZEP5ZkNWDpoaLbh56Vv/WVWMXkgJ35wtOAoM9Q=
X-Gm-Gg: AYBFou2cUlU1EepD+6+6Xw55f1gii7mIJamS+U+p7/mE75vph5DwlyIUE/j1QUucbVw
 s0cbYmYpTYoILVdGKvPgQu0QeclY5VHLtk9N8/5qturS1tOZFH/ZFqDgGw/tQ/NTUvDtritvaGh
 +d5J+xxnW+hsJR0ro61b+ITNzz+O5wyxC9GFnAibySEMWQTReEFHrn7mlef9iKTnAKj8Xoprfj0
 lrX/9HpU4cDC5KAxBodprO+JCoT+tyoBvR5Tu/vHASettNh0RmniCI23JdodChml5LQWHb/SZw1
 4hLH7HtiAkbTIjzNhVFpv3W+87rpU+YT7euysvGNNh325M8UnZKCsr2tHgZ3iC6jB5OVp/7IrEF
 rCXPC2T2V/d7ZCmWMhNPV6pjw5WrHy1yPPbWLXYjRnf1pYB3NDpFiz6fqkztlcGRX23ev730yGc
 4AqU6TfsXvpCk5juOzvN7ilimntfULu7d+bIKs0tebmI/TuzMT6fCg9MmKvIhYUf2f8H+zL38WO
 0XIq4KkfAiGyH75TNqal56Zj4OOoEIwLsLqKJZo4MjpyO0QVQKfA+yI
X-Received: by 2002:a05:6000:18a8:b0:48a:fb26:23a4 with SMTP id
 ffacd0b85a97d-48dbacdeb33mr8663184f8f.31.1791624193017; 
 Sat, 10 Oct 2026 02:23:13 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9462ebcsm8836442f8f.8.2026.10.10.02.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:12 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:11 +0200
Message-ID: <20261010092311.139288-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926130006.243930-1-bernd@kuhls.net>
References: <20260926130006.243930-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mpg123: remove MMU dependency
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
> Buildroot commit f0862592b3caf5bc9cd347fd29634673cfbbabd7 added the
> dependency to BR2_USE_MMU in 2014.
> Upstream made fork() optional in 2022:
> https://github.com/madebr/mpg123/commit/91f75fc026e37d88d25229b81c58bcf8d6d2a8eb
> 
> This change reveals a previously hidden build error with the toolchain
> bootlin-armv7m-uclibc:
> 
> src/libmpg123/synth_arm_accurate.S: Assembler messages:
> src/libmpg123/synth_arm_accurate.S:22: Error: selected processor does
>  not support ARM opcodes
> src/libmpg123/synth_arm_accurate.S:31: Error: attempt to use an ARM
>  instruction on a Thumb-only processor --
>  `stmfd sp!,{r4,r5,r6,r7,r8,r9,r10,r11,lr}'
> src/libmpg123/synth_arm_accurate.S:33: Error: attempt to use an ARM
>  instruction on a Thumb-only processor -- `add r0,r0,#64'
> [...]
> 
> To fix the problem we limit ARM code to !BR2_ARM_INSTRUCTIONS_THUMB2.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
> Gitlab pipelines for mpg123 passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/85dfb60e8f4fbe0caa74674d91c54400c288ec10
> 
> Gitlab pipelines for squeezelite passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/f5549196dd9e923e3c83e809a5e170da44551c75
> 
> with the exception of an unrelated build error at
> bootlin-x86-i686-musl/build/ffmpeg-6.1.5/.stamp_built
> 
> /builds/bkuhls/buildroot/br-test-pkg/bootlin-x86-i686-musl/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
>  read-only segment has dynamic relocations
> collect2: error: ld returned 1 exit status
> 
>  package/mpg123/Config.in      | 1 -
>  package/mpg123/mpg123.mk      | 2 +-
>  package/squeezelite/Config.in | 2 --
>  3 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/mpg123/Config.in b/package/mpg123/Config.in
> index 73ca1c740c..8cbc3a4758 100644
> --- a/package/mpg123/Config.in
> +++ b/package/mpg123/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_MPG123
>  	bool "mpg123"
> -	depends on BR2_USE_MMU # fork - in the application
>  	help
>  	  Fast, free and portable MPEG audio player for Unix. It
>  	  supports MPEG 1.0/2.0 layers 1, 2 and 3.
> diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
> index 17445395ae..0318cb4810 100644
> --- a/package/mpg123/mpg123.mk
> +++ b/package/mpg123/mpg123.mk
> @@ -26,7 +26,7 @@ ifeq ($(BR2_aarch64),y)
>  MPG123_CPU = aarch64
>  endif
>  
> -ifeq ($(BR2_arm),y)
> +ifeq ($(BR2_arm)x$(BR2_ARM_INSTRUCTIONS_THUMB2),yx)
>  ifeq ($(or $(BR2_ARM_CPU_HAS_NEON),$(BR2_ARM_CPU_HAS_VFPV2)),y)
>  MPG123_CPU = arm_fpu
>  else
> diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
> index a034759143..0bdc43ce6c 100644
> --- a/package/squeezelite/Config.in
> +++ b/package/squeezelite/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_SQUEEZELITE
>  	bool "squeezelite"
>  	depends on BR2_USE_WCHAR # flac
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -	depends on BR2_USE_MMU # mpg123
>  	depends on !BR2_STATIC_LIBS # dlopen
>  	select BR2_PACKAGE_ALSA_LIB
>  	select BR2_PACKAGE_ALSA_LIB_MIXER
> @@ -44,6 +43,5 @@ config BR2_PACKAGE_SQUEEZELITE_VISEXPORT
>  endif
>  
>  comment "squeezelite needs a toolchain w/ wchar, NPTL, dynamic library"
> -	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
>  		|| BR2_STATIC_LIBS
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
