Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00D8C52D71
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 16:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C7C640362;
	Tue,  6 Aug 2024 16:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvbpNDZv6RnA; Tue,  6 Aug 2024 16:57:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFF54402EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFF54402EA;
	Tue,  6 Aug 2024 16:57:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 146F41BF32A
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 16:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 025A1607B8
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 16:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfWBVsAVxe0Y for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 16:57:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 719E5605EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 719E5605EE
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 719E5605EE
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 16:57:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0008740003;
 Tue,  6 Aug 2024 16:57:32 +0000 (UTC)
Date: Tue, 6 Aug 2024 18:57:31 +0200
To: Christian Stewart <christian@aperture.us>
Message-ID: <20240806185731.372f8f3e@windsurf>
In-Reply-To: <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722963453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g0TOTugiwIlylUnQ4TU9GKP3XWwv5UreuVvTQdACAgo=;
 b=gnqcbtbZLIf7wRsV7YUA7WW8CdYcT5FxM6apD08voq1tCjSAnjTcvf08bm6irxSCdRigv2
 xIcN8xbKQx+5dqEr48txRv8cazl2H8XZkzEutOYhbxy52Jbtx+wPYz8rLZ16TbppeHIfCM
 pI0L7fTbLjDo4bnfZF4ETL0qs39EyZ6R+nxKbqszQSH3LzbV1/BjUcKiSwH/+RXb0Y7NHF
 uttxpBqTpOVDzUE7YYqKQMLy7vZdhTQg0/PoiDFrgBlPO26aOP+5tXrJgBJKUC4cDxvD5Q
 0NYRYCtPQEYRUBsB1fCYr9CHZ5UvA/0UdfmtHpSL0idQsdUw1qKzM5N2Anbs9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gnqcbtbZ
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Anisse Astier <anisse@astier.eu>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 6 Aug 2024 09:13:50 -0700
Christian Stewart <christian@aperture.us> wrote:


> The reasoning for using GOPROXY=direct is as follows:
> 
> When we enable the proxy, the Go tool will download the sources for the
> dependencies from Google.
> 
> This is OK in general, but in the context of buildroot we typically
> download sources from their upstream releases or Git repositories.
> 
> GOPROXY is not broken.
> 
> That said, a lot of dependencies cause problems when they change what tag a
> git release points to retroactively (rare but happens), or delete a older
> commit from their repository (which happens extremely rarely).

Crap, those projects do that? They change a tag, or remove an older
commit from their repo? Yikes for reproducibility :-/

> The proxy smooths this over by always serving the same thing for a git tag
> or commit hash.
> 
> The problem with this is, now we have something different being returned
> for a dependency than what it says in go.mod.
> 
> The go.mod might say we are fetching foo at version 1.0.0, but in fact, if
> you go to the repository for foo, and go to version 1.0.0, it could be a
> completely different source tree from the one we get in the proxied
> download.

And that obviously sucks, and using a proxy doesn't seem like a great
workaround.

> This opens up the opportunity for bad actors to hide code in the proxied
> version and then retroactively change the git tag to hide that bad code.
> 
> For this reason the default was set to always use Git to fetch the
> dependencies for Buildroot as we would prefer to detect the mismatch and
> deal with it up front, possibly falling back to fetching the .tar.gz from
> our own mirror, rather than depend on this behavior from the Google proxy
> to always be there and save us.
> 
> As you can see we have never had an issue with this setting until now, when
> we have an actual broken dependency somewhere, and its when we are adding
> the package, not retroactively, that the issue is found and solved.

I'm not sure to follow you on this. Why would this only happen when we
add the package? If we use GOPROXY=direct, and 3 months after we've
added the package some upstream dependency decides to change its tag or
remove some commits, then it will start failing (of course,
sources.buildroot.net will have a backup, but sources.buildroot.net is
not meant to really be used in "normal" circumstances).

> This is my pitch for keeping GOPROXY=direct. If we want to use the Google
> proxy with all the cavets I mentioned above, we could add the option
> HOST_GO_GOPROXY and default it to the Google proxy. But personally I will
> still always override this value to direct in my projects.
> 
> For now we can just include the latest commit hash of tailscale until they
> make a new release and nothing else needs to be changed.

Don't understand this last part. What is your proposal to fix the
tailscale situation?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
