Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F3ACCD195
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 21:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2036040E1D;
	Sun, 19 Oct 2025 21:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7iE0sUqgE0s; Sun, 19 Oct 2025 21:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E107413B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E107413B1;
	Sun, 19 Oct 2025 21:31:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 558D9177
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 21:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A9AD413B1
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 21:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzhGT--Vj2CH for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 21:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BFAB40E1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BFAB40E1D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BFAB40E1D
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 21:31:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0324D2003C8;
 Sun, 19 Oct 2025 23:31:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 23:31:07 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 23:31:07 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251017131035.224739-1-aperez@igalia.com>
References: <20251017131035.224739-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <cc93ebe7f1b702a71c48e410766eaf54@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760909469;
 bh=aagGSaCLPKOagzekxN4ZZ7WFyIcg3GwwfS8tSZCbZTw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dQl8IFHdFuI3B5Sy9AhmvUI0iTmx/IrDRWwcMdDXqSHC6jZkmNJY6YvrjjuV4kXA/
 b9igs1I5B0FRiJdKChuU2AoSPEjGhG8zb84cLwGqDCJ2NIPI3J75KnHMqC1Sl3P3JZ
 5qgzrNO+WIqsg82k6cXGFdU13NobM2lok9iO75Omi5FDcVtmUJsUbEw8YW310GMUIp
 JunRcjGdOpNs9QNm5ZE5YbwONeUEk3TsFIlstM3lNEGOV1Xrd4n2qLnfj3ZHG+jA4F
 IHypjX9CqL6fIRgd1v2PMt1evsezPq6m1AUVxGTFsLx9vyB/Rmpnwhy5J6Oiu1yCU1
 jaO3egQ5hL6FA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dQl8IFHd
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: security bump to version
 2.50.1
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

Hi Adrian,

Thanks for the patch.

On 17/10/2025 15:10, Adrian Perez de Castro wrote:
> This updates WPE WebKit to the 2.50 stable series.
> WPE WebKit 2.50 highlights and 2.50.1 release notes:
> 
> - https://wpewebkit.org/release/wpewebkit-2.50.0.html
> 
> - https://wpewebkit.org/release/wpewebkit-2.50.1.html
> 
> Fixes the following security issues:
> 
> - From https://wpewebkit.org/security/WSA-2025-0007.html
>   CVE-2025-43343
> 
> - From https://wpewebkit.org/security/WSA-2025-0006.html
>   CVE-2025-43272, CVE-2025-43342, CVE-2025-43356, CVE-2025-43368
> 
> - From https://wpewebkit.org/security/WSA-2025-0005.html
>   CVE-2025-31273, CVE-2025-31278, CVE-2025-43211, CVE-2025-43212,
>   CVE-2025-43216, CVE-2025-43227, CVE-2025-43228, CVE-2025-43240,
>   CVE-2025-43265, CVE-2025-6558
> 
> Two patches which fix build issues are included. Those have
> been merged upstream, both in the "main" branch and in the
> 2.50.x release branch.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

I naively tried to compile the package with this patch on top of the
master branch at commit 7095e120a2 with the following commands:

     cat >.config <<EOF
     BR2_aarch64=y
     BR2_TOOLCHAIN_EXTERNAL=y
     BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
     BR2_PACKAGE_MESA3D=y
     BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
     BR2_PACKAGE_MESA3D_OPENGL_EGL=y
     BR2_PACKAGE_MESA3D_OPENGL_ES=y
     BR2_PACKAGE_WPEWEBKIT=y
     BR2_PACKAGE_WPEWEBKIT_SANDBOX=y
     BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA=y
     BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM=y
     BR2_PACKAGE_WPEWEBKIT_WEBDRIVER=y
     EOF
     make olddefconfig
     make wpewebkit

And it failed at configure time, complaining about missing
freetype (then fontconfig) libraries, with the following error:

Could NOT find Freetype (missing: FREETYPE_LIBRARY 
FREETYPE_INCLUDE_DIRS)
(Required is at least version "2.9.0")

I also tried with BR2_PACKAGE_WPEWEBKIT=y only (without the
sub-options) and it fails the same way. I don't think the issue
is introduced by this patch, as I see the same issue without this
patch.

I was not able to compile the package without manual modifications.

Could you have a look if you can fix this issue, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
