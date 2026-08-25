Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DD4C5DF94
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 08:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AC6F40624;
	Tue, 25 Aug 2026 08:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_kIn1YV42Gc; Tue, 25 Aug 2026 08:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787646876;
	bh=6fqLa1AerGLD228Tj+A4VTK4cqEfITgxG8ivzDyniP0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LIMgsNsnhkWIVtYgvMqJtiCW54H4QNFMPBX50LU9NDa70v9pgYAXqUD03WmvYbDZP
	 lkTVj4VjkZQ/++xIJYF69Ypm8hffdPCuZ6pRJAf3HAb7k98833M5LIa6WudxGKjuVG
	 nHHJSofkwW3Emh6Iquf1qkwMh2BQ+sCh8XJFi3IKWirqgBhuK0/pdDEBIS9d9K1gFp
	 mgwL+2CW2Ntaw9z78SPIGyrtPayJfzhFEUKzoTBeicjfdD9j/yiieFygXn11SRqMlG
	 2gPOocztourxie87/zzycnIhZd24dUsyphHe4D1Fe7uDDOuSDsIJlJCbFQl/SP8hVa
	 Lf+KbGC26k7HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BFBE40613;
	Tue, 25 Aug 2026 08:34:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 434B7279
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F7786060B
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weTLzT7xhzVb for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 08:34:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=N0jH283U
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 247E96060A
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:34:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=N0jH283UtpB7A3dYEQJzOxy96EWf8WYFk1tvSgiW0jO3I07ZkXpoOH0XV8uGRxXqBWQWZWF4iD9wCSEMKLKk43aFRzXTgMs/a5Gzm6Mce+nsHNg8QNzuIZOXZxGXz1TWuKO7bUFlQd6D/hj5WsJGuY02rjHU4U6RoTsUiuanx8V2NbVoPSC1DLFsEJeO/LQkdsYGjvsFIbew4VQ4jQeA9Od4cwYSBE3+hROEHNGh8JCDjdF9tu1L33N/jDgn+yu2kM8ynL6PK++bwYvXS5dnAVshmv1piPkWjDWqCzAb8i1XkhYoZJKpxoCBYigeyLTGPMLMnU0JNIAbSx3nTWqUkQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Xf0UrxFR8xrIqrCo4j86qY6vJ1rDap36CBpM4tJgI9U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1607912799; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 25 Aug 2026 08:34:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wymc3-0000000CRHT-2MPC;
 Tue, 25 Aug 2026 10:34:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Romain Naour
 <romain.naour@smile.fr>,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>,  Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20260823191926.2684260-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sun, 23 Aug 2026 21:19:25
 +0200")
References: <20260823191926.2684260-1-thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2026 10:34:31 +0200
Message-ID: <87fr02y4x4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] toolchain/Config.in: refine
 BR2_TOOLCHAIN_HAS_LIBQUADMATH definition
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

 > In commit a2380157f6688c5c065fa19060a2c33145bab95b ("toolchain: enable
 > libquadmath for PowerPC with VSX"), the definition of
 > BR2_TOOLCHAIN_HAS_LIBQUADMATH has been extended to also be true when
 > BR2_POWERPC_CPU_HAS_VSX.

 > However, practical experiments show that when 64-bit VSX-capable cores
 > are used in 32-bit mode, libquadmath is not built by GCC, causing
 > build failures:

 > cp: cannot stat
 > '/home/autobuild/autobuild/instance-3/output-1/host/powerpc-buildroot-linux-musl/lib*/libquadmath*':
 > No such file or directory

 > We did an extensive testing, building the 27 combinations of:

 > - GCC versions: 14, 15, 16
 > - C library: glibc, uclibc, musl
 > - PowerPC 32-bit, PowerPC 64-bit, PowerPC 64-bit little endian

Wow ;)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
