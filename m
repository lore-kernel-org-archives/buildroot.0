Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B6AD3A679
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 17:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ADF5605DD;
	Tue, 29 Oct 2024 17:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5-Qi8afPwMf; Tue, 29 Oct 2024 17:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A477A60657
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A477A60657;
	Tue, 29 Oct 2024 17:49:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E2EB4969
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BFFE40426
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0u8VSvBrRmEx for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 17:49:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0627C400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0627C400E2
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0627C400E2
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:49:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C05F5C0002;
 Tue, 29 Oct 2024 17:49:09 +0000 (UTC)
Date: Tue, 29 Oct 2024 18:49:08 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241029184908.23a73683@windsurf>
In-Reply-To: <20241029141125.1065482-1-fancp2007@gmail.com>
References: <20241029135851.1063521-1-fancp2007@gmail.com>
 <20241029141125.1065482-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730224150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PycjCVuNumvWmNdbBCuYLuIvQY30JiLoV7Q7duCo3ZU=;
 b=e+cITfW2jWBJlWsXq+AXlWJ+g2ONm3upQOtLSYqp6L6UhCEN5mPALkf/E62b1/gWYCfiT2
 dxgHBY0ZbcEumf2VHMDNvzFP0OrRhxw3pk5gqWt9mTrL2nkK/VV4vyHANUnmy2a5dYsyhi
 v6D7CMkwzQsD+ZfuIYxXiV98P/oubzUZnIu7RcpVh3DQz2myTdF9I0zN4Gtm3QF99egg8i
 shrMubhHgQk1M/n1o478naiCnKc1xiGD4vOrov2MUpkVwaZhDfSfHejVdPOHkadCtfx5ub
 cBl5OU8FPLElNfvOgKKNHvwpu6Ke6QgDy22M3wApzzvX5DunVYfWs+R+VDknRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e+cITfW2
Subject: Re: [Buildroot] [PATCH v3] package/procps-ng: fix typos in config
 option and help text
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

On Tue, 29 Oct 2024 22:11:24 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> The option has been renamed, so add an entry in the
> Config.in.legacy file for the old option name.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - add an entry in the Config.in.legacy file

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
