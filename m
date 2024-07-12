Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94769C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4D1781D18;
	Fri, 12 Jul 2024 22:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsitsHx5O8Y7; Fri, 12 Jul 2024 22:08:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C7A5845CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C7A5845CA;
	Fri, 12 Jul 2024 22:08:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0479A1BF427
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2195400DA
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_5AwrJKslft for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:08:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F7A1400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F7A1400AC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F7A1400AC
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:08:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF4EB20003;
 Fri, 12 Jul 2024 22:08:33 +0000 (UTC)
Date: Sat, 13 Jul 2024 00:08:32 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240713000832.79ccfa53@windsurf>
In-Reply-To: <20240519091604.2195932-1-thomas@devoogdt.com>
References: <20240519091604.2195932-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720822114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ljMSzYB/O8a8rZjQ2hj+71VyjGKZGUPbISR8zH7XANM=;
 b=d84eG95uQtYbFNeTxc7L6DSkVOftH8QH+HfGI8bLwyvQ4TwmIdOw04Bpa51QqTfXKdeFJE
 ObJBCuhHUofZM7q5nH0UJyUVrkubRbuoCUjPQrLyZ0t2rjgi47FSS34YW2lTPcI5wADRQA
 KHYKYykf2NBFV/xGBCFEpIdi9Sd37p18rjwEs/PJrvSUoRE1+PQ2RCDjPQIxV0p96LEgl8
 7qMKQH+HE0W0ll6HnGGlcbsjBk8ANUp6N7aWpHj0LAy8qV9N+gPBDtKHYO6g01SMH4+CTm
 2qUhiQVAu6b+1LsfCX6OwVxztKegJYpYnIPu1RvH69XFTCQ6lWSZGJrLlcHjpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d84eG95u
Subject: Re: [Buildroot] [PATCH v4] package/webkitgtk: bump to 2.44.2
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 May 2024 11:16:04 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> A lot has been changed in 2.44.0, please consult the announcement [1], what's new [2],
> and the security advisory [3] for more details.
> 
> Specific to this bump:
> 
>  - Libegl is now mandatory [4] and the USE_OPENGL_OR_ES flag has been dropped.
>    While at it, also explicitly add the libepoxy dependency which is now selected
>    by libgtk3.
> 
>  - The WPE renderer has been dropped [2], so drop the wpebackend-fdo dependency.
> 
>  - JPEG2000 has been dropped [2], so drop the OpenJPEG dependency.
> 
>  - GTK4 is now the default, so turn it off, since buildroot has no GTK4 support
>    yet [2].
> 
>  - USE_LIBBACKTRACE has been added [5], so select it properly.
> 
>  - Support for ENABLE_WEB_CODECS has been added, which will now be enabled
>    together with audio and video support.
> 
>  - ENABLE_WEBASSEMBLY is forbidden when ENABLE_C_LOOP [6], so disable it when
>    compiling for MIPS r6, ARMv5, and ARMv6.
> 
> In the meantime, a follow-up 2.44.1 and 2.44.2 release has been announced [7][8],
> which contains a bunch of patches that were accepted upstream. Including build
> fixes for 32-bit devices, and disabling video.
> 
> [1]: https://webkitgtk.org/2024/03/16/webkitgtk2.44.0-released.html
> [2]: https://webkitgtk.org/2024/03/27/webkigit-2.44.html
> [3]: https://webkitgtk.org/security/WSA-2024-0002.html
> [4]: https://commits.webkit.org/271345@main
> [5]: https://commits.webkit.org/268579@main
> [6]: https://commits.webkit.org/271347@main
> [7]: https://webkitgtk.org/2024/04/09/webkitgtk2.44.1-released.html
> [8]: https://webkitgtk.org/2024/05/16/webkitgtk2.44.2-released.html
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> v2: update patches with the upstream reference
> v3: bump to 2.44.1 and drop the upstreamed patches
> v4: bump to 2.44.2 and move xlib_libxshmfence to a separate patch series
> ---
>  ...velInterpreter.cpp-339-21-error-t6-w.patch | 39 ---------------
>  package/webkitgtk/Config.in                   |  4 +-
>  package/webkitgtk/webkitgtk.hash              |  6 +--
>  package/webkitgtk/webkitgtk.mk                | 50 ++++++++-----------
>  4 files changed, 26 insertions(+), 73 deletions(-)
>  delete mode 100644 package/webkitgtk/0001-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch

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
