Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77155C3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 19:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11889605B3;
	Sun,  4 Aug 2024 19:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOYaTZ_RU6W2; Sun,  4 Aug 2024 19:43:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B72D605D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B72D605D8;
	Sun,  4 Aug 2024 19:43:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F7BC1BF39F
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 19:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C6984034B
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 19:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbMEgI7JeG4R for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 19:43:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D71740199
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D71740199
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D71740199
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 19:43:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9801320004;
 Sun,  4 Aug 2024 19:43:22 +0000 (UTC)
Date: Sun, 4 Aug 2024 21:43:21 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240804214321.30c1d66a@windsurf>
In-Reply-To: <644363c1b32b75633da922333b075c8e@free.fr>
References: <20240719173723.546583-1-ju.o@free.fr>
 <20240722151314.6abebd25@windsurf>
 <c5c3fd836f9f7f503c31ebf1d555453d@free.fr>
 <20240728161944.7ef214e3@windsurf>
 <644363c1b32b75633da922333b075c8e@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722800602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i8JQvZG/vFyqFXX7S9yKi4BT4USUi5n8YTKpA/WQOEU=;
 b=lGfzOjfWf7FpyZoswGDQl+0yk06fWx5CCF4Q/iw4hCI1zsy94Yx7xqsBwMOL+9ISInfco/
 tdTOTvTuj6NeSIvUK9Xx3ef0w8Iowd/pcj7osutc9pCw2CRLPfhuz3N29DuzNXCrMoOtuF
 jWBR75T1K1wr/uzG3gwVc6gXoL8V5dTosH7QHuP8r6h6yjEX16q9XJ7fQupScLDp57bqIe
 V44i08hl07HeoznDUpJbEYT2UIbaKdCw5yi2dGolD88WS1O3mvZeMUdoUlfgsY6lhbBWd/
 FEHHKVUODVkE6CWW4djGkhTy8PEAyDmuHu1BqRIMYUhgwRiNwAxcBgd8nf3iMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lGfzOjfW
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.29
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

Hello Julien,

On Sun, 04 Aug 2024 19:34:50 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Yes, I was aware of this functionality (from the manual). I quickly
> tried it a while back, and was not able to make it work. At that time,
> I thought this CI was limited to paid users, or gitlab users having
> their own runners (which I don't have), or Buildroot maintainers
> (i.e. project members).
> 
> Reading your explanation here, and reading again the Buildroot
> documentation at:
> https://nightly.buildroot.org/manual.html#_runtime_tests_and_gitlab_ci
> I now understand I should be able start CI jobs on my own.
> 
> I tested again (a bit harder this time) with this Kexec runtime test
> as you described. After resolving few (GitLab) issues I was finally
> able to make it work. For example:
> https://gitlab.com/jolivain/buildroot/-/jobs/7455292795

Nice!

> I will propose some Buildroot documentation updates. I hope this
> will help more users to use this nice feature. Specifically:
> 
> - write explicitly this CI works with a "Free" gitlab user account.
> 
> - add a note to make sure "GitLab Instance Runners" are enabled
>    in the forked project. In my case, they were disabled.
> 
> - add a note about setting the job timeout. In my case, it was
>    set to "1h", which was too short in many cases. Right now, I've
>    set 4h for simple tests.
> 
> - document all the other recognized branch name formats by the script:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.05.1/support/scripts/generate-gitlab-ci-yml?ref_type=tags#L60

Such updates to the documentation would definitely be welcome for sure!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
