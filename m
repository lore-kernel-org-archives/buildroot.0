Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1114FC35FE4
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 14:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 852AD40135;
	Sun, 15 Sep 2024 14:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txBSsbDx0w1n; Sun, 15 Sep 2024 14:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F6B140237
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F6B140237;
	Sun, 15 Sep 2024 14:02:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A2431BF283
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1836440205
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDTPaDEx6mUq for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 14:02:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A4B94401FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4B94401FE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4B94401FE
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 14:02:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC951C0004;
 Sun, 15 Sep 2024 14:02:28 +0000 (UTC)
Date: Sun, 15 Sep 2024 16:02:26 +0200
To: Hugo Cornelis via buildroot <buildroot@buildroot.org>
Message-ID: <20240915160226.339b0d30@windsurf>
In-Reply-To: <20240915131934.1636336-1-hugo.cornelis@essensium.com>
References: <20240915131934.1636336-1-hugo.cornelis@essensium.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726408949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yp6QidYB1GocEO+koaMY7xBWoKOT6wGRkRpNyTXie3A=;
 b=QvVwBSz1XHESIbNjxucJsO0B0fJRixHmlMH4NX51RrPHiS8Nl2fmnX6eP4y0RmqWZ5mkW/
 6hdzxNxckY19HD265050QOHVcH+huxdn4a6VzoNzl/xqVfOpAozyKavg4EIVOcQSN7ldzj
 YzsaNqxa5iX6d250YK7Roc6vA87SrQF1YHAuzg5r5yQYlwD5pUz4KwpB114Kzm3RHrQLKc
 Pu24xgYxTj92hlUFooaLJxEtZnFNx5seurV1psMsNcqMGtEhvms2EgyAzdrYaEwL36I7ij
 a+e4kqzYkfrwZSr+Uh/++owfuWL8NM9J/7x4UZf5ARMbwOPwHu7prPecO/d/SQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QvVwBSz1
Subject: Re: [Buildroot] [PATCH 1/1] package/ncurses: put headers in the
 common include directory.
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
Cc: Hugo Cornelis <hugo.cornelis@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 15 Sep 2024 15:19:34 +0200
Hugo Cornelis via buildroot <buildroot@buildroot.org> wrote:

> When wide char is enabled in ncurses, packages such as procps-ng,
> expect ncurses.h in a 'cursesw' subdirectory.  We have to disable
> ncurses overwriting header files in the regular directory.
> 
> This fixes several builds running on the autobuilders (see below for a
> few examples) but not all of them.  For examples this does not solve
> the similar but not the same build problem:
> http://autobuild.buildroot.org/results/e7665f43b97c6f90a7a8ce83eb16cfc364c3fc1a/
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/72d8bf3e618ae7797f3311fbbdbd90d77dfed4ad/
>   - http://autobuild.buildroot.org/results/809dac9945e24c7e0bb6cb37c38cb258b41b3276/
>   - http://autobuild.buildroot.org/results/12b348238bd3ef8116ac48a35d0a9d18dad38f04/
>   - http://autobuild.buildroot.org/results/f86546cc0934f44e0d1851a932d64d2d29790f17/
>   - http://autobuild.buildroot.org/results/93ca9899542d4ef31f3609219e09ce1db8ba7cad/
>   - http://autobuild.buildroot.org/results/901e5a5e394d6e0b67bff15946ece9d66398b73d/
>   - http://autobuild.buildroot.org/results/10c23c9f5d79dcb8a68551a15009e9d1b3be1fff/
>   - http://autobuild.buildroot.org/results/38e8aeb5469314f31c78506f62a714f57ff030d9/
>   - http://autobuild.buildroot.org/results/9e09b7ba0c6213471c73ffc6cb3c777b4aa33b23/
>   - http://autobuild.buildroot.org/results/82d747d0d6b7150cba0b921cc9431c0f5bdf86f7/
> Signed-off-by: Hugo Cornelis <hugo.cornelis@essensium.com>

Thanks for the research!

However, what is the impact of this change on other packages than
procps-ng, that currently build fine? Indeed if I understand your
change correctly, it means that the ncurses header files will be in a
different place... potentially breaking other packages, no?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
