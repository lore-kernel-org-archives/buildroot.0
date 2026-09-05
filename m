Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55919C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 13:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73B0080F72;
	Sat,  5 Sep 2026 13:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgziXWnTG2fD; Sat,  5 Sep 2026 13:58:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7573D80F6E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788616710;
	b=iMcI4EzdxrkNRrHuCFoyneY4XPUtRPP6PefsPDWAbXa30k2DyBZxxRmmGg3emJ0Qaegt
	 RNyZgyTBw9ZiFKBVzBYpNXuiJmX1UR3lFK04E9AU//I6Btl27S97sDFlsMIJ8/zyi/nL3
	 7N5A5+l39meIDM4DoLOtvS3jkwwoHq4Plm9mJzvtzezGOQ2XxXJlJqUsdo2vo+4haPbhW
	 DbDsT3f/txo3Buouqde/hf0oUKQaMl4L+bxG3N6LRSdDFszWxVYve9CUiJ4Pg0PrdsT6Y
	 DyLe+KA1D8dp7xe6WsO68kj4VkMR+NJIN5C4Zas4J4K1dOHwGcutg/XIW1dWrDFXq0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788616710;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JP7tPQ3XlKqPpPRvyYTg64eh89BR/0T3RUof30ro9ec=;
	b=X6QxId8n0Tn8GushkhCz+w/eHz2UYFt9rYEJ88Xbr5fCbP0AB4hsPc8Dmgm28Ylzh3FE
	 +iFlOiQE0vD6zFQQPQRmvcWkTjTAOE21BXq6a1Vz/TTj9ElEDtOtOZ5LIteQ5/23sFO16
	 c4RM2HFQYVwikoS38k/EkFQPwqamzHPJNBtrChoPm6nm1CPF+eFIlhE85F7ow6CzHnaNv
	 K4exQQzsMzTyM4pXY1PCU+djCki5YL3qp0k9IV2FkIViIrHyevZzoKDu+bVVRCt+0PbCH
	 odHQvWCfb4gdrZHN/jAsl4VEOsPPdUhvc/6Fr24uQAy4LDIW4X1o+JxPg2i0tRNCyVg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788616710;
	bh=JP7tPQ3XlKqPpPRvyYTg64eh89BR/0T3RUof30ro9ec=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QZSBIvem1L3Ag7GOmVknjm1AvCQIMktntETLZ1R4MmD7iHQt5RqM8I5XaAMnVBGMz
	 AiOZUCxMDW8ol2M66NQnLQa9CwRO3ySB+/BgOVSQmmBlRnFOcEQo/YR5B05aNdKQNj
	 fMqGSgxu9O3xym3pEu8397cTUy9r5vymjA2KmMVuThbw2KTyk6rDgpM3S7ck7XZyLX
	 Mti28czXjhRljIYkFOgSdvIIHH6qz59e8ztOynvqrFHDSAVTgLDpdjHlBJP8xZDEC8
	 KPFUOYs+T3EA9xZaWKNTWjhkDuW1Le2rOabYZriZm2S+zQvrMxTvguOtymhPTiPean
	 QG2wTXCs5S3/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7573D80F6E;
	Sat,  5 Sep 2026 13:58:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 384C749D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29FF46060B
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0Wt0V3GFeki for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 13:58:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4980F60604
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788616705;
 b=FZJg2qetC1p2wzBEUDxiDawYjLyuJPnxWpmG9t5PVDSYMIKkO18iYAfLgpldenSiPsOn
 /kn/Lkk6g4zNMF7oKtuaQCnNNDm8/aU3mwOeEuLzx9Z+yILkpvoZEavkM/1+blcqzpwzE
 5HgDtlO3t+Jyx4A0sxH34aa9h7er56vMAhxgGSVBH9lyrmdWjpTBkZOOPol0Hqd4aOXqn
 D5hXtuO56B26QpnY3jNZuPW8Sm8f7Niyxpmm3W3iJ3DOj2N0XRbPCML9Ky9VIRw0ryKb5
 iZZ4hB4atLFeAd/TAk73A3x+6s5aiKKSy3s9GvBXUpfhmEaKDq7XemDIf56P7QaZA3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788616705;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=bEYeKPGA77AtZArWjCWyyq8waDzmsX1vvHL3p1XBl9Y=;
 b=P/uJAXDY5MgU9sz5v48jk2ngrsJ+feCFyJYjQRm9/7hu5hYPnSk9lNAa2ipUZfZMRNnW
 gy7g0WhoMizcB78eLj7BlBlzI/JNNRGcljAsKdvY4NRq7jvXh9JNEsb5aHbXwHQzYz5Cn
 QJwqz4XmAZ1InnV1uI0TZQ+HwxcSDWUDDT3DUxskAy5aEnGzZ+9oDtzipaBH3n8aOJEm5
 0Oj3hCuHUVX43gqwUedhCzNc8X4Fnjsq1QuSg3DTpkRnrnfkiyTETca43BJ+37w5sIX/8
 iScxKnh4SvGW1V242FuyaWh3eYPOtltQAnTfqM3P6wZwmssJQLGSvmVuj0httXrJ6sw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=cjxZQwOL; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4980F60604
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:58:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 427901A1901
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:58:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 18ADC60233;
 Sat,  5 Sep 2026 13:58:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B119F11C783E9; 
 Sat,  5 Sep 2026 15:58:15 +0200 (CEST)
