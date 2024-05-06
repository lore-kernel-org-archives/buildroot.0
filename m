Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506E7C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AE90820B3;
	Mon,  6 May 2024 19:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0f_nDZxuaKE; Mon,  6 May 2024 19:31:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12E76820BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12E76820BC;
	Mon,  6 May 2024 19:31:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CBFC1BF3CA
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46F0D40B86
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5SQPLUI6A5n for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:31:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 23FBE408CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23FBE408CA
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23FBE408CA
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:31:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 537BD1BF203;
 Mon,  6 May 2024 19:31:23 +0000 (UTC)
Date: Mon, 6 May 2024 21:31:22 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240506213122.1da7a111@windsurf>
In-Reply-To: <20240506074013.263439-1-peter@korsgaard.com>
References: <20240506074013.263439-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715023883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SruPGf/ZiN6DrphWXsC5IU7JHICFX+s4tj4NRPGYeeQ=;
 b=hCUuPhbCngvE5asdvqjAfvvUy86MuAFc/qGlID3fsYGWh/hb8m6wv/F4rvMyDvvkari3ss
 96OuNOJp72IoA0MXQ8cDcGFnAPZqbnf6SXTPkq5KetXJV4oo96BweTbZwUsIBB0gl4v+Nq
 2+FibBjFFWbWUk+3HipTCeXX9ivfDMsK+aON9uB6bKXAaLzZFEQd9ZcW/qs6cJnO6oxavn
 jnXAZNlbUHYv8zlzvpO70z/bpY+6aS7TqGxrQVbUEpEbTf+An5XwdNDWIO6X12OUxsB94B
 bActv6iXZqLWqRiyOloTlvesFu5qnOqawg6sRUdxqzqZML7f1Ah/uRvuY5oR0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hCUuPhbC
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/sheevaplug_defconfig: bump
 Linux to fix binutils 2.41 build
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

On Mon,  6 May 2024 09:40:11 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6761770801
> 
> The Linux kernel fails to build since commit e88225ed882 (package/binutils:
> make 2.41 the default version):
> 
> arch/arm/mm/proc-feroceon.S: Assembler messages:
> arch/arm/mm/proc-feroceon.S:587: Error: junk at end of line, first unrecognized character is `#'
> make[3]: *** [scripts/Makefile.build:430: arch/arm/mm/proc-feroceon.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> 
> Fix the build by bumping the kernel to 4.14.336, which includes commit
> 3ab03df64f77 (ARM: 8933/1: replace Sun/Solaris style flag on section
> directive):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-4.14.y&id=3ab03df64f7754728a2257c47775a70a88428331
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  configs/sheevaplug_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Series applied. In the second patch you had forgotten (perhaps
intentionally?) to update .checkpackageignore, so I did it while
applying.

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
