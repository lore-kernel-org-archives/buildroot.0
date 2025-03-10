Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A0AC282EC
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 06:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF567409D0;
	Mon, 10 Mar 2025 06:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYQ_Rj8z3agh; Mon, 10 Mar 2025 06:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C39DA409F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C39DA409F9;
	Mon, 10 Mar 2025 06:01:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 655201C1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 06:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D41E4040E
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 06:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjlYlH3dQmIh for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 06:01:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 412C1400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 412C1400BA
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 412C1400BA
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 06:01:00 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2feb96064e4so7493535a91.1
 for <buildroot@buildroot.org>; Sun, 09 Mar 2025 23:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741586460; x=1742191260;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I4nAYxD3l8/2fELAEK/stL8vsXzJeuRqzrPP8RDTe3Y=;
 b=m4E45FYttIBm0EVCa3Y5jesPbLRMZouU/5t/A8jGCqkkXo8OYCvUUZA80yQRXS6YlO
 SdjQkeATWstgu0SLzauJ3BDemjcyCGwuWYezx4UxhVoHzI9B5hxIL7G9Y23Ma1kTBXY5
 fjMPl3+YcvV5B1PNUN7EViUQ0xB9w0sNeP7SEBLBYXd0CjeqlTPomHTMoO/U1+E7oEpI
 CoYjTicsOBPSPBBSo2gOIsecyqMGFU3e7WWV0oe06GSQLx8OrGkr8dtdxXpD408n5COr
 zFc3iWNLHDaH/YGpr97tJkloFVqmmag5OQybzp3vwkED54ppKHXoL+RIHifiJCYfbCzq
 WJFQ==
X-Gm-Message-State: AOJu0Ywywb4nFYWUR+7/aJrZWbLu5HZzAC1yVI6lLZP5mUsroQxmEnAh
 sr6SvzCzj9xLMrRiX9LvGu/8pGKIroXTpt6Z2yvQoIk+vG6CtozEtQTUamZCa7uCT8ynhhpBeSe
 B
X-Gm-Gg: ASbGnctEpUR2tL6qOawad5notnEa05/HlXjLXkNIl/Ul03egIK2CE8Km+hbh8Pdb93S
 Y48VzwTusfF2CMjQA7SE2Jf6tRq3wfpVhcHAKsDU9t9cXBIyOEqJ8Lg00WCPOBD5HdzS9S5qCsC
 fj4olMj5Pxu9ly39O9ZMV1vBT1WH5OTxGXAQJEIcljuRPyHTBx8XAGg6piNpeF5pGGLn1tPV+uU
 NzWrbJe/bdYAikDTZMMeM/PF/5K55Xnh9Lb/8S7bzsBTwhzhW1RkDqtJ+JSILp248t8QH9uMu+V
 1dKwTnjNy4mJF7nmMH1+KXrZpFIc7nnjF4aenRw=
X-Google-Smtp-Source: AGHT+IGVL/Ly99bObiGHTeAqvNHFyXJPbXXLU9uM604A7YbqvKD+ozR+f2XI6C+psnWj8rPchmr+MQ==
X-Received: by 2002:a05:6a00:cc2:b0:736:3be3:3d76 with SMTP id
 d2e1a72fcca58-736aaaabb86mr17933623b3a.17.1741586459828; 
 Sun, 09 Mar 2025 23:00:59 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:677:c5f4:a978:3253])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736ac1997c9sm5678539b3a.113.2025.03.09.23.00.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 23:00:59 -0700 (PDT)
Date: Sun, 9 Mar 2025 23:00:57 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: buildroot@buildroot.org
Message-ID: <Z86AGdrKHaUqgLVt@ghost>
References: <Z85-NfSRZVA9VxK6@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z85-NfSRZVA9VxK6@ghost>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741586460; x=1742191260;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I4nAYxD3l8/2fELAEK/stL8vsXzJeuRqzrPP8RDTe3Y=;
 b=BXmU1PP+mDi3HeZBAXBca9LIGHPZL1sbOWkuX8/qbUwnXykIpb2gJmjdnk7k66dKo/
 +/gNIXHMSYOGYqGX08ZnqeQDN/FCW0jPJ/8kvg8TcY6saUxDirhvMIviRW4wxruDvTrg
 zYC6nktp/QRzMmOH2o0aCC8Shj2Ztje9cT5QrWbASPvzd/gDQMGT68he3VkRm1kHaIwO
 BOiNNqBHJ4gl92/ZS6Ti3NQwhEOlmDQvn4lvWoaTInhbKnBhhhIxy0qM+VdMEPuyMMAG
 DXWjNhEw2x7MevOnnkFygt5ni4VXGZirExduKwlpLiEtswwsPINO8XIq6Iq4MM+pQFlB
 PkgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=BXmU1PP+
Subject: Re: [Buildroot] Crosstool-ng external toolchain with
 BR2_ROOTFS_MERGED_USR
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Mar 09, 2025 at 10:52:53PM -0700, Charlie Jenkins wrote:
> I am trying to use a crosstool-ng build toolchain in Buildroot with the
> BR2_ROOTFS_MERGED_USR option enabled. However, crosstool-ng installs
> the sysroot libs at /lib instead /usr/lib as BR2_ROOTFS_MERGED_USR
> expects. I am not sure what the best solution for this is. Should
> BR2_ROOTFS_MERGED_USR be ignored for toolchain packages when an external
> toolchain is being used?

I meant to add more information about the failure...

Because crosstool-ng installs the libs at /lib instead of /usr/lib, the
libraries end up getting symlinked into nothingness. For example:

$ ls -l ./output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so
lrwxrwxrwx 1 charlie rvs 6 Mar  9 22:58 ./output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so -> ../../

> 
> My crosstool-ng config is:
> CT_CONFIG_VERSION="4"
> CT_ARCH_RISCV=y
> # CT_DEMULTILIB is not set
> CT_ARCH_USE_MMU=y
> CT_ARCH_64=y
> CT_ARCH_ARCH="rv64gc"
> CT_KERNEL_LINUX=y
> CT_CC_LANG_CXX=y
> CT_DEBUG_GDB=y
> # CT_GDB_CROSS_PYTHON is not set
> # CT_GDB_GDBSERVER is not set
> 
> My buildroot config is:
> BR2_riscv=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="<path to built crosstool-ng toolchain>"
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-unknown-linux-gnu"
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_11=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> # BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
> # BR2_STRIP_strip is not set
> BR2_ROOTFS_MERGED_USR=y
> 
> - Charlie
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
