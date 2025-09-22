Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75B9CA100F
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 19:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B16C6169C;
	Mon, 22 Sep 2025 19:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIMs3JYtsKpU; Mon, 22 Sep 2025 19:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0B8D616D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0B8D616D8;
	Mon, 22 Sep 2025 19:54:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3878E1F1
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E36741752
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJegtuQ-UHkw for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 19:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F5E5415F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F5E5415F7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F5E5415F7
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:54:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3965213F854;
 Mon, 22 Sep 2025 21:54:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Sep 2025 21:54:22 +0200
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 21:54:22 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250922081552.3598651-1-peter@korsgaard.com>
References: <20250922081552.3598651-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5e8b6a0cd72d03c840f8aef8124be815@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758570864;
 bh=WRwUlmk1p6qhidt/dI6GAQkBu9qZC+yAYz9VKP6X/Og=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gtphfigcb1v14dNGgfptc3UMhBT7Fus9NBRCP5r49Bidjz3heXCInDhyo6UAbnpMS
 Ax6IUlb2+ut9ePt1fNiYoQXWRMMeFP/lSjbQ0u0Y37QtHSBWaJ6hwzogZUEsbXYTB3
 H00KQB3eHP/V372Nh6RsIZ/6zEeZixzusZgsRWYgBu2LqLVa1bneNh9zVlxpSWWpEa
 D7+7bewTiRJ6I2eLDTCcNaP7vi5ZtE+XOX0w7EB1C5iLjYWNcQFtaubhGbHXyC2F5C
 I+Q7xF/6HlxOskdPnxL4iKpBHv2vkUApY4sPZ11O8XSuRc+LD/JZoW6YHrN7nIJmBY
 bqQYMfnF3RdoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gtphfigc
Subject: Re: [Buildroot] [PATCH 1/2] package/rtl_433: do not leak Buildroot
 git info
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

On 22/09/2025 10:15, Peter Korsgaard wrote:
> The CMake build system has logic to detect the git repo info and 
> include it
> in the version output.  This unfortunately gets confused and adds the 
> git
> info of the Buildroot repository when building inside the repo:
> 
> -- Found Git version: refs/heads/rtl_433-25.02 commit 
> a367362af00ed349915b0b4496ebeb9910fc86e4                                
>  from 2025-09-21T20:07:58+0200
> -- Using Git version tag: 2025.08-283-ga367362af0 on rtl_433-25.02 at 
> 202509212007
> 
> rtl_433 -V
> rtl_433 version 2025.08-283-ga367362af0 branch rtl_433-25.02 at 
> 202509212007 inputs file rtl_tcp RTL-SDR
> 
> Pass GIT_DIR=.  to the configure step similar to how it is already done 
> for
> the build step to disable this.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
