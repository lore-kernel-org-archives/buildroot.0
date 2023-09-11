Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7791CCA0EC0
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 21:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2505240905;
	Mon, 11 Sep 2023 21:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2505240905
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8j8OyQwSa6WW; Mon, 11 Sep 2023 21:08:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDE6F40922;
	Mon, 11 Sep 2023 21:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDE6F40922
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 376E11BF32E
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 21:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10A9760BDC
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 21:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10A9760BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BBjC052kE7fj for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 21:08:42 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9712560AD5
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 21:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9712560AD5
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0926E0009;
 Mon, 11 Sep 2023 21:08:21 +0000 (UTC)
Date: Mon, 11 Sep 2023 23:08:21 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230911230821.12471642@windsurf>
In-Reply-To: <20230223153236.914358-1-fontaine.fabrice@gmail.com>
References: <20230223153236.914358-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694466520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l+Qvg8urVJ9i/z3gTJpfUX/63x6KRoIUOqbiO8mTZZI=;
 b=PPlbll5xm9Y3Y50kfhYUdy5MYAJ6sSl486BklcAezgWXD/YNTu1/hVMk4fQrI/b9Y8w2Hr
 5uZ1OMW4KkWtb0TtFJZXKeLJ3my4ab9Qx3nZ7ZegjG14yWW9aCtGl7X9CPZ3pBYs+KLnvh
 GOQpyPe4t6J8d3YjtvL3pzntL6yXehwG0kr202d8uzjCh3Po6BukIpkchnIPOPMxJcYmUS
 E4WHPKbN9Zi/VTbeDQZnByddMXVtOazR0pfZIWK9JSsQXMcFE7EbkBzeH5/C9yui1nOyOk
 TyGSHzQAc29ONtaRfTx2kWKFuOAJ+ImjruVvobA6J+iZ3rKn1Vgk9JAWFMrEQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PPlbll5x
Subject: Re: [Buildroot] [PATCH 1/1] package/cairo: fix pthread detection
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

On Thu, 23 Feb 2023 16:32:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pthreads detection fails if a warning is emitted resulting in the
> following build failure with some toolchains:
> 
> onfigure:34189: checking for cairo's pthread feature
> configure:34300: /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O0 -g2  -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lrt -latomic -lexecinfo -lm -lpthread >&5
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies executable stack
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> configure:34300: $? = 0
> configure:34419: /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O0 -g2  -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lrt -latomic -lexecinfo -lm  >&5
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies executable stack
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> configure:34419: $? = 0
> configure:34500: /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O0 -g2  -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lrt -latomic -lexecinfo -lm  >&5
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies executable stack
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> configure:34500: $? = 0
> configure:34555: checking whether cairo's pthread feature could be enabled
> configure:34557: result: no (can't link with -lpthread or -pthread)
> 
> [...]
> 
> In file included from cairo-mutex-type-private.h:45,
>                  from cairo-scaled-font-private.h:45,
>                  from cairoint.h:434,
>                  from cairo-analysis-surface.c:37:
> cairo-mutex-impl-private.h:262:3: error: #error "XXX: No mutex implementation found.  Cairo will not work with multiple threads.  Define CAIRO_NO_MUTEX to 1 to acknowledge and accept this limitation and compile cairo without thread-safety support."
>   262 | # error "XXX: No mutex implementation found.  Cairo will not work with multiple threads.  Define CAIRO_NO_MUTEX to 1 to acknowledge and accept this limitation and compile cairo without thread-safety support."
>       |   ^~~~~
> 
> To avoid this build failure, add a patch that overrides this broken
> mechanism
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5420beaf94855e47eeb08627e8e3c169dc00419a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...e.ac.pthread-respect-enable-pthreads.patch | 59 +++++++++++++++++++
>  package/cairo/cairo.mk                        | 13 ++--
>  2 files changed, 68 insertions(+), 4 deletions(-)
>  create mode 100644 package/cairo/0005-build-configure.ac.pthread-respect-enable-pthreads.patch

This has been fixed directly in gcc by:

  https://gitlab.com/buildroot.org/buildroot/-/commit/ab4f3fafaa839593b3efd9ea12c8ee5d9340cdeb

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
