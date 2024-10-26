Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F85D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 19:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C30CE810E6;
	Sat, 26 Oct 2024 19:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ki_WxIdqI84B; Sat, 26 Oct 2024 19:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D63E1810E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D63E1810E7;
	Sat, 26 Oct 2024 19:01:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42E235C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22E9B4012D
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_zAQdVlVJoP for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 19:01:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4D5E40125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4D5E40125
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4D5E40125
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:01:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C56F3240005;
 Sat, 26 Oct 2024 19:01:26 +0000 (UTC)
Date: Sat, 26 Oct 2024 21:01:25 +0200
To: Ludwig Kormann <ludwig.kormann@ict42.de>
Cc: buildroot@buildroot.org
Message-ID: <20241026210125.45ef52cd@windsurf>
In-Reply-To: <20241016124537.2645119-1-ludwig.kormann@ict42.de>
References: <20241016124537.2645119-1-ludwig.kormann@ict42.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729969287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/DT2hvRYl+SRPuZeh1Q1K6CpjM82hLUuoohmYI9/oI=;
 b=ahDWgdrYC16qoRVeCQPFd6b6W/xrfOmNka3fCowQV214gZy+hLjcNWsCRftdnxZOwSyQhX
 KSqMDX8aYNAJ8uUqzgU/bmSJv2Hkul5iiu2EEoG8KDB4Fa4HRx5FqOngYTn+Yc2iB2Zx3P
 PpBq7IAtgYd556tUS357Y0ZTT7bD7+fyigX6DOHMf1Cbs18oxcoFJIQuU3eZE0kj18NZwh
 oMksnMJBMsytStJwDzpJ4162dpyj/69f9XFM1HQQvM4eUfTHbFGJfiDVraHPp+ev6gt8jH
 vSv/WBXRBd8mSGvipc+ilMBsqDqeUmH0PJkDbGsGaORPEiKUibjXJOYg6IBONQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ahDWgdrY
Subject: Re: [Buildroot] [PATCH v2 1/3] configs/icnova-a20-adb4006: Bump
 Linux to 6.6.56, U-Boot to 2024.10
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

On Wed, 16 Oct 2024 14:45:35 +0200
Ludwig Kormann <ludwig.kormann@ict42.de> wrote:

> Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
> ---
>  configs/icnova-a20-adb4006_defconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

I have applied the entire series. It would be good to add a readme file
in board/in-circuit/icnova-a20-adb4006/ like we have for other boards.
You can look at other readme.txt files for other boards for examples.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
