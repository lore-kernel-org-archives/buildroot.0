Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A11C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B993608E3;
	Wed, 14 Aug 2024 21:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gK6CwGdxE_T; Wed, 14 Aug 2024 21:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06F0D608E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06F0D608E9;
	Wed, 14 Aug 2024 21:04:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E01581BF471
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCE5140386
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJRAc948L6An for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:04:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E6FB40388
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E6FB40388
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E6FB40388
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:04:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60121C0002;
 Wed, 14 Aug 2024 21:04:01 +0000 (UTC)
Date: Wed, 14 Aug 2024 23:03:58 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240814230358.576be4cc@windsurf>
In-Reply-To: <Zrz8vdUIY6wBPD7m@waldemar-brodkorb.de>
References: <Zrz8vdUIY6wBPD7m@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723669441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdNAXJ/QJTCdk2Cn6j3l7PzmULPum6xtmbhZcg5PnwE=;
 b=AZbrWiULytz7oAetGCkNc9xlZTTRQ8K1xH7eGR2qZlXwYb4cvf0eZL7kg55gJS+afyZeIR
 ftyLIZFo4eNtZGvgodpMBfkaDmqZC0ZC6leugojCzOLQzZ1HrwUjfgh5ug3AM+ya5wCSl0
 5TT4/cOhXbj1DTMSOapCb7PFamnhVyqtZywlgxhPy2TDGCpseicQKsjsMmEzJnhxmCp28I
 az+Xu2qLqTells98TePtLcBLYYlqFt8lyZt9VFskDdIY8Ou+A2hx1Zsm06d64BepmsoDld
 Tu5rC54fETW6hHYtRW+RIpfHSYPej7LX9v8cG3cwPJz9TuXEBl5vmPQDz3ZREA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AZbrWiUL
Subject: Re: [Buildroot] [PATCH] package/ncurses: fix uClibc-ng compile error
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

Hello Waldemar!

On Wed, 14 Aug 2024 20:51:41 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Unfortunately upstream does not use any SCM.

Yeah, kind of crazy.

> See here for the Changelog:
> https://invisible-island.net/ncurses/NEWS.html#index-t20231014
> 
> "+ updated configure script macro CF_XOPEN_SOURCE, for uClibc-ng"
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/01c/01cbc188c70f53fe492128100b430857f1cd98f2
>  - http://autobuild.buildroot.net/results/e2b/e2ba6a5554bfa0bf9b4c2eaf9222d041204f00e9
> 
> And many more.

So I've applied to master, but to me this is not the "perfect" patch.
The perfect patch would have researched when this issue was introduced,
so that we know if it needs to be backported to a LTS branch. Could you
try to think about this for next fixes?

Another suggestion: I see that ncurses 6.5 has been released, perhaps
time to update? (But of course that will be for our 'next' branch).

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
