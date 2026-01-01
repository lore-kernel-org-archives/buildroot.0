Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED77EED603
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 15:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9970A60781;
	Thu,  1 Jan 2026 15:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XnsD-OHUrDQh; Thu,  1 Jan 2026 15:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD24460786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767280232;
	bh=a7vTTurXfthR4d4/m8bEpWjF+pFHD4VvsEwOWs4Bq8I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KGYnESKhE+ZiFLTZksS97a8f8P7FQg02veLQuOBr2q8pVN+VtRah+q8+SJvRT8zwO
	 G3b1hiyOdtQSAZmgoydoIJiUbUiLIlepKJPMejicIywU4A1hxOeFpx4BqMrFg+o/G/
	 yNeLbwD1vAWz5qeQ9HJ8vIEQTa1fA3Mjn7prylyn/tQ04DamG/rYk9neeAzDtErZpw
	 jE/8oG+utJotOQ2Hu4jMv1Olxidw148HmfNvi3z3RH2WWPSnTCQnypxgqqq0IUiLZf
	 e04Cq5bQMGY4T32ONNKuN/AKJZdlrCiEYQbbtsVEIf9At94jSUW8iafg0IIQkafM4F
	 ZHHzhIsRB1dvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD24460786;
	Thu,  1 Jan 2026 15:10:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E89ED19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5FDC4070C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4snfOLTXTpRz for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 15:10:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E119B40703
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E119B40703
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E119B40703
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:10:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BE6651A2578
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:10:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 96794606B6;
 Thu,  1 Jan 2026 15:10:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1A340113B029E; Thu,  1 Jan 2026 16:10:26 +0100 (CET)
Date: Thu, 1 Jan 2026 16:10:26 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Philippe Proulx <eeppeliteloop@gmail.com>,
 Devin Steffler <devin.buildroot@gmail.com>
Message-ID: <20260101161026.266acce6@windsurf>
In-Reply-To: <20251115164828.1519438-2-bernd@kuhls.net>
References: <20251115164828.1519438-1-bernd@kuhls.net>
 <20251115164828.1519438-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767280228; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=X0s1OFmz8t21ZgRtOHgBVrYvAcM4cvWvbRF6g62JLhM=;
 b=EVMMSZ4CjpNSMJppOKc7GogXS/KRdWThIqw4kT6ZXVqM0A0xo6zpBWyRprx8mRjGOWMalR
 LZmkPYk9xzXTOIrPaODi26xoY7U3JuO14/f7fmtcjFBLWqsFv9UL93qvyvsXUfRQupoZmX
 lRL24J8B894Cpw5dfBWAhcYV7R4J4g0bKJX6SLKSsBuk2VFDOzU8nWDjfXhhAEyVHUb/Bv
 h2TIPMFPQcH2hCylrRmnU7+3NKObx82JOF8dG+bJFBndnALbpj+wmTjdPvQSSlxzFFysdD
 mGnd/lhzPRS19qIGqmN/rFB65SWRspOr6WTNiChlBRVKBeEUirk/M2L3C+A3bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=EVMMSZ4C
Subject: Re: [Buildroot] [PATCH 2/4] package/lttng-modules: bump to version
 2.14.3
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

On Sat, 15 Nov 2025 17:48:25 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: Devin Steffler <devin.buildroot@gmail.com>
> 
> The current lttng-modules that buildroot uses is 2.13.10.
> That version of lttng-modules does not compile with any recent version of buildroot, including the following:
> - latest stable release: 2024.11.2
> - latest long term release: 2024.02.11
> - master branch on github

Since it affected an old Buildroot version, including our LTS branch
2025.02, a smaller option that a big version bump should have been
investigated.

And indeed, the LTTng guys did maintain their 2.13.x branch, with more
fixes, including fixes that are relevant to address issues in
2025.02.x. So I instead committed a bump to the latest 2.13.x, which
the LTS maintainers can backport to 2025.02, and then on top of that
this bump to 2.14.3.

I also rephrased the commit log which was too verbose, and used first
person sentences, which isn't really great.

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
