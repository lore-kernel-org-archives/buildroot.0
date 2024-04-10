Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669DACD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 20:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3269440399;
	Wed, 10 Apr 2024 20:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t40soThYB7xs; Wed, 10 Apr 2024 20:22:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 419DE4176C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 419DE4176C;
	Wed, 10 Apr 2024 20:22:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C7B11BF4DD
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 265B440653
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pr27SV8T7H6J for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 20:22:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BBE4E4064F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE4E4064F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBE4E4064F
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 20:22:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EACEC0006;
 Wed, 10 Apr 2024 20:22:52 +0000 (UTC)
Date: Wed, 10 Apr 2024 22:22:51 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240410222251.3afee4b5@windsurf>
In-Reply-To: <20240408171250.11751-1-ju.o@free.fr>
References: <20240408171250.11751-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712780572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPx3K5CmG5XvLDpzma/OdgxVm34zsWwUTluqLAD7i18=;
 b=cLg2Qejwzx6SadvQmaDpyfV9My9V1Bg2HmWd/a1oAgdTyDWLJftYrJ5egKNbwdf7N7ugLo
 YtdrVMkfXBMDuSe8vD8UVuooNr+Iq6nIqpsAQ4tLOuNLv9XYqrh9V3wEeocA+ec2m3eyD1
 z/QwJLtliwcvJRTMQiyprZ2nfZ8iod4/WCAHZnSCHXrtOzlgTgDWXAizKEWRUV670FV/u1
 7s+1Hq0S7zsCyYZqmtpxzoql2DJ5GMgtuBD+U7VS542WL5h4XV9IfsH/ytMc9Wl0BgQxik
 kK61208AV6XFUZmaj1NKTkPUZJp6SSjXvhJ3zg186FF1ETee51dA3HevmNY1Dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cLg2Qejw
Subject: Re: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.13.0
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

On Mon,  8 Apr 2024 19:12:50 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 4.12.5, see:
> https://github.com/Z3Prover/z3/blob/z3-4.13.0/RELEASE_NOTES.md#version-4130
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/z3/z3.hash | 2 +-
>  package/z3/z3.mk   | 2 +-
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
