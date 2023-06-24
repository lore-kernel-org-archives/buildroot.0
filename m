Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42266EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 13:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E23F260B05;
	Sat, 24 Jun 2023 13:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E23F260B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WsJmtUlO-M4l; Sat, 24 Jun 2023 13:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 176B5607CE;
	Sat, 24 Jun 2023 13:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 176B5607CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8B351BF31F
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 13:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEFC6607CE
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 13:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEFC6607CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SgIn1CxFXDyQ for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 13:34:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FDB9607AA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FDB9607AA
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 13:34:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d5f8:72e0:30f9:5d41])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4790BB0053E;
 Sat, 24 Jun 2023 15:34:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 15:34:30 +0200
Date: Sat, 24 Jun 2023 15:34:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230624133430.GM24952@scaer>
References: <20230624082953.2537472-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230624082953.2537472-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687613673;
 bh=b0TjVxO0FqkWOyQFf+A/crbP9Tsxa2//qPKdGgwX94g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MN3z6XUhESBpH4Vmcwy7MX8+PfMIVLDruAExAIlhq8MUkVLjlPOu9r9F+ezbVsfP+
 4ZxpPhUE4ykjaEKp48MG/p5HIJyCa78GojUSX2qOM1LCyCpelm4GxOxzYMkp6IL+Qq
 mIuVQPeVZja+Qx5pn1MckXvgPPUj44QbhwHy58k0P3Bvd0br8uxiRDfTRpzzroXcqG
 42fdJBvnmGEUMblXyj/3dWKqUy94DSmquR4SKL/YagqqAFlC3SHYlNQrWvBMq/wuZo
 0jqcZvjZONLUIzVBnYKuPvZ782tiS6WZ6uTSCIMX9zr4niMQPgseGolqrtL6OX2Fmk
 TmTwlV2wP8wwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MN3z6XUh
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: fix build error with
 flatbuffers 23.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-06-24 10:29 +0200, Bernd Kuhls spake thusly:
> Fixes build error with defconfig
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON3_PY_ONLY=y
> 
> caused by bumping flatbuffers to version >= 23.x in commit
> 3d1ee7d624b71009ff61d4fa5ed860c52eb89b47
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...fer-Remove-forward-declararion-of-Fl.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch
> 
> diff --git a/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch b/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch
> new file mode 100644
> index 0000000000..87df0e4c9a
> --- /dev/null
> +++ b/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch
> @@ -0,0 +1,42 @@
> +From 07d8c98a0a65e005b85ef70e06eb1b9bbe7f764c Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Markus=20H=C3=A4rer?= <markus.haerer@gmx.net>
> +Date: Sun, 28 May 2023 00:49:40 +0200
> +Subject: [PATCH] SavestateFlatBuffer: Remove forward declararion of
> + FlatBufferBuilder
> +
> +This caused a compiler error with recent faltbuffers because the type changed:
> +
> +In file included from xbmc/cores/RetroPlayer/savestates/SavestateDatabase.cpp:12:
> +xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h:19:7: error: definition of type 'FlatBufferBuilder' conflicts with type alias of the same name
> +class FlatBufferBuilder;
> +      ^
> +/usr/include/flatbuffers/flatbuffer_builder.h:1414:7: note: 'FlatBufferBuilder' declared here
> +using FlatBufferBuilder = FlatBufferBuilderImpl<false>;
> +      ^
> +1 error generated.
> +
> +(cherry picked from commit 351184d7e4e3edc447d04a297769eb41a477ba68)
> +
> +Upstream: https://github.com/xbmc/xbmc/commit/07d8c98a0a65e005b85ef70e06eb1b9bbe7f764c
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h b/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
> +index cb93e6bbc2e12..fa42a9bad7034 100644
> +--- a/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
> ++++ b/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
> +@@ -14,11 +14,6 @@
> + 
> + #include <flatbuffers/flatbuffers.h>
> + 
> +-namespace flatbuffers
> +-{
> +-class FlatBufferBuilder;
> +-}
> +-
> + namespace KODI
> + {
> + namespace RETRO
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
