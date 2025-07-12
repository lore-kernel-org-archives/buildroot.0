Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCACC83F1D
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 21:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12AEC407A1;
	Sat, 12 Jul 2025 21:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LyHXzNRfT-bE; Sat, 12 Jul 2025 21:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ECAA40791
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ECAA40791;
	Sat, 12 Jul 2025 21:36:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B13AFDF
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 21:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9791461291
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 21:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rQSKAiC-svx for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 21:36:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 156E76128D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 156E76128D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 156E76128D
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 21:36:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 860A5B0055A;
 Sat, 12 Jul 2025 23:36:01 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Jul 2025 23:36:01 +0200
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 23:36:01 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250710143244.678848-1-thomas.perale@mind.be>
References: <20250710143244.678848-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <30090fc2d75f712db011e2da6bcb0786@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752356162;
 bh=dqSlWA4dcX04GWAS5gFmvbJNag7sV9SyoQIkhZJ86ZA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pll32eEH2lEAAF8vbJl2Ap12luvWAlMGf9X4pElII+yUCIM8QcwNew+ymOz8IPnZT
 zxvMn4w+KIJlLIES+CEI2m9z30SMOabuZgDkUfEWP3Wegeh7AmWPzWlnFEwesb1mPn
 orBq+NTZYE/Bhp5bmeSRbGfOpagYxufukk3qkaL+/19KAeXpwJXJx24e9FH6Rp58sR
 Qomgo1sjeiHsZ5mOORBblvdHm6Fid77ytoxeoGwhkrH+WoccXXf8RCEu2oDYnedQcD
 xFk8g6HFuR5umqnF/lbL5exxE0Xg1wUiZdyErc6TunlTh0rgUw0LbBgv1eVtaN8Cgm
 I6nmoo28eaQUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pll32eEH
Subject: Re: [Buildroot] [PATCH] package/libargtable2: fix build error
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

On 10/07/2025 16:32, Thomas Perale via buildroot wrote:
> The following build error is happening on the autobuilder:
> 
> ```
> arg_int.c:60:12: error: implicit declaration of function 'isspace' 
> [-Wimplicit-function-declaration]
>    60 |     while (isspace(*ptr))
>       |            ^~~~~~~
> arg_int.c:33:1: note: include '<ctype.h>' or provide a declaration of 
> 'isspace'
>    32 | #include <limits.h>
>   +++ |+#include <ctype.h>
>    33 |
> arg_int.c:89:8: error: implicit declaration of function 'toupper' 
> [-Wimplicit-function-declaration]
>    89 |    if (toupper(*ptr++)!=toupper(X))
>       |        ^~~~~~~
> arg_int.c:89:8: note: include '<ctype.h>' or provide a declaration of 
> 'toupper'
> ```
> 
> Both `isspace` and `toupper` are declared in the `ctype.h` header. The
> include was added in a later upstream commit.
> This patch adds that upstream commit and strip everything else to only
> patch that include.
> 
> Fixes: 
> https://autobuild.buildroot.org/results/d38/d38e3e12f52c3fde08ab446ca14a1a7bd65c9469//
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
