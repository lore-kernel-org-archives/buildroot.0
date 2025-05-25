Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D422C5AE59
	for <buildroot@archiver.kernel.org>; Sun, 25 May 2025 20:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6405B60714;
	Sun, 25 May 2025 20:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-LB5QG1ROIj; Sun, 25 May 2025 20:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D2B56065F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D2B56065F;
	Sun, 25 May 2025 20:50:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B626568
 for <buildroot@buildroot.org>; Sun, 25 May 2025 20:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C64280DC9
 for <buildroot@buildroot.org>; Sun, 25 May 2025 20:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvAXGd5IA4Aj for <buildroot@buildroot.org>;
 Sun, 25 May 2025 20:50:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE59280DC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE59280DC1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE59280DC1
 for <buildroot@buildroot.org>; Sun, 25 May 2025 20:50:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 861A813F86E;
 Sun, 25 May 2025 22:50:21 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 May 2025 22:50:21 +0200
MIME-Version: 1.0
Date: Sun, 25 May 2025 22:50:21 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Andr=C3=A9_Zwing?=
 <nerv@dawncrow.de>, Romain Naour <romain.naour@gmail.com>, Spenser Gilliland
 <spenser@gillilanding.com>, El Mehdi YOUNES <elmehdi.younes@smile.fr>
In-Reply-To: <20250524080355.19316-1-bernd@kuhls.net>
References: <20250524080355.19316-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <e8e87bbf85b67dc07f5e0e024df5f0c4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748206227;
 bh=bUgQVd3LEJhhVxlxv8uUrPXZXaOVidiL3bL3Yyr0cn0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L/oloQEySw+jXT/YMwBpI8+XIpUVCukGNynZEqdc03+mBwzoWMnksDbpXLJwkyeFs
 6Zolo5xEGhOVaHvWDG8pP0fwIu3IWvP3+olve1ZFw1+srVkqi+GkTGx3RqIc7J5wiF
 ZZPVTFWyLIjHi2Cy0iT87IYHZAc6q/AIaVJnX3dEwwBDaN5WH+HbZ68dAGMCnc22VW
 8HGRJtH2kjOTuG7VxVBLlf01XFTCnd69JNn9VWR+I0rKGOiyDSjbSiR8dbM2T/lO65
 oVdGhIkBzufrCemNY/q84gijTO8I8GV7e4B5XQMeCqWQtGv81Q7SPmrhRYdh6kS59H
 mAy6wZBr5ocsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=L/oloQEy
Subject: Re: [Buildroot] [PATCH/next v3 1/1] package/mesa3d: bump version to
 25.1.1
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

On 24/05/2025 10:03, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2025-May/000804.html
> https://lists.freedesktop.org/archives/mesa-announce/2025-May/000802.html
> 
> Note: Mesa3d depends on spirv-tools >= 2024.1
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/fe8a0d35485c77efdb3c4cb6f176f2b3cbe4c65d
> which translates to spirv-tools version 1.3.280.0.
> 
> Note: AMD drivers depend on llvm >= 18:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/82047fa82f1bbbbd4f1a9b05c034f79a00d85e31
> 
> Removed patch 0001, not needed anymore due to upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/e4eb5e80c316c0af3fff310ca89e1175d81556c1
> which removes the libclc headers include.
> 
> Renumbered remaining patches.
> 
> Rebased patch 0002 due to upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/6652eb0ec37e3cc3751928cc8180bac0db95f00f
> which renamed meson_options.txt to meson.options.
> 
> Panfrost driver depends on llvm:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/20970bcd9652ea8727a307ced9b372fad4b89991
> and needs the host tool panfrost_compile which is created by the same
> method as mesa_clc needed by the Iris driver. Refactor the dependencies
> by introducing a blind option BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
> which is selected by either the iris or the panfrost driver.
> 
> vtn_bindgen was replaced by vtn_bindgen2:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/6d5375017a516f4281ec0b73748582c56a86057a
> 
> OSMesa was removed upstream:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/027ccd963b1f8f288bef4224aedcddc1557e4f8a
> Also remove optional osmesa support from mesa3d-demos and wine.
> Regarding wine please see this discussion:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33836#note_2805850
> 
> Configure option shared-glapi was removed upstream:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/e5c76088e9e8834aa277777b41604b2463029a09
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/fefb1a6fb3cff1b227e835c2f67accd33fb96b2a
> 
> Removed deprecated and unused configure options gallium-opencl & 
> power8:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/a0b457aca6cbe94d555ae75864a47bb6a16318a0
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/c4b305079d70790ee9d34a25a2f70759ece96f0d
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> [Bernd v3: - bump to 25.1.1, rebase on -next branch, added note about
>              impact of osmesa removal on wine]
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> [Mehdi v2: - removed 
> 0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
>            from .checkpackageignore.
>            - removed OSMesa from mesa-demos and wine packages.]

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
