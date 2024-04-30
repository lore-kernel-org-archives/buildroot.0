Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C8EC4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 18:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC230401AF;
	Tue, 30 Apr 2024 18:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUQxv39uB7iE; Tue, 30 Apr 2024 18:57:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A14440213
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A14440213;
	Tue, 30 Apr 2024 18:57:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 755691BF977
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 18:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62A1860AF1
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 18:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id At-TNxhIeJYP for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 18:57:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 52A2160762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52A2160762
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52A2160762
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 18:57:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 55CBD13F8B8;
 Tue, 30 Apr 2024 20:57:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 30 Apr 2024 20:57:03 +0200
Date: Tue, 30 Apr 2024 20:57:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZjE-___LZZHOEDFi@landeda>
References: <20240427160607.46044-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240427160607.46044-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714503425;
 bh=BM7qR3ZXA7XxOc7vYwKR7Tw2MlFJarEKU2qaK1nuLN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EX/R7XJAGut+AiTa38wknk0x4VEMfzRGqRTzG4k2KBK0JBVYPxr3IH7Pfc5mOqQZt
 i5bCwnAhs8OeWZGEWRljuz89bOWV70XV4F+QsgtWHLcyLOkto//FxULA5EEnkfE7lB
 SP9oA0DXkstg3djBtZTX1rnvPUSgaK8JipVEBFFje2nfZauTGJ46G0avqgH6IAZaTA
 6yqgJKAOwkaUAHUZEUGUNsjQLMXKRHkZQRZAPWJbFEDBmJM0NfPa/VafQZ+09MF16F
 CV8L5GvYT0HiBaa1dbtU8oGKfnZ7C5FQuhht8HaHrpH4jJTOsQfpUg5tJri/eOsPtw
 E12uKhNg3g2Yw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EX/R7XJA
Subject: Re: [Buildroot] [PATCH 1/1] package/libiscsi: bump to version 1.20.0
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

Fabrice, All,

On 2024-04-27 18:06 +0200, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libiscsi/libiscsi.hash | 2 +-
>  package/libiscsi/libiscsi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libiscsi/libiscsi.hash b/package/libiscsi/libiscsi.hash
> index 769035837c..5caecbc5d9 100644
> --- a/package/libiscsi/libiscsi.hash
> +++ b/package/libiscsi/libiscsi.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  c7848ac722c8361d5064654bc6e926c2be61ef11dd3875020a63931836d806df  libiscsi-1.19.0.tar.gz
> +sha256  6321d802103f2a363d3afd9a5ae772de0b4052c84fe6a301ecb576b34e853caa  libiscsi-1.20.0.tar.gz
>  sha256  88e3eccc48722b2a0eaff456dda94b8e8e123848d01f631969bec8e3c6c6eb85  COPYING
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENCE-GPL-2.txt
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
> diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
> index c8b6ddd123..ccee77bf64 100644
> --- a/package/libiscsi/libiscsi.mk
> +++ b/package/libiscsi/libiscsi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBISCSI_VERSION = 1.19.0
> +LIBISCSI_VERSION = 1.20.0
>  LIBISCSI_SITE = $(call github,sahlberg,libiscsi,$(LIBISCSI_VERSION))
>  LIBISCSI_LICENSE = GPL-2.0+, LGPL-2.1+
>  LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
> -- 
> 2.43.0
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
