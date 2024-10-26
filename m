Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAD2D10BFF
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 17:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB26A40356;
	Sat, 26 Oct 2024 17:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cT1UdGBFPro2; Sat, 26 Oct 2024 17:05:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83CA040292
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83CA040292;
	Sat, 26 Oct 2024 17:05:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BA8C5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 17:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37D7A40324
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 17:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSgofz9dpfxf for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 17:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC84840292
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC84840292
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC84840292
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 17:05:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 034DAFF803;
 Sat, 26 Oct 2024 17:05:42 +0000 (UTC)
Date: Sat, 26 Oct 2024 19:05:41 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>, Fabrice
 Fontaine <fontaine.fabrice@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20241026190541.6be5629c@windsurf>
In-Reply-To: <20231104184142.24723c2d@windsurf>
References: <20231104155857.110364-1-fontaine.fabrice@gmail.com>
 <20231104184142.24723c2d@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729962343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+0KwtDhUB1XbJ8esHHREZJadmGAS+so74XVbGsb/otk=;
 b=EBjvXsWIi5vwrdleGFyIYM+X8Z3qhs/paoxh1PmZNCExQKMBVd+jFHWWsPfuYVnE7w2yCi
 EesO0Q3uNftdU08B1asoGrTcJHbuwXd08K5TZxBHlkR1YWqyeWLz/59plyY+Iw4NEJ1CkK
 5oeci8MGrj/9XfdPQZ542cX+TZoHSZuXxKg9+vAN4Dqb4dcVg036ZMG5xRU/CG5YG2N5YC
 Mt9akrHBp+3RtBxpsNJnVkzfJUlS6a/IGJIs3BkYvMuUb4aMizLzux2zfITaEpdtyIu0w0
 AujfkonRx/7uyy1XJGDobJpy4x0EbosYwjOdNP9b94SzmaUy1/seaUsW2AVtFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EBjvXsWI
Subject: Re: [Buildroot] [PATCH 1/1] package/ltrace: fix musl build
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

Hello Fabrice,

On Sat, 4 Nov 2023 18:41:42 +0100
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Doesn't that defeat the purpose of the Upstream: flag entirely? Isn't
> the idea precisely to strongly encourage (not to say "require") that
> patches be sent upstream?

There has still been no feedback from you on this, so I looked into
this a bit more, and it's messy.

ltrace.org points to https://gitlab.com/cespedes/ltrace as being the
Git repo, and this Git repo has changes from a year ago, but absolutely
no tags.

On the other side, Buildroot uses https://github.com/dkogan/ltrace/tree/master
as the upstream... which hasn't seen any commit for the last 8 years.
Though this one has tags, including a 0.7.3 tag, which it the latest
version according to ltrace.org.

And when trying to figure if one if a fork from the other... it's not
clear.

Regarding your patch, you made the inclusion of <error.h> conditional
on __GLIBC__, but what if the code is using functions from <error.h>?
If it builds without <error.h>, then presumably it means the code is no
longer using any function from <error.h>, and those includes can be
dropped?

Alpine had a different patch, that adds a configure.ac check for
<error.h>: https://git.alpinelinux.org/aports/plain/main/ltrace/musl.patch

However, their patch is for 0.7.3, while we use the "latest" commit
from master.

So overall, quite messy stuff, so I decided to mark ltrace as
unavailable for musl:

  https://gitlab.com/buildroot.org/buildroot/-/commit/859bd545821a838454577c4c1c9106837cda51cb

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
