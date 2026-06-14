Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183B0CD98D2
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 10:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBEA480CB0;
	Sun, 14 Jun 2026 10:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNaYqo2ye0SI; Sun, 14 Jun 2026 10:09:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7438880C5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781431768;
	bh=fR7WNqCQ84/hYhw0PZyoqSsoD8MTvDLOPXeBJgh/iWA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TQrm4GYhisTaoSg5/mn0RIPJePidIa2Szap57f47QQJ72xvVYhjgJTkP98JodIR4Z
	 waGUUNXOYtQBphsGgok+b2fL6ujfae6GXXqyuOBk/KLyPqo5YGjURYUEyO1DLhvegx
	 uWHb10PEH+lfcUIIHB6t+3ez/1arwi3AlZTwamvqPXsF6jvsoqsvl7SVR8OquYAiKL
	 13ocKTML6QdYMkHbEC0c6mZQbV9O1+nuICEjiWNN5q6pmXgLledCQdZpVZfojCj6B5
	 Sp1BUzpAYnV1qgqhR7HuD0vP/tRCytMlchMQJOcni5Kepc+0+MZgr1TM7AcCZPxF9K
	 E9eZ+1exskDlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7438880C5C;
	Sun, 14 Jun 2026 10:09:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2716C2EF
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D86040280
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7o1hl6AcOKu for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 10:09:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2F7D4026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2F7D4026F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2F7D4026F
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:09:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 196739963; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 14 Jun 2026 10:09:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wYhmN-0000000FSrR-00sd;
 Sun, 14 Jun 2026 12:09:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20260613194451.220317-4-romain.naour@smile.fr> (Romain Naour via
 buildroot's message of "Sat, 13 Jun 2026 21:44:50 +0200")
References: <20260613194451.220317-1-romain.naour@smile.fr>
 <20260613194451.220317-4-romain.naour@smile.fr>
Date: Sun, 14 Jun 2026 12:09:22 +0200
Message-ID: <87a4sxmo19.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Wq3vyhTGmjLjIZk0cP+g+Y8JD/xgr6+dlnGh45eyapC2FwOgufnT6jdjjEsQCrIcfwhvUllwaOn0RUYiqXnGLo0oFwSZ338tZSPQ7b6xl+FUbmwtjIlghszGCCaPnqFUdAqRBxtIGxAuaZvGH5l3zSHvIaamibzHScaLm2QpuRdjL5en2VoUc7g06cuqx0ZVr6IE2yW2BEFJYUp7ehirhCeIQfIlPwhYR5QB7URXEXCUd8pzPCvW5zzTw9MwhUHMGxH80sX2myMJoKQmzdDTu/cH8l0Aj8cj6ijsgUETte/TLKqNZIc1RUnWAZh8871sKLkW3r+ZxxdDsjBwU6Us4w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=DW7n9Du94AboOUCsms8arK4TxnSG2GAxd1/IFG74x+k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Wq3vyhTG
Subject: Re: [Buildroot] [PATCH 4/4] configs/qemu_{riscv64,
 x86_64}*_efi_defconfig: switch to Bootlin stable toolchain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > Update the qemu riscv64/x86_64 efi configurations to use the Bootlin
 > glibc stable prebuilt external toolchain, as recommended in the
 > Buildroot meeting report from ELCE 2024:
 > https://elinux.org/Buildroot:DeveloperDaysELCE2024

 > This will reduce the number of Gilab-CI minutes by ~20 minutes.

 > https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914014 (qemu_riscv64_virt_efi_defconfig)
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914021 (qemu_x86_64_efi_defconfig)

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
