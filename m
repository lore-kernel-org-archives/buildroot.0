Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC83CF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F13F40A23;
	Sun, 13 Oct 2024 10:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIjVYBQsofCJ; Sun, 13 Oct 2024 10:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 994D240A8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 994D240A8B;
	Sun, 13 Oct 2024 10:48:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 172C01BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0084140729
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lqzTWPoogSj for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:47:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B829440725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B829440725
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B829440725
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:47:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91EF0C0005;
 Sun, 13 Oct 2024 10:47:55 +0000 (UTC)
Date: Sun, 13 Oct 2024 12:47:27 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241013124727.65e811e2@windsurf>
In-Reply-To: <20241011183902.2771890-1-james.hilliard1@gmail.com>
References: <20241011183902.2771890-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728816476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAg1Ija0TmFIx6GWI7jlSehlOEsIklD/r3ZmyJwrd70=;
 b=LVhXP9qcD5ZyQ4ZoB3R9HaYI9D4g2wXsnA9x3hwAbHvDgYJlujb6ipLWJ37TdFpRQ1KLzb
 uDSAnKgiEqKodNkBQjUKJG9ynWo+T47zRYcd6WtXSTlqh3vNDD/3NMoMcY6A88Cn3E9VqB
 frqCYs+vpHG1eEPcjp/irCN7BbERGitRjWW7J8UhT/GAD54VUm4SExeMRlgu0cKKBYMtzH
 exA1BLax9ITtDlFAAd4c66m4KlNpLisds3oZadJtMvhWjd9B90SsoeFeyvUNDY62Klk2jm
 NyqoW+hi51UUWk+2cbl2JwLwwlgdzgC3Jb4qBYb9QKRlftGSHeDHMNICL7fhdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LVhXP9qc
Subject: Re: [Buildroot] [PATCH 1/1] package/python-distlib: bump to version
 0.3.9
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 11 Oct 2024 12:39:02 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-distlib/python-distlib.hash | 4 ++--
>  package/python-distlib/python-distlib.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
