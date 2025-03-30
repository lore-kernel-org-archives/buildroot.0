Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2965C28B20
	for <buildroot@archiver.kernel.org>; Sun, 30 Mar 2025 09:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7106860680;
	Sun, 30 Mar 2025 09:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNpRzc7vgKIh; Sun, 30 Mar 2025 09:34:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D54D606B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D54D606B4;
	Sun, 30 Mar 2025 09:34:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B872D0
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 09:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 275464033A
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 09:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbBr6tc-Te4X for <buildroot@buildroot.org>;
 Sun, 30 Mar 2025 09:34:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 50DB24035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50DB24035D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50DB24035D
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 09:34:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 097495FFBA;
 Sun, 30 Mar 2025 11:34:49 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:32788])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Mar 2025 11:34:49 +0200
MIME-Version: 1.0
Date: Sun, 30 Mar 2025 11:34:49 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250329221815.573118-1-giulio.benetti@benettiengineering.com>
References: <20250329221815.573118-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <46b77ff81a96ebcb9e707d4de114a79e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743327291;
 bh=Qh7/4lKCVOB/rYpXvCAfId07pO9uQwVqeCqKfLiYcFY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PolevUvzUOGBY+7cKCLtKiDFBXys+nVpf/YMF5z6MuloFLiQx9yhEqjx82TWEMcE3
 KBmar+g89lyTM8M56GGPiRbKhb3geHj4yh3krp1qVYd4JuWii8ZjW1qJ5o0M9uVmEK
 ZUvRoi6H8hQrlaM3okjM2PHFjhbGrJIx1aqjMJGxC/DnjQXa9kR7JC19qKYV/gjrEd
 uk33xFCK0ECP5DGISf2oCsqxTsqlu5ilR5Hn4Dfe3iZhsuj/XRCYDGj+Xg/Au9agkP
 bWMXjvQAUbaE+Gekvy1iund4Q2OTDFYEyI4YaUdGBVLCjpxf7qwPczUKB50OGMYKPE
 M/MLrO3mccP2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PolevUvz
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump to version 3.17.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On 29/03/2025 23:18, Giulio Benetti wrote:
> Release notes:
> https://github.com/libfuse/libfuse/releases/tag/fuse-3.17.1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
[...]
> diff --git a/package/libfuse3/libfuse3.mk 
> b/package/libfuse3/libfuse3.mk
> index f5c9dae8f7..2fba6792cb 100644
> --- a/package/libfuse3/libfuse3.mk
> +++ b/package/libfuse3/libfuse3.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBFUSE3_VERSION = 3.16.2
> +LIBFUSE3_VERSION = 3.17.1

Building this version with the following commands, on
branch master at commit 4204bfe:

     cat <<EOF >.config
     BR2_aarch64=y
     BR2_TOOLCHAIN_EXTERNAL=y
     BR2_PACKAGE_LIBFUSE3=y
     EOF
     make olddefconfig
     make libfuse3

fails with output:

     ../util/fusermount.c:40:10: fatal error: linux/close_range.h: No 
such file or directory

libfuse3 introduced a use of close_range() in:
https://github.com/libfuse/libfuse/commit/cdad7b6001036f1a33bddab59558eec099bcb278

The <close_range.h> header was introduced in Kernel 5.9 uapi, in:
https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=60997c3d45d9a67daf01c56d805ae4fec37e0bd8

In libfuse3, Meson checks for the (libc) function close_range(),
but not for the corresponding header (in linux-headers).

Could you have a look please?

>  LIBFUSE3_SITE = $(call 
> github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
>  LIBFUSE3_LICENSE = LGPL-2.1
>  LIBFUSE3_LICENSE_FILES = LICENSE

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
