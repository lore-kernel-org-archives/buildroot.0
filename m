Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F35C61DD9
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 14:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DE076060E;
	Sat, 29 Aug 2026 14:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taXxunbeJxom; Sat, 29 Aug 2026 14:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788013191;
	bh=pgYNwUDgDnBW0yu8FphmCclztIGAHNEE5NpKbGfX4NA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YNZfuUzHHPJOhOTZY34bbQcVwkTQOV1xP7Xs/qr5AS1Zk01z07PfvRrPnJQOGl03s
	 bxumkxrwZt3A+B8XmHEQBut3StaBNqO9mF7wlUT1bqxhyM1S0zql0QteJwtSZ1vHHB
	 HtzxklFzCMr4KB7QF0eQlUCpby1REJ46QhQYaCbdqUkXFquTLQdfQXksxXrMmwTYEk
	 xm76iaw3B7wVGbRVQ6RDR8UYfjIRE4I0jVUB5vhAY18AmJ1ZdFvjTNsrTXxOLCVoIe
	 m08DFQdvNeKU+1qAnBLIe01PNunfzRnRgduij47t21F7ONM3OU8w1yLtD8appWr/hJ
	 lE30HfaHF0wfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3702360607;
	Sat, 29 Aug 2026 14:19:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 323DF118
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 14:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2442E80E3E
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 14:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MG5H77Gp505Z for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 14:19:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=guKr44SB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7128F80E3D
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 14:19:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=guKr44SBnwydGj+VKBi/eKFa/YviPUbzLPRMbbT/9K3tgUr14jrstMh0uDshxjJ0VLddsvTcBp+BFL2YyFX9RSRUfCIepvHa/JT8rmhGc1Etz3QPSvXRONvw8tDVFQ+zeBxNlEKUQ84UuU341N+dKN8hr95UT2z7ul3yvM/bKsqRK9P9OimDWx3tPfcZrX0QSW0rWMj8xXazEp3psoIXMicyYNQU/vesfMnUPIxqBBQgLm+ZfXQEvatGONXGGvgzEKCJZAzl018S08fqBtLoIHANcGYW8RTOlvbKF/rmbjSjXottXo51EAPcveKQ7GjImE2VRHO5kHyalBzFcswkeg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=EIgCKUkiu+p30tZM1nlk5h4N3r5sBONgC8iScz4ow1g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -931414156; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 29 Aug 2026 14:19:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x0JuJ-0000000HUsu-0DXB;
 Sat, 29 Aug 2026 16:19:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260827095520.1049186-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Thu, 27 Aug 2026 11:55:18
 +0200")
References: <20260827095520.1049186-1-thomas.petazzoni@bootlin.com>
 <20260827095520.1049186-3-thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2026 16:19:42 +0200
Message-ID: <8733vxypoh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] support/testing: add bpftrace test
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > This commit adds a simple bpftrace test that ensures that not only it
 > builds fine, but it also runs properly on a minimal test scenario.

 > +    config = f"""
 > +        BR2_aarch64=y
 > +        BR2_TOOLCHAIN_EXTERNAL=y
 > +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 > +        BR2_LINUX_KERNEL=y
 > +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 > +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"

Any specific reason to use such an old kernel? The qemu_aarch64_virt
defconfig uses a 6.18 kernel. Is it to match the default ARM 15.2
external toolchain? If so, that one is built against 6.6.44.

cat output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/linux/version.h
#define LINUX_VERSION_CODE 394796
#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + ((c) > 255 ? 255 : (c)))
#define LINUX_VERSION_MAJOR 6
#define LINUX_VERSION_PATCHLEVEL 6
#define LINUX_VERSION_SUBLEVEL 44

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
