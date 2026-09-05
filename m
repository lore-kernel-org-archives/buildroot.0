Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCB5C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 13:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76A4240B27;
	Sat,  5 Sep 2026 13:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_YO0d064plq; Sat,  5 Sep 2026 13:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BA7C340B28
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788616612;
	b=QAwW5s9mIiF/As8O5ihTMho+3LSk8R9/wslD/hXSjuLJynuLQyAcVIbSzl+f3hyfzYkb
	 N2JcgyUXGfS9nRquRIAab6+wxocUc8IRv2Rl5v7VQh5nXMnatJ2va/mRSOOuCrL4aUpIM
	 mhCP+xr4tYmNJt6LCoM9KgYcdlakgo8gfX3CGb+i4RCx+4rIAfSMvlmayp5gbS+OZ7Z54
	 mdlhUbfLh8Xt9x+XUp2/Q5G0GXzDmLMn8v1W/iIJSRPoJ+FebynKqkpABCjFrmh0wvvX0
	 eqEASZwJihjKJDAEgT8163z/rOFCM4oVeWRhUY230TuZTdL/6f2zaZnp4eEupS70Ofw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788616612;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FXoZcc19Fxl+6iDNJCZbwxGx3rST5Dm+GCqVEXUdqhs=;
	b=r2C97MFWj9LzGvQ+RBH09UC4AcKHZRsjJTzvkON+RTqgsigOGsj/Nm4N4x6RboSja8Js
	 iFLkuZf7cIU7Ev6U34VEjQpYDElIHc8XEIyRyzWkYMWRFWdSiWKqttDN2lhscUnXgnQNb
	 VoauE9OQFRln7BfxnX1AQvkJdTbOc2hs6jQD5bTeam00aeveWf6+U8+5LS1NDjtjE5yxg
	 j2/t2HxsrGbDeP+FFLS2HBJRhHP6jAvZl+mFO9qKp61ySkBwlHBhho56XyaJ8QBEabvVg
	 smpGIGyaHolSI4jiAtqpBoH45ki775EQklxoK0rCSGaRxKhM9ysoO9tlzw3f2V9s9tg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788616612;
	bh=FXoZcc19Fxl+6iDNJCZbwxGx3rST5Dm+GCqVEXUdqhs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fssvAPgIhel2ImYmQTeNCK6IlYnAMb9AdhG8Mi5gkjRPXmEfi6KmoFkP8Zqq1wWa0
	 8yo9wOL0uB6wfS45OsXHC66b9zHMp8O0avY/ehOdsGRaSmnPPsduFu5fRXwoIbYhUH
	 qGRAG54TBIV17meTT7hkh2ud0rsU8/iUf/EY7Z745H1XzZI89KmROnhEywmNPkix4E
	 /v1bShR91GjJxCISo9y7+MJAZtFxrP87F0Pa/MPHq/5aFtZnXqrqJJgj/ixwAUnC0a
	 ixWiMl2yws1g172pfHD5DnVkxgFu5i/MuNLfFtvePSe5DXbLz/693QQQAPWy0hdyDo
	 s9ydQeW0BODeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA7C340B28;
	Sat,  5 Sep 2026 13:56:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AF08572C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A14DE4005B
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wc6yUaT7f3aG for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 13:56:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7C0CD4004C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788616609;
 b=UW/Zw2/LKJKTp0r2ki6ntpucNGPZQKc/kT7Uvk5OUhyFgATiTvVbMBKv4x4Zw9bSrBW7
 4wx7Qg3MjNT3cmIGg5Zc2ew/JNCbkqCNtMgGcOcd+JKA+Zyh3QEuSTt3QF6lehVm6miiN
 enW04C1cmRpsQxJjQJziqi/YI55zXYWQuSRa2oYAYGTumGKXCyoYJ5XDYDuWeod2nmDaL
 LLe013wpH27yxbU7FoGqRUhIF3hR08rCTgxQVeUsJuPpisuRY2yDivu1D+i+c+mQyaXZ0
 lCJeM/tXvl+r1EtowJGVlhk1cFXIJUvOT7h3nPQgsW7Uc0g3pzKco1+OJmOQ1X50uuA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788616609;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=4zpf8M5Xbd1gZDwAeQlFV/Rf6FXPvIs2WLu6LrA35pg=;
 b=InyaPH94PrJOyVRBkICh6mH9g3OiA5ogJRIdvECBs8AmRQYxpTvelqAMudY350HgIBrd
 kZqKdoZS9Zo8yzoHgAEIFwkgD42iUdYB1RHI/+ZHYZcec1UgE5ntxJq5+LcS+NFtRaxXJ
 u44C+Hs/XTojO2Hm0nqfd5+ivKXip2g1mYltz28N4hwKZlwcpCVlVLika8OUnc6P62PHh
 aVfpQePwer2sejR2znSCyJ1ioDTWouMqwslNn0Ju6lZEakga6kUWrvdOxJp76abAPIQy4
 NsID6E5VhrogOj1nogjw4es4oyZD1lPR8kwCriWHFC7EQj9eX2/Il3EWC1yIDQeunlQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zPrDL3rF; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C0CD4004C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:56:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D625D1A1901;
 Sat,  5 Sep 2026 13:56:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9513F60233;
 Sat,  5 Sep 2026 13:56:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A1E6111C783E9; 
 Sat,  5 Sep 2026 15:56:40 +0200 (CEST)
