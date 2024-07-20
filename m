Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD58C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E33A9403D4;
	Sat, 20 Jul 2024 21:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWKcuzLhpQSB; Sat, 20 Jul 2024 21:01:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADF18403D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADF18403D9;
	Sat, 20 Jul 2024 21:01:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B225D1BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C7DD817AE
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MyfEiF4zBoTA for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:01:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 411EA80D8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 411EA80D8C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 411EA80D8C
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:01:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DC541C0003;
 Sat, 20 Jul 2024 21:01:40 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:01:39 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720230139.1223172f@windsurf>
In-Reply-To: <20240720100820.347284-1-fontaine.fabrice@gmail.com>
References: <20240720100820.347284-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VXRXsACVPuwE1QVnpDotjVMevl4hjdgDiyQP+zH4ZFI=;
 b=BM0v+JTZFl4syiDta7OaeEA44vVqy7VI4qjSbeI5wzcK+v23OyKhhqZ18FYtXD+nWYzxbx
 x8Vq0oevGBaXbabTBknVfi84++Z6USbL9eh1NnzVtQ1roOxIPfORdjQF8WubnvZKenN3a/
 jZ9bx9Yg3pcOE/qkajCDmR3zOnxpAapsIsfv/sBGhSqbKnB4j1nirtRBYrUhv/s2JqZz2E
 SCqwicN4yUDwvkDOmB8grBta21VZgElln+XUDA/Yc4Eol+U4Ewnwr1gKlBXQzje1Ertuk+
 ZfSK6Y1CQcA+M1rvstBSk6F4gbG91US5Nv54vl44YaqE1mXIoiNpKgYOLjgSIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BM0v+JTZ
Subject: Re: [Buildroot] [PATCH 1/1] package/httping: fix patch fuzz
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 12:08:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix patch fuzz to avoid the following build failure raised since commit
> 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016 which reduced the fuzz factor:
> 
> Applying 0001-fix-math-library-linking.patch using patch:
> patching file Makefile
> Hunk #1 FAILED at 37.
> 1 out of 2 hunks FAILED -- saving rejects to file Makefile.rej
> 
> Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
>  - http://autobuild.buildroot.org/results/f9cfb6f55d1f2cb855e6959c2381eeddea3e4936
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/httping/0001-fix-math-library-linking.patch | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

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
