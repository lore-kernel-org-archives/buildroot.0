Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16BFCDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADE7780D62;
	Tue, 22 Oct 2024 20:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tfrsn5P5Hea; Tue, 22 Oct 2024 20:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B276180D5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B276180D5F;
	Tue, 22 Oct 2024 20:54:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E987A2072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA10980AFC
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_N4UlXGftls for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:54:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B898A80A85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B898A80A85
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B898A80A85
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:54:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B51A40006;
 Tue, 22 Oct 2024 20:54:38 +0000 (UTC)
Date: Tue, 22 Oct 2024 22:54:37 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Anand
 Gadiyar <gadiyar@ti.com>
Message-ID: <20241022225437.3f4fb440@windsurf>
In-Reply-To: <20241010-uboot-bump-v1-1-287ffa07e49e@ti.com>
References: <20241010-uboot-bump-v1-0-287ffa07e49e@ti.com>
 <20241010-uboot-bump-v1-1-287ffa07e49e@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729630479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CSZ8pKC6kLtZ3nt8yzONNSEqmaMLIMVDWpHYo2Y5QLY=;
 b=jEFCfIgQSSDSIAdTpEFs3Ey+yuEYrCvUMYQdubWwyzD4fOIaDSlXlUfnFHpxGqCYWXAdPR
 +zb6rr8YznKoIw1l3LYf643hqApD0Af4Z9oBd1DQlyTpM2UZsOJ+sug4W0tb8s1j3EG7an
 u+uAyAIQiju4jzJdbTHA0oG67fpRNfMvLtHHTxNXjJnPX7IplPVIb+uA9fWJCRxPIsXVDi
 YAGwclKQq48Db5avQsFalMH2Eo5JpcqenZ+qw5/AtA5c8ezIk+rPnZjhfeheWYjAMLtI4B
 eshfZc9+b8DedaXIZMgb7jqm219aymRcPuEDdISTn5FgKrQPJyGgqVsa6SQEqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jEFCfIgQ
Subject: Re: [Buildroot] [PATCH 1/3] boot/uboot: update link to the U-Boot
 docs
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

On Thu, 10 Oct 2024 18:39:22 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> The denx.de/wiki/U-Boot link now redirects to docs.u-boot.org/en/latest
> Replace the link to the new location for the U-Boot documentation
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  boot/uboot/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
