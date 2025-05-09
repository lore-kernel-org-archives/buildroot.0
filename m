Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1755FC3ABC9
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 20:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1C0161119;
	Fri,  9 May 2025 20:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oi_KzMUQuMaU; Fri,  9 May 2025 20:08:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 051F26102C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 051F26102C;
	Fri,  9 May 2025 20:08:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9625A1A9
 for <buildroot@buildroot.org>; Fri,  9 May 2025 20:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8786941143
 for <buildroot@buildroot.org>; Fri,  9 May 2025 20:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0ehDxaOBe9r for <buildroot@buildroot.org>;
 Fri,  9 May 2025 20:08:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ABA134110B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABA134110B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABA134110B
 for <buildroot@buildroot.org>; Fri,  9 May 2025 20:08:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 412CFB0055A;
 Fri,  9 May 2025 22:08:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 May 2025 22:08:03 +0200
MIME-Version: 1.0
Date: Fri, 09 May 2025 22:08:03 +0200
From: Julien Olivain <ju.o@free.fr>
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
In-Reply-To: <20250505134929.541115-1-yegorslists@googlemail.com>
References: <20250505134929.541115-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <40f50a63e5a304769db6595038a4b0ff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746821284;
 bh=TKiWy1IK+hFEX4at90qPU21a95HhuPqZNYDXhiJskNQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=okGdOS8ZRQvQ60QcdJgG8qF+4c3h0wYJaf6WZSxqH1qnSm74K6BsfBZqc7erzQbxx
 fNAuC2x5hdavMAZpprqielDbNqRujW/JYgwpwIgywM8/OuOE+4B7zGhU319Bb9T6Cq
 G0Vw3RdBjACfuG1+A3Ch6ysbwEdajCbOXbE7x/jarOBuL+EbZWD12n/bwOua1JfVo5
 iN/SSk+o1fGjlRJMNIZsoOHt8c+ArXA6a+zMJ3RGYFFFDuRoqGeaEuyGgDdS7IHU/d
 5WlCPFY4eAmeBDyx7XUVbYO1NQB6JYJkPKEtruxog+RGP0G+hS53sxVry1JFCxl343
 SUiKbDkcQ4Z0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=okGdOS8Z
Subject: Re: [Buildroot] [PATCH] libical: bump to version 3.0.20
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

On 05/05/2025 15:49, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> For change log, see:
> https://github.com/libical/libical/blob/master/ReleaseNotes.txt
> 
> Update license info: the source code is now licensed under MPL-2.0
> instead of MPL-1.0.
> 
> Remove upstreamed patches.
> 
> Add a build-time dependency to host-perl.
> 
> Disable unneeded options.
> 
> Use ON/OFF instead of true/false for CMake options.
> 
> Fixes:
> https://autobuild.buildroot.org/results/dc2a6d9e50759e948a5f9952eaa1a866d52400fe/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
