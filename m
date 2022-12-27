Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC0CC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 21:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 808DB40260;
	Tue, 27 Dec 2022 21:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 808DB40260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D25ZKayYL2E2; Tue, 27 Dec 2022 21:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADF1140386;
	Tue, 27 Dec 2022 21:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADF1140386
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20FCB1BF847
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00D72402B1
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00D72402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eUoeVr4xMWQB for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 21:27:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE15B40260
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE15B40260
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 21:27:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 361D81BF203;
 Tue, 27 Dec 2022 21:27:12 +0000 (UTC)
Date: Tue, 27 Dec 2022 22:27:11 +0100
To: Gleb Mazovetskiy <glex.spb@gmail.com>
Message-ID: <20221227222711.234afc0e@windsurf>
In-Reply-To: <20221223174922.12131-1-glex.spb@gmail.com>
References: <20221223174922.12131-1-glex.spb@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672176432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMxZP0cXa4GDbM8ygRlik3nf5EWNbuHZCfOcqS5K3ac=;
 b=C8StHXjbcJZkb/0huZbW0U6LVLxG70hTbf5ma04Lm3ZGN7yBBkHjNQC2plbeTDmdAVq44q
 fDLzW+K31Qtx9g9hekEqjzfaQA2D7zFL93fMbKwi8wgppaUJvBI746eeyNzmkFnAa4uKbr
 Ag0mud3zxipEAjkOa5ubbGerPB1nwpvbbWN47WhXr/XPFAUkKmTFVxoTEWg7DJAuwyiewW
 /R05bB5X5wmQPxbMx/9AootrXGBZon4Ud6pRBcCSR1g7nNdk6yNAKkv4wLn43ro6TSibc6
 tGi1vPazvKBc9a9BVrO3F9tcs+7Whth1OzVQltoxm/4lgASvpTaSHL4jx+jkmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C8StHXjb
Subject: Re: [Buildroot] [PATCH] package/gcc: fix gcc12 with uClibc
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 23 Dec 2022 17:49:21 +0000
Gleb Mazovetskiy <glex.spb@gmail.com> wrote:

> GCC 12 produces broken binaries when used with uClibc.
> E.g. `gdb` crashes on startup.
> 
> GCC HEAD fixes this in:
> https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=ee4af2ed0b7322884ec4ff537564683c3749b813
> 
> Adds the commit as patch for GCC 12.
> 
> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
> ---
>  package/gcc/12.2.0/0002-fix-condvar.patch | 80 +++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 package/gcc/12.2.0/0002-fix-condvar.patch

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
