Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB7FC3DA61
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 07:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7979C812D4;
	Tue, 30 Jul 2024 07:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cItO2pz2Vhn; Tue, 30 Jul 2024 07:37:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB8B80D58
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AB8B80D58;
	Tue, 30 Jul 2024 07:37:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 577D31BF360
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EDB2400F1
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGXpM5BfvEau for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 07:35:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 316DA40199
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 316DA40199
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 316DA40199
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:35:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9AAF24000B;
 Tue, 30 Jul 2024 07:35:52 +0000 (UTC)
Date: Tue, 30 Jul 2024 09:35:51 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240730093551.5bf42cc3@windsurf>
In-Reply-To: <20240726143907.1345051-1-buildroot@bubu1.eu>
References: <20240726143907.1345051-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722324953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lsxpC+p6NHgWZcdE+8OJliBq//ZN3lbKMiM7BZS2Ndo=;
 b=C0k5HNNAkirQwxumP7L95f38HXzG/WCJjWCh5YC26uSvhbF9C2pE/9IiOGYGGi+DcYYItn
 7Hpr8r8vCGG7xsr1eHX8kpw1diq4JNKqxDVvNySJv+miVfDrpU4jgqqEZPaPb0WVfNTLIo
 S3ZVRD2rPQmf7XSEt+A7/WN6XtCQn5H5dsprZt0VY74CjhY20Z9N2R36k66RJAtl2KHTdB
 DqqEWidJs61JXvkx/iCkae9ID/A8ZvNtb9qG02OWs/ciPr7LmtYdEZSRHSauvOndjlFYNe
 7tgYTHM9/+lLyyavpACqZuxc7GE4ZwSuIZk/XaliXf5t5n9DzH3Dhg2KREvBhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C0k5HNNA
Subject: Re: [Buildroot] [PATCH] package/sqlite: bump to 3.46.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Jul 2024 16:39:06 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog: https://sqlite.org/releaselog/3_46_0.html
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/sqlite/sqlite.hash | 2 +-
>  package/sqlite/sqlite.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
