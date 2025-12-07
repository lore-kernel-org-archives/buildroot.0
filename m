Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D508D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 15:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D138607AA;
	Sun,  7 Dec 2025 15:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3UU4ZYnUBXk; Sun,  7 Dec 2025 15:58:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D2E560762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123101;
	bh=3OgrG2uzjHyX/mvZvmMdV0l8cXIHMU6OaiagpmyVP2k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bPFNFTkfB/8ObxIhUznHOPBonKIDL/7LCXSI/0A2AQjOhJAyA+fWc0R1MPfZKdZ90
	 UjDN+072eB83Ql0m1uZLG3+oZA6gE4YgWjacMHiYEA8xVRUlre5tlucuh6FVF46tpI
	 FsTCqceN1+pdfYYqRWtBqBaXybjAjwxX9nJ3rTKeHWj0OjUCC4O3c6LR7N0vLS+Obr
	 EvC9N2/Om+jzt9PlHu7zLlKH4hr0yhqquoeOI3In+7aBqUS7awpCFleyJPgA6FQ9J+
	 5x2W6RFibW9fie3k/ibyW3u2xt35VcfWexBO17r3pWXR/BT/M6roH6UjwGaC3ix3R4
	 pPsymNWgd+WgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D2E560762;
	Sun,  7 Dec 2025 15:58:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9234CE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 15:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8431440296
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 15:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bo_M2DHn_eCY for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 15:58:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E33240166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E33240166
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E33240166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 15:58:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id AD15C6013C;
 Sun,  7 Dec 2025 16:58:05 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Dec 2025 16:58:05 +0100
MIME-Version: 1.0
Date: Sun, 07 Dec 2025 16:58:05 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alexander Dahl <post@lespocky.de>, Davide Viti
 <zinosat@gmail.com>, Eero Aaltonen <eero.aaltonen@vaisala.com>, Fabrice
 Fontaine <fontaine.fabrice@gmail.com>, Rahul Bedarkar
 <rahulbedarkar89@gmail.com>, Romain Naour <romain.naour@gmail.com>, Sergio
 Prado <sergio.prado@e-labworks.com>, Stefan Hager
 <stefan.hager@ginzinger.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251203214709.2321976-16-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
 <20251203214709.2321976-16-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <dde03e87e035e8aa9a7ffe6b434b5da4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765123096;
 bh=/uRE1Ck55SM2Vo9zicrLENFoOM5xmo5AgnYpJsEZRGI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uPdi84Lyk4o0kxVu4d41MAG96Fywh9h2V/WIJfJHcijmacQ8OoKR8l8QsB/qeFJD3
 xdgfnLEQn8TlB/4RP5eTjfYQlKwyvUjmAoaZhfp/JXT2ZEZmHV8z+TDU0RDZeKf1cu
 3ouKp4h1kbrPJZWfDSoO4EczdHsOLHxhLNefpzKSR5cdU6qoAixFYEY62rtYf8Qv+D
 5M3TzGxCgJ060dsaErpC68UMnPA0RIo4+wIRL5FutYZM2AFca8RdsstYjFpWCK+uc8
 ofrnEMa/SyhHucZECVZhP3+8StnROBV8BHmRekU3LsPPvITJ4z4RjYbGUNgotkO/xE
 9XPp6ILcwsF1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uPdi84Ly
Subject: Re: [Buildroot] [PATCH/next 16/21] package/libvncserver: fix cmake
 4 compatibility
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

Hi Bernd,

Thanks for the patch.

On 03/12/2025 22:47, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...001-CMake-require-at-least-CMake-3.5.patch | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 
> package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
> 
> diff --git 
> a/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch 
> b/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
> new file mode 100644
> index 0000000000..e7b30e3db6
> --- /dev/null
> +++ b/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
> @@ -0,0 +1,26 @@
> +From e64fa928170f22a2e21b5bbd6d46c8f8e7dd7a96 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@jolla.com>
> +Date: Tue, 13 May 2025 08:37:07 +0300
> +Subject: [PATCH] CMake: require at least CMake 3.5
> +
> +CMake 4 dropped support for version requirements < 3.5.
> +
> +Fixes building with CMake >= 4.
> +
> +Upstream: 
> https://github.com/LibVNC/libvncserver/commit/e64fa928170f22a2e21b5bbd6d46c8f8e7dd7a96
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 205f3928..9b8118c8 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.4)
> ++cmake_minimum_required(VERSION 3.5)

This package patch does not apply. It fails with:

Applying 0001-CMake-require-at-least-CMake-3.5.patch using patch:
patching file CMakeLists.txt
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- saving rejects to file CMakeLists.txt.rej

Could you rebase the patch and send an updated version, please?

> +
> + set(PROJECT_LANGUAGES C)
> +
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
