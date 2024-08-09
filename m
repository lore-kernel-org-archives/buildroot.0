Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14013C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 22:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85AE7844BE;
	Fri,  9 Aug 2024 22:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aHRM7D2aDpih; Fri,  9 Aug 2024 22:13:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84EF884446
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84EF884446;
	Fri,  9 Aug 2024 22:13:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A8101BF865
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38F7584445
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2xoEa_ptRdP for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 22:13:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69FA984446
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69FA984446
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69FA984446
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 22:13:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64AA4C0003;
 Fri,  9 Aug 2024 22:13:31 +0000 (UTC)
Date: Sat, 10 Aug 2024 00:13:30 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240810001330.576f6cfe@windsurf>
In-Reply-To: <20240808204812.85880-1-ju.o@free.fr>
References: <20240808204812.85880-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723241611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8+ckmrriMPi6MWMPTZGPnav3EPjuZF3bwRNS2pG0oo=;
 b=SBbBQWwjHNbwwbRsSzXj6NgHAzb7kWSaJcGl+bEsTXUDzmp15XiisctFQ+/JVE7r0pynwW
 OFbVAaqJz4S5Cu+xtvJE5hT+0RfXCbCjDtd/1eIIC0Mh2zMO4g5LZXPFMPOxX4TpmYxbNC
 ZxU3jrMI/OmCIbgRXj1K+Y7ynHzzdnPKviBJPXttZOnExIdxpLebgMa2zktIvFm1fmTtwm
 Cj9Qm62YYFSzHEFSb9ssHwXl8+/dNm2Rtjlw44P34L7xhe940UoCo2GpI5SWSIuUQEN1yk
 b5YwQdxA2bUQpzqjmeCDIEV0Evry3QGpkfjQpF+S0yr9mcBvHBnlcJMKh24p3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SBbBQWwj
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/run-tests: add a nose2
 debug option
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Aug 2024 22:48:11 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This commit adds the -D/--debug command line options to the
> support/testing/run-tests script.
> 
> Using one of those options will pass "--log-level debug" to the
> nose2 invocations. This can be useful to debug nose2 internal
> behaviors. See:
> https://github.com/nose-devs/nose2/blob/0.15.1/nose2/main.py#L209
> 
> For example, calling:
> 
>     support/testing/run-tests --list --debug
> 
> will output:
> 
>     List of tests
>     DEBUG:nose2.main:logging initialized debug
>     ...
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> For info, this patch was written for a small investigation asked by
> Thomas in the discussion at:
> https://lists.buildroot.org/pipermail/buildroot/2024-August/759983.html
> This debug option might be useful in some other cases...
> ---
>  support/testing/run-tests | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
