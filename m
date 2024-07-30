Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F32C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 07:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A91180E47;
	Tue, 30 Jul 2024 07:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlsEfT_kxnHa; Tue, 30 Jul 2024 07:37:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35CC280ECC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35CC280ECC;
	Tue, 30 Jul 2024 07:37:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 624181BF360
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50E38812EE
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqo_UqR_Ztkk for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 07:35:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A35D80E47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A35D80E47
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A35D80E47
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:35:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 667B3C0006;
 Tue, 30 Jul 2024 07:35:45 +0000 (UTC)
Date: Tue, 30 Jul 2024 09:35:44 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20240730093544.001f5abf@windsurf>
In-Reply-To: <20240719210325.2096254-1-thomas.petazzoni@bootlin.com>
References: <20240719210325.2096254-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722324945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7k6wbeeVOsZcE6Xybjc7L1BhF+ymKnFPEYah5wJ/fhA=;
 b=p7rwPcoBnOgAEe6YHkUjj9+yb2r82N61ebMzLTrec3JyAEBydo6vaFyjCjhBp/XYxdNBnQ
 B486M+IcI6o+/8vyJy6zast6FRVbl06ERIZpT+Y9U6xqDB8ByCEH3IAKPFPi1MzDxAQhaZ
 mnhaGU46prv59FpvUIevIEqyqSHABtfHHi7U9ghxF7cNCKWIyUdEP3Xt6maOSO/We6ibnm
 WxHNnTyf77e1qdn7BahIwRnVdHP3g/wdeSilq5F3B8Q7Znw/HjGoBRZw3ywQGL69BuPzgl
 zkFrT75UEqBucfe8x1H2dWw4aojCKYAA/t2QKeMBJgamQxoDWawBlMPKnRSA/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p7rwPcoB
Subject: Re: [Buildroot] [PATCH] package/gcc: fix build with
 BR2_TIME_BITS_64=y
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 19 Jul 2024 23:03:24 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> On the architectures that supports libsanitizer (part of gcc), the
> build is currently failing with BR2_TIME_BITS_64=y. This is because
> some code in libsanitizer unsets _FILE_OFFSET_BITS, but building code
> with _FILE_OFFSET_BITS unset, but _TIME_BITS set isn't legal.
> 
> To fix this, this commit backports two changes:
> 
> - One change to also unset _TIME_BITS in
>   sanitizer_platform_limits_posix.cpp. This change is upstream in
>   LLVM, and already part of GCC 14.x, so we only bringing it to GCC
>   12.x and GCC 13.x.
> 
> - A second change doing the same modification, but in
>   sanitizer_procmaps_solaris.cpp, which as crazy as it might sound,
>   also gets compiled on Linux platforms (but to basically an empty
>   file). This change has been submitted upstream to both LLVM and gcc.
> 
> Notes:
> 
>  - the special PowerPC SPE version of GCC cannot be affected, as only
>    uClibc-ng is used for this architecture, and uClibc-ng doesn't use
>    _TIME_BITS=64 (but now default to 64-bit time_t on 32-bit
>    architectures, like musl does).
> 
>  - the special ARC version doesn't need patching because libsanitizer
>    doesn't support the ARC architecture, so it doesn't get built
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/ff2dbfdabf0bb6a0d82ea8a80122ab97fd75bd3f/
>   https://gitlab.com/buildroot.org/buildroot/-/issues/16
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...-along-with-_FILE_OFFSET_BITS-on-Lin.patch | 44 +++++++++++++++
>  ...o-undef-_TIME_BITS-in-sanitizer_proc.patch | 53 +++++++++++++++++++
>  ...-along-with-_FILE_OFFSET_BITS-on-Lin.patch | 44 +++++++++++++++
>  ...o-undef-_TIME_BITS-in-sanitizer_proc.patch | 53 +++++++++++++++++++
>  ...o-undef-_TIME_BITS-in-sanitizer_proc.patch | 53 +++++++++++++++++++
>  5 files changed, 247 insertions(+)
>  create mode 100644 package/gcc/12.4.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
>  create mode 100644 package/gcc/12.4.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
>  create mode 100644 package/gcc/13.3.0/0004-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
>  create mode 100644 package/gcc/13.3.0/0005-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
>  create mode 100644 package/gcc/14.1.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch

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
