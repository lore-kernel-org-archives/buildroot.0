Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9DCC3271E
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 06:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2621161124;
	Thu, 11 Jul 2024 06:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOPCH0-I8jZr; Thu, 11 Jul 2024 06:54:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AD7B610F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AD7B610F2;
	Thu, 11 Jul 2024 06:54:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A73BB1BF3E1
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 06:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9348982090
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 06:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKBZwO9gmYKL for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 06:54:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3BBE98206D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BBE98206D
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BBE98206D
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 06:54:52 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ee98947f70so5194041fa.1
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 23:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720680890; x=1721285690;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pLcu1UUB3Qe1k+xlHu0SCiPzzF5poOOpqt3cGjR8sek=;
 b=LAx0y7meTrf/c51X+hzogB5mEJXz0fwP7xw1CvR4ZfZXeQ9IDkSbz3y7XrHQ3VWtBh
 vwlkUwEd381eBF/rJBzSAWDKlk/jhOtEHqdgm6LYm8gDwtYFwGMR5jIZ1tzLqVMuug4b
 PLGTFwzJE9k/mIdDgmUYs29RqO6UanMKUGYURYA3001Q6b8hrKdTfR9iDVSjMmhSRsDV
 yCztI1KZEakXNcKKm66YYUAmvWikrthjT/wR3ofw9Fp5qYfB/IajPDWXHIH9QKNwoQ4h
 d2f4pgBZtSGMVo+XH0whyvXxcyU3zmgf1z17jFD2xdP1Ly0boWmsa6mggA7qaZctQlRX
 qxfA==
X-Gm-Message-State: AOJu0YzZ0bqHdKLLNa16qOALExQ8upuOa4Lz+s3tsl+xEX7s6gr/h86S
 i4BP1lq43pzOzCIw766EBMby93/PYyqYM7B8B/6RdGFkTheExxgsgTQp7OfHQIhyZw291vHXBM6
 AKY1GcgU22+Wir53CsKMnec7tfTBs+CK+
X-Google-Smtp-Source: AGHT+IGef4rDLm5E/a8rCYz1TVIgLdmrhKUMsxHp6y5zjqZEHlWQ7D3sXRmKXuNHvZEaBVwzkPh2XdANfjBBbaKP6r0=
X-Received: by 2002:a2e:90d0:0:b0:2ee:80b2:1e99 with SMTP id
 38308e7fff4ca-2eeb31977famr44910261fa.44.1720680889471; Wed, 10 Jul 2024
 23:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240708210353.7865483D7D@busybox.osuosl.org>
In-Reply-To: <20240708210353.7865483D7D@busybox.osuosl.org>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 11 Jul 2024 08:54:37 +0200
Message-ID: <CAEyMn7YCPEKxChPE5z3d2VECaSqT08E9N2aONgiBdyV1a=Wu7Q@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720680890; x=1721285690; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pLcu1UUB3Qe1k+xlHu0SCiPzzF5poOOpqt3cGjR8sek=;
 b=MHusWy1gifGxJOM9v09czVzYZbT3QTY52oqAV8FQAZizclytlOnt7bH60BmMOOk6dB
 kN72N/tdAT+B6BmtV5fGuw6K4HWcBvrPT2ds1qtLZHV8PnW4/bK4ywF5Wqve+Ug8sof+
 DB6Qj32uCMZN66GViQj3UJ8ZMnnc4n3lu/fqAqOnDuc/Maba27QIYeXHvuaLx0ZBzimQ
 2XT/AN9+QzeECHZM8MQu4IXcZT1wfzzm4SfYLW8H2CHJK6yTOXkL7GIcyRBVsUDI+55y
 fZjH8BGp5WezZWLWrRt3+zujtw3dEU0+SVegKjPDU3sF042Zr0nwRDQJx/xOlVtzrX0Q
 2FVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MHusWy1g
Subject: Re: [Buildroot] [git commit] package/rauc: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,


Am Mo., 8. Juli 2024 um 23:04 Uhr schrieb Peter Korsgaard <peter@korsgaard.com>:
>
> commit: https://git.buildroot.net/buildroot/commit/?id=e8f80c24026110390ac9d53829e50f0a95d3206a
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> This fixes link time errors, undefined references to various ENGINE_*
> functions (paths shortened to the output directory):
>
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `get_pkcs11_engine.constprop.0':
> signature.c:(.text.get_pkcs11_engine.constprop.0+0x14): undefined reference to `ENGINE_load_builtin_engines'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x20): undefined reference to `ENGINE_by_id'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x54): undefined reference to `ENGINE_ctrl_cmd_string'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x60): undefined reference to `ENGINE_init'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0xe0): undefined reference to `ENGINE_ctrl_cmd_string'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x128): undefined reference to `ENGINE_free'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x1a4): undefined reference to `ENGINE_finish'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `load_cert':
> signature.c:(.text.load_cert+0x114): undefined reference to `ENGINE_ctrl_cmd'
> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `load_key':
> signature.c:(.text.load_key+0x124): undefined reference to `ENGINE_load_private_key'
>
> Before linking there were matching implicit declaration warnings
> during compile.
>
> [Peter: only select if libopenssl backend is used]
> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
> Tested-by: Heiko Thiery <heiko.thiery@mail.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/rauc/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/rauc/Config.in b/package/rauc/Config.in
> index 7451b29a55..01a321e3dd 100644
> --- a/package/rauc/Config.in
> +++ b/package/rauc/Config.in
> @@ -5,6 +5,8 @@ config BR2_PACKAGE_RAUC
>         depends on BR2_USE_WCHAR # glib2
>         select BR2_PACKAGE_LIBGLIB2
>         select BR2_PACKAGE_OPENSSL
> +       # uses ENGINE_* API
> +       select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
>         select BR2_PACKAGE_SQUASHFS # run-time dependency
>         select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # run-time dependency
>         select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


This patch fixes also 2024.02.x (see
http://autobuild.buildroot.net/results/991681bbe0200c652c6d77e5abd9966ef6ca2739/)

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
