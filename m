Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70452CD1296
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 20:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3302D4177A;
	Wed, 10 Apr 2024 20:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRJ5ogsprLJJ; Wed, 10 Apr 2024 20:23:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5AC641799
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5AC641799;
	Wed, 10 Apr 2024 20:23:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6F881BF4DD
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D17C18211F
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKw4202m7a2Q for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 20:23:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB33B8211E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB33B8211E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB33B8211E
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 20:23:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0533240003;
 Wed, 10 Apr 2024 20:23:00 +0000 (UTC)
Date: Wed, 10 Apr 2024 22:22:59 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240410222259.6664d894@windsurf>
In-Reply-To: <20240408181322.813020-1-ju.o@free.fr>
References: <20240408181322.813020-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712780580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MbJ7QDnvnR3w+MdweaMbP+iyb5h3x+/IR7PmqTtS6zA=;
 b=BjAudln5LS3f34bXwvjfGTD6gfCIe/8nff0iiN8UxSDW7l2Yk3YMEOEsJ1e8nb9iemXevu
 v7ZqoNLsD4dAdgNs6oHH0qxVyCAZ5nZx3MH3VrE1uOqoP3Cmz9RtbykyZmlj1PogAxZvHJ
 JSJRUyDSJRZBTT0YHpxYbg6qFyVbSx2d0ahn5KLte6Zj/Z4AaQTVszwRRwL1TtVGq3CUaD
 RoTboxnQEbj0IiyjL033Lpzjb+v/V5KcICjlwoPu3Vn0NtqscD3hzy3Mdxl6yeDel14EOk
 AG1nR/qjRCfq2R4hNipG2Pn41PnjnRLqC7UUb2PecyIquidb0EWZi28rZx0OpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BjAudln5
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: bump package to version
 9.1.0
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

On Mon,  8 Apr 2024 20:13:22 +0200
Julien Olivain <ju.o@free.fr> wrote:

> See release note:
> https://octave.org/NEWS-9.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/octave/octave.hash | 4 ++--
>  package/octave/octave.mk   | 2 +-
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
