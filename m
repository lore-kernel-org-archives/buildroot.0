Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D143CF8540
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BAEA41401;
	Wed,  2 Oct 2024 21:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3xrsFgYE0aY; Wed,  2 Oct 2024 21:03:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AC7043044
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AC7043044;
	Wed,  2 Oct 2024 21:03:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8FAC1BF30E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97978411C3
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bcf8YzpeFWV5 for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:03:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 680DE40653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 680DE40653
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 680DE40653
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:03:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CBCA240002;
 Wed,  2 Oct 2024 21:03:01 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:03:01 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241002230301.0b1f86b5@windsurf>
In-Reply-To: <20240926190913.199381-1-james.hilliard1@gmail.com>
References: <20240926190913.199381-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727902982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YrpI/D1R6dzPa7Z/bh4IuRaR06NAdrI60FwZMlTx+Zg=;
 b=UR5d5hj4QTMmE6zNzcAEF9DVsfN6DRuw+qgnoTSG0ZXx8JVtNIOFf2+G6q9OvRValuCYMg
 ftjB2SET0BptBwSGUhJPNjzYzNI7UihBmQsGlaSM+qJAtoRrpPAd5OuIw+cMn0rPbz7GI6
 amwYyFTEt+jwx4c0zYFCvX+baPpJ6FJlM/R6tdehPxFoCro2sOwPANbLLOndXxvwdxKeTj
 tbJ9Ru4JTGNbCS/PuFA5HA8C7RCCcnyvqF2b7qbsy2Xswfi8QMvyAZMrkL/obKVNvnL98h
 zFVBMklTFklwaFan6VQ34ZxpAV5cdhJR+107nHxvDwFqwz4dSJKWAkvDBY2mpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UR5d5hj4
Subject: Re: [Buildroot] [PATCH 1/1] package/python-prompt-toolkit: bump to
 version 3.0.48
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

On Thu, 26 Sep 2024 13:09:13 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-prompt-toolkit/python-prompt-toolkit.hash | 4 ++--
>  package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
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
