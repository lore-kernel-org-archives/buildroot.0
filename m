Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD6FC6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 21:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CF0181757;
	Mon, 13 Mar 2023 21:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CF0181757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sKC1HsYXFJea; Mon, 13 Mar 2023 21:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D3A8174C;
	Mon, 13 Mar 2023 21:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86D3A8174C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 859C21BF282
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 21:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EE63815AB
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 21:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EE63815AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJHAlppsStPc for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 21:51:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A8CF813FC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A8CF813FC
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 21:51:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B52EC60003;
 Mon, 13 Mar 2023 21:51:06 +0000 (UTC)
Date: Mon, 13 Mar 2023 22:51:05 +0100
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20230313225105.6a8d5954@windsurf>
In-Reply-To: <189b4d81990997b87dec82c4865a3d25e35573b0.1678714004.git.stefan@agner.ch>
References: <189b4d81990997b87dec82c4865a3d25e35573b0.1678714004.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678744267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gARYFJUhcCim2MYkQNHaC5H9aeT0JKBVEOwvw6eVJS8=;
 b=deSJ1ZlsKG8sRxtxqkpo+L6eQShcowIQ3EBBfc8P9lwWo2G/qDnxz+B7mFY8hx7CGgcL90
 XDMXdASJZGzYRPoFifaQwfahLOiv6VVn5aZQ+w+3j8200yNJ7XCkfqNdceQI0tAzwp8TUk
 frlFC4LVyqnWx0C4udUkhvq6BBIDIhkno09LuL5Jcs5bCTfvim3IZq8DxWUNaIOtFmtkaa
 eoVjsxNqBY0DH1rwvZkBkmK+iopdPIQd2UmGxPieg7M9A2dmdgE+3lGQQwx2klvKdUQ1S+
 +wwWS2wgxPsfsBj6G++d37dEJ2SYhOEWwmEgLL9UPLc16/Kj0dqbiFSZMGUaNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=deSJ1Zls
Subject: Re: [Buildroot] [PATCH] package/gptfdisk: fix another runtime
 failure with popt 1.19
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stefan,

On Mon, 13 Mar 2023 14:34:18 +0100
Stefan Agner <stefan@agner.ch> wrote:

> Fix the following runtime failure raised since bump of popt to version
> 1.19 in commit 895bfba93f6e5535f2132aeea144d2cd87ebc71b:
> 
> Segmentation fault (core dumped)
> 
> Fixes:
>  - No autobuilder failure

Well, if it's a runtime failure, pretty obviously there's no
autobuilder failure :-)

> diff --git a/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
> new file mode 100644
> index 0000000000..8541fd2772
> --- /dev/null
> +++ b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
> @@ -0,0 +1,41 @@
> +From f5de3401b974ce103ffd93af8f9d43505a04aaf9 Mon Sep 17 00:00:00 2001
> +Message-Id: <f5de3401b974ce103ffd93af8f9d43505a04aaf9.1678702777.git.stefan@agner.ch>
> +From: Damian Kurek <starfire24680@gmail.com>
> +Date: Thu, 7 Jul 2022 03:39:16 +0000
> +Subject: [PATCH] Fix NULL dereference when duplicating string argument
> +
> +poptGetArg can return NULL if there are no additional arguments, which
> +makes strdup dereference NULL on strlen

Where is this patch coming from? Could you add a link to where the
patch was found? Is this patch a backport from upstream?

Also, we need your Signed-off-by line inside the patch.

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
