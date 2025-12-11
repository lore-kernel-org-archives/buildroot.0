Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15FFD43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBCEB411AF;
	Thu, 11 Dec 2025 19:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVTtdO1oRSHX; Thu, 11 Dec 2025 19:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE34540515
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481541;
	bh=2iPrN2RHVDzlY6JDM0GQgG7wYtkU4/3bZYq1n1QNOSw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K3mnzckkn54gS4o3WC23xT7vSd8y4MC7sRaJ/+cr9mBbQ/Lt2kQ4ysUK5yDhGmHl4
	 zzYvg/aOdgtR+8D863sUiKKOoh9P9ARxISwuFXfUKBP2SxheC7OH3iDpWtHsv5rRmm
	 OwTJfDtAVZkkvqCY7+oTl14oqI1tkfjaXDoD9RIgMkwYvOzomZ4SYkmeYIeLocG8oK
	 fPkUXO0oTp1r3Ron5U7uwOefrPfbh3qqMkmohNdHusvn1u3GhMUKVhoaFe7AHv4thC
	 sJ3PDiwdw78Td7XM0VrGmF24uLPH/Ryutmhz1QLgAZi9s9518HuSOc/r+H2sY2jia8
	 9nAWtGMcUUBag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE34540515;
	Thu, 11 Dec 2025 19:32:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C8DB2C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A19240027
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWji8b28RyBp for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:32:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77BFC40012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77BFC40012
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77BFC40012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E04EB979EEF; Thu, 11 Dec 2025 20:32:16 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:32:13 +0100
Message-ID: <20251211193213.1100491-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122125442.2235928-1-bernd@kuhls.net>
References: <20251122125442.2235928-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481536; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=kuQ4qCkxPI2wmMbuoQdWbAMPM794yX7m0BpYtcDSfh8=;
 b=V9bx+XBnGdmOSSqlawCcgXZ7jcls8g3PLb1NmLJeKX3cTmMS2ddepx4qaANp0jZmS0OefN
 XHk0kUc/ODHfVOAu1weMLuggBB2dC66JVhmgw9vKoLfwY4VTr1SV4RMx9Gcx2ghmiAzndh
 nHa5wm6o9K6wspk6ZQ+fsL4B5Fyri4AT7v9xUGBydyfxaWiZfl6cJ+hm59rwVN2uCuI8TS
 aUern7g/ZI4iiA0rkkE5xuTg9vUCQExB1fXmNcYHtpfZgpigUSsfL/OZ7W/86jRToFCXwi
 egHZptke7TuH5OetDnMFuXuJLNBhqZX5JQuqFf/FB7KEfosYK5bm2rUnkIyVRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=V9bx+XBn
Subject: Re: [Buildroot] [PATCH 1/1] package/time: fix build with newer gcc
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
> Fixes:
> https://autobuild.buildroot.net/results/2d4/2d440a31fc49366d77289f1d21080e1861c6ee21/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.08.x. Thanks

> ---
>  ...ime-fix-sighandler-prototype-for-C23.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/time/0001-time-fix-sighandler-prototype-for-C23.patch
> 
> diff --git a/package/time/0001-time-fix-sighandler-prototype-for-C23.patch b/package/time/0001-time-fix-sighandler-prototype-for-C23.patch
> new file mode 100644
> index 0000000000..8d4e1d7033
> --- /dev/null
> +++ b/package/time/0001-time-fix-sighandler-prototype-for-C23.patch
> @@ -0,0 +1,35 @@
> +From 218cd7ce34b6dbc86c80f1c781639ea7661d1252 Mon Sep 17 00:00:00 2001
> +From: Marcin Serwin <marcin@serwin.dev>
> +Date: Thu, 2 Oct 2025 19:30:12 +0200
> +Subject: [PATCH] time: fix sighandler prototype for C23
> +
> +In C23 functions with empty argument list in the prototype are treated
> +as taking no arguments. This means that the `int` argument of the
> +sighandler must be specified explicitly or the code will fail to
> +compile due to mismatched function type.
> +
> +Signed-off-by: Marcin Serwin <marcin@serwin.dev>
> +
> +Upstream: https://lists.gnu.org/archive/html/bug-time/2025-10/msg00000.html
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/time.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/time.c b/src/time.c
> +index 7b401bc..88287dd 100644
> +--- a/src/time.c
> ++++ b/src/time.c
> +@@ -77,7 +77,7 @@ enum
> + 
> + 
> + /* A Pointer to a signal handler.  */
> +-typedef RETSIGTYPE (*sighandler) ();
> ++typedef RETSIGTYPE (*sighandler) (int);
> + 
> + /* msec = milliseconds = 1/1,000 (1*10e-3) second.
> +    usec = microseconds = 1/1,000,000 (1*10e-6) second.  */
> +-- 
> +2.47.3
> +
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
