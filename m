Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9D1C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 20:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF264817AC;
	Wed, 10 Jul 2024 20:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhIFPYlTtNJg; Wed, 10 Jul 2024 20:12:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA6483EC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FA6483EC3;
	Wed, 10 Jul 2024 20:12:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 439EE1BF599
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BF0D83ED5
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2dFr6liYM5M for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 20:12:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0DEF83EC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0DEF83EC1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0DEF83EC1
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 20:12:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B07FFE0002;
 Wed, 10 Jul 2024 20:12:09 +0000 (UTC)
Date: Wed, 10 Jul 2024 22:12:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240710221208.2dcc6150@windsurf>
In-Reply-To: <20240710161927.61358-1-bernd@kuhls.net>
References: <20240710161927.61358-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720642331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/O4ce8/KhxpfrcAqIb29O/F42vP3nYecHlI9TjcsAY=;
 b=fbEROaNXF2d1P/fZnPPS+UEffrOAXT55EgyqkhOsC7N9lP0ninxKgH2rmsWOxfEUsn5Ich
 FyRWT8WOBccgTTQSgmh27qIc2zli/ziR+wbRBoy8uwqZv/11d9YNg04wmhncMvJPSjpxRP
 hToPJyYi1rseFaVM1MNGUSSOjtt69KKwPiabB6KhttkoiKG/fqRwnB73i/cnkY3QxctPF1
 PZCiN+iZb5EpOF9iilJ7z3F+SqfcQei6wVjn6zuERYi0bH4X6IHQwun47b4dGB3+ml5vEi
 TfQBX8J9Z9ioYpqKXxR23WRVL1HGeNRvNgi/Ndw8OjBhlrzqR7z2zp5ScLoDtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fbEROaNX
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.98
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Jul 2024 18:19:27 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.exim.org/lurker/message/20240710.155945.8823670d.en.html
> 
> Fixes CVE-2024-39929: https://bugs.exim.org/show_bug.cgi?id=3099#c4
> 
> Removed patch 0004 due to removal of codesourcery arm/aarch64 toolchains
> with commit 53a8c5150e5eeeb6dbbead0275dbf9141f507511.
> 
> Patch 0005 (renamed to 0004) is still necessary with gcc-13.x,
> reformatted Upstream trailer.
> 
> Removed patches 0006, 0007 & 0008 which are included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  2 -
>  ..._lock-fix-lstat-related-build-errors.patch | 53 -----------------
>  ...atch => 0004-sieve-fix-build-errors.patch} |  2 +-
>  .../0006-OpenSSL-fix-non-DANE-build.patch     | 28 ---------
>  package/exim/0007-typoes.patch                | 58 -------------------
>  ...nssl.c-fix-build-with-libressl-3.5.0.patch | 43 --------------
>  package/exim/exim.hash                        |  4 +-
>  package/exim/exim.mk                          |  2 +-
>  8 files changed, 4 insertions(+), 188 deletions(-)
>  delete mode 100644 package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch
>  rename package/exim/{0005-sieve-fix-build-errors.patch => 0004-sieve-fix-build-errors.patch} (95%)
>  delete mode 100644 package/exim/0006-OpenSSL-fix-non-DANE-build.patch
>  delete mode 100644 package/exim/0007-typoes.patch
>  delete mode 100644 package/exim/0008-src-src-tls-openssl.c-fix-build-with-libressl-3.5.0.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
