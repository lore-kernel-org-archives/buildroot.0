Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF776C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7514B60AE5;
	Fri, 24 Jan 2025 20:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pfv1Rg-MWySM; Fri, 24 Jan 2025 20:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FFA560B01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FFA560B01;
	Fri, 24 Jan 2025 20:10:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85D2394A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66BC18220F
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-55utaAjk2T for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:10:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60E8A821F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60E8A821F6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60E8A821F6
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:10:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 666A45FFB4;
 Fri, 24 Jan 2025 21:10:33 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45108])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Jan 2025 21:10:33 +0100
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 21:10:33 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250121091917.19379-1-nemaakhilesh@gmail.com>
References: <20250121091917.19379-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <04bec83ec4a2329035c481f35d0abb8d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737749434;
 bh=ZSkZnvNjQvNoBmy+k1TaT3dllxIZVDk2DnRbMjQVsDg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qTBy30i1mhD/M5vMdi5kYLpO0/ySou0oZ2988GotAXLNcqlEor6HMEiGsGKBWfKDk
 bxcqxXqyp0ZdnlIhcH/28j7tl1JWeYIX3nZbRzKBFSDYeX1Iq656ae+r2KWWJyGayW
 3VZn9kf79Elnw8EVxGOw7ZWKSsL/RG5c7rrZdgekm1bdFVuxLHSDzWeAYUevNOjSLK
 wh2oDjLSkXBxL8/Ih80dyhzlNophSuC5HboBuAxMhHcZH8gQlFR0z7GbgX/l5NvVj+
 z92zmtHWLNbn3BNmAdtiYBJzChtBZL9mK5HDil9WCI4UVzr1Z6OngDDL+mCnLUXREc
 59wPJX787ASrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qTBy30i1
Subject: Re: [Buildroot] [PATCH 1/1] package/lzip: bump to version 1.25
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

Hi Akhilesh,

Thanks for the patch.

On 21/01/2025 10:19, Akhilesh Nema wrote:
> Release notes:
> https://lists.nongnu.org/archive/html/lzip-bug/2025-01/msg00012.html
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>  package/lzip/lzip.hash | 4 ++--
>  package/lzip/lzip.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
> index 7900835e11..ffa70c3e6c 100644
> --- a/package/lzip/lzip.hash
> +++ b/package/lzip/lzip.hash
> @@ -1,4 +1,4 @@
> -# From 
> https://lists.nongnu.org/archive/html/lzip-bug/2024-03/msg00003.html
> -sha256  
> 30c9cb6a0605f479c496c376eb629a48b0a1696d167e3c1e090c5defa481b162  
> lzip-1.24.1.tar.gz
> +# From 
> https://lists.nongnu.org/archive/html/lzip-bug/2025-01/msg00012.html
> +sha256  
> 09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668d0f346e3d3f0a56f  
> lzip-1.25.tar.gz
>  # Locally calculated
>  sha256  
> 3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  
> COPYING

Running "make lzip-legal-info" fails with output:

     >>> lzip 1.25 Collecting legal info
     ERROR: while checking hashes from package/lzip/lzip.hash
     ERROR: COPYING has wrong sha256 hash:
     ERROR: expected: 
3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef
     ERROR: got     : 
022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6
     ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Could you check what has changed in the license (you can provide a link 
to the
upstream commit change, or describe the change) and send an updated 
version of
this patch?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
