Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BA8C0218B
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B64DD617AD;
	Fri, 24 Jan 2025 20:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMFuehOb7KQL; Fri, 24 Jan 2025 20:29:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D09AE6F618
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D09AE6F618;
	Fri, 24 Jan 2025 20:29:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9417E94A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 812BE6F618
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCxDF_LhFIoT for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:29:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 587AC617AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 587AC617AD
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 587AC617AD
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:29:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4FEFB2003DC;
 Fri, 24 Jan 2025 21:29:38 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45736])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Jan 2025 21:29:38 +0100
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 21:29:38 +0100
From: Julien Olivain <ju.o@free.fr>
To: patrick.oppenlander@gmail.com
Cc: buildroot@buildroot.org
In-Reply-To: <20250121031414.5907-1-patrick.oppenlander@gmail.com>
References: <20250121031414.5907-1-patrick.oppenlander@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <81e6726e7ebcce7cbf78df44fafe366a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737750579;
 bh=NSz0UuW1Pqtcby58mZZy1GPi7/PWAyHd82QsRNzYUk4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MLuB4N6UCSUyTdc9t7nYMXeXsy4PS8HaAZ3MNQRAXnkBLPmbsWZe91DjTnL4nzbDD
 53yVF1vBpaMdWQvCIAEGadmQsvtjj35HMG6M65CkwONllIPsxsmhQt1RAbCaoyCHaK
 4+FIOpkX+oPlbADBdh93W26hfnnyJYyeZPe72hI0kNdD3bYwnLMHLBiG3Oru4RYSaI
 6UUaPbv2dSKrxE3JMdUvWK0FKXbqmPwHOwA/svFR4RwYw39wMLNytolwCaY/JG5TNZ
 kJLgHdh+3hM9wamI4Z94h+lJg73LogREGQJ4+zQfWndUKAD8PcjzpL0W9oXE5TNfHz
 gewvvHk4aWMxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MLuB4N6U
Subject: Re: [Buildroot] [PATCH] package/minisign: bump to version 0.12
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

Hi Patrick,

Thanks for the patch.

On 21/01/2025 04:14, patrick.oppenlander@gmail.com wrote:
> From: Patrick Oppenlander <patrick.oppenlander@gmail.com>

Could you add a link to the change log in the commit log, please?
Something like:

Changelog: https://github.com/jedisct1/minisign/releases/tag/0.12

Also, reading it, I see that the libsodium is now an optional 
dependency.
Do you think it is worth reflecting this change in the Buildroot recipe?

> Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> ---
>  package/minisign/minisign.hash | 2 +-
>  package/minisign/minisign.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/minisign/minisign.hash 
> b/package/minisign/minisign.hash
> index 12cde42a43..74941163e9 100644
> --- a/package/minisign/minisign.hash
> +++ b/package/minisign/minisign.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> 74c2c78a1cd51a43a6c98f46a4eabefbc8668074ca9aa14115544276b663fc55  
> minisign-0.11.tar.gz
> +sha256  
> 796dce1376f9bcb1a19ece729c075c47054364355fe0c0c1ebe5104d508c7db0  
> minisign-0.12.tar.gz
>  sha256  
> d775d155cbf31638714c31c6f990f9fdc5f07998d91e42d1bf15483bd2d1706b  
> LICENSE

Running "make minisign-legal-info" fails with output:

     >>> minisign 0.12 Collecting legal info
     ERROR: while checking hashes from package/minisign/minisign.hash
     ERROR: LICENSE has wrong sha256 hash:
     ERROR: expected: 
d775d155cbf31638714c31c6f990f9fdc5f07998d91e42d1bf15483bd2d1706b
     ERROR: got     : 
01aa50818d6609e85a9610b7d04da037e8b28bcf3bb5b5b4963c0c3f7abdabbd
     ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Could you check what has changed in the license (you can provide a link 
to the
upstream commit change, or describe the change) and send an updated 
version of
this patch?

Best reagrds,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
