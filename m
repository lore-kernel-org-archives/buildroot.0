Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C9DC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 22:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29A2940426;
	Thu,  7 Aug 2025 22:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVzXOvh6eQdV; Thu,  7 Aug 2025 22:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61CEA403FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61CEA403FE;
	Thu,  7 Aug 2025 22:01:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A8D559CF
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A611680CD4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAB2xJXXiCyB for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 22:01:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A97680C73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A97680C73
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A97680C73
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:01:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 250522003C8;
 Fri,  8 Aug 2025 00:01:07 +0200 (CEST)
Received: from ip099.116-187-66.sogetel.net ([66.187.116.99:44478])
 via ip099.116-187-66.sogetel.net ([66.187.116.99]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Aug 2025 00:01:07 +0200
MIME-Version: 1.0
Date: Fri, 08 Aug 2025 00:01:07 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250805110636.3514105-1-peter@korsgaard.com>
References: <20250805110636.3514105-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <44e904ca6a5335b912f3f93f331e27a9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754604070;
 bh=OiBylcZQg0ulCW/ifyvexRVrTXZvL6hQxFEnP3UnXGU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ddxaDXIEeTgtxAhAvPiMqF7/x9T2V8lRFpg1h2jUx2vw5uGpiLhu1AReViWipXQJX
 KsuvFn+lHRuFIBNZZwG/BH+AcqJ2u4oNH2RAxe0MVAus+2amGTicaAGukaQ1dZvGHM
 zLfdw5ydVvv2NTlSGH0k40iJvriWkFBE1gbfIFJvnJMGOCcFXZ4Gehpexb/mb6m0x7
 6zk/3lKjJWBNIsnPVtB7z2fKlwNxSL0dLUC5PM/1QD9ekyUQ000U9de7yCnu9b1Tny
 XE4P39eazPk18D2I5eV2xoGFqyMwqObfiMS3++WzxaChiOjkePcamajD1gLCLR5XYb
 oi+Isd+J7FvhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ddxaDXIE
Subject: Re: [Buildroot] [PATCH] package/glibc: security bump to version
 2.41-70
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

On 05/08/2025 13:06, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2025-5702: power10: strcmp fails to save and restore nonvolatile
>   vector registers
>   https://sourceware.org/cgit/glibc/tree/advisories/GLIBC-SA-2025-0003
> 
> - CVE-2025-5745: power10: strncmp fails to save and restore nonvolatile
>   vector registers
>   https://sourceware.org/cgit/glibc/tree/advisories/GLIBC-SA-2025-0004
> 
> - CVE-2025-8058: posix: Fix double-free after allocation failure in 
> regcomp
>   https://sourceware.org/cgit/glibc/tree/advisories/GLIBC-SA-2025-0005
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

For info, I also added a note in the commit log that power10 is 
currently
not supported in Buildroot. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/feaf53585a12d97802a67fd557ffc7340bbe6e13

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
