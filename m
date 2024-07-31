Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48596C3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 10:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E89BC606A3;
	Wed, 31 Jul 2024 10:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hf8CpBI38L4d; Wed, 31 Jul 2024 10:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09BEB6070C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09BEB6070C;
	Wed, 31 Jul 2024 10:24:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDBAD1BF3E5
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 10:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB2154040A
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 10:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olazHVvHwzbt for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 10:24:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73265400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73265400E4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73265400E4
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 10:24:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C81A11C0005;
 Wed, 31 Jul 2024 10:24:12 +0000 (UTC)
Date: Wed, 31 Jul 2024 12:24:11 +0200
To: Alexander Egorenkov <egorenar-dev@posteo.net>
Message-ID: <20240731122411.01f82c08@windsurf>
In-Reply-To: <20240731061235.18090-1-egorenar-dev@posteo.net>
References: <20240731061235.18090-1-egorenar-dev@posteo.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722421453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uDP5ThB2kJ61mNXMvAjgtfpT422nD1HQUl4M1VeWtTc=;
 b=cHqONTBOfIQo7kGx0yVlNuYPRpQYLViiRxNmy4QCND1g/okHpoCchQtDatkUZIJyj6zJJ+
 Kd0xnMnHgQIStkw/XaVCGvrLvPQWRgHeYzp9M6JFb1mvGPXnuX87ZfuB39Q40QZYrYOlAG
 UUuodpwIp2SALquOqT0j/PRgbXBxR2ne3UZU0jqFnrlvCu//MK8Om6lp5Hh2Z0yH6tdX6K
 yWGXfmakoNzYN/pVziCKnuzjemUZ9d8OKYEeeffxFoyzBSdcAI5sc82xj4sF5TyJZ2oXPd
 QBpN1xLETU/SKPny1rNYesmfK9f7LDEX9z487qhoMsJXGDZROfPTcEKCcscyuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cHqONTBO
Subject: Re: [Buildroot] [PATCH 1/1] package/makedumpfile: fix build with
 musl libc
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

Hello Alexander,

On Wed, 31 Jul 2024 06:12:35 +0000
Alexander Egorenkov <egorenar-dev@posteo.net> wrote:


> diff --git a/package/makedumpfile/0003-Fix-build-with-musl-libc.patch b/package/makedumpfile/0003-Fix-build-with-musl-libc.patch
> new file mode 100644
> index 000000000000..26718fb7f6b9
> --- /dev/null
> +++ b/package/makedumpfile/0003-Fix-build-with-musl-libc.patch
> @@ -0,0 +1,27 @@
> +From 3ae383c5dfdbd4dc5cfb888b3cc187819658068b Mon Sep 17 00:00:00 2001
> +From: Alexander Egorenkov <egorenar-dev@posteo.net>
> +Date: Wed, 31 Jul 2024 07:43:50 +0200
> +Subject: [PATCH 1/1] Fix build with musl libc
> +
> +musl libc defines PAGESIZE in its limits.h header file.
> +
> +Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>

Thanks for your patch. However, we now require all patches to carry an
Upstream: tag that points either to the upstream commit being
backported, or the submission of the patch made to the upstream project
(link to the mailing list archive, link to the pull request, etc.).

This is pointed out by "make check-package".

Could you have a look at submitting this patch upstream, and add the
Upstream: tag?

> +diff --git a/makedumpfile.h b/makedumpfile.h
> +index 6b43a8b44f93..54e894bfee2b 100644
> +--- a/makedumpfile.h
> ++++ b/makedumpfile.h
> +@@ -169,6 +169,7 @@ test_bit(int nr, unsigned long addr)
> + #define PTOB(X)			(((unsigned long long)(X)) << PAGESHIFT())
> + #define BTOP(X)			(((unsigned long long)(X)) >> PAGESHIFT())
> + 
> ++#undef PAGESIZE /* musl's limits.h defines PAGESIZE */

Is this the right thing to do?

> + #define PAGESIZE()		(info->page_size)
> + #define PAGESHIFT()		(info->page_shift)

These macros that assume "info" is an available variable are anyway
really atrocious :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
