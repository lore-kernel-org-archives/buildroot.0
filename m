Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4F2CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F26FD42867;
	Sat, 30 May 2026 20:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ts-v68_lxtGi; Sat, 30 May 2026 20:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D68F4286B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780171339;
	bh=4n44YSJ8WKyW6w5rjXziuJh3SelL9zookIODZMtFNxY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Ska/xcifxqKPTxJq480kq4HOfVquR/BOoySJ2QdfirE8vYn4BlinV8YaqvEWRBTGY
	 MD6eA06U6oOd3bGkOx4hPIuo/2AFO0KqhO1qYnFR24Jlcns7C6y+tr/rX0vyTKXTOg
	 FsctyR5exobkUC7rm85DS3ZIiNzu3EQa8SyJPJGOlshXPmgQSEEqMR17Y4KM8M4P6R
	 OurG2zVsNmB2evHJ8UBEsZPncwN10X1RMYlor7vuKfWwyF/qjv/ZfaAXP6GfFrG3rH
	 VWiaZlabq04YhtQxiYTy3ZpqGmQCeeJFoZKjGrcVhtRGbg5e4pUakuwxHvWv6jMxf4
	 J9XqJSEDUesbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D68F4286B;
	Sat, 30 May 2026 20:02:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 215B6F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12E086F5B9
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YgSDQ81fI7p for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:02:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E477D61737
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E477D61737
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E477D61737
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:02:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 56791B97C654; Sat, 30 May 2026 22:02:14 +0200 (CEST)
Message-ID: <9c1fb04c-d11e-4d24-8985-2cd962098179@rnout.be>
Date: Sat, 30 May 2026 22:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260530190023.2108688-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260530190023.2108688-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780171334; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=vwxPkC4IRUatitwdkLzFjl8M5l5Gbnf3yCgayb+6QwU=;
 b=TlDY9UeTwhlSPjpW6jv5E1ZedoHTSPZuTGT629k5MSzCJkfEPwOEwtApPsFNqCDeP0aTxJ
 Shvmi/T2iskOCSW2jmWd7uXKBmoHYsI+6KTDLaB0FuiDMbmlWKksOOhedRYujotlPeJb0s
 EJgJRIgij6+8ojR+Du3k6Tu5P1xNgpWY/LbFfRkyVoYHXhAFSTfUQTi0iRRbmqhVsGROoV
 8PGFWaRxx0ijQv4eiZa4R6p6PUUSI2OPMs96TpkkuBgOJTMKUrTab3QNjHsA2xWZyPx3g9
 68ac0DQRr2wn42yHVKPaqJTiHuPuDHqcv7FeKGpJdh3gUjDo2IxXdqhqCfW7IQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=TlDY9UeT
Subject: Re: [Buildroot] [PATCH v2 1/1] package/lrzsz: fix build with gcc >=
 14.x
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/05/2026 21:00, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/2e3/2e33c61e1c9bee099f973c1e43b696c63e5eed4b/
> 
> Building lrzsz with this defconfig works:
> 
> BR2_GCC_VERSION_13_X=y
> BR2_PACKAGE_LRZSZ=y
> 
> and gets broken when switched to gcc 14:
> 
> BR2_PACKAGE_LRZSZ=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks. However...

> ---
> v2: Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/91762f979c8e49688a6e84c1cecdc7060d7c290b
> 
>   .../0007-configure-fix-for-gcc-14.x.patch     | 55 +++++++++++++++++++
>   1 file changed, 55 insertions(+)
>   create mode 100644 package/lrzsz/0007-configure-fix-for-gcc-14.x.patch
> 
> diff --git a/package/lrzsz/0007-configure-fix-for-gcc-14.x.patch b/package/lrzsz/0007-configure-fix-for-gcc-14.x.patch
> new file mode 100644
> index 0000000000..160cf73d62
> --- /dev/null
> +++ b/package/lrzsz/0007-configure-fix-for-gcc-14.x.patch
> @@ -0,0 +1,55 @@
> +From 791b757537d48a9e6beec4a1551d277b79b95f37 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Mon, 2 Mar 2026 20:09:25 +0100
> +Subject: [PATCH] configure: fix for gcc >= 14.x
> +
> +The pre-generated configure script has a check that doesn't work with
> +GCC >= 14.x:
> +
> +configure:1932: checking for ANSI C header files
> +configure:1945: /home/bernd/buildroot/output/per-package/lrzsz/host/bin/i586-buildroot-linux-gnu-cpp -D_LARGEFILE_SOURCE -D_LARGEFILE64_S
> +OURCE -D_FILE_OFFSET_BITS=64 conftest.c >/dev/null 2>conftest.out
> +configure:2012: /home/bernd/buildroot/output/per-package/lrzsz/host/bin/i586-buildroot-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_L
> +ARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0 -D_FORTIFY_SOURCE=1 -std=gnu17 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BIT
> +S=64  conftest.c  1>&5
> +configure: In function 'main':
> +configure:2007:67: error: implicit declaration of function 'exit' [-Wimplicit-function-declaration]
> + 2007 | if (XOR (islower (i), ISLOWER (i)) || toupper (i) != TOUPPER (i)) exit(2);
> +      |                                                                   ^~~~
> +configure:2003:1: note: include '<stdlib.h>' or provide a declaration of 'exit'
> + 2002 | #include <ctype.h>
> +  +++ |+#include <stdlib.h>
> +
> +Doing AUTORECONF = YES doesn't work as the configure.in is very old, so
> +let's fix the configure script directly.
> +
> +Upstream: N/A, patching generated file

  That's not a good reason actually. You can still send a patch upstream that 
fixes configure.in.

  Regards,
  Arnout

> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + configure | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/configure b/configure
> +index 16a259a..8601361 100755
> +--- a/configure
> ++++ b/configure
> +@@ -1572,6 +1572,7 @@ else
> + #line 1573 "configure"
> + #include "confdefs.h"
> + #include <ctype.h>
> ++#include <stdlib.h>
> + #define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
> + #define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
> + #define XOR(e, f) (((e) && !(f)) || (!(e) && (f)))
> +@@ -2000,6 +2001,7 @@ else
> + #line 2001 "configure"
> + #include "confdefs.h"
> + #include <ctype.h>
> ++#include <stdlib.h>
> + #define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
> + #define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
> + #define XOR(e, f) (((e) && !(f)) || (!(e) && (f)))
> +--
> +2.47.3
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
