Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C23E7719E
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 17:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D04F8050E;
	Sun, 12 Jan 2025 17:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQH8oLfBocLJ; Sun, 12 Jan 2025 17:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBC618119B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC618119B;
	Sun, 12 Jan 2025 17:36:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23D50950
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 17:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D3E54012D
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 17:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5UJS0WP63tG for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 17:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 171CE401C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 171CE401C9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 171CE401C9
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 17:36:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 069BEB0051B;
 Sun, 12 Jan 2025 18:36:25 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42988])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 18:36:25 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 18:36:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250112164136.213929-1-thomas.petazzoni@bootlin.com>
References: <20250112164136.213929-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <56be43ba53903eb67b66b0c4d80a9c45@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736703387;
 bh=le8GfQ+aLOin1BD8O/LAedFhTshv3oSALgpJVR5FtuI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GWnpH8nisPa0XU0RCUdo/EmIA/bJykJbNg7Bl4hnn1QzqB7xXfeFVkbsDMYtxA6Mi
 SnOKen+TJNFEFnssnS8R79gqHjC/Gqa94rjcJb1+AfzznNT02uWxo1NSiFb8HXsrWP
 4+vhSQ0VWwbijIFWaO4Vlz+mC83T/QE9W2K3apphQqCCI4fwMBpzTD6GmtqzyJt0fA
 qm67tafOj5MmqrctyRk2dlqWjHJKJkEWuTUZcJITvM7ufQmw2CMmH6wJq/ym8ILTD7
 6nPDt7iDHqvOy2vrlVlec9/gtYpUa1YFsnrd8a6lIDtfztHaHIXJnqtKL29ASm/UCX
 BKAFhF7f+kXJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GWnpH8ni
Subject: Re: [Buildroot] [PATCH] package/igh-ethercat: backport upstream
 commit to fix build issue
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

On 12/01/2025 17:41, Thomas Petazzoni via buildroot wrote:
> This patch backports an upstream igh-ethercat commit to fix build
> issues at -O0 or -Os. The commit message says -O0, but in the context
> of Buildroot, the issue was encountered at -Os, due to dead-code
> elimination.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/bfa074afee8a70abe597b117ecf815e234f16b40/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
