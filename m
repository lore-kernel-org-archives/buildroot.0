Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41D6C64ED6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 23:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 183784059F;
	Thu, 23 Feb 2023 23:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 183784059F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jv7g3Jw8nct7; Thu, 23 Feb 2023 23:01:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52F0A405A0;
	Thu, 23 Feb 2023 23:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52F0A405A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 983431BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 23:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 603F260BBB
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 23:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 603F260BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B9UHU7ekDLJB for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 23:01:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB25A60BB9
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB25A60BB9
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 23:01:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 17249E0007;
 Thu, 23 Feb 2023 23:00:59 +0000 (UTC)
Date: Fri, 24 Feb 2023 00:00:59 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230224000059.367730f1@windsurf>
In-Reply-To: <20230223153236.914358-1-fontaine.fabrice@gmail.com>
References: <20230223153236.914358-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677193260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLdlvGKcFBH7CI63emUH3Hk6NmKcGRVhBK+5CREA2es=;
 b=OYjMrvT2VlSujZ9yAXpbtrgj4VYVDZF0Q5YRjfPf5dX084jE7E6FzutDcJp1KcSOS+BJm/
 kUhIWdYz5WnxU+BZX9+uuyiOnsqT5Tp6qrA6FSUq+VxF5uwaQguxIlvQGpjnwMFTTZlVEA
 Xr6YrJOFO3u4xN2O4cJe8SPHGWA7UcC/MgLgEqLN/W3uswOg3uemPmgf+rCCUSzkJf0J71
 U2fkZth5KgaTC+JJWbNgx8kgfB99mqZOzie7y32JEdFCO/GBK+ZtttKDKO7re/QdNc74zX
 HpKeBDy/ja9Lv16MfSXz4dMgfZOW55EVgogQntK62dFyumBK9oN3skyvvJ72dA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OYjMrvT2
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

Hello,

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

So this returns success.

> configure:34419: /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O0 -g2  -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lrt -latomic -lexecinfo -lm  >&5
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies executable stack
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> configure:34419: $? = 0

This as well.

> configure:34500: /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O0 -g2  -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lrt -latomic -lexecinfo -lm  >&5
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies executable stack
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> configure:34500: $? = 0

This as well.

> configure:34555: checking whether cairo's pthread feature could be enabled
> configure:34557: result: no (can't link with -lpthread or -pthread)

So why does it conclude that thread support is not available?


> + 	dnl Make sure we scored some pthreads.
> + 	if test "x$enable_pthread" = "xyes" -a "x$have_pthread" != "xyes"; then
> +-		AC_MSG_ERROR([pthread requested but not found])
> ++		AC_MSG_WARN([pthread requested but not found])
> ++		have_pthread=yes

This looks odd because you're basically "ignoring" the
detection/validation of thread support.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
