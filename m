Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C1EE77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 23:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53F1B402B1;
	Thu, 26 Dec 2024 23:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0JW9WPa9JiE; Thu, 26 Dec 2024 23:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A6C240348
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A6C240348;
	Thu, 26 Dec 2024 23:56:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8505D757
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 23:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6562C606A3
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 23:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMygVJaCMS7r for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 23:56:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3CF86605C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CF86605C5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CF86605C5
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 23:56:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id AFAEF19F593;
 Fri, 27 Dec 2024 00:56:28 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35888])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 00:56:28 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 00:56:28 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241226215116.2530043-1-thomas.petazzoni@bootlin.com>
References: <20241226215116.2530043-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <916c0b21de453d9f83cde1bdcb74abac@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735257389;
 bh=KTO0zpr/fsIMGXApz43E++w9pWMZxtpczuOOSYzLFJ8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qWY7ITguxJt+bGTSOuzvt6tyUw6cSsIceEk6xLIB1K4QREFePyTDScCnPRnhrgxMR
 fdNcCX1X04mO8LfJJGcPRIY2WzbdLJACGt9WP0bWEf2mcxVk3CVPsXqJeIDIJsU/JH
 MxgRDN5mYMJ2GiOAcv3q3kKCrR3jDDVav5tmnR/bHve2uhcy2ZPqCACXhfSS1rWdRV
 jUMx+/kWY6/uMbc6eK08WJgKbFBu/T/VzWoV+PDkePF9y9bziTohAjsu3NzlgKNvie
 x9T0BsE1DOUbdLH5hLQMxdZVxUajFgE92UBDndFtADqYCL6HlTcDzAA7OB9QmGOSOI
 rFMhlNULR5h2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qWY7ITgu
Subject: Re: [Buildroot] [PATCH] package/cmake: bump to version 3.31.3
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

On 26/12/2024 22:51, Thomas Petazzoni via buildroot wrote:
> According to
> https://discourse.cmake.org/t/cmake-3-31-3-available-for-download/13245:
> 
> Changes made since CMake 3.31.2:
> 
> Brad King (16):
> 
>     VS: Factor out check for mixed C and C++ target
>     VS: Restore support for mixing C++23 and C in one target with 
> clang-cl
>     cmLocalUnixMakefileGenerator3: Simplify progress command generation
>     Makefile: Fix per-directory codegen target
>     Makefile: Enable progress messages for codegen target
>     cmGlobalNinjaGenerator: Remove unused local variable
>     cmGlobalNinjaGenerator: Remove unnecessary local variable
>     cmGlobalNinjaGenerator: Fix local variable name for codegen target
>     cmGlobalNinjaGenerator: Clarify order of codegen build statement 
> logic
>     cmGlobalNinjaGenerator: Simplify per-directory configuration list 
> lookup
>     Ninja: Add missing top-level codegen dependencies on per-directory 
> codegen
>     Tests/RunCMake/CXXModules: Rename FileSetModules cases to be more 
> specific
>     target_sources: Improve error message for CXX_MODULES on INTERFACE 
> libraries
>     Help: Update link to UTF-8 RFC 3629
>     ci: update macOS jobs to use Xcode 16.2
>     CMake 3.31.3
> 
> Craig Scott (1):
> 
>     install: Restore treatment of DESTINATION as a single-valued 
> keyword
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
