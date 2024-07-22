Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE47C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A413840284;
	Mon, 22 Jul 2024 12:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ta55nQ9nVDzg; Mon, 22 Jul 2024 12:15:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7563A4096F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7563A4096F;
	Mon, 22 Jul 2024 12:15:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BC181BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8579A4010B
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id befTaBkfEnGu for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:15:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 290CA40106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 290CA40106
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 290CA40106
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:15:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9998C0007;
 Mon, 22 Jul 2024 12:15:44 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:15:44 +0200
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20240722141544.488781ce@windsurf>
In-Reply-To: <20240721173604.13824-1-br015@umbiko.net>
References: <20240721182342.6403c1d7@windsurf>
 <20240721173604.13824-1-br015@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721650545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EoMHazuEBNi25Yq1W/1PZlk2epSAR/vCSBHajCFG/3M=;
 b=ez1kEp6yzUnW8NczuIusSTfzPqHxMSj5SlChLIJvkiYrWXqavNd66GPm8+b/hQRedlo9kH
 L/TCA7gI1zj45uP79Dlcce7QeTmdngUAXz3UeVlc+zQunLXIofNexoqUxiYpLzMpf5O2lL
 94u2sxAwsn08RAUNFjVm+t+0fCIWgp2Pqvf7eQO5a+ShinjJN8cIhk1vHxcXj332zPlV6R
 Wc6Ua8E28I1vTLJ6Ak2tAaAoCaOS1wzfz8VHXYuZVCa5PCSW+Fq7Io499Oej2zTdio4eit
 PE3YhDF/xPgDYJC0h/eMjgpmmyAbT9ufZaDoH67pEtNO7WrwxPDqnurMKa+UaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ez1kEp6y
Subject: Re: [Buildroot] [PATCH v2] package/mpd: rebase init script on
 layout introduced by openssh
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

On Sun, 21 Jul 2024 19:36:04 +0200
Andreas Ziegler <br015@umbiko.net> wrote:

> Rebase S95mpd on commit 1f743f4 (package/openssh: tidy up init script)
> 
> $ utils/check-package package/mpd/S95mpd 
> 61 lines processed
> 0 warnings generated
> 
> (smoke test on live system)
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
> Changes v1 -> v2
>  - use --pidfile in startup of service [Thomas Petazzoni]

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
