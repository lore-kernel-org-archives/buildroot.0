Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD0ED5B15D
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 17:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8858581746;
	Sat, 13 Dec 2025 17:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogaJDbcif52l; Sat, 13 Dec 2025 17:22:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A4A181454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765646532;
	bh=MLSsZFxDSjPfaDrksNhTANBRn5k8I0HQDa+9z9EXd1Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C63pNoRJFwjF1feOLRgoH6jNn9JHrB55BXQyMEUzauUG/Gf/AEf3fFVz2jiacEJw2
	 MZjE6FT+Txc7aBCkKZO9QYDu/Bu6ligVJs2aH35Z9L55r+i+SlBTPVowXp/eQntbqQ
	 X1sRxFDWzxNksgR/L31w3JB3LGOuth+P22/tsZYffqsoA6niD4LlRuJMf1Q5E/yFcn
	 Athh2fwDHNfL3E2t+zQxRdoIDjPW1F6iQqQEtOBtbA+I5d/kMCGUws03yJXxjmtXdJ
	 UyHH9sdk88BcaM+/DF2LKSQ0C5jnzAbi3EWhrjYjlPRyv8E34w/j7i6MqWylUKbjE/
	 rua4KQdy5herA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A4A181454;
	Sat, 13 Dec 2025 17:22:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0F402C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7331605CA
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTizQU0jY-Eb for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 17:22:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE4DC605A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE4DC605A7
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE4DC605A7
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:22:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B1C36C1937E;
 Sat, 13 Dec 2025 17:21:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AC99D6070C;
 Sat, 13 Dec 2025 17:22:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AE0DD103C8DF9; Sat, 13 Dec 2025 18:22:01 +0100 (CET)
Date: Sat, 13 Dec 2025 18:22:00 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>, Valentin
 Korenblit <valentinkorenblit@gmail.com>, Qais Yousef <qais.yousef@arm.com>
Message-ID: <20251213182200.1eb4f9c7@windsurf>
In-Reply-To: <20251012090027.3442805-1-bernd@kuhls.net>
References: <20251012090027.3442805-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765646523; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rzO6aNW6LZPvRxJnpCVRzQjrn97gr0sxqqkufYc+dZw=;
 b=y9CUXftEBRGs3JZwgTUcM/mqnO0J8xVmV3/SbYQMlguQA+lHhS53IybKgjV5BdsVBPLL9t
 A+ea9SgZaEUlATxWaobeYLiTH6QFX353K+SJAVJ2g/t4LggB/EnAZSiY6ehGZzCqWpx6Yi
 SoNNfN0G/56LOj6D85pIHLCHlY6KSiSC8eABQY7oaKC473+hScX8xK6kq87L0b/FB/rLQC
 lYZufwzjieziW4nlFujDJNgMip6WNO8u+omJYkAhSmvnBmmka9o8p1vcgG7hiL4a8iu84h
 62U8DC4/gundnQ5W2Cllz3yQ7hcUGFAYxbR4y+zaS2tF/JMS4WTbTMzv+1WriQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=y9CUXftE
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump to version
 21.1.3
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

Hello,

Adding Qais Yousef in Cc, who maintains our bpftrace package.

On Sun, 12 Oct 2025 11:00:27 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://discourse.llvm.org/t/llvm-21-1-3-released/88525
> https://discourse.llvm.org/t/llvm-21-1-2-released/88398
> https://discourse.llvm.org/t/llvm-21-1-1-released/88244
> https://discourse.llvm.org/t/llvm-21-1-0-released/88066
> 
> Update spirv-llvm-translator to align with 21.1.3
> Release notes:
> https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v21.1.1
> 
> Added upstream tarball for third-party code due to upstream commit:
> https://github.com/llvm/llvm-project/commit/7f3afab9181d83f92771293ad3b6c00ac62800fd
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

This commit updating LLVM from 20.x to 21.x broke the build of bpftrace:

  https://autobuild.buildroot.net/results/2bf/2bf26b4848796ab031ab0767b97aba63a35f1184/build-end.log

CMake Error at CMakeLists.txt:168 (message):
  Unsupported LLVM version found via
  /home/autobuild/autobuild/instance-14/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include:
  21


CMake Error at CMakeLists.txt:169 (message):
  Only versions between 16 and 20 are supported

Qais, Bernd, could one of you have a look?

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