Date: Sat, 5 Sep 2026 15:56:40 +0200
To: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Cc: buildroot@buildroot.org, Christopher Obbard <obbardc@gmail.com>
Message-ID: <apwfhGIFSbDc-Bn7@windsurf>
References: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-0-42eceaa12f55@oss.qualcomm.com>
 <20260831-wip-obbardc-package-dtui-fix-armv5-v2-1-42eceaa12f55@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-1-42eceaa12f55@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/2] package/rustc: add
 BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_64
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

On Mon, Aug 31, 2026 at 04:49:57PM +0100, Christopher Obbard via buildroot wrote:
> Rust does not provide 64-bit atomics on every target Buildroot can
> generate. rustc sets max_atomic_width = 32 for three of the 25 targets
> listed in RUST_TARGETS in utils/update-rust, so
> core::sync::atomic::AtomicU64 and AtomicI64 simply do not exist there:
> 
>   $ rustc --print cfg --target <target> | grep target_has_atomic
>   armv5te-unknown-linux-gnueabi     "16" "32" "8" "ptr"
>   armv5te-unknown-linux-musleabi    "16" "32" "8" "ptr"
>   powerpc-unknown-linux-gnu         "16" "32" "8" "ptr"
> 
> Every other supported target, including armv6, armv7, aarch64, all the
> x86 variants, riscv64, s390x, sparc64 and both 64-bit powerpcs, has
> them, e.g.:
> 
>   arm-unknown-linux-gnueabi         "16" "32" "64" "8" "ptr"
>   armv7-unknown-linux-gnueabihf     "16" "32" "64" "8" "ptr"
> 
> A crate that uses 64-bit atomics without a cfg(target_has_atomic = "64")
> guard therefore fails to build on those three targets with:
> 
>   error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
>      |
>      |         atomic::{AtomicU64, AtomicU8, AtomicUsize, Ordering},
>      |                  ^^^^^^^^^ no `AtomicU64` in `sync::atomic`
> 
> This has been hit at least twice already: by package/dust, worked around
> in commit 3abc3b97bad9 ("package/dust: bump to version 1.1.2") by moving
> to a release in which upstream had added the guard and by package/dtui,
> which has no such release available and had to open-code the affected
> architectures instead.
> 
> It is likely to keep recurring: infra.basetest.BASIC_TOOLCHAIN_CONFIG
> builds with BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE, so
> every runtime test that does not override the toolchain compiles for
> armv5te, one of the three affected targets. That is exactly how the two
> failures above were found.
> 
> Add a hidden symbol so packages can express this constraint once, rather
> than each open-coding BR2_ARM_CPU_ARMV5 and BR2_powerpc and needing to
> update whenever rust gains or changes a target.
> 
> Note that armv5te and 32-bit powerpc are only supported by rust for
> glibc and musl, so the uclibc variants of those architectures are
> already excluded by BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS.
> 
> Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

Thanks, applied after renaming the option name, as suggested by
Romain.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
