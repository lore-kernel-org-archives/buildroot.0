Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1408FC83F1A
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 13:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD49C61083;
	Mon, 14 Jul 2025 13:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BweX6R0lQWA2; Mon, 14 Jul 2025 13:17:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F69160AA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F69160AA6;
	Mon, 14 Jul 2025 13:17:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E484E967
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D627B4046C
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 715cQxCp9GPn for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 13:17:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1DAE240426
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DAE240426
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DAE240426
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:17:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A72DC13F89A;
 Mon, 14 Jul 2025 15:17:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Jul 2025 15:17:32 +0200
MIME-Version: 1.0
Date: Mon, 14 Jul 2025 15:17:32 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250714081749.83051-1-thomas.perale@mind.be>
References: <20250714081749.83051-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <9de88d89e85505721171b58dc46ba582@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752499053;
 bh=NHmJ40QEsvd00D4HppAX64Lsm7bf3YfTLKEuNR8i+eI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CRXgEdffrcQkp3dXJFHm98qRKJMqnEosyYAvnFDJBFVtYfCddVFbzO06ftddHl8px
 muk+NobwYU5/EvmNuhTxHEy6sAPUS94f3sKTVJXun3Sx+3zyfGJZfdfK6iPl5swT7D
 xa0PX/lFpOX3AxrcJdD1Sa/0hAYz82crful2Mk66vzXcvVE/LrnWryrPmi8700SR21
 uGb3MFDSryrzJwn0rjcn/AkJPInH9EJAELbg04n7HPMD5ZvU3kUWeL9UB1AuLB+qvT
 tguJeWCswapVq1UwG1woM1Hri6wPBGLm5mznZo9YPlTD8xriQvVInUjVXHnjgwVIW1
 S+DZsIlOiXjfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CRXgEdff
Subject: Re: [Buildroot] [PATCH] package/libesmtp: bump to upstream version
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

Hi Thomas,


On 14/07/2025 10:17, Thomas Perale via buildroot wrote:
> When building libesmtp on the autobuilder, the following error occurs:
> 
> /workdir/instance-0/output-1/per-package/libesmtp/host/bin/arc-linux-gcc 
> -Ilibesmtp.so.6.2.0.p -I. -I.. 
> -I/workdir/instance-0/output-1/per-package/libesmtp/host/arc-buildroot-linux-gnu/sysroot/usr/include 
> -fdiagnostics-color=always -Wall -Winvalid-pch -std=c11 -O3 
> -D_POSIX_C_SOURCE=200809L -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
> -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=2 -fPIC -pthread -MD 
> -MQ libesmtp.so.6.2.0.p/smtp-api.c.o -MF 
> libesmtp.so.6.2.0.p/smtp-api.c.o.d -o libesmtp.so.6.2.0.p/smtp-api.c.o 
> -c ../smtp-api.c
> ../smtp-api.c: In function 'smtp_version':
> ../smtp-api.c:1183:7: error: implicit declaration of function 
> 'strlcpy'; did you mean 'strncpy'? [-Wimplicit-function-declaration]
>  1183 |   if (strlcpy (buf, v, len) > len)
>       |       ^~~~~~~
>       |       strncpy
> 
> This error has been fixed upstream in commit [1], but no new release 
> has
> been made since.
> This patch update the package version to fetch the latest upstream 
> commit.
> 
> For the changes, see:
> 
>  - 
> https://github.com/libesmtp/libESMTP/compare/v1.1.0...335ee8d2fa5cb7d30db7b818ec05563ad139ee2f
> 
> [1] 
> https://github.com/libesmtp/libESMTP/commit/972eb547493357681b1b7012ef20618e6831cfde
> 
> Fixes: 
> https://autobuild.buildroot.org/results/ced/ceda012506edccda1727904eb3327017b07e27d8
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied on master, thanks.

I added in the commit log a mention that the build failure started
to happen with gcc-14. I also changed _VERSION to use the
git describe format (which gives a human readable git reference). See:
https://gitlab.com/buildroot.org/buildroot/-/commit/84077c777658d834ba8bb67582707f24d73cb914

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
