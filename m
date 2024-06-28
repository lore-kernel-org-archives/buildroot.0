Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55069C2BBCA
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 06:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEDB784457;
	Fri, 28 Jun 2024 06:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53G7fcCInQFw; Fri, 28 Jun 2024 06:41:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 112BB84471
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 112BB84471;
	Fri, 28 Jun 2024 06:41:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A34301BF315
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 06:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C5194053F
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 06:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pb_Bh9hYisto for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 06:41:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D686140230
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D686140230
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D686140230
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 06:41:42 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 1AA80C4EAD
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 06:37:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B07A1C0003;
 Fri, 28 Jun 2024 06:36:55 +0000 (UTC)
Date: Fri, 28 Jun 2024 08:36:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240628083654.6377fe91@booty>
In-Reply-To: <20240627212547.2194843-1-bernd@kuhls.net>
References: <20240627212547.2194843-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719556615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vaOVYB1XkpuJP5hxmWSiRprrgBtigqWL+lHJktlNFwc=;
 b=Hs4MU3jFV8AkY5jjC7aRCosuryzS8C7iIwD5x8q6fWp03c8IXM9xsTSessJpH6DqNLgbww
 LO12UER/SNLPXOqgL58qlvD2NrQ+tqwgjVTnmZ5UohD6q4bghQ/TxxbGNNvrH5Bpf3wQMv
 jpjXq/BYRWq/Z8EM0i59nRWBaPqeW8xXinnBQKtIEQbjzpEww40YGp4IUoFeX6GKHX6i3s
 wEmSaXqDPX7Bdp4M9P2UybRLcXU9UDNtUVVYylUupCqMPxwPeEG1P66OWbYlQoRhycA21B
 wRzrJDnIJ5qFb9A/kmpBeB/pLLsxdSGi10VD7WcYvHSIIVOlqhnmsIev9C5Uzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hs4MU3jF
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: update patches to be
 applied with fuzz 0
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Thu, 27 Jun 2024 23:25:47 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, exim fails to build with output:
> 
>     Applying 0004-exim_lock-fix-lstat-related-build-errors.patch using patch:
>     patching file src/exim_lock.c
>     Hunk #1 FAILED at 13.
>     Hunk #2 succeeded at 27 (offset 1 line).
>     1 out of 2 hunks FAILED -- saving rejects to file src/exim_lock.c.rej
> 
> This commit rebases the package patches on the current package version
> when needed.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ff27d5ebd7f24ac8cb236b83c67c2c75255e51c6/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
