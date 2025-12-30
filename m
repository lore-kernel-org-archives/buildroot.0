Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C01EE4990
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 17:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28CC481756;
	Tue, 30 Dec 2025 17:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gIhmy6yxGoRj; Tue, 30 Dec 2025 17:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DB94816DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767116655;
	bh=B/U7DQM1YlCZ1hiRuo5m0s/5Dk0FqncZNvaO0zqWpLw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g+zi4BNSUyffEvyeiDJ04MezQGmp1pdSu/Nz4HTTC1SsI48BHGOLHfgAxFjleHjM3
	 ajdFvC1M5dgIetBC+r5Slp22GanTdn8qaHaYtmOS7BpZc7yXLrvZLHqYZPn4lFERhy
	 aM5Jw8kwrnTv+ufpFWpGs+zJr/7LjBbRMjoOpzIR8Fqk/0tBYJmlLqYMz+1ML8bmOB
	 9U2hj12pLDaDVZFz1RfirykhuzLB8Im3H85YPKvAAi6ZvHzG0ZkX4TnfjUqtmPIBVn
	 5wyotmqYFPXKd4Ce0hZhN7X6zXj6VGh0h9qfF93qltNjP237ghUO/tUarKcjiuq0iH
	 O6f5Gf9+l0nRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DB94816DF;
	Tue, 30 Dec 2025 17:44:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61856277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 519E46085C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQpduPzH8DMo for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 17:44:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2902460791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2902460791
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2902460791
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:44:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 183541A2541
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:44:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CBA926072C;
 Tue, 30 Dec 2025 17:44:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7D5AB113B062B; Tue, 30 Dec 2025 18:44:07 +0100 (CET)
Date: Tue, 30 Dec 2025 18:44:06 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Maksim Kiselev <bigunclemax@gmail.com>
Message-ID: <20251230184406.68299d26@windsurf>
In-Reply-To: <20251201183142.2493628-1-bernd@kuhls.net>
References: <20251201183142.2493628-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767116648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=F+bA+4/l/7bxSp7Sj6bbaKqM2XpMjeJdEwRYFVrTywk=;
 b=orWGSvgf1aAHLd6J/VOnV4nEhG8469jRkNqfmAyTfXJMa5OxdtLfLgmR2dJRyMiDQYEJhP
 1yd2P3DjT9PXnJs1QjvnJyjKqDW82jIbNlDoLG3UUKDcLckTSF+I7TUbx7cf/KjcUjDY4M
 AXurHPYomJIwykxK+xktwYpz8jlZ/PO/rWvpXWjEioktjIirt6w7n9PDbp6Y0dCpUpJ9dx
 ZT2r5KR+sT1Z8thJqbUpbZ0QTQHzm3rOX68H2DuVIMacF265vUUpabhtD9DqAuQMGv1vp3
 0mZT3+aoEwaOpKntll5O/WLuNXcxMwN6BP5v/tab8nZjJmTRoEJEoLfekeRsOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=orWGSvgf
Subject: Re: [Buildroot] [PATCH 1/1] package/ledmon: update patch to fix
 musl build
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

On Mon,  1 Dec 2025 19:31:42 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Updated patch following an upstream review:
> https://github.com/md-raid-utilities/ledmon/pull/272#issuecomment-3596495739
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Build-tested using this defconfig

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
