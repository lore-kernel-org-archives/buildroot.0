Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD46DD5B146
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AC8180ADA;
	Mon, 28 Oct 2024 20:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZYJpBg33E_r; Mon, 28 Oct 2024 20:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87C3080AE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87C3080AE7;
	Mon, 28 Oct 2024 20:26:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6AC3112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7BE26062F
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxt5rPnUgYqa for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:26:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5F1E605C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5F1E605C4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5F1E605C4
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:26:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA331E0002;
 Mon, 28 Oct 2024 20:26:38 +0000 (UTC)
Date: Mon, 28 Oct 2024 21:26:37 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241028212637.5366c905@windsurf>
In-Reply-To: <20241028193504.15914-1-ju.o@free.fr>
References: <20241028193504.15914-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730147199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ldiimQA2YrF9juUKRpAw5TJMaeZAIPw72Tpx2Ol4WRg=;
 b=Iz7CBSFr2QuqjCut6nTYkM6rfmre3YcYCK8fggr1yqADrUuGuJiZU3KTBPeDQkFi0oHXXp
 GrllJt9jzZRpbBX20jwW/A3jihw7cJfYoWGlqtOMBH88+ywemaH3JBJ9VrQDqkJVQ9/sfS
 d0dllD6eKzjRkPkZ24It1CQqwCCFMpwYRwwG2wfwwDCs+rjx6k90oYGkBmhym9gxKH/scu
 9DCssP+ZioEW0CG8kK8DitAlsgLjh2ER4wA8Q56V+DCy7lwKSnhTTb51LNHeKIbwVyeVli
 /zTwJha30cAOyOhkeV531DvOH0kIFxL2qddOIcDf4wXNZpjRMtk+NowrphSyWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Iz7CBSFr
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenmpt: bump to version
 0.7.11
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

On Mon, 28 Oct 2024 20:35:04 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For release note, see:
> https://lib.openmpt.org/libopenmpt/2024/10/26/releases-0.7.11-0.6.20-0.5.34-0.4.46/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/libopenmpt/libopenmpt.hash | 2 +-
>  package/libopenmpt/libopenmpt.mk   | 2 +-
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