Date: Sat, 5 Sep 2026 15:58:15 +0200
To: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Cc: buildroot@buildroot.org, Christopher Obbard <obbardc@gmail.com>
Message-ID: <apwfqRATqEGdN3SL@windsurf>
References: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-0-42eceaa12f55@oss.qualcomm.com>
 <20260831-wip-obbardc-package-dtui-fix-armv5-v2-2-42eceaa12f55@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-2-42eceaa12f55@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 2/2] package/dtui: require 64-bit atomic
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, Aug 31, 2026 at 04:49:58PM +0100, Christopher Obbard via buildroot wrote:
> dtui depends on tui-textarea which unconditionally imports AtomicU64 in
> src/widget.rs to pack a viewport rectangle into a single atomic word:
> 
>   use std::sync::atomic::{AtomicU64, Ordering};
>   pub struct Viewport(AtomicU64);
> 
> As there is no cfg(target_has_atomic) guard in tui-textarea, its
> build fails on any target for which rustc does not provide 64-bit
> atomics with:
> 
>   Compiling tui-textarea v0.7.0
>   error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
>     --> .../dtui-3.0.0/VENDOR/tui-textarea/src/widget.rs:10:25
>      |
>   10 | use std::sync::atomic::{AtomicU64, Ordering};
>      |                         ^^^^^^^^^ no `AtomicU64` in `sync::atomic`
>      |
>   help: a similar name exists in the module
>      |
>   10 - use std::sync::atomic::{AtomicU64, Ordering};
>   10 + use std::sync::atomic::{AtomicU32, Ordering};
> 
> This has been reported to tui-textarea upstream, but unfortunately the
> project seems to be unmaintained (issue linked below). A sane workaround
> is to disable the package on targets which lack 64-bit atomic support,
> which is exactly what BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_64
> describes: it is n for armv5te-unknown-linux-{gnu,musl}eabi and
> powerpc-unknown-linux-gnu, the only rust targets Buildroot can generate
> which lack 64-bit atomics, and y everywhere else.
> 
> The same problem was hit by package/dust and worked around in commit
> 3abc3b97bad9 ("package/dust: bump to version 1.1.2") by bumping to a
> version in which upstream had added the missing guard. That is not an
> option here as tui-textarea 0.7.0 is the latest release.
> 
> Note that a runtime test for dtui cannot use the default
> infra.basetest.BASIC_TOOLCHAIN_CONFIG, since that builds with
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE, where dtui is now
> disabled; such a test would need an armv7 or aarch64 toolchain instead.
> 
> Build tested with utils/test-pkg against:
> - BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
> - BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
> - BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
> 
> all three fail with the above error before this change and are skipped
> after it, while armv7 (glibc and musl), aarch64, powerpc64le and x86-64
> still select and build the package.
> 
> Link: https://github.com/rhysd/tui-textarea/issues/66
> Fixes: https://autobuild.buildroot.org/results/188f6442371500731453f75983590c922eab6d57
> Fixes: https://autobuild.buildroot.org/results/e254db2654f18f1d2110eb8b1a32b43ad0f2a3d6
> Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

Thanks, applied after:

- Renaming the symbol

- Adding the "depends on" also to the Config.in comment so that the
  comment doesn't appear on CPU architectures where dtui will anyway
  not be available

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
