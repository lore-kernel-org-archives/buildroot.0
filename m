Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5273DC36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 17:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE28082B1E;
	Fri,  4 Apr 2025 17:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oD7IWPD5H0-k; Fri,  4 Apr 2025 17:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B6B482376
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B6B482376;
	Fri,  4 Apr 2025 17:06:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FC505E
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 17:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8198882223
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 17:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lpT4kDf6memf for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 17:06:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8719D82375
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8719D82375
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8719D82375
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 17:06:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E1A1513F8C2;
 Fri,  4 Apr 2025 19:06:26 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47992])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 04 Apr 2025 19:06:26 +0200
MIME-Version: 1.0
Date: Fri, 04 Apr 2025 19:06:26 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250404154044.49664-1-thomas.perale@mind.be>
References: <20250404154044.49664-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <04f02cf0f76dadbd83015207f63fd64f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743786388;
 bh=BjO3JNQw8WSFcFMQD/+LZEuGLHPFM/+6MD+lpe9WRsA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YNT3+UVxLOM6VvBRpV7gvqieOqJmdLZbr8aebvv1gsifwJLkJW5s8wdgEkK0HwW81
 outsmGWXqR3Rvn/dlQ6gx94BhX9DQghC5M2R1KkjwZGXSYxIy4mb41tiLQz8+ppI5D
 rBzDL/NO2tNA0bmXkkyfqj8XTs64GXbL1SkaLMFfL332+pnBm3Vu41GxIMV5L1gOui
 a7YuTzL+Fvpltay/tPBm5naeJC44Z5ILSVjUrBU1fTu49qkk/bZ02GGm/JKiTwLFzn
 NgXM21LQL7vgyRrUWcKsIQul77h1by882C5oZ3i0UPiISBN5xUizI8VB93jcLsh4yg
 bsXcd530DMJaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YNT3+UVx
Subject: Re: [Buildroot] [PATCH 1/1] package/dillo: remove trailing slash
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

On 04/04/2025 17:40, Thomas Perale via buildroot wrote:
> Commit f2a862fe60 (package/dillo: move to github) changed the source
> site for the Dillo package. This change introduced a trailing slash at
> the end of the URL.
> 
> This cause an error when running `make show-info` with 
> `BR2_PACKAGE_DILLO=y`:
> 
> ```
> package/dillo/dillo.mk:46: *** DILLO_SITE 
> (https://github.com/dillo-browser/dillo/releases/download/v3.0.5/) 
> cannot have a trailing slash.  Stop.
> ```
> 
> This commit removes the trailing slash.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
