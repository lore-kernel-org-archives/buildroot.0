Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACC6D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D51404095B;
	Wed,  7 Jan 2026 17:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tY2wetsHEa9a; Wed,  7 Jan 2026 17:49:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFEB84095A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808135;
	bh=jZRtItt3JPEMVUuxrlrx4RYxwBDONg7cG7562Z6dciA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mblAfUenBQLpVWn9Bf8OFPt/S9iuW1pZqoBar6Q76FBus6+Y1wsSmwtCBQu4mZ0gb
	 XBDxt/QGDHE4rYn4Z8mxy+bPgfLcJSWgdaIgFHgdlJFF0gfkAD7gecyViqeOSxdvfs
	 DT3eY4pdHUr95s7uXIzKSGDmzFf2Otvh0+FxWGi2+eks6JyzsSxOKQcSIKzYXLtPEQ
	 rkNsPS0or1/GSB8PLyubLExqlxyQel45MQDCaIXoobknTYPgd+t3hiTjt4CZ7A9iFA
	 7APfrxDc4OAr0NbNP7ieo/cdv16FE22zH4/BAVwS6mu4hTGKNPbxu5FOhUI54unCWN
	 eLe26ksyaoZ1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFEB84095A;
	Wed,  7 Jan 2026 17:48:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9FFC25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0B5080BD8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZzweeyM8fyC for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:48:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AAE268227E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAE268227E
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAE268227E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AE98CB97A596; Wed,  7 Jan 2026 18:48:24 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:48:22 +0100
Message-ID: <20260107174822.224394-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205190034.1839192-3-bernd@kuhls.net>
References: <20251205190034.1839192-3-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808104; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=yvc0ym3z3V/Gf1nq1i8ByvKTQtRWBMesbD7bh9yeniI=;
 b=fyKdNTOX1/7TRERGX2B0B0hkjVQZUqcno2Jetwo4/U3a9K6404DlEWx9WrLz5BurHHXnwh
 GvL/6tBE5WRkPiNdefZ3jMPGLdkSEKndvYwDiAqcXm3hHfDInxCDDhtHCiVfUup+d8Hjqk
 rSN16O2qfyqic+t69ms0iENq/GnwM35n2dzw1Kvl1+fGVbfZ2ojG2ba2Shj1EbaHHX2bCQ
 nk6+yeNM3RrH19pbS4DlmxXWY1igq58eQgQNmWYa3w4wzFh27u8B2hWrQPmoOstyB3rzSF
 02GkVwKg9+JBBAqmRg8VVSCCr4mEmsprLVttQQDn/WGuay/j70azNE4VJdzyFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fyKdNTOX
Subject: Re: [Buildroot] [PATCH/next 3/4] package/matchbox-keyboard: switch
 to gz tarball
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Switched _SOURCE to .gz, upstream does not provide bz2 tarballs anymore.
> 
> No autobuild errors recorded due to previous download error with
> matchbox-lib.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/matchbox-keyboard/matchbox-keyboard.hash | 2 +-
>  package/matchbox-keyboard/matchbox-keyboard.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/matchbox-keyboard/matchbox-keyboard.hash b/package/matchbox-keyboard/matchbox-keyboard.hash
> index 43ace650a4..1cc657edc4 100644
> --- a/package/matchbox-keyboard/matchbox-keyboard.hash
> +++ b/package/matchbox-keyboard/matchbox-keyboard.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  44fc6dc6075090d6f8e43f8667cf8a85bed59b7221a5ee81843454c66e352790  matchbox-keyboard-0.1.1.tar.bz2
> +sha256  dd3e9494a9499a3bf3017c8c1e6572a4e91deb20e219717db17c0977750b8bcb  matchbox-keyboard-0.1.1.tar.gz
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
>  sha256  bba6fd8976fa5c669ddc1378a3d8d49a74263d4d39efb9a90cefb3583a813ecc  applet/applet.c
> diff --git a/package/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox-keyboard/matchbox-keyboard.mk
> index a1e3c61543..5d54a0005b 100644
> --- a/package/matchbox-keyboard/matchbox-keyboard.mk
> +++ b/package/matchbox-keyboard/matchbox-keyboard.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  MATCHBOX_KEYBOARD_VERSION = 0.1.1
> -MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz2
> +MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.gz
>  MATCHBOX_KEYBOARD_SITE = \
>  	http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/snapshot
>  MATCHBOX_KEYBOARD_LICENSE = LGPL-2.1, GPL-2.0+ (applet.c)
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
