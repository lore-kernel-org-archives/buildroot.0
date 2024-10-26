Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AECED10BFD
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAC0360621;
	Sat, 26 Oct 2024 14:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKuNj6kE8iw4; Sat, 26 Oct 2024 14:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DEDA6062C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DEDA6062C;
	Sat, 26 Oct 2024 14:34:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 600FA2318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DF95401CC
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_f7Z3bnt3N9 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:34:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05EA740175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05EA740175
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05EA740175
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:34:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A175E0004;
 Sat, 26 Oct 2024 14:34:32 +0000 (UTC)
Date: Sat, 26 Oct 2024 16:34:32 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, Marcus Hoffmann <bubu@bubu1.eu>
Message-ID: <20241026163432.7067ed03@windsurf>
In-Reply-To: <20240920103900.169718-1-buildroot@bubu1.eu>
References: <20240920103900.169718-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729953273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+CrVWdxrxElNq45wLroMFbhzsQLtojRCxlyri2H6iA=;
 b=dXwSGEftyIsiD2PszFtAUpal98GWFZNhe8IVIdP4XbdGsgif+dumOF+uftoOL7YYT3q6Yu
 Rnvgv6NZ+jPUQF8DXY8PGQeINRUPXQgBTBNIg3VEMYhhnZt+sbKWh2sSFGXRmYRukoKQJf
 1grq+LVglS0OKIw2xAPZGd6PFLMi3xPIiPEN6trU1t1iLnmip/jqS8EgzT/ybWPc+rq5Od
 U0acekW5ZqPCCcPQnL55n06lW+EBtAfyLPy/2YWaCePuyszPORijSRhDf1L6fM8z6fRy6b
 AAuJL0EV+k6gC57mfD7AGydsPb0sGcJ3ZDVS5tYk7Xu7DybqXX7L+oLURRBrHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dXwSGEft
Subject: Re: [Buildroot] [PATCH] package/nethogs: add patch to fix version
 generation
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

On Fri, 20 Sep 2024 12:39:00 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> This fixes nethogs being built with the (mangled) buildroot version
> name from the outer buildroot git repo.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  ...termineVersion-sh-prevent-traversing.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/nethogs/0001-determineVersion-sh-prevent-traversing.patch

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
