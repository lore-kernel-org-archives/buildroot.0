Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9ADC88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BA00406D2;
	Wed, 16 Sep 2026 18:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xun9YtI2CMmK; Wed, 16 Sep 2026 18:59:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B8EBB40681
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789585139;
	b=RikHppeXubz9/hf/KYDaaMfRn17bI5C4Cg8cpZPPsu4xewDBZ66CUTtEPgYe3DNsqisU
	 TL12CpzZeElnCqwHyTBEB/kRvas/GD9YmIdPGJLZapdvMwkUrhoojx/aNckbkwMFUDbX5
	 OcjcL4j9U8FY21FydI0DEXutQJRbGHoQuQ7EMiWdW69IUGWSZvd3gUUdB6HOrdTG0mw98
	 Gf+LxHk5/m2HZTtVzA9ulX1J6w11xj3dM+srmnS24oLTM4LR6WfV6IuTG+62Xmz5YFz5z
	 WKJTnsDiwYTJBVdSuw9NiS2qcfbUYwuPBxYugNmwCKASbwKUMIHn5fn2GE7SsF/u/uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789585139;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aqRTBgp/5of/IsiII015PZzm9U9xYdFa6qEKoAgRCbo=;
	b=jEDiDwmXvtgFVcjQr+fD7TbieHsoZDx92kvFs7WocpVVNfzLSqKYaunaJ1bRrIE/CrFl
	 D9GvKQNx/wbVWfcV6BO1Z97RvzNwjIlfRT+3DBdhzS+QGN2vmWjw/hoJO5o/QA1M26gP+
	 9cRYw4IV1fQDbRjO+vk70v7NDwPp9TVA1R9UDUgh5eGzMFiyxwBuZAqShSaCjK8VrR8Ae
	 EXsgqr1aVz+++dPwPGtU7rVbapYA07Qy6MA9EGdts+336Q6riTgVgCNJUaEI3SLHQ/hJ/
	 KQS3YxmGwhMEtKUXl3u+zFWhTmGhIwUgoS4qu6E5IBToWxEr/aZTZOzxkQhEapU9rJw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789585139;
	bh=aqRTBgp/5of/IsiII015PZzm9U9xYdFa6qEKoAgRCbo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dc4itH2Vf56Gw5rTEReYRw7RrV4nZj5xhHvLbe5cM9+qU1VJUNR4OI+5KV76MOLek
	 cemF8fClkVtu3NMfm5u3RHXFhuAY9CJ2OMjFVcCGxfVxIcMwaCeaMpCF3smrcTXChS
	 ao5P6SzDjp2jLATQyWeQ0d3tpIvfV5VnIMsYmQV+yOvhxRQZXDdlf6/1fSgaqyZ3j7
	 Pk+Ltpdik3TtmlOk9/J8bct81UxAVBmDJh10vr7x/I3eMe+ZbGUbANcdPl2yERK3E/
	 oIY1SjzHxjcNLaSN6qZvWnmwTMNB+vFbcAFJIe1SUh4bU9TadEJG5i5SdBLCXY4eeu
	 khEfB+TrKBwng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8EBB40681;
	Wed, 16 Sep 2026 18:58:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A4117AD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C0CE80766
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBTbHqrFRbQW for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:58:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5767E806E8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789585137;
 b=Jk/DsU1lGQkFZuwAKqmvaC1wUtmEW/B3+FKUYoiQoDbkPZKe5mxlf7mIfs1vve2EXqU7
 4Wk0Q/cYj6iA0Ur2weKveeEjhbONaW820COOrBwITf/+rEbdOp91ER/SCcQw5sIScC1yq
 VE3GtO67Ri06p8sdXuqHkoKKHJaGLeTXZ9NbDAcWdzrgEMsWKX+16/GHcT6xoSwvE+Q5i
 GOLE1eIpmUJPt3zyfa1S+OvD7gUdjYUjYuTavy30Wo6LCTpIboZrU8MIew26SaloskirE
 4yhAJfC2QASOlYqzgPNKG19A/YWDaLLP8XSuOYHr+xe7/1yJm8AJ9Lv4s0TheYjNyPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789585137;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=vkx7URi/y5+1eniD/fW4u1PzYtPs/pJcm8WtTquKxzQ=;
 b=eWcKDv0HIXktWgj9rDI2ldp8461HYwybOZNx00/1Lh+/yGNfC1ip1JFSqWQxGO+qPT1h
 0GgOYZRZXdmdT7AHxmtxCmJKXQzHjUBPvrichVIzfxKf3wmbzuNLCiriUX5ukdwc3TOTj
 eoCnruOKCBxchU/NVn/vIB0GRTdAj/wVQksJtTdQ+xn8T9JgLwGCntf4qX876dDvfoe+U
 mAcGJPbANrs8nPB4hfT6BIVOGIu+0rYXZIG13+aCG8mo3QDE4FGpB1gJ6hyx7cZeEbIDw
 Z0ZYmt7TsNKLLX24NhuLUjIhAiQY+WllhVvUeYDDqjlFRYkLR/xzzhS7Dl6a9y9xN6Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zUe3RGmZ; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5767E806E8
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:58:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 11E6E1A08DB;
 Wed, 16 Sep 2026 18:58:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CFACF60337;
 Wed, 16 Sep 2026 18:58:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E681A11C7B00D; 
 Wed, 16 Sep 2026 20:58:53 +0200 (CEST)
Date: Wed, 16 Sep 2026 20:58:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aqrmwE4x0hEUC1J5@windsurf>
References: <20260910211103.2554103-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910211103.2554103-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/xtables-addons: use
 kernel-module infra
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

On Thu, Sep 10, 2026 at 11:11:02PM +0200, Bernd Kuhls wrote:
> This package does not need the kernel-module infra because the kernel
> module is build by autoconf but the MIPS fix from buildroot commit
> 1d8d9e8d6cd824b2a43a0b92d71cfb25a3f9300a is not added to _LINUX_CONFIG_
> FIXUPS causing a build error with this defconfig:
> 
>   BR2_mips64el=y
>   # BR2_MIPS_SOFT_FLOAT is not set
>   BR2_TOOLCHAIN_EXTERNAL=y
>   BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE=y
>   BR2_PER_PACKAGE_DIRECTORIES=y
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.156"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
>   BR2_PACKAGE_XTABLES_ADDONS=y
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
> 
>   MODPOST /home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/Module.symvers
> ERROR: modpost: "memcmp" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/compat_xtables.ko] undefined!
> ERROR: modpost: "register_pernet_subsys" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
> ERROR: modpost: "_printk" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
> ERROR: modpost: "nf_register_sockopt" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
> ERROR: modpost: "unregister_pernet_subsys" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
> ERROR: modpost: "xt_register_target" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
> ERROR: modpost: "nf_unregister_sockopt" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
> ERROR: modpost: "kfree" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
> ERROR: modpost: "free_pages" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
> ERROR: modpost: "xt_unregister_target" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
> WARNING: modpost: suppressed 342 unresolved symbol warnings because there were too many)
> 
> To fix the problem we add the kernel-module infra to the package.

Can you explain a bit more how this works? Does this mean that we will
be building the modules twice, once through the kernel-module infra,
and once through the autotools build system?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
