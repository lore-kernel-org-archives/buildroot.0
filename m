Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A000DC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F03E5408F1;
	Mon, 22 Jul 2024 12:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyKEIUT2tp9E; Mon, 22 Jul 2024 12:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EDCB408B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EDCB408B0;
	Mon, 22 Jul 2024 12:32:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CEA31BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E20140156
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpcVQ2-FNuoZ for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04A6840373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04A6840373
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04A6840373
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:32:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5A3DE000A;
 Mon, 22 Jul 2024 12:32:02 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:32:01 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240722143201.68c96b59@windsurf>
In-Reply-To: <20240721165023.1988603-1-fontaine.fabrice@gmail.com>
References: <20240721165023.1988603-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721651522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4tuhKHAwUsupRoJiq50R2rTyZVpo1sv6431BWaFpn/A=;
 b=CmkicrGz82tcSDMqvJ8oT3maUCFc7KtaCrobkoIkSwWZoCwVwkIYoISvxfwW1NxUrDBOq6
 csDQ1/cXMRoszBHzHvoRFPadtQYuo9y6B/Cj2jYaVArxGzmaa8JujWwWoWQglX+gvKJoER
 alWUbzaJs70fgnqZg4PPMkqaibiso+Ic5DTpaUibFqMH+YHLS1Bdl+LoTKeLXzs4RjtTSy
 3jJuPSS4kvJf0qZko0KVkf72WAfMWiGvti0ejlxPvGkAFOEohiLQxg3TQlhnyQEufB1lGl
 nO5z+yQ6VXCt6Qh9uiO7LPh2Ldw3YbY9Z4YNT4N0ksm/9rpvyazuG0Co7DK/tA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CmkicrGz
Subject: Re: [Buildroot] [PATCH 1/1] package/sysprof: needs headers >= 5.12
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
Cc: Will Newton <will.newton@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Jul 2024 18:50:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> sysprof unconditionally uses PERF_RECORD_MISC_MMAP_BUILD_ID which is
> only available since kernel 5.12 and
> https://github.com/torvalds/linux/commit/88a16a1309333e43d328621ece3e9fa37027e8eb
> resulting in the following build failure with kernel < 5.12 since bump
> to version 46.0 in commit 0d57555407f2a0708515e7c377f57a6466c78b1b:
> 
> ../src/libsysprof/sysprof-sampler.c: In function 'sysprof_sampler_perf_event_stream_cb':
> ../src/libsysprof/sysprof-sampler.c:186:33: error: 'PERF_RECORD_MISC_MMAP_BUILD_ID' undeclared (first use in this function); did you mean 'PERF_RECORD_MISC_MMAP_DATA'?
>   186 |       if ((event->header.misc & PERF_RECORD_MISC_MMAP_BUILD_ID) != 0)
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                 PERF_RECORD_MISC_MMAP_DATA
> 
> While at it, also fix a typo in "library"
> 
> Fixes: 0d57555407f2a0708515e7c377f57a6466c78b1b
>  - http://autobuild.buildroot.org/results/9a9f8462bd1d7127dc80de7f280ab9d100db47fe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sysprof/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

5.12 is quite "recent", but OK if people care about sysprof on older
kernels, they can provide a patch that allows building sysprof on older
kernels. Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
