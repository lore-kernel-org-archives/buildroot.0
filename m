Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1A6C001DF
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 20:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 217BB81E2D;
	Mon,  7 Aug 2023 20:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 217BB81E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_p8pp2zi8LR; Mon,  7 Aug 2023 20:06:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B02F81E26;
	Mon,  7 Aug 2023 20:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B02F81E26
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 703331BF287
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43B4E404D8
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43B4E404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UlfjgbwOdp68 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 20:06:50 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C092240122
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 20:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C092240122
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0B5CC0002;
 Mon,  7 Aug 2023 20:06:46 +0000 (UTC)
Date: Mon, 7 Aug 2023 22:06:45 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230807220645.546836bc@windsurf>
In-Reply-To: <ZNEOketbv2Ba6O5N@waldemar-brodkorb.de>
References: <ZNEOketbv2Ba6O5N@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691438807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2hqdK98ohcV9lbkZ9jjkpoMuUYKmeIcq/gzdD35b06c=;
 b=k6ytbSRT49iB7J04EIUfQRJnj0Ms4Mz7e7jyEB5ROGd8LHq8fTpJ0OxOl5zWasK0jx6VW/
 7heQhyCOEspwTV1j6HYabuk1uM8wNrtqpJl21N9+JDnHaFOIoLJyVJOzmsFcV/vwRFYanD
 UojYGynDwyULsTXy7WyEwpAXkfWAyynGdXWOwp42l9K2SW88bL95ydgDpeKKLOpXrI40U4
 bWhaVWwjiB0QB1IuUTfAwXivp5cFT0nMstCoSDGa/AJ8gXgjJIp66FLyJofbC3pmPXIQgI
 TVkMGqceOiBEppF4sC89SrYWrnZu4Q6JN3OUQ6DvDOLPL3D5jktgFYaeFfjuLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k6ytbSRT
Subject: Re: [Buildroot] [PATCH] package/check: fix compile issue
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
Cc: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Mon, 7 Aug 2023 17:32:33 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Switch to the tagged version of check.
> See here for details:
> https://github.com/libcheck/check/issues/303
> 
> Fixes following autobuild failure:
> http://autobuild.buildroot.net/results/b10/b1087e9a67ff0382632b73f280fabe92cd863593/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

This commit log was too terse, because it doesn't describe when the
problem started occurring, which is important for the maintenance of
our stable branches. So I had to do quite some research to figure out,
and come up with the following commit log:

    package/check: fix compile issue due to missing source file
    
    The release tarball of check 0.15.2 lacks a source file, causing a
    build failure, as reported at
    https://github.com/libcheck/check/issues/303. This failures happens
    when thread support is not available, as the file missing is getting
    compiled in when thread support is not there:
    
    if(NOT HAVE_PTHREAD)
      target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/pthread_mutex.c)
      target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/pthread_mutex.c)
    endif()
    
    This issue started appearing when we moved from the autotools build
    system to the CMake build system in commit
    6dfc789f4f21367bc5f4b5454db0922821a765bc. One might wonder why
    changing the build system can cause this kind of issue: the file was
    in fact already missing. Turns out that the missing file is never used
    with the autotools build system: this file provides some Win32
    compatibility layer for pthread functions, so the autotools build
    system never compiled this file as the autotools build system was only
    used on Unix platforms. With CMake it now gets compiled to support
    Windows platform. But on Linux, the entire contents of the file is
    ignored as it is within a HAVE_WIN32_INIT_ONCE ifdef...endif. Still,
    with the file missing, the build fails.
    
    Until upstream publishes a new release with a complete tarball, switch
    to fetching the Github-generated tarball, which does contain the
    missing file.
    
    Fixes:
    
      http://autobuild.buildroot.net/results/b1087e9a67ff0382632b73f280fabe92cd863593/
    
    Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

As pointed out by Daniel Lang, using "Fixes:" is important, as it has a
special meaning for patchwork.

>  CHECK_VERSION = 0.15.2
> -CHECK_SITE = https://github.com/libcheck/check/releases/download/$(CHECK_VERSION)
> +CHECK_SOURCE = $(CHECK_VERSION).tar.gz
> +CHECK_SITE = https://github.com/libcheck/check/archive/refs/tags

Switched to using the github helper, exactly like Daniel Lang suggested.

Applied to master with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
