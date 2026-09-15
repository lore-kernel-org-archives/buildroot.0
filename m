Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150F6C88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB5C580ADE;
	Tue, 15 Sep 2026 17:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ImHz8iLXlhL; Tue, 15 Sep 2026 17:11:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E94D8809E9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789492280;
	b=p0w53dAYdvNlSH5d62FfvxZSJqR1ugF5QaHQhzIyPFL6m7ttQ9y9xhZgYTNQxKriaQqC
	 Jlb8ToP/bPy0m/6zIvyUO+KUG+JkWPfRTIuAoa4xjN2FHq5Z8ZuqvvDFog+57jlJ3dxZc
	 STHoqopEAEopRhk+F6yUGy8jmOySn3GaerCvT/ZoZJYEFWlWJXYqF0KLZKi3Wz0ws0wOY
	 hfioFQKSWjrofs60NkhQhLT+gDbRHORevEwQahQWjLdg303LP5IYnJpDoSVLOdWaeUjc8
	 SHpha6JETWGBBk+yvjx3bbEUafdXgor6toCdabJq0Qgsel2ruomgH19vMPgTZbhSQBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789492280;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=7YIy+MQBp8z4Om5noMTvt6pcTYmJnRbaui1FFlqfHpE=;
	b=B+c99w5BlisfCtOw9nnjlgmtRUUQm5wZZMDhnhtpGYw/zv5oh8ZnFbgisoHNudvEsJZg
	 D5z6SSg0WAKfCceH9gIGJDmmqc9RcgpFW5KN/3y26s5z0kg4ei4V24ntwgvLJNzEEKYTh
	 sP++Hx3HWuk+Fr8qqvVojpCm9tTs5cTQYCGGHufR1ycFLh+Pbljk4OUyj7DKWl2JF0Fvt
	 n72hKbW3W1XiTR2KLvcGpS7lWH0OEIuR1UoynHBJEYHQIRwRzAt/lyBKltWWN2UCj64Mu
	 DnooR/z9JT2mMfUmK3/eB4wlK7sDWMQQb8YEmqfFc47K2AJlO+6VB7cNnspT3j/cvzg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789492280;
	bh=7YIy+MQBp8z4Om5noMTvt6pcTYmJnRbaui1FFlqfHpE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Tf4UMJmkp4PiaSZVfy9i3pQ+Bu/UAsLz41FaUPOtciY7jkT2bpxrI7WlszKGBGSkA
	 Q02PoLu2NhVQYEEREXY8jrivVOmScHn/4qdrCb9q0705r+KjuEdX/5BoZohw1jyCaG
	 0JuxnIOP3FEyVmCzGg+0t2edVOe08AgP/6hQAtb+mkgxFAa//1DAmQKgkMb6PXLG7B
	 cFH5quJfKMFXX1CEzAvnz5o0xT0vCnIpnK0/hXBl7aNcN4IFum09hZdvjf6i5ur9yX
	 rCJtDnPKn4ttIwahdefRCO/JO0wDq4siHMH6/GRPb1+f8y2vyzwC2jtbWIS8mp36ho
	 WyFQ2+zocq9Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E94D8809E9;
	Tue, 15 Sep 2026 17:11:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 299142D0
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10C0B40111
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XuehuOZjKkG for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:11:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8ACAE400FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789492277;
 b=LHqXpU1UIPiN7l3FuXcOrwBg9xiRc3ypVikIR9W0I0LANJIP/6J1mxbyeYFBWw2yRfOW
 bxY5QCruhOgljHTNPE2A3hjjS2M29FMk0BLwY+VvSS1mhdw+yeKZGeyFYPEuQxhOoTtFe
 0rm6ZocTyaBthYDEquJA4mz17ReSw/vK57/Lsl1PmIZ2qODuFS6Xwu7ouI4x8MZD0Rcgm
 BsD9Yiftw9i77Yzi2+9VMY2VFvuRHBcFXZr+NGddGA5T4LghVsmK1jRtBCsT7ulDPVeCe
 GD956diciwF9+P9UJZ5H30MZU1ilrbU6prM39t9mCUyPiyR/SHckDf3cBfH1LmAez5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789492277;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Uh/u4isYRod+LM73DJUIYBFxUac7Oaa4WE+EkMZPUdQ=;
 b=RGEF35rmBKpmYBDL5GYc2O3hcNHxyUe2XK+PNKTndQZXokcW4VRP2o4edE+XX+H/X6EO
 XgTcD88ZHsIc83L1Ycifn9HK+hynYo1UvWJuZe9id44m30IOMT1owC8nP7PFtvmbovkvG
 w/Z1nsDQ6hUOa+oj0q7m55ehQKopdDm3FxDj+4ABIq8SbaiM+aL4KNM0NG63G/P6uEIz7
 tPv/oBdRmrx4TPwD3sy03raYPRKpwbo8Wut+qngxZnDcnALhMnP5JpSVu3JaHr0arx77G
 JQra3c9f7CrejfuhGg8/redeEjwAkKq/o8Ms1vidixYe4fnDIA2vFJ4Pf6hUl6EXynA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YYJSAeqE; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8ACAE400FF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:11:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1F33D5FFA3;
 Tue, 15 Sep 2026 19:11:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Sep 2026 19:11:13 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 19:11:13 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260914075245.1749775-1-thomas.petazzoni@bootlin.com>
References: <20260914075245.1749775-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <6ae8acf63efea3c90d2b3c01a47767a2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] utils/getdeveloperlib.py: fix regexp used
 to find package infra
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/09/2026 09:52, Thomas Petazzoni via buildroot wrote:
> There's recently been autobuilder failures on
> toolchain-external-bootlin, but I wasn't getting notified in the daily
> autobuilder e-mail for those failures, which sounded odd as DEVELOPERS
> contains:
> 
> N:      Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> [...]
> F:      toolchain/
> 
> And indeed, testing:
> 
> $ ./utils/get-developers -p toolchain-external-bootlin
> 
> returned nothing.
> 
> Turns out that the regexp FIND_INFRA_IN_PATCH and FIND_INFRA_IN_MK
> used to find the package infrastructure, and ultimately decide if a
> given .mk file contains a package, was a bit too strict:
> 
> "^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$"
> 
> This would only allow packages named <something>-package or
> host-<something>-package, but the <something> should not contain any
> dash ("-"). So this works fine for cmake-package,
> host-autotools-package, but not for toolchain-external-package where
> <something> is toolchain-external and it contains a dash.
> 
> We fix this by relaxing the regexp a bit and allowing any character in
> <something>. Consider the rest of the regexp that expects $(eval
> $(<host>-<something>-package)), it seems highly unlikely to match
> anything else but the line we're interested in.
> 
> With this fix:
> 
> $ ./utils/get-developers -p toolchain-external-bootlin
> Giulio Benetti <giulio.benetti@benettiengineering.com>
> Romain Naour <romain.naour@gmail.com>
> Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> This issue has existed since the toolchain-external-package
> infrastructure had been added.
> 
> Fixes: 1c99d70e5210f9d7b475736e0360ed63d16584f2 ("toolchain-external: 
> introduce toolchain-external-package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
