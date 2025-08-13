Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D40C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 22:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 667A861CAA;
	Wed, 13 Aug 2025 22:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkOmYo-Tlr0O; Wed, 13 Aug 2025 22:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C5CD61CAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C5CD61CAC;
	Wed, 13 Aug 2025 22:10:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9637E1BA
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 22:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8802684337
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 22:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PL1ksqn87OJB for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 22:10:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 929DC8433E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 929DC8433E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 929DC8433E
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 22:10:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 712D613F86A;
 Thu, 14 Aug 2025 00:10:37 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 14 Aug 2025 00:10:37 +0200
MIME-Version: 1.0
Date: Thu, 14 Aug 2025 00:10:37 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, "Signed-off-by: Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250813212834.59170-1-romain.naour@smile.fr>
References: <20250813212834.59170-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <132e249b2606f0249cd7a81479d0862b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755123039;
 bh=FDgIagLtUGYEuTmH6WoCSzSVY15Kf8TEBK5HtvVGoiE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W6jJOTrhR7Z9bGEtoSY4I54D9Wb8SB+Re9NWhHFQpseKukW5f1418cC6RazOePcmb
 oB2kaS7lRmEqW58K1Zo5Di/ndIdqk6yTION9DbjcZQkKMtDZ48De1Y+cAnJ2JqwaUv
 gTV1TOl2AXprMSdr37CCnhT2Rgz7jwY960twKHEJxgD81po7462/q/Jcfb2rPPj9rA
 HMYXb2BGoK1V8u9yJbImbmjELmydAdh45q6cO0fwrwom4GV7qpUpOwpKuElh+o6JnC
 fdoL9UxQP0bRJ8BiBmpL67wNFri3g+GKsNf9BbTh9ZxeOmiTP1M451TuejmIPMY3EX
 HH/hOpOy+1WIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W6jJOTrh
Subject: Re: [Buildroot] [PATCH] package/rt-tests: update URL
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

On 13/08/2025 23:28, Romain Naour via buildroot wrote:
> The previous version bump 8f52d4183e ("package/rt-tests: bump to
> version 2.8") was using the latest release, so the URL was updated to
> remove the "older" subdirectory.
> 
> The URL was:
> 
>   https://www.kernel.org/pub/linux/utils/rt-tests/rt-tests-2.8.tar.xz
> 
> On the 01/07/2025 a new rt-tests release was published (2.9), so the
> 2.8 archive was moved to "older" subdirectory and once again breaking
> existing packaging downloads.
> 
> The "new" URL is now:
> 
>   
> https://www.kernel.org/pub/linux/utils/rt-tests/older/rt-tests-2.8.tar.xz
> 
> [1] 
> https://lore.kernel.org/linux-rt-users/20241228114346.6020d6b0@windsurf/
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/10984686708 
> (TestRtTests)
> 
> Cc: Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
