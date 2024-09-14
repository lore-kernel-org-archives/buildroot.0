Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4D2C021A9
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D16ED80F47;
	Sat, 14 Sep 2024 18:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9Tbwl1OusKZ; Sat, 14 Sep 2024 18:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED4098126A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED4098126A;
	Sat, 14 Sep 2024 18:07:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DD2A1BF283
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C3B5403BE
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GIsXfvRmms9 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:07:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA651400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA651400D1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA651400D1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:07:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15A7F20002;
 Sat, 14 Sep 2024 18:07:27 +0000 (UTC)
Date: Sat, 14 Sep 2024 20:07:26 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240914200726.006e9712@windsurf>
In-Reply-To: <20240914180148.2447072-1-festevam@gmail.com>
References: <20240914180148.2447072-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726337248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sg/Y0dkzHA8TRVXG8FFfo+IcCMXZDflZPO2iSoA8HNg=;
 b=Ps4qxQbpUYxfOFkC/eYRUS1UPJjqyjKt1MEwfryLIuQ4KgHHjDqm4YiwcYyP9LYVBM1Khh
 kOIjIrtLpsg9dz2J/FiE7X4xJd4A2cYUPFv6LBx/TWDWEBBFmLnA0+wj0XWuRH0cjXBB03
 Pb0rnnMw017igv+Q27VfCwYgna5OKtdtZiJaMrFDHqmGcxpysG+kvEorXO6JZj6lBsCrQp
 QLYQwYJ2r7qd5kvDZW5C5E8YFkAlihGoS0o/5w1CNey/GoOuPWq2yNpY7c1An+/0ImZvw7
 tR9qyfVcuDa1OEKTtYAGbAO27C3dfI9m4kyZLrhrU9emXJu73NrZs7h+8mTZFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ps4qxQbp
Subject: Re: [Buildroot] [PATCH] configs/imx6slevk: Update the kernel to
 6.6.51
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

On Sat, 14 Sep 2024 15:01:48 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Kernel 5.15 fails to build with GCC 13.
> 
> Update to kernel 6.6.51 to avoid the build failure.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199854
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/imx6slevk_defconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

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
