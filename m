Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC43AC54731
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E58260896;
	Tue, 27 Aug 2024 16:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36s_J8vQ4ZRB; Tue, 27 Aug 2024 16:17:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E081608A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E081608A1;
	Tue, 27 Aug 2024 16:17:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 746C01BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 612794036E
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhhDg_aXYVq0 for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:17:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AA53402C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AA53402C3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AA53402C3
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:17:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30D4E60006;
 Tue, 27 Aug 2024 16:17:31 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:17:30 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240827181730.44ba28f7@windsurf>
In-Reply-To: <Zs1XglvC1GPvEr4K@waldemar-brodkorb.de>
References: <Zs1XglvC1GPvEr4K@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724775451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6xKL/QgRVTgC/2+wwQdeQIJjiyxyZU+rpeRhgoATBc=;
 b=ENkStW1xkWs2vRVgK1eD9wiP8ZvqeeD9ArgCGt0eFbp0c5mxqmYSi3YjceFZhzrbsxcnnw
 WomaB1HRhMkCDtyviWq7/+n5XpPmAH/6WxSC14OConOKVkD5vavhGSsF7whDcFa5pRcFY9
 QH62wWQ79njIkkN5A2KLxejbQ8KvF3Lc1dEYnlo1ymUCPaUpPpZZd11I+c4tvAQnIEGYPx
 cZ6L1digGQdg3+w2LOFbt8pz7xJQiwQyDVoJcj8iKlomitLbWy/m0QlS+Y9J0sd3/kkLEE
 B7cZVA3FqiIvdsnaYIknve31M3C52gH7opzNHWP7IDPGJbZu4P45PTes3bVmpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ENkStW1x
Subject: Re: [Buildroot] [PATCH] package/file: fix musl compile issue
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

Hello,

On Tue, 27 Aug 2024 06:35:14 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Since the update of musl to 1.2.5 in commit
> f7f03445cf320adbbc41270a806b38c911d3454a find no longer compiles.

Thanks a lot, but that explanation cannot be correct. The Gentoo issue
at https://bugs.gentoo.org/789336 is discussed since 2021, and the bug
report at https://bugs.astron.com/view.php?id=473 is from 2023... but
musl 1.2.5 was only tagged in February 2024.

In addition, if you look at:

  http://autobuild.buildroot.net/?reason=file%&libc=musl

(and click on "Next" to see the next results), you can see that the
issue has been occurring since 2022-01-25, with the first failure being:

  http://autobuild.buildroot.net/results/0ef/0ef268f01541c3ef40d5570a443fec9dbd61c62f/build-end.log

Is it the bump of file to version 5.41 in commit
d38b72bcd75392a88b5100839ac410859d0a6a79 that triggered the issue? This
change was committed on Jan 1, 2022, but the issue first occurred on
Jan 25, 2022. It feels a bit strange that it took 25 days for the issue
to show up in the autobuilders, with such a simple package with no
dependencies.

I also see no musl version bump around that time.

Conclusion: I don't know what started the breakage, but it's not the
bump to musl 1.2.5. In this kind of cases, I think it's fine to state
that the breakage has been occurring for as long as Jan 2022, which
provides enough information to allow us to know that the fix should be
backported to 2024.02.x.

Indeed, with your justification, we would have *NOT* backported the fix
to 2024.02.x, because 2024.02.x uses musl 1.2.4. Hopefully this
illustrates why the investigation of the root cause is an important
matter :-)

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
