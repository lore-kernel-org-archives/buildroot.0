Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7630BE92716
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 22:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C977580FAA;
	Sat, 27 Dec 2025 22:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0Z0TEnZuYCv; Sat, 27 Dec 2025 22:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEC0980D92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766874270;
	bh=ao4x12VTk0GbTuN88dtBt2X1zd6fziQmcZ5l7Wu2sEc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HIPnGwcWJ1nqQ1k2d1CtuLOpAj3VBSRwgiOTh/yyyh63DuoqcxAgoA85DfXPaBH2r
	 U3YaJaeHlu/TvrF21xXHYzOdkamolqR6Xk72J7NJf6d6xjH+xTuP2ImTmV0s6m56bl
	 B2BkXYCGWMrX0YTE7/h8LIMo+YskbRDBXsp1eCxbycQ6/HMVK6I+o+cbp3UvcxX+4K
	 jd7WyX8xuvHfBpsnt+J/pd96ddMS7kbZQ08OIRDmCApMX+oIzmOAShIOwtNocHZDTE
	 qpEPSfzaLvQ3PMTgojcHFAihUcLZAAFw0m4zxgsTL37hr0c80pgw1eN06m6Aq6B0HS
	 nQEIZZnqG71Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEC0980D92;
	Sat, 27 Dec 2025 22:24:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 009C3B9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB01C80D92
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z67yWwZcNgSw for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 22:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 009CB80CF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 009CB80CF0
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 009CB80CF0
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:24:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 02E50C1D1AE;
 Sat, 27 Dec 2025 22:23:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 398EF60725;
 Sat, 27 Dec 2025 22:24:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F71911978AEC; Sat, 27 Dec 2025 23:24:21 +0100 (CET)
Date: Sat, 27 Dec 2025 23:24:20 +0100
To: Rustam Abdullaev <rustamabd@gmail.com>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>, Giulio
 Benetti <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20251227232420.1644a29f@windsurf>
In-Reply-To: <20251227211415.2269024-1-rustamabd@gmail.com>
References: <20251227211415.2269024-1-rustamabd@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766874263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Fi7TAPkjEGt9OpDAHa53enTzUS8uesqOPvcp0xDhLho=;
 b=wk+Q1g7GRIrCSAvBefqSB+S4w5UICESMMCSGaX+kMJAqepofs56Uj1t5pYwSmf/6+QUE6M
 re/xMB6NglfXo53ZbG7zpUOcFxU5ISLE+agO2LyS9pDyoJP2/tNQirJwMcC5SbTVr9Nhsm
 ImyGW3gH531ZpIl4TJhC9KWEMUUCwn4kbi4E5ZXggmK4EhFp0LYlhz6JOQNMr58OjfXLU3
 MN/8kpeMJhREwG1cqWLvIiHIoyBiTZJrEGOq6OmrdA4Ui2lkYjazTdDSiM/M9BfX98ydUk
 kzN9ra/+Zti4Imm7AaCmb6BcAgaIuVHOh4QL85d+/+NI8GmdxYXPG+RyQ0p0Dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=wk+Q1g7G
Subject: Re: [Buildroot] [PATCH v2 1/1] toolchain/toolchain-external:
 introduce BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
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

Hello Rustam,

Thanks for your patch!

On Sat, 27 Dec 2025 21:14:15 +0000
Rustam Abdullaev <rustamabd@gmail.com> wrote:

> It is important to have matching kernel headers when building packages
> that make use of kernel features such as seccomp, as they depend on
> system call definitions in linux/unistd.h. A typical example of this is
> openssh - building it with the official ARM GNU toolchain and kernel 6.x
> results in a non-working sshd.

Do you have more details on this? Which version of the ARM GNU
toolchain? Which kernel header version do they use? Which kernel
version are you running?

Indeed, there are two cases:

- The kernel headers in the toolchain are newer than the kernel you're
  running => you are doing it wrong, and updating the headers in the
  toolchain are not going to fix the fact that your C library is built
  with headers that are too recent for your kernel (even though I admit
  glibc has some tolerance on this)

- The kernel headers in the toolchain are older than the kernel you're
  running and you're seeing breakage => this is a kernel bug as it
  shouldn't happen.

In both cases, your proposed patch should therefore not be needed.

Could you clarify which situation you're in, so that we can
understand better whether the use-case/issue you're having warrants
this additional complexity?

> Currently restricted to glibc-based toolchains as glibc is backward- and
> forward-compatible with different kernel versions while uClibc and musl
> are not.

Not sure why this matters here though. Could you clarify?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
