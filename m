Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AE0CCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 13:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66B7B405FF;
	Sun, 26 Oct 2025 13:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUmh4yeBFdyU; Sun, 26 Oct 2025 13:29:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86D8B40620
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86D8B40620;
	Sun, 26 Oct 2025 13:29:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE1D815F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B010B8100A
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruc56djKoNhX for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 13:29:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B12F781004
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B12F781004
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B12F781004
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:29:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A1AEF19F54D;
 Sun, 26 Oct 2025 14:28:58 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Oct 2025 14:28:58 +0100
MIME-Version: 1.0
Date: Sun, 26 Oct 2025 14:28:58 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251024212958.4091720-1-giulio.benetti@benettiengineering.com>
References: <20251024212958.4091720-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <cef371b428d879283640a6c5174d9706@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761485339;
 bh=ZxovZKUyEgounXX4swo46DL9ffCL8NzOqcbx4Qsc678=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cUO7e66DZcGWdDtJx125maxHLTfuQzijEu1ghd7HP/2UOrstLoL116/q0efOJ2FQD
 U1mdCg9jlESt238o1e2ygCGQJO6tZ+z4EQAgjpAF+bdgb6yl91nayp5jhiYJZ2Eg1w
 qEhRKUpcj/ISB7wdbvQSUf81op5hlbKACnRoVbBvbeGGannOfKdN+nA9zTFA43BNKf
 hvPy4Cl2WeH126KiBuG8KXYndqdj1/Tc6LGKC6rru5v0RJIsU8qv4hcx240qgWKHTC
 VrA2myNflwaYsCTK9H2/xWdT7bMIpW4yXYJ38KNuAaR9Egje4pAX61jL/h1YgqEqsb
 3IyGO1eTL6mQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cUO7e66D
Subject: Re: [Buildroot] [PATCH] package/liblo: bump to version 0.34
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

On 24/10/2025 23:29, Giulio Benetti wrote:
> Drop upstreamed local patch
> 
> Release Notes:
> https://sourceforge.net/p/liblo/git/ci/master/tree/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
