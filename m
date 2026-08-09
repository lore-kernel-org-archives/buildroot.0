Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7F3C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 15:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F382240564;
	Sun,  9 Aug 2026 15:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6za0LfSkkSz; Sun,  9 Aug 2026 15:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1C9640549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786289710;
	bh=aHLf+aL9Z0/OiR2N9sU9y67YOVyMh1j0uLyZ90wSEW8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pDnql+DnkNhvARO4nF7eG28o8WuiK1XUTHQjkG1LKsNXEZLGU1I5aLF1A5SWgWqvD
	 qk8ToSPTV2hnAeFhJNVaeQBvD4L1fPkj98vRYEI8T9OTh6L021smHUM59QLzvI67oP
	 rVpRwpvBoP1B8sxcSsSHQYecBnclMhmOiBPugnJ6G1nMVWGSzLBIx4TwVLp75LH84y
	 UAQ9D109u4JiDvSG2kdCPnA9gWzcF3TtqYrLljVrgwSlx92XjvllPgVyy29Yon8/D/
	 TDq3hjLlJnxM4v310z+uLxS6H7gBQrAnwDvzSTud1soV247suQVo23dlEgcz81mcfM
	 PyeaEfh/Mgi6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1C9640549;
	Sun,  9 Aug 2026 15:35:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E77BA28A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE93580D77
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFj1aZDpgLCI for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 15:35:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BD1A80D49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BD1A80D49
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BD1A80D49
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:35:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D28F313F89A;
 Sun,  9 Aug 2026 17:35:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Aug 2026 17:35:02 +0200
MIME-Version: 1.0
Date: Sun, 09 Aug 2026 17:35:02 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Vincent_Stehl=C3=A9?=
 <vincent.stehle@arm.com>
In-Reply-To: <20260809111130.2074795-1-fiona.klute@gmx.de>
References: <20260809111130.2074795-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <84e5eabe89e688acbe39d9db223d67ec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786289705;
 bh=aX1ltFk11SiRlaaHzv7ES2Fiiup6jZotw9ZFtqCTLMI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XeADrst9SilsqfUqa6rE4sOuEQ7Yb3u0oeOWWC9TL27NUA8MIGFHeRX7HeLQbY5gt
 5TcPPV+MlbvjPU5tmU6n4O/YOcmNWjLfKv8NdVqJ3Uvye6wm8D/lB7gvo/RCZ4R+ZL
 yFEk/95/DsuOS4DJ1vG+DgDHeBoZ9VSoSjjWAVYhBSkmIriz/janK4DZFvx8FkPuz1
 ZEqp3UvZm5srFcVkWyDJCafRiSQRohwJvURP9nb/Z67DpY7PHuZ84Cz9Qfej8oHaTf
 WYlkaR0PQhH3GXw/IuoLws21AQy3CEiWG1snXmEXSI97Yzt/yojx08hTDHxOhcbTnt
 eZjeKPbirpzcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XeADrst9
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: select p11-kit
 when building target mkeficapsule
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

On 09/08/2026 13:11, Fiona Klute via buildroot wrote:
> Since upstream commit 0c716a157be460006a4b762625de329b5e36dbf9 (first
> release: v2026.07) mkeficapsule supports PKCS#11 keys, and in turn
> requires GnuTLS with PKCS#11 support.
> 
> Without it, building mkeficapsule for the target fails:
> 
>   HOSTLD  tools/mkeficapsule
> /home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: 
> tools/mkeficapsule.o: in function `main':
> mkeficapsule.c:(.text.startup+0x530): undefined reference to 
> `gnutls_pkcs11_init'
> /home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: 
> mkeficapsule.c:(.text.startup+0x544): undefined reference to 
> `gnutls_pkcs11_add_provider'
> /home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: 
> mkeficapsule.c:(.text.startup+0x5fc): undefined reference to 
> `gnutls_pkcs11_obj_list_import_url4'
> /home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: 
> mkeficapsule.c:(.text.startup+0x620): undefined reference to 
> `gnutls_x509_crt_import_pkcs11'
> /home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: 
> mkeficapsule.c:(.text.startup+0x1334): undefined reference to 
> `gnutls_pkcs11_deinit'
> collect2: error: ld returned 1 exit status
> 
> The error can be reproduced using "utils/test-pkg -c" with the
> following config:
> 
> BR2_PACKAGE_UBOOT_TOOLS=y
> BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE=y
> 
> For host-uboot-tools this was solved in Buildroot commit
> 6597563da7bb359eac57c8fb70e4efc3d6ef4c02 "package/gnutls: add host
> support for pkcs11" by unconditionally enabling PKCS#11 support for
> host-gnutls. For the target a more fine-grained approach is desirable,
> so instead select BR2_PACKAGE_P11_KIT if
> BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE=y and propagate dependencies.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
