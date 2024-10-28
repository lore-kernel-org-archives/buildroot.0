Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770E0D5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3997680C09;
	Mon, 28 Oct 2024 21:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GegGItK-ywm; Mon, 28 Oct 2024 21:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3675E80D8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3675E80D8E;
	Mon, 28 Oct 2024 21:30:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A3FA4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85C78404D4
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hEPZzxTHelX for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:30:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B7AD4049F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B7AD4049F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B7AD4049F
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:30:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5ADC2C0002;
 Mon, 28 Oct 2024 21:30:28 +0000 (UTC)
Date: Mon, 28 Oct 2024 22:30:27 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Anisse Astier <anisse@astier.eu>, Christian
 Stewart <christian@aperture.us>
Message-ID: <20241028223027.0bfbd782@windsurf>
In-Reply-To: <20241028162926.209397-1-james.hilliard1@gmail.com>
References: <20241028162926.209397-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730151028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m58D5e3wY+0e9MmDqBSno83xgEsHZFoLtvJn+J/h2cI=;
 b=JZtGxvsEomloBvDKp122w2iflzepKcFDFYHsCDR/ZqP2F9kkR/FoPrxn7vwgAeSPD5H0uI
 h1TDuD8xBH6Dhn1I+ue8FHdRLFBl+zd6FH9IOvjKDdFPKAXBN+Jdv4WkGsfOqY49C9JCn3
 PCTZ4Tf1JG71Z83aMikfynmP8Mi/ct+Z/ipw5c72hCnRPRrdrVFqyVTtW5Dm80ga4cZz2v
 /CM2NBGffwfaBg9m80jJC2BJ+POxdnx5ijOjjPlzU6MWREQXicLQeGvsek5JIu59mMPe4J
 isu3E1DOiPZqQhDeMdepLIoGGtFQ0Xo3r70pW8Jg34TAmBED1kWFBXO+UW+SGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JZtGxvsE
Subject: Re: [Buildroot] [PATCH v6 1/1] package/tailscale: new package
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

On Mon, 28 Oct 2024 10:29:26 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v5 -> v6:
>   - bump to version 1.76.1
> Changes v4 -> v5:
>   - bump to version 1.72.0
>   - remove GOPROXY override
> Changes v3 -> v4:
>   - restore GOPROXY override
> Changes v2 -> v3:
>   - set required CONFIG_TUN kernel config option
> Changes v1 -> v2:
>   - don't set GOPROXY
> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/tailscale/Config.in      |  8 ++++++++
>  package/tailscale/tailscale.hash |  3 +++
>  package/tailscale/tailscale.mk   | 22 ++++++++++++++++++++++
>  5 files changed, 35 insertions(+)
>  create mode 100644 package/tailscale/Config.in
>  create mode 100644 package/tailscale/tailscale.hash
>  create mode 100644 package/tailscale/tailscale.mk

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
