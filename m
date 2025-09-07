Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC8BCA1017
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 15:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F098D82451;
	Sun,  7 Sep 2025 15:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHn3Y1nFJaRz; Sun,  7 Sep 2025 15:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B1138238E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B1138238E;
	Sun,  7 Sep 2025 15:19:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 777239E4
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6980440CCC
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79_W-PukGGu0 for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 15:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1ABF4028B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1ABF4028B
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1ABF4028B
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:19:50 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id A7127440908;
 Sun,  7 Sep 2025 18:19:28 +0300 (IDT)
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Luca Ceresoli
 <luca.ceresoli@bootlin.com>
In-Reply-To: <20250907150711.3438750-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sun, 7 Sep 2025 17:07:10 +0200")
References: <20250907150711.3438750-1-thomas.petazzoni@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Sun, 07 Sep 2025 18:19:45 +0300
Message-ID: <87wm6agui6.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1757258368;
 bh=89s4voQsVdN+V+o7BzsjA8Rk1Vvq4GcR1ZnnbQ6On9w=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=wFP0KCrOo0dzsFKvWt/q4noblfOaicI9HIErUUxpDp0jOjlL5BGbmDJpeN0o0is+M
 qoIjnUJqWkcw01hraGGkIl0TYqT2LA14JoWIU2J0FtB4yuUfKNZehygEd6bWTdpNn1
 xfLhjcFk1NfPXdQmCe8jr1MLga0t23inb5SR7vZ3jTOKYZ10df3MfdKxqMEa6G2xk9
 YqKzudeGGi/1tpHeIJIzgWMp3ASB75gmP00dHIohZQJ1+/BOeUNbtsAnYCSPRfhFMP
 xtOXLb8ZGUPqv/PjNyeDffwiRWINjG5dgmzOO1UnHl6vJ0QR2q9I1DxjPqUvttlI+i
 Qxdc4hvU0Axsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=wFP0KCrO
Subject: Re: [Buildroot] [PATCH v2] package/unzip: bump to Debian patch
 level -29 to fix GCC 15.x issues
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Sun, Sep 07 2025, Thomas Petazzoni via buildroot wrote:
> diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
> index bbf4f7d71f..5e2bbcb0b0 100644
> --- a/package/unzip/unzip.hash
> +++ b/package/unzip/unzip.hash
> @@ -1,6 +1,5 @@
> -# From https://snapshot.debian.org/archive/debian/20210110T204103Z/pool/main/u/unzip/unzip_6.0-26.dsc
> +# From https://snapshot.debian.org/archive/debian-debug/20250311T212313Z/pool/main/u/unzip/unzip_6.0-29.dsc

Why is this move from debian/ to debian-debug/ in URL?

Also in _SITE below.

baruch

>  sha256  036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37  unzip_6.0.orig.tar.gz
> -sha256  67bde7c71d52afd61aa936d4415c8d12fd90ca26e9637a3cd67cae9b71298c12  unzip_6.0-27.debian.tar.xz
> -
> +sha256  14043e5ea351c02b3bc8676e1e6d20d79b9a690b6d7520e8138ac629cc048417  unzip_6.0-29.debian.tar.xz
>  # Locally computed:
>  sha256  7469b81d5d29ac4fd670f7c86ba0cb9fa34f137a2d4d5198437d92ddf918984b  LICENSE
> diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
> index 5effebee4a..4329054c1c 100644
> --- a/package/unzip/unzip.mk
> +++ b/package/unzip/unzip.mk
> @@ -6,8 +6,8 @@
>  
>  UNZIP_VERSION = 6.0
>  UNZIP_SOURCE = unzip_$(UNZIP_VERSION).orig.tar.gz
> -UNZIP_PATCH = unzip_$(UNZIP_VERSION)-27.debian.tar.xz
> -UNZIP_SITE = https://snapshot.debian.org/archive/debian/20220916T090657Z/pool/main/u/unzip
> +UNZIP_PATCH = unzip_$(UNZIP_VERSION)-29.debian.tar.xz
> +UNZIP_SITE = https://snapshot.debian.org/archive/debian-debug/20250311T212313Z/pool/main/u/unzip
>  UNZIP_LICENSE = Info-ZIP
>  UNZIP_LICENSE_FILES = LICENSE
>  UNZIP_CPE_ID_VALID = YES

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
