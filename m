Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A785C25B74
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5E4E6069D;
	Mon,  6 May 2024 20:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3VDOcrSUl59K; Mon,  6 May 2024 20:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFDD7608DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFDD7608DA;
	Mon,  6 May 2024 20:27:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 912AE1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7764F824DC
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAwNKenJMjei for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D9F7824C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D9F7824C1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D9F7824C1
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:27:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B4F6E0006;
 Mon,  6 May 2024 20:27:07 +0000 (UTC)
Date: Mon, 6 May 2024 22:27:06 +0200
To: Geoff Levand <geoff@infradead.org>
Message-ID: <20240506222706.157b4045@windsurf>
In-Reply-To: <f6398ca5-a3b5-48a2-ade8-d31b363ca937@infradead.org>
References: <f6398ca5-a3b5-48a2-ade8-d31b363ca937@infradead.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715027228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+Xt9WrA7gJ+RLuieEit7SwmR1yj8kYxhOZMXz/f4IE=;
 b=ZFYMO8fX9cm904RTh6JQS5rg9AhXxOIBj6xEBmN76irR4tesfawO6SZJee/ltKLxvhJKBj
 KlXHLnqx0Uf6U12RWgZDB5hEadPy4JoLtouFamHpvjlNr2OgdkEF5y3a31xCeMwafxzbG4
 aNyt6mrSf4vAK0RyFjmUpKD3gizNWfcjPMC/1UPcT6R0GcCTGz8D0cxtGkPLFx6uueix22
 4n5SMdaZQcOhaepNyGIjQaLfNyjgVuxGsy05rfolin2SxivM2Oix+yW4vPjg1dBPg//Lqm
 oTef2EzFHIz/ndIwYGbPP3izDlDMec1Ul/w86BGBcAlCTn7bMxNsJml5H04nEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZFYMO8fX
Subject: Re: [Buildroot] [PATCH] package/flannel: Bump to version 0.25.1
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

On Wed, 1 May 2024 11:53:05 +0900
Geoff Levand <geoff@infradead.org> wrote:

> Signed-off-by: Geoff Levand <geoff@infradead.org>
> 
> diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
> index 2e0198debe..97700d37ec 100644
> --- a/package/flannel/flannel.hash
> +++ b/package/flannel/flannel.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  98dde4eda016fec9aa6394cb4b283bdd972deda6ef9e1f2c3669dd2719ea1fe9  flannel-0.24.4.tar.gz
> +sha256  c0de130efa2b14bc0f057a17df07bfd61154b30ce4a5eca24594c5b533ce661d  flannel-0.25.1.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
> index 5cdfa0e09e..aa24644764 100644
> --- a/package/flannel/flannel.mk
> +++ b/package/flannel/flannel.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLANNEL_VERSION = 0.24.4
> +FLANNEL_VERSION = 0.25.1

This was not applying on master, because you created this commit on top
of your previous 0.24.2 -> 0.24.4 bump, which still had not been
applied to master. So when something like this happen, we ideally
expect you to mark your previous patch as Changes Requested, and then
submit a brand new patch that does the 0.24.2 -> 0.25.1 in one go.

I fixed up the conflicts when applying, and pushed to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
