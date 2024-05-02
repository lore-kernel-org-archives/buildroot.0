Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0530C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6E30415B6;
	Thu,  2 May 2024 07:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id neMYopqCv7XP; Thu,  2 May 2024 07:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B617F415B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B617F415B4;
	Thu,  2 May 2024 07:49:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6161BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58DCD81311
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BP11JkoHMwug for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:49:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0B5D812CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0B5D812CF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0B5D812CF
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:49:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB4C920013;
 Thu,  2 May 2024 07:49:34 +0000 (UTC)
Date: Thu, 2 May 2024 09:49:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240502094934.7798190c@windsurf>
In-Reply-To: <20240411210204.2127966-1-bernd@kuhls.net>
References: <20240411210204.2127966-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714636175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TaSSu7hQ3djmDlCOa7Nf0D5LnLpPL1VRdk3FRfKWGZQ=;
 b=AGrgV7uU1nwOuWTIeLTzb3+0UJF1ujeK7IdYgQJLforvxP3WZY4BRv1jTfyU0x24IWHm/H
 slFrklHsulf1gR/fsY65txWXwpsDD3fM6tIwOaOhG1r3T4OPm5lPOLPJxjLNFa6p1/IB+/
 /ZLoe8+LSaPEPxnsqavAI6hF4qSppu4NGhuZJ0OWRB4mnhtFkFY2AJl3qvo86OYEqt2oEB
 Kp2zJsUOKK4Bddp69+wA+e7Z0jHoL1lM7C5p2Fxn3VeYDX2q2fRDWzjxrEQqaEVVx5SeIi
 d2oq6HJKLuWn3evQYSJxfJ012sNQk1I4hvjhYejn+J29kO1MVFaBpD2tGc+ThA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AGrgV7uU
Subject: Re: [Buildroot] [PATCH] package/libopenssl: bump version to 3.3.0
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

On Thu, 11 Apr 2024 23:02:04 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://www.openssl.org/news/cl33.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> run-time tested using my usual defconfig

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
