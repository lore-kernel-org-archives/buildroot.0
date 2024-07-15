Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA9AC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53ED640352;
	Mon, 15 Jul 2024 10:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k68yhzu43bUx; Mon, 15 Jul 2024 10:15:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06D52404D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06D52404D5;
	Mon, 15 Jul 2024 10:15:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A30B51BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E60C80F26
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lucnk8WPsHs3 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:15:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 44D0980F0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44D0980F0E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44D0980F0E
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:15:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7142720004;
 Mon, 15 Jul 2024 10:15:38 +0000 (UTC)
Date: Mon, 15 Jul 2024 12:15:36 +0200
To: Kadir Yilmaz <kadir.c.yilmaz@gmail.com>
Message-ID: <20240715121536.1db28c1e@windsurf>
In-Reply-To: <20231025212924.1957581-1-kadir.c.yilmaz@gmail.com>
References: <20231025212924.1957581-1-kadir.c.yilmaz@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721038539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lLzxtbwhZqvkzZNZJEDUYtqlzLIY5HiXAoCbDNClKw=;
 b=L+PQowV/6r8478LQ3sC4D+a66dRxdV4znixlLosO0EEogNCCRAVbZKMljoVxuow7UNe664
 xj+tYJrfsCY/hE6wmDgTsYSibjMeTH5fsalQyPAPSA1HRXw3qeXAnfhy3pendjrI+eKEyH
 KmlzEbm2q3CVdyIYwwvovKMqWe2zbT1OHEdfWgoUF6T7pJqo5oP0HsE4++Dx+O5yhnZ1Nx
 U2MGFtC35li+40fefZ11FKxVaNJTT1r1qhSD3bdzQWi4uEuvgcyulw6q0MiyWA4nBkYthI
 bwmbWwiCRDQFA99wqZQmdyWg/Gc1br9zathE34smv3ZJbFzMXDO0u8r5+E6wug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L+PQowV/
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5webengine: don't use system
 ICU libraries
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
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kadir,

On Wed, 25 Oct 2023 23:29:24 +0200
Kadir Yilmaz <kadir.c.yilmaz@gmail.com> wrote:

> With the "-webengine-icu" config option qt5webengine uses icu headers
> on the build host. If (for ubuntu) libicu-dev is not installed on the
> system, build fails with:
> 
> In file included from ../../3rdparty/chromium/v8/src/regexp/gen-regexp-special-case.cc:10:
> ../../3rdparty/chromium/v8/src/regexp/special-case.h:12:10: fatal error: unicode/uchar.h: No such file or directory
>    12 | #include "unicode/uchar.h"
>       |          ^~~~~~~~~~~~~~~~~
> compilation terminated.
> 
> Otherwise, if (for ubuntu) libicu-dev is installed on the system, build
> fails later at linking stage.
> 
> Using icu bundled with qt solves this problem
> 
> Signed-off-by: Kadir Yilmaz <kadir.c.yilmaz@gmail.com>
> ---
>  package/qt5/qt5webengine/qt5webengine.mk | 1 -
>  1 file changed, 1 deletion(-)

I have applied your patch, with an improved commit log, as part of a
larger set of 13 patches to fix the build of qt5webengine (which now
builds fine for me on ARM64), with all those fixes. See your final
commit at:

 https://gitlab.com/buildroot.org/buildroot/-/commit/ca7cedaa8cab0a0ac0fc48c2f40c4e6a84fb6877

If you are able to test the latest master, and report back if
qt5webengine now works for you, it'd be amazing!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
