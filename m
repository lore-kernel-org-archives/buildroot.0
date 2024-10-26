Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1AFD10BF9
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 13:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0621817B0;
	Sat, 26 Oct 2024 13:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZJyvX1g5b52; Sat, 26 Oct 2024 13:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31711817AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31711817AA;
	Sat, 26 Oct 2024 13:24:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AD72D5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DB6A40799
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STKdVqzf-Oxt for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 13:24:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 48A68407C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48A68407C9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48A68407C9
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:24:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80D6960002;
 Sat, 26 Oct 2024 13:24:12 +0000 (UTC)
Date: Sat, 26 Oct 2024 15:24:11 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <20241026152411.7417073a@windsurf>
In-Reply-To: <20240930193627.50229-1-ju.o@free.fr>
References: <20240930193627.50229-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729949052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PsRAJ3rqRAvv5UpKgfN0SXNi/QVcJUetJNf5wf6e9Zw=;
 b=SGd2eaDakGC3izI8AKCWeYclQlkjqu84wJ82468HLhKY1bjnQV/LFb9XdSBVOBm7/69iOq
 PAvvYMUiic56qrQtZsYiIRLB9H+tYwnMzVbJUuRR5uyBSdQEfD/SDOGxBCD1wR+qPpIa1j
 6WcazuL0VBg2pkH1izeB9rU7CCriscpmi08V4Wg5EdUvEsla2vGu/r/dcJ3fjyz6ww7S4I
 RhY8kKx8PjYiwxdp1cptmYeIhs3jGrfC5v3NEteSa4zO+A4s14vn8MBx72EYOL0s9vA/M7
 O4R9Ranfg7BqdCvvX7COO05SMpKTEjMt2YQQjZu6gCI1eKv4CyuTsFv3KuodQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SGd2eaDa
Subject: Re: [Buildroot] [PATCH 1/1] package/liblinear: fix _SITE url
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

On Mon, 30 Sep 2024 21:36:27 +0200
Julien Olivain <ju.o@free.fr> wrote:

> The package _SITE url only contains the latest version at a given point
> in time. When a new version is published, it is replacing the old one.
> 
> This issue was not detected because the archive was downloaded from the
> sources.buildroot.org backup mirror, when the primary source became
> unavailable.
> 
> Since commit 559bb33ae "support/testing: do not use s.b.o" [1], the
> runtime test infrastructure is disabling this backup mirror. This
> makes the nmap runtime test failing [2], which is using liblinear as
> a dependency.
> 
> The liblinear package author confirmed in a private email that all the
> releases, including the latest version, are all kept in the "oldfiles"
> directory.
> 
> This commit fixes this download issue by updating the _SITE url to that
> location. While at it, this commit also change the url to use https
> (since the http equivalent redirects to https).
> 
> Fixes:
> - [2]
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/559bb33ae71dd2358ca2314ccb24b56cc3809fc1
> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008007
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/7957597476
> ---
>  package/liblinear/liblinear.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
