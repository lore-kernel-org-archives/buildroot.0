Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60991C4167B
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 123BA83963;
	Wed,  1 Nov 2023 17:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 123BA83963
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHFtagf2x9Fa; Wed,  1 Nov 2023 17:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAF9584CCE;
	Wed,  1 Nov 2023 17:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAF9584CCE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D77091BF280
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEE8B431CB
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEE8B431CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nzynowmq4htL for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:52:15 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85A11431BD
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85A11431BD
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA5FCE0009;
 Wed,  1 Nov 2023 17:52:13 +0000 (UTC)
Date: Wed, 1 Nov 2023 18:52:12 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101185212.44fe2f04@windsurf>
In-Reply-To: <20231101174519.3808-1-fontaine.fabrice@gmail.com>
References: <20231101174519.3808-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698861134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67+YC00FNNmY/XbyxyRTjDU8XtH8pAyA/kz9vq6iDfc=;
 b=JnHdLQohXxMv4LsDazXQZNL1cVYeLIt/cOoMYWOBu7SQgtCP1ntEM2LnL/0nx/KrhubkHw
 85GAlQ3B97EdhhifRMHODJAECjxJHGLlCTOVD637SoBbcEGHEr4afNcPSN/S2l5f6cQBD0
 WqrYLPycuM4EhFVfmCaGGGy75Bbsy2Ofir4N8dQ5hf16BS30IHNHHWL2yT6Q+LuX+kSZT0
 tYfE0lwZyUcx+oAfndNKT5OA2ITG5y3blWZBc2E7+dsu2U0dJPodfIfIFmJSEPgfCxld69
 r65HeUoRwO+theqUETJ5JrACyNRGTTOYyhq38+VN9sfASX6WU3DTODGVTM8a9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JnHdLQoh
Subject: Re: [Buildroot] [PATCH 1/1] package/conmon: fix static build
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  1 Nov 2023 18:45:19 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following static build failure raised since commit
> 8144dd1b4cca2d5c89e329b0497f49f512c9caed which fixed dynamic build but
> broke static build:
> 
> src/seccomp_notify.c:10:10: fatal error: dlfcn.h: No such file or directory
>    10 | #include <dlfcn.h>
>       |          ^~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/71b4f35b3150183c7b44bc3897f01b0019e10ebe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...rc-seccomp_notify.c-fix-static-build.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/conmon/0001-src-seccomp_notify.c-fix-static-build.patch

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
