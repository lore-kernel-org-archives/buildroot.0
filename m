Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEDAC7115C
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C048341DBB;
	Wed, 25 Jun 2025 17:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LaspCfWYBaJ; Wed, 25 Jun 2025 17:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07AF241EE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07AF241EE2;
	Wed, 25 Jun 2025 17:01:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F3EA43F
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05FD040401
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2Pjh6YqIjKc for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:01:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5736C40111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5736C40111
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5736C40111
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:01:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 82413780510;
 Wed, 25 Jun 2025 19:01:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Jun 2025 19:01:05 +0200
MIME-Version: 1.0
Date: Wed, 25 Jun 2025 19:01:05 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>, Sen
 Hastings <sen@hastings.org>
In-Reply-To: <20250623214048.1751840-1-thomas.petazzoni@bootlin.com>
References: <20250623214048.1751840-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <1e895108b94af37bccf97edf2ac1e969@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750870868;
 bh=1/Hub3O6Unqrdat4CsqAn8J45EuX35sTBevJwcB3w3s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iEovVI4L2k4CZVIKimhGodVckhoQ9nQ61Ly9CQNufG490kbmjFLbDIXbYIz6aFVIa
 zGeQzQGmQGo83vtmxXO4gIZmOugc7NqHRbYh3/MzTV1UdhgE7Enq+kI+YaBWT73g5i
 lsQHVrjkTKl/Pmtk5pWZLrFNoRtUZ/DQ17e+fhnnIolGBcW3G7aLJnH763btwnswF/
 nvKgUS+VrtsqB7HN1CZIoyygIwkGMmKLwj7u6JyEGw+zAIy9YDFPJe/MsUGfRzq69p
 zdM7n95oYaqwGmh7JpOeI0n2+EZ2nMjpUcmQZKYz0bdvQgOsEkTudn/2hnVwfhD408
 LolajQ3rbmpqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iEovVI4L
Subject: Re: [Buildroot] [PATCH] package/systemd: fix systemd-boot
 installation
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

On 23/06/2025 23:40, Thomas Petazzoni via buildroot wrote:
> Following the bump of systemd to 257.5 in commit
> 7d8d48cd2ba1396ea146e94020939f4dfe08c5cb, the installation of
> systemd-boot fails with:
> 
> /usr/bin/install -D -m 0644 
> /home/thomas/projets/buildroot/outputs/3/build/systemd-257.5/buildroot-build/src/boot/efi/systemd-bootx64.efi 
> /home/thomas/projets/buildroot/outputs/3/images/efi-part/EFI/BOOT/bootx64.efi
> /usr/bin/install: cannot stat 
> '/home/thomas/projets/buildroot/outputs/3/build/systemd-257.5/buildroot-build/src/boot/efi/systemd-bootx64.efi': 
> No such file or directory
> 
> Indeed, the systemd-bootx64.efi binary is no longer produced in
> buildroot-build/src/boot/efi/, but in buildroot-build/src/boot/.
> 
> No autobuilder failures have been found corresponding to this issue,
> but it can be reproduced with:
> 
>  BR2_x86_64=y
>  BR2_x86_corei7=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
>  BR2_INIT_SYSTEMD=y
>  BR2_SYSTEM_BIN_SH_NONE=y
>  BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
>  # BR2_PACKAGE_BUSYBOX is not set
>  BR2_PACKAGE_SYSTEMD_BOOT=y
>  # BR2_TARGET_ROOTFS_TAR is not set
> 
> Most likely this was caused by upstream commit
> 97318131fd06a5bc35454da81dcbbc84f16d9940, even though we didn't check
> if this commit was really the culprit.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
