Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71B5C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7651E41719;
	Wed,  1 May 2024 20:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuaIkeXwrBhd; Wed,  1 May 2024 20:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 856E241722
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 856E241722;
	Wed,  1 May 2024 20:47:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A3691BF400
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2496981EFE
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X87LPbV6rEYm for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:47:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0407581EE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0407581EE2
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0407581EE2
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:47:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E65F2E0003;
 Wed,  1 May 2024 20:47:38 +0000 (UTC)
Date: Wed, 1 May 2024 22:47:38 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20240501224738.5f8a693d@windsurf>
In-Reply-To: <20240426113540.534475-1-buildroot@heine.tech>
References: <20240426113540.534475-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714596459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yrqGeIpfxdMd++YldWYQDnx2ZazNkSeCIm3cXxjwT6g=;
 b=nCkdCWSYgD6moo1MVeqMI7FHAogz9fnhQY9S0The14dabGgzwrlKv1F5M2cyCutsvCmx8V
 zCXx8xE0d0mm91MwdWLST5ve+gO7/ujcF13he1eVLQO0R+bgvsWe9bS+OFASoOrMLE0dbO
 aEqhuFUTwDNDLOHdC2fh0Tj4nmDoT9q4cGIArC8B7LSxgbuV/F0PI4Sw6JIcrzaWPiSwvM
 uZglbymQ3vMnw276vXUrvZ3uFIOuc2EgPMLu9I5YJLQjJVg4ykDcWTdQLsrTalzpy1BYGm
 roVbWQn+25s9m9dFKw5+fLlRMkPzFU6nABAF9VuUK3V3+O+1NJ3dxiABqOkeBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nCkdCWSY
Subject: Re: [Buildroot] [PATCH] package/spdlog: bump to version 1.14.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Apr 2024 13:35:38 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/spdlog/spdlog.hash | 2 +-
>  package/spdlog/spdlog.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
