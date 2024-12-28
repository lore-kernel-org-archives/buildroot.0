Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14360E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 16:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD6D74031D;
	Sat, 28 Dec 2024 16:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVy5Di2HfJZl; Sat, 28 Dec 2024 16:15:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 737E140327
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737E140327;
	Sat, 28 Dec 2024 16:15:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DB7EC8
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 16:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B54480CCB
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 16:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCEWLJnK07Ur for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 16:15:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D4C580CBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D4C580CBF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D4C580CBF
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 16:15:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BF62719F59C;
 Sat, 28 Dec 2024 17:15:21 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46230])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Dec 2024 17:15:21 +0100
MIME-Version: 1.0
Date: Sat, 28 Dec 2024 17:15:21 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241228105635.3079116-1-thomas.petazzoni@bootlin.com>
References: <20241228105635.3079116-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <43d5aca7ba48bab4ffafb406f8b1840e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735402522;
 bh=qm6Td+u86SnfY61/WDnKObe0HSYj6vrfHj+AhNuiMy0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F6IATNeRCa8yDp+RYnl7fxhW6+OcfXI0+kLRMMD8XpduFujEjQGrxCyaTOJ3jWc7j
 1W896XVg4R/lXDPr2OQczWJb3uG/XHF+zPrB1d8eJup3hmz9fKck9z6aqnQeoLjVF0
 rOQK750/cPc6RS9r2cSLIPoHSk85vaVzTmZynKl0MOo8NMwKU2VwZjRDQjVr/UFlkF
 PHNyEgy15nEYxDqMJi0Ynpy/41g2KvHQ3ay9zAfYGsoXnq8sNCKImvKiXUMJZtCVaF
 EiGcT3r1RmvupzmI4Id+XiZ6pAgZLA41Zk4xFz9kXMomFXXVeXH7DFkiHwVKBDCVOF
 cDAptkovVkYWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=F6IATNeR
Subject: Re: [Buildroot] [PATCH] package/rt-tests: bump to version 2.8
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/12/2024 11:56, Thomas Petazzoni wrote:
> Changes 2.7..2.8:
> 
> c8b918c53cd57fdcbb6df153064d1b2e5cc329e8 rt-tests: Change to version 
> v2.8
> 84833954f7ee7ef9eec0071831355070c897e8d9 rt-tests: pi_stress:
> 0ef93a1735316141df5d973496db54a08956fa85 rt-tests: cyclictest: Add 
> --deepest-idle-state to manpage
> 3b775a463a13f34b95d6963d6d034eb8b4690e5e rt-tests: cyclictest: Support 
> idle state disabling via libcpupower
> 3372e0d56b3fa2de82cbbab361b881ba470cfbbe rt-tests: Detect libcpupower 
> presence
> fab7d905788701fd94d418126a52f74b776eb91d rt-tests: 
> determine_maximum_mpps.sh: Get frequency from timebase-frequency if 
> cpuinfo fails
> 394f7507112b394142bdded1330b28a77f70851a rt-tests: queuelat: Fix 
> wraparound in __clock_gettime()
> f2d8e34c9f2754b35327973f49d93f7b6089b8d7 rt-tests: cyclictest: Reformat 
> help for 80 char screen
> 3fdf4e7130ab53e7036268c0b85f447e8ba10d9e cyclictest: Fix help text for 
> '-a' option
> d2af77295440da1c0f178aa87ff6ab9fc169dcf7 rt-tests: Add 
> console_commands.json to gitignore
> e67db31eb3fd18f1dbbc97dc7b9adb9331572f11 rt-tests: pi_stress: Move 
> unlock into if block with matching lock
> cadd661f984c0e6717e681fdaca1ce589b0ed964 rt-tests: hackbench: properly 
> recognize when integer arguments are negative
> 64c7f92979ded63ac5a19ea59e9b791e3da1fae4 rt-tests: hackbench: removed 
> extra use of optind
> 
> Patch 0002 is refreshed.
> 
> The tarball is back at $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests since
> it's the latest release. We have sent an e-mail to the linux-rt-users@
> mailing list to ask them to stop moving the tarballs around:
> 
>   
> https://lore.kernel.org/linux-rt-users/20241228114346.6020d6b0@windsurf/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
