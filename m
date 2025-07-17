Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE41C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 16:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62374615D4;
	Thu, 17 Jul 2025 16:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCLtfRhWacHU; Thu, 17 Jul 2025 16:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03B1F614EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B1F614EA;
	Thu, 17 Jul 2025 16:26:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DFA395B
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 16:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19BA660B5D
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 16:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yG2GPeCoLVgG for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 16:25:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D833D60ADD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D833D60ADD
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D833D60ADD
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 16:25:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7CEFE19F5C3;
 Thu, 17 Jul 2025 18:25:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 17 Jul 2025 18:25:53 +0200
Date: Thu, 17 Jul 2025 18:25:53 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aHkkEc2JfqmXf96b@landeda>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
 <e3682b2190a8db8a5e815cb0d76835700fde43fb.1752524763.git.yann.morin.1998@free.fr>
 <eda07754ff0ec104ef4506ba6549d2d2@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eda07754ff0ec104ef4506ba6549d2d2@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752769555;
 bh=4nWS3AgdITOUG3hJ4i1jVnkXmL0umDn9KHe/D3K87a0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cHwA+RruUlnqxmVslgGqqJxs+yZhQIsrxW5++ObUK1DXEDHhfDxs0Pd+5VdrSs2tH
 EoDb3/c1t3VGfQtFpq7Qy3+7JlkvCcbqdsBqyAPinXo2vVpLx3bmtrjVY0Za3QsSd7
 TP2shRdY0sdG002bGRKIV2rOQODLkMo2OP0ySjjwe3HjMDyDm5yFe3iU1yS2rlXZbG
 K8v+7zpNqj3oT/kPd1+hRiAVmgJ0kq2IVxE/5rSQDePKLwDv/NRbNJbH+N58PKLTRx
 bguNW5OfBG5c+qcG/zNeu9cigML5AF2yDnvpZuQkuNddLfMUzyqlvks5KCbzWyeXFg
 DcLCeDheuVATw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cHwA+Rru
Subject: Re: [Buildroot] [PATCH 01/13] support/testing: add a crun-based
 runtime test for docker-compoe
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2025-07-16 20:41 +0200, Julien Olivain spake thusly:
> I applied this series to master, thanks.

\o/

> I fixed few minor typos and added links to release notes,
> when available. While doing so, I noticed that podman 5.5.2 was
> fixing CVE-2025-6032, so I marked to bump as a security fix.

Ah, great, I forgot to check the upstream release notes, indeed. I'll
try to think abou tit next time, thanks!

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
