Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B619CA0EDC
	for <buildroot@archiver.kernel.org>; Sun, 17 Aug 2025 14:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B47161737;
	Sun, 17 Aug 2025 14:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KuKuhJnNAIWP; Sun, 17 Aug 2025 14:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09B066160D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09B066160D;
	Sun, 17 Aug 2025 14:47:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FCCE75
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 14:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 163606160D
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 14:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blRRzzZuYBsu for <buildroot@buildroot.org>;
 Sun, 17 Aug 2025 14:47:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E6F79615ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6F79615ED
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6F79615ED
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 14:47:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7D1D95FFAA;
 Sun, 17 Aug 2025 16:47:26 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 17 Aug 2025 16:47:26 +0200
MIME-Version: 1.0
Date: Sun, 17 Aug 2025 16:47:26 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien Olivain via buildroot <buildroot@buildroot.org>
In-Reply-To: <20250816110533.7ec8ee44@windsurf>
References: <20250816001117.246947-1-ju.o@free.fr>
 <20250816110533.7ec8ee44@windsurf>
User-Agent: Webmail Free/1.6.11
Message-ID: <10c144b888c17f9107c6a2f49955a883@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755442047;
 bh=p8s3UNI0vWcrW4vl+V0xzIFzfGop3JR814sNLIQFXdQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h2rQT93iZssfNSmv2uA3Uqm6X8tAwa3muVaOLgJgsfqMWNtpPa5wJSnFgJybzLFuh
 BuJKWz7B6EdyMCumyysp3JpYCnNTR9dtEGmrSHuYGx8mlpEMH7qOPopIfOtBefZisR
 xFLrMgprHQVT+ZQLkTaQ13zffBhmeBeLbOAbwAf7WjVcupxjFlVC7OjyT0Hxw5Cymm
 APFBiQ0REYWLKdbg6upfqVL49TJaUAHDzKatxRaGdYw4JZcyPydqw4vlyRrd307alo
 CVFQ8iR0f1Dr5hPfdIxroFIo3+rh3zd8ruUa9z3RH6m3NmtjOxUPRwqE0e8huEtP6t
 OncHWxaqWpd1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=h2rQT93i
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_dpdk: fix test
 after bootlin toolchains update
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 16/08/2025 11:05, Thomas Petazzoni via buildroot wrote:
> On Sat, 16 Aug 2025 02:11:17 +0200
> Julien Olivain via buildroot <buildroot@buildroot.org> wrote:
> 
>> Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
>> the tests.package.test_dpdk fails to build its Kernel 6.6.58 with
>> gcc 15.1.0.
>> 
>> This commit fixes the issue by updating the test Kernel version to
>> the latest 6.6.y version (6.6.102 at the time of this commit) which
>> includes the fix for gcc-15.
> 
> I was surprised by this, because the test only says
> BR2_TOOLCHAIN_EXTERNAL=y, so I would expect the default to be a Bootlin
> *stable* toolchain. But with the order in which
> toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
> is written, the bleeding edge toolchains are indeed the default. Is
> this really a good idea? Shouldn't I change this to make the stable
> toolchains be the default?

I believe the Bootlin toolchain variants were just sorted
alphabetically. So the order end up to be:

- glibc bleeding-edge
- glibc stable
- musl bleeding-edge
- musl stable
- uclibc bleeding-edge
- uclibc stable

This is also why we need to specify
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_xyz_GLIBC_STABLE=y
when switching a defconfig to use the bootlin stable toolchain.
See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/47f4e3810c981e8cee19d8a411b38c771ebd2381

Having glibc in first position makes sense, since Buildroot switched
to that libc by default a while back.

As you mentioned, it would probably make sense to invert the order of
bleeding-edge and stable to have the stable by default (or to add a
"default y"). Doing so will probably require to refresh all the
defconfigs with "make savedefconfig".

The same ordering question could be raised for the general
external toolchain type. We always had some variability in toolchain
when selecting an external toolchain depending on the target cpu
architecture. For example for the BR2_aarch64 architecture, selecting
BR2_TOOLCHAIN_EXTERNAL=y then defaults to
"Arm AArch64 14.2.rel1", then propose "Linaro AArch64 2018.05", and then
"Bootlin toolchains" (this time, not in alphabetical order).

I think this is the reason why you were not expecting a Bootlin
bleeding-edge, because in for Aarch64, we end up to
"Arm AArch64 14.2.rel1" and many of our tests using an external
toolchain are Aarch64. Only few are using x86_64. Note that
all the tests I fixed were x86_64.

Maybe this is a question that could be discussed during the upcoming
Buildroot DevDays.

Since the Bootlin toolchains are supporting most cpu architectures,
we could have the stable variant as default for all supported
architectures by default.

What do you think?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
