Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B541E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 21:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 096648126E;
	Sun, 29 Dec 2024 21:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9erRyuhfSyQ; Sun, 29 Dec 2024 21:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E9A880AB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E9A880AB3;
	Sun, 29 Dec 2024 21:28:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96D13C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92F588126E
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28qtsWMLqS8j for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 21:28:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B2A381193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B2A381193
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B2A381193
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:28:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFF031C0002;
 Sun, 29 Dec 2024 21:28:32 +0000 (UTC)
Date: Sun, 29 Dec 2024 22:28:32 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <20241229222832.1172e4e0@windsurf>
In-Reply-To: <20241105234045.2624651-1-ju.o@free.fr>
References: <20241105234045.2624651-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735507712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0T2ALaEyjzxsKJcYbRA6fPX1GIJ8ihRYMrCk7JKh1ng=;
 b=Ml92mlndkekOEHsn7bQ8lc+FiA5JsvBV3VJQEfsMiu/UMWzo9LV4t/zS1IN9q3Rl6yF2Yx
 lmeLl7eVpxsJzA0LNDY6fR+f1VIjPigDOWfqP1qm24EICItu9+d6V0CHgly9EtJgzOhjQX
 B1C48ncM7vGbRmhQURkQPxTTbOsZaUPYMUsOdVNeLvNeNtEYEwPIMG3RSa0H3gk25EVezK
 AEe84KSXXWCkjvVrlDE5HL8TQMeUQzxl22O7VKFbrU3xI2iHUzZJoJM2utCZWfC4ieLhFS
 +xFd6I9QvsOkgEmmZNKWVqZh+Flq9w+pMXE8faj9WM7u5ab6ecVmKjZCiILuUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ml92mlnd
Subject: Re: [Buildroot] [PATCH 1/1] package/numactl: bump to version 2.0.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  6 Nov 2024 00:40:45 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change logs since 2.0.18, see:
> https://github.com/numactl/numactl/releases/tag/v2.0.19
> 
> This commit also removes the package patch, which is included in
> this version.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8279029791
> https://gitlab.com/jolivain/buildroot/-/pipelines/1528845024
> ---
>  ...-when-set_mempolicy_home_node-syscal.patch | 46 -------------------
>  package/numactl/numactl.hash                  |  2 +-
>  package/numactl/numactl.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 48 deletions(-)
>  delete mode 100644 package/numactl/0001-Don-t-fail-build-when-set_mempolicy_home_node-syscal.patch

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
