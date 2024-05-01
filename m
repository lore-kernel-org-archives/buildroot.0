Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F51C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DCB882120;
	Wed,  1 May 2024 21:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uezkxm_t4RSi; Wed,  1 May 2024 21:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE02182124
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE02182124;
	Wed,  1 May 2024 21:31:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 692071BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6247240767
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9U4wyjImV1c for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:31:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FD0A4080A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FD0A4080A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FD0A4080A
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:31:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1515A20003;
 Wed,  1 May 2024 21:31:27 +0000 (UTC)
Date: Wed, 1 May 2024 23:31:27 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240501233127.78a845c8@windsurf>
In-Reply-To: <20240415193522.7719-1-ju.o@free.fr>
References: <20240415193522.7719-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714599088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cPEvkMb1WrXgdaGsASpQ9AgAGBxsaVT/vOkpMH0UkrQ=;
 b=Y5kt5NYAi4FzGVIH52K8gu4nhzUdoUPTQNteu4zosIqWlJ7TiqJ1ZJOHxZH3t+EIbbWxed
 uNshGU8H77ZrCTPRJCJlZLEcex3rHpmCCNK2COQ8zHJSGAGapeaeCkj1cnP2I/Ed67yFVq
 8e2ntj+FNXfcwKwz9g16W8HjH0bG2bKpF9ViyNsitlU6ltO7qj+YpxyzGZvuBHjATVGE05
 D55x7fVOHgyA1gzbjbOy6HbEcAeEwLAwtdsi9KIMG95monx32GUSoa6bRF33eerfvdezsZ
 IgmBLnisEm7PUSLnkmLVfyiIY9/tH2dCNpU9QL46VnTDJT5GbnURAasHNZ96JA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y5kt5NYA
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: fs: f2fs: bump test
 Kernel to 6.6.27
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Apr 2024 21:35:22 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Since the toolchain Bootlin update to 2023.11-1 [1], the arm Linux
> kernel build is broken with binutils >= 2.41 with:
> 
>     arch/arm/mm/proc-v7.S: Assembler messages:
>     arch/arm/mm/proc-v7.S:640: Error: junk at end of line, first unrecognized character is '#'
> 
> This commit fixes the issue by bumping the test Kernel version to the
> latest LTS version 6.6.27. We bump to the 6.6.x series to refresh the
> test, as the 4.19.x series is planned to be end-of-life soon, in
> December 2024.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6623401447
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/7e0e6e3b8618ab942f25b11ee72fbc5a4deefdf1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  support/testing/tests/fs/test_f2fs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master after rebasing, and adjusting the commit message as
the change is no longer fixing the build, it was already done by Romain
Naour.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
