Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7036D3A67B
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 18:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 774CF80CC8;
	Tue, 29 Oct 2024 18:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhTKT7cp_Qvd; Tue, 29 Oct 2024 18:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CF1F80CCE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CF1F80CCE;
	Tue, 29 Oct 2024 18:37:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 114854969
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E69E0408BF
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQ5SvSrqwmfq for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 18:37:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A6F99400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6F99400E2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6F99400E2
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:37:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE72340005;
 Tue, 29 Oct 2024 18:37:17 +0000 (UTC)
Date: Tue, 29 Oct 2024 19:37:17 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241029193717.4fcda83d@windsurf>
In-Reply-To: <20241028222101.2184759-1-bernd@kuhls.net>
References: <20241028222101.2184759-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730227038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+m//IFlHz1wEhJdfJgj5r/V5P9rs/989wEX7Aw+LmE=;
 b=NANRyXZAzJhpNcqDf1R916lwoXLEGdMhmQCH9Yllb1sjPIM7y01MPdaoKJEsTRfyrl+xtI
 rPMhsLehnvmlwQQH4/A4d28RSAPCPq6AWh+6jDIHujiOSH0LsXCnY1SEMwIgBBcIlo9lbF
 f4noNtRtSZZ8wj/2cRZHaVnoEaXlEU4tz6lXVpC2X/eHpFx2I6C9vigMMxnfaHfV4MjaHq
 V+AuOrHPVOM+MpsxpSZssJjvWoa30m2jJsEKWwyDzlqOo7WpDvQcIcvjc6bN+5J237nxyv
 ReuRF7rD+5SERnrb3DO4R1mkW9XIcND8zXCmUYyiU1IBs2dNCwafHkIX2QR37w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NANRyXZA
Subject: Re: [Buildroot] [PATCH v2 1/1] package/apache: Include
 ap_config_auto.h to define _GNU_SOURCE
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

On Mon, 28 Oct 2024 23:21:01 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/2f6/2f6b7bbb4c97e4c91b3abd6bb205e237e57045fa/
> and many more.
> 
> The bug was introduced by bumping apache to 2.4.59 with buildroot commit
> e0bbfaea0e983c1ce42a9c3085f3ca3dd796852f which includes
> https://github.com/apache/httpd/commit/008e6afcfdae36bce1b5f3fc0cb9519375fd99cf
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: Fixed missing _GNU_SOURCE define (Thomas)

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
