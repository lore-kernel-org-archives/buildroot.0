Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00985E8FDCD
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B9C060799;
	Sat, 27 Dec 2025 15:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXF8L5ou4Bw8; Sat, 27 Dec 2025 15:57:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B42F06069A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766851030;
	bh=9euXds7vaTBvyBRQSN8rm5ctifNZ4Ujz8zitb/eDfDA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jn/j5lbYctKQXaq9mtALjmHw1RDvMxYHNV32tefpNg1DIvw5HtX3lVqP+AGS3UAHW
	 C9i3SmRB8z53kfGTsR13LHweHkfIe9/j0hgWH/3R5dpi+OBn/InuNj9l7xtexq/UxM
	 wTFeuIMS37V2ROwSrEugxdMSedb+5gpjxQiB7jCaHfpyIq+4AUKPOOkjnRE7VEMv55
	 Qd8DE+qHrbG4Ymxf63plt900DTNUSmBdHunZDNDXGjQAG3p9DnXB+iBTkBz+UW2IRX
	 0ZvUFqPYFF80Elj+ArJBLFUoYfuqvrTnT6em/TkwVHzeZud6iUmQ8Wq6Vvn7FTCsDx
	 5yEPYmttToDDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B42F06069A;
	Sat, 27 Dec 2025 15:57:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02CB1119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAB7F4043B
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fukHC0HSVnE for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:57:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 100B84043A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 100B84043A
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 100B84043A
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:57:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9EB9B1A24A0;
 Sat, 27 Dec 2025 15:57:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 681BF60725;
 Sat, 27 Dec 2025 15:57:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BF21F11978559; Sat, 27 Dec 2025 16:57:03 +0100 (CET)
Date: Sat, 27 Dec 2025 16:57:02 +0100
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, Paul Cercueil <paul@crapouillou.net>
Message-ID: <20251227165702.5930b424@windsurf>
In-Reply-To: <20251222172638.839720-1-buildroot@bubu1.eu>
References: <20251222172638.839720-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766851024; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CYA4Z9/JYdXUMaxuteDAk+/z+EmSWdPO32dbk5JuWmk=;
 b=lD6zvFeZ5irmte3VSlJgcx8vcKaZh6WXuKyh95HvIIHzPQRXHJyLlENsp1XuOmuvKKwmBk
 yt1C1X9+oXmbhK6chfiv4fqVOzSCVWJEOaW65CnnA7llTnHcbyBaQkAi6Z2HvFaL/+DQ48
 lgc1C7GSGH3azZkSYYoHhkL8cJ0K2QKkpGnpXwDX0SolKpTJ9hCZrKb6Phr9mKfSZnndLL
 kSPOHp+5mFmgAXITjHat/bWX3NKmpSFSvOwWKZmQ3ztcijtBEjCOsK2u3qAdCHa6R6UtGh
 1yXaL/3ucM1BlLh5f34T/NLwNPksLZ+rgwt7TMohpXqVuESmULeZPbin7zMYig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=lD6zvFeZ
Subject: Re: [Buildroot] [PATCH 1/2] package/libiio: fix python bindings
 without glibc utils
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

Hello Marcus,

On Mon, 22 Dec 2025 18:26:36 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Libiio python bindings use ctypes and specifically the find_library()
> function from there to load the libiio.so shared library. This is not
> working unless glibc utils (specifically ldconfig) is installed to the
> target (alternatively the target would need gcc or binutils, for objdump
> or ld).
> 
> The easy fix here is to just bypass the find_library() machinery
> altogether as it's not needed on a buildroot system.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  ...-bindings-python-fix-library-loading.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/libiio/0001-bindings-python-fix-library-loading.patch

Thanks, I have applied both patches. However I must admit that for
PATCH 1/2, I would probably have preferred to backport the on-going PR
on cpython, which fixes the problem for all cases, not just libiio.

Reading the discussion on the PR, I think it was improperly presented
as being needed for "musl", and used only for musl. I would suggest to
not present it as something musl-specific, but rather something that
makes the lookup for the C/C++ libraries more portable (and therefore
probably drop using ldconfig entirely). This would have addressed the
concern raised on the PR that this is musl specific, and musl is not a
supported platform, yadayadayada.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
