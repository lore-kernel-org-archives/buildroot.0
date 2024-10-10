Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5ABD24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD07241326;
	Thu, 10 Oct 2024 21:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytN4vnzfmTfG; Thu, 10 Oct 2024 21:36:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 643404130B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 643404130B;
	Thu, 10 Oct 2024 21:36:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9160E1BF98E
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D31B412CC
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhyvVvmXpG5P for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D8E8412C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D8E8412C4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D8E8412C4
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F9D240004;
 Thu, 10 Oct 2024 21:36:15 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:35:13 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233513.10665ebd@windsurf>
In-Reply-To: <20241009173201.3846339-1-james.hilliard1@gmail.com>
References: <20241009173201.3846339-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qWUIKRzJmrezbAX5Yun+b3bQtKiZ63AMXzK26reaAxY=;
 b=orKD/wGlupxY3cvO+75eWPrupW2bnmixnJUmEKuFIn0YK3UC7M9h0+NZ/UBLUTd2RsN54e
 vmo/xtJjrXB92jJVdwUjy2lljhHvVM4VO2m2C+2vMZJil/6tCtBvbF1OHlgJnWqQ4VqIrU
 SyvrejcUdpV8eG3X/3Y0dKZ6AeGjvebBepzGOaGhvzldrS/01XqQ5GJ4rQqKaVFSk1tSuT
 XAI11I8Wvww+KfjVntAuof1ICXTj71sCbjGsvfVVBNziMF9vJvr/1d7KyoSV5JCB2Ib0hn
 LRbiANcmSg1g2M9MLNAuRY1o1w8LwDP0MGcxmdwS2ioLbxiUm6ExF6TqJs3itA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=orKD/wGl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyproject-metadata: bump
 to version 0.8.1
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

On Wed,  9 Oct 2024 11:32:01 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from setuptools to flit build backend.
> 
> Add new host-python-packaging dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-pyproject-metadata.hash                         | 4 ++--
>  .../python-pyproject-metadata/python-pyproject-metadata.mk | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)

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
