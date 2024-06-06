Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0127EC25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 11:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B80BB80D05;
	Thu,  6 Jun 2024 11:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9STh1A8NjMqs; Thu,  6 Jun 2024 11:54:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B12D480F07
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B12D480F07;
	Thu,  6 Jun 2024 11:54:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3DB41BF5DE
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADA1D40646
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4Z_rKITO0QK for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 11:54:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79DD940612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79DD940612
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79DD940612
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 11:54:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1931513F846;
 Thu,  6 Jun 2024 13:54:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 13:54:36 +0200
Date: Thu, 6 Jun 2024 13:54:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <ZmGjfC1r05jHNAfU@landeda>
References: <20240605233503.23516-1-jarkko@kernel.org>
 <20240605233503.23516-4-jarkko@kernel.org>
 <ZmGBnfkfL4h2SDac@landeda> <D1SWT4PQ5SRG.3CIZII0XWVO0O@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D1SWT4PQ5SRG.3CIZII0XWVO0O@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717674880;
 bh=0x5X43rztmnP/AVIHZNc6JpYyVgVWwfo3ycEFCj0QgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z80/OuvfbASfHENyeArY9yxPfPPLEpJ9POhCmkHoOVj6uE8a8C2NU47GzFlDVoiPR
 adPbNC+gFMkvaQzmQvzziPUUAwQdvjbBmh+1V6/s3AhWonUsK8iTsr85VBNKSAt0FJ
 gPfjrOEfrWLec7asIlqmeljrmkcRQQauueIi4xbqcyYBLy2h9rfENlohwiODi5mfpy
 DNdLyo0tp3RsJI0+S2we2cOm4u0CK3kNQC3Zui1FEL8LqIKlYNGnXA4ZsLMCkWVvKT
 V4k4Oh/2WrO72Zyd04XTL/nE5cCL89Ge26TkirwE0iW6/8CL3+W2j04mL8OzOuK5rb
 uPktjezLfBseQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z80/Ouvf
Subject: Re: [Buildroot] [PATCH v7 3/3] package/swtpm: add host package
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
Cc: Stefan Berger <stefanb@linux.ibm.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jarkko, All,

On 2024-06-06 14:49 +0300, Jarkko Sakkinen spake thusly:
> With systemd I'll test if just those fixes without version upgrade
> would take of it because that would be a better order. And also
> split into two patches.

Please, keep the replies in the corresponding thread, otherwise it is
hard to follow on and understand what's going on...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
