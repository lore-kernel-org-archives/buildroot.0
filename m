Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A724C10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 07:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D945F41560;
	Tue,  7 May 2024 07:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id si9IF6tXMh0y; Tue,  7 May 2024 07:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF66241566
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF66241566;
	Tue,  7 May 2024 07:14:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81B7A1BF32C
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C0C981F16
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wFWjiKA5J9N for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 07:14:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 473D181EEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 473D181EEE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 473D181EEE
 for <buildroot@buildroot.org>; Tue,  7 May 2024 07:14:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66006240008;
 Tue,  7 May 2024 07:14:43 +0000 (UTC)
Date: Tue, 7 May 2024 09:14:42 +0200
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <20240507091442.25a27b48@windsurf>
In-Reply-To: <20240507041548.382997-1-dm.chestnykh@gmail.com>
References: <20240507041548.382997-1-dm.chestnykh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715066083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NAK7zfrrTeOBihYXpTsAspTBAcOpzmXRs2FmaCfcBF4=;
 b=kLIrfBZbFpjIgP0gWt6u0jPMef5/Nt6s6ezt+KMuVGgTZE/WNcSbgQkMntx0bzZMFBfquV
 u2sNzmaY1Xgyp9xv4v66WCBYOLEALc/O5BQqTlr5H2UEbsNQ4pCDJkgv+dfyg3rp3O15Th
 JMYY/gNiu3gCWMT0ibnhNfI5ZrE/eJBsuWV4ZItrok4FOhffId1oCk8NucsUZuoXxPdOwq
 7VUPnk7e9Kh6OkVs6crkPVwBNxkUgkFlSjgV6Lv+HRXdskaJMEXo/hxoisZbpLCIHIWUGA
 A0uAdbvc6nT31igMrsmDIwtE/I+5kAPv56BVgldxZp5N3BXnlwnjA/lu4lGfZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kLIrfBZb
Subject: Re: [Buildroot] [PATCH v3] configs/qemu_sparc_ss10_defconfig:
 Re-introduce.
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dmitry,

Thanks for this new iteration, which I have applied, after doing a few
changes, see below.

On Tue,  7 May 2024 07:15:48 +0300
Dmitry Chestnykh <dm.chestnykh@gmail.com> wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1c5ad1e42a..4bd6c58d4a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3343,3 +3343,7 @@ F:	package/quazip/
>  F:	package/shapelib/
>  F:	package/simple-mail/
>  F:	package/tinc/
> +
> +N:	Dmitry Chestnykh <dm.chestnykh@gmail.com>

This file is alphabetically sorted, by name of developers, so you
should have added this entry in the "right" place rather than at the
end of the file. I fixed that up.

> diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
> new file mode 100644
> index 0000000000..a8e3df9180
> --- /dev/null
> +++ b/configs/qemu_sparc_ss10_defconfig
> @@ -0,0 +1,28 @@
> +# Architecture
> +BR2_sparc=y
> +BR2_sparc_v8=y

We now require (since just a week or two) hashes of custom packages to
be checked as well, so I added:

+# Hashes
+BR2_GLOBAL_PATCH_DIR="board/qemu/sparc-ss10/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y

as well as a board/qemu/sparc-ss10/patches/linux/linux.hash which
contains the hash of the linux 6.8.6 tarball.

> +# Linux headers same as kernel
> +BR2_PACKAGE_HOST_LINUX_HEADERS_AS_KERNEL=y

This should have been:

+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y

Again: patch applied with those fixes, thanks a lot for your
contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
