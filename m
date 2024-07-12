Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032D8C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB285410A7;
	Fri, 12 Jul 2024 13:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QM_MqhKiP4jZ; Fri, 12 Jul 2024 13:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97FA841347
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97FA841347;
	Fri, 12 Jul 2024 13:44:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75A291BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7166881FEB
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7Kl2NhoL3Y4 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:44:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 592A081F15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 592A081F15
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 592A081F15
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:44:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F3886000A;
 Fri, 12 Jul 2024 13:44:11 +0000 (UTC)
Date: Fri, 12 Jul 2024 15:44:10 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240712154410.16c6e000@windsurf>
In-Reply-To: <20240707194439.371088-1-dario.binacchi@amarulasolutions.com>
References: <20240707194439.371088-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720791851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PZ9WXEIa5euynf/xRPJ2dvcWDqkgSvOg+G/yzgq/OVw=;
 b=aYu/cMwR+6P23hfHKKeduaA0cO+7s0ZFIh7mRGWKJSkHE2hqixdGoc+4RaCGXzA1Ppq3gr
 wbiUJqMnAaxcm6fPsyRUTtgQPcp1/tUYDsf/QTPg03WXdy4giCIeJwsap4WXPsMjF6GiD+
 UlVOdnwXTvLJF4fzFsBIOAeFGtD99bxACx7Y69G65pu4b8VzCSZzdTzl8zrdAkB9WEOKKB
 SXP9Zc9VydL5o9la2GZ5lNsy2UU7SY4NjI3Zr4ITurQZlOH55T0KqI6MmyFIla6WgnGjQT
 6yyooq7MrfNIAg/W0Ug8c997F7tm+2EuCHp6IE03ZN2vx7XEIyplqNqXeEhmsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aYu/cMwR
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: fix patch fuzz
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 linux-amarula@amarulasolutions.com, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Jul 2024 21:44:39 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, qt5webkit fails to build with output:
> 
>     Applying 0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch using patch:
>     patching file Source/WTF/wtf/glib/GRefPtr.h
>     Hunk #1 FAILED at 29.
>     1 out of 1 hunk FAILED -- saving rejects to file Source/WTF/wtf/glib/GRefPtr.h.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...Remove-invalid-g_object-declarations-to-fix-build-wi.patch | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

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
