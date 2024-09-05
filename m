Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035D0CE7A96
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A99DF400AE;
	Thu,  5 Sep 2024 20:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxAkKrH9B-ss; Thu,  5 Sep 2024 20:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B39E400E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B39E400E4;
	Thu,  5 Sep 2024 20:35:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DAC441BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C816D400E4
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9EU2VQ1sWRc for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:35:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9830E400AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9830E400AE
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9830E400AE
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:35:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A7FDFF802;
 Thu,  5 Sep 2024 20:35:42 +0000 (UTC)
Date: Thu, 5 Sep 2024 22:35:41 +0200
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20240905223541.554934cb@windsurf>
In-Reply-To: <20240904124343.25805-1-nicolas.cavallari@green-communications.fr>
References: <20240904124343.25805-1-nicolas.cavallari@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725568542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/jhReic0g5l/PXFyLWSXNAGx6GNXZVWVMP5UZsRpCV8=;
 b=HobYFlL4Wc891qS99s9w7ri2bsY/EK1Nv27iHvuhPXNs9LVpXW4qPNSOxW5qqMQcpZuMoE
 Cdt2h84uZPh0AT8+xk6NkuZ7P2KV3CvoSYr2WKZ6BJknUv+2VxAu+eYSraPOFbp4hr3xQP
 WX9Sd2x3gknSQWDacaJD+5BCnrd3fN1/5Dy/DfFRz/7HTY+qkXsQFXW9j2sAfINH8HaUCL
 e4K+oo2m0Ktq2TzXkfaUPw6iP63hd85xe+b9XTCqD94sOqGHBSbfD9HFS9mYX40CItoVPp
 6k8p9yyrxGCI2iH8jJQroAuMHq2ySKpNyxsmpocgK52aerjJp3BXAELNO5LfZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HobYFlL4
Subject: Re: [Buildroot] [PATCH v3 1/2] DEVELOPERS: add bluez-alsa to myself
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

On Wed,  4 Sep 2024 14:42:45 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
> v3: fix package sort order
> v2: add sob
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)

Series applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
