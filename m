Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F21C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 20:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F41E40225;
	Sat, 20 Jul 2024 20:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g02mOPdglzuV; Sat, 20 Jul 2024 20:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B666402BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B666402BA;
	Sat, 20 Jul 2024 20:50:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BD151BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECA59402BA
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6A7mKasOMN2j for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 20:50:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7459840225
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7459840225
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7459840225
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 20:50:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0651B1C0006;
 Sat, 20 Jul 2024 20:50:40 +0000 (UTC)
Date: Sat, 20 Jul 2024 22:50:39 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720225039.4599e455@windsurf>
In-Reply-To: <20240720122908.453217-1-fontaine.fabrice@gmail.com>
References: <20240720122908.453217-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721508641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o1d0LK++rfo2UYPZcFV2afjhoPqgdXsop9syFL5Yqc8=;
 b=dSMSJmnqHvVQsMbo+0Obed6Y+8wLNUas5TAwEvwtJ79TfrJ8SWqKX2FVoSVzF1CoiwaOny
 tb76pcI2iDTJDy3XqKnL6bkf693fR1UWNxGosT57cVr6jmDvpAzrvPzCRqJVjEr350zYzo
 qJySh4p0PeUFxBH35NouZ7uUQWwrxrDIm45cfIavHv0D9x4BToz/s//NbG3YJJT/7s/t1d
 08w9LI/VbKSGWjapOMQKQ8CLBZvnzA+HclsS+Dwv7rTMGM/lSXByRt07qw7Gaf7QBZaxrt
 x4ZnHDEA8/Ye5bK3Dhk/6MzJQyKaftBsH9HyZJkmwtKh4uD0IDAGX+AEX571Hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dSMSJmnq
Subject: Re: [Buildroot] [PATCH 1/1] package/mpir: fix build with host gcc
 >= 14
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
Cc: Semyon Kolganov <semenak94@mail.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 14:29:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with host gcc >= 14 which enables
> -Werror=implicit-function-declaration
> (https://gcc.gnu.org/gcc-14/porting_to.html):
> 
> configure:9998: checking build system compiler /usr/bin/gcc
> configure:10011: /usr/bin/gcc conftest.c
> conftest.c: In function 'main':
> conftest.c:4:3: error: implicit declaration of function 'exit' [-Wimplicit-function-declaration]
>     4 |   exit(0);
>       |   ^~~~
> conftest.c:1:1: note: include '<stdlib.h>' or provide a declaration of 'exit'
>   +++ |+#include <stdlib.h>
>     1 | int
> conftest.c:4:3: warning: incompatible implicit declaration of built-in function 'exit' [-Wbuiltin-declaration-mismatch]
>     4 |   exit(0);
>       |   ^~~~
> conftest.c:4:3: note: include '<stdlib.h>' or provide a declaration of 'exit'
> configure:10014: $? = 1
> configure:10021: result: no
> configure:10026: error: Specified CC_FOR_BUILD doesn't seem to work
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3ab381f06d5dc030039b6f6f8d19feb55cf3367d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-Fix-configure-failures-with-Xcode12.patch | 116 ++++++++++++++++++
>  package/mpir/mpir.mk                          |   2 +
>  2 files changed, 118 insertions(+)
>  create mode 100644 package/mpir/0002-Fix-configure-failures-with-Xcode12.patch

I had investigated the issue as well, and came to the exact same
conclusion, so: patch applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
