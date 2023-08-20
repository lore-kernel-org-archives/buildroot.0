Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD31EE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 380E34159F;
	Sun, 20 Aug 2023 21:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 380E34159F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8A1FRFyw71Rv; Sun, 20 Aug 2023 21:42:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35D9D41548;
	Sun, 20 Aug 2023 21:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35D9D41548
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43DBF1BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10BEE60EE5
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10BEE60EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FUUDrmYd4KnH for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:42:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E67F860EC6
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E67F860EC6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16751FF803;
 Sun, 20 Aug 2023 21:42:04 +0000 (UTC)
Date: Sun, 20 Aug 2023 23:42:04 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230820234204.75b4af22@windsurf>
In-Reply-To: <20230820152639.3867011-1-bernd@kuhls.net>
References: <20230820152639.3867011-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692567725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yo020o4eye35IDnytqe2XvGvQ+/lODPtYzX64HFqpiE=;
 b=GDX4nwNbDHonUSthX+6VYZw6FxbNgTv0IBTmOY+jFGsiIbAAOc2cRz2C0TDZYQkIDJhr8X
 +SkW6sl+ef6cE2A4JjPUAXTQawPPumvfh3ajfzybIt5L1LABSUf8xRsMxzdkc0TRezWJ/r
 1G+5dKhj+8q4P5aZ8+9nTpqXjJd33Z3hb/y5CzoODfDGn99JJFcsLRUkXAF9yvyS+m7UCP
 yFfUdoc6oWxVqKzVJuuh4/UsDfHETtK3zkqfbSX1wd8IvHGCYn55Xqw9f/Rr/STrygn5R1
 A6MI/3f5DHy2nR8gB2rX3eY1SWtiKnKTtgNIxzoLsSlWbam7xCnrUmS0V0kY2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GDX4nwNb
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: fix linking with libargp
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

Hello Bernd,

On Sun, 20 Aug 2023 17:26:39 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/45f/45ff44284565c8e7deecfdc93995ec0ae4e89e2c/
> 
> The bug existed since the dependency to argp-standalone was added with
> commit 0d9f268424558c37cd9538596358a537cd2f882d. The oldest build error
> I could find occured on Nov, 9th, 2022:
> http://autobuild.buildroot.net/results/ebe/ebea5d76c615d8509f87238d449e66da214fed73/
> 
> Please note that using $LIBS does not fix the problem.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/crun/crun.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/crun/crun.mk b/package/crun/crun.mk
> index 15438a44b3..9d904ccf1b 100644
> --- a/package/crun/crun.mk
> +++ b/package/crun/crun.mk
> @@ -17,6 +17,7 @@ CRUN_CONF_OPTS = --disable-embedded-yajl
>  
>  ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
>  CRUN_DEPENDENCIES += argp-standalone
> +CRUN_CONF_ENV += LDFLAGS=$(TARGET_NLS_LIBS)

This looks extremely strange. TARGET_NLS_LIBS is either empty, or
contains -lintl. How is that related to argp-standalone, and how can it
resolve the argp-standalone issue?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
