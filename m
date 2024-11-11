Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49287D3ABF5
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1960F80E23;
	Mon, 11 Nov 2024 20:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vwkfe9zb7D2; Mon, 11 Nov 2024 20:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37F5580E34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37F5580E34;
	Mon, 11 Nov 2024 20:28:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 086516C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EEA7401A2
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XBSXHb5doEK for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:28:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D6F59403D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6F59403D2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6F59403D2
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:28:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1613840004;
 Mon, 11 Nov 2024 20:28:01 +0000 (UTC)
Date: Mon, 11 Nov 2024 21:28:00 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20241111212800.4488f35e@windsurf>
In-Reply-To: <20241111102901.1934365-2-buildroot@heine.tech>
References: <20241111102901.1934365-2-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731356881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=toONXb1/H4UatutGaFrelYmxTMq9zD5Bps1zK4lVU9w=;
 b=WjNF+6U8gZ0I5zneyZx1d87M7QKxYGLP3HWtapTHl4pQ8aWvWcaqkJhlSuJYjL4xfBp5ni
 RFupI8bM/G2qjBRBjJ587sNzSZNoJ9cpXN1WPw9E0a4ERZkfMdpcY46uAc7Oe46irhZXLR
 BcXBsdgnTlKpnHsF8FXi6gAvxYjDq9UN88LuZwmZ7FFBlu7rA5+T76KZ1Iz9dWND1FLM0C
 tJ9ns+Yx8kDSIucehohqwScfvmyHanLQvyb/skkZwlDEj2tpBcDF8DXHBVJyjC0+ptGJKE
 wR71SsKemyK5CAdy5jN5KCCg2gmvnqoT7B3A3+YL0r3x3wSeK1O2XJeKhYCWaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WjNF+6U8
Subject: Re: [Buildroot] [PATCH] package/spdlog: bump to version 1.15.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 11 Nov 2024 11:28:58 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/spdlog/spdlog.hash | 2 +-
>  package/spdlog/spdlog.mk   | 2 +-
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
