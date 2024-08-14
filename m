Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0508C52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 20:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59D16608CD;
	Wed, 14 Aug 2024 20:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cC_IXpwAU4gM; Wed, 14 Aug 2024 20:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E47C608CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E47C608CE;
	Wed, 14 Aug 2024 20:19:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDBAC1BF471
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C793680B91
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wr4dPxDefD3 for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 20:19:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6AC580B8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6AC580B8D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6AC580B8D
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 20:19:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E136FC0002;
 Wed, 14 Aug 2024 20:19:51 +0000 (UTC)
Date: Wed, 14 Aug 2024 22:19:50 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240814221950.458101ad@windsurf>
In-Reply-To: <Zrz+JUwTsNaKI8sK@waldemar-brodkorb.de>
References: <Zrz+JUwTsNaKI8sK@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723666792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XA1cF1YJIy4kVfFDHFUm1AHA0mHwYjQsLWDDG9tEe3E=;
 b=JhbPNkqtW7qjkXMyEKN26GrmhqhZiO19p3DYPzO30XfGr6S6tMkWd2Pl2eBqfeUt3MaAW1
 +LuYzlqY0XYx9gCfPRnJs9hSWMlvTZ48+8G6wRyxBeLjgWLSw27uogkXkNAJCyIcAw4ZTn
 H00ZMNCK/mYxE4D1UqS90WfJFVPT0oQIedCgswf0jaGHMFzzXk8dWrVdZJqOKdC9cT9ZBg
 B0Q6qZG18nh+EGfaFMcT7SmZtCSlmmvf5inkZppd+qDsMbDZzQfaQM676X+M8//b7bfxHI
 fwY1QTusG8X6PR/LCN6Tg2aOf13bEPuoGWwGahlnKmDqe6sxmNgUhkD9sZPEDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JhbPNkqt
Subject: Re: [Buildroot] [PATCH] package/iproute2: fix musl compile errors
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

Hello Waldemar,

I've applied to master, but I have a couple of nitpicks, and one real
request.

On Wed, 14 Aug 2024 20:57:41 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Add two patches to fix musl compile errors.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/8d7/8d713bd911f8d6b97272a7bb5dc2c188aeb99b05
                                            ^^^^ you can drop this part of the URL

Also, there should be an empty line *before* the Signed-off-by line.

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...laration-of-function-htobe64-in-gcc-.patch | 43 +++++++++++++++++++
>  ...laration-of-function-basename-in-gcc.patch | 30 +++++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 package/iproute2/0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch
>  create mode 100644 package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
> +From Alpine Linux.
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +Upstream: https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/iproute2/basename.patch?ref_type=heads

This really isn't an "Upstream:" URL, it's really a "downstream" thing.
Indeed, what we want to see is patches submitted to the upstream
project, so that at some point in the future, we can drop them from
Buildroot.

So could you submit this patch to the upstream iproute2 project, and
then updated the link in this patch?

"man 3 basename" says <libgen.h> should be included for get the
prototype for basename(), so it shouldn't be too difficult to convince
upstream that it's the right thing to do, and not just a musl-related
fix.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
