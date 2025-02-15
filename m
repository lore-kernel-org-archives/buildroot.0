Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C110C021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 21:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F225484781;
	Sat, 15 Feb 2025 21:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXBlNWv1hLP4; Sat, 15 Feb 2025 21:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17C7D84778
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17C7D84778;
	Sat, 15 Feb 2025 21:20:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91E39DF
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 21:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 807A280FFD
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 21:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZsFm86Zw9oDr for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 21:20:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2F5F84778
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2F5F84778
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2F5F84778
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 21:20:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C31C520039E;
 Sat, 15 Feb 2025 22:20:47 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Feb 2025 22:20:47 +0100
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 22:20:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250215110705.159871-1-peter@korsgaard.com>
References: <20250215110705.159871-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <711fd2c4e6f8c517971e1e9d00565cd6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739654448;
 bh=v2goIw+uikF77wUxo6UJB3V4cETIXk+4ZBXyH+IDqRI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qV2Iewj2Rqy8TKrvAmj+HkOynDlTUjPWGvuPpN7/hI9GJmAcZwP42ISFAtfqddPNv
 aO/O8iuwRE1cEwA0bfTmf9R+vIAEu1TLaC/P/aHLLubm5BZpub9/dUNCaMKTU7pDaP
 7/577aLTvw7paBoszoaZ522+BQletRXHWLmIjMWk1Cjuo3G5HtOuDZL79IjfQ8/Q0W
 rePfbzsYCOyny6ZL6FEWJboseib59rtU2LU9iMm0EEYPtKUWsBy2DWKjvA5Uz/68MQ
 noSTHO8GFINnXQfJhuI8KPr/b0pjPPpKIDEfk8B2MveI0M2OxQQDbhlZukxYnSwkIx
 mu6ZvG1h5allg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qV2Iewj2
Subject: Re: [Buildroot] [PATCH 1/2] package/angular-websocket: drop package
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

On 15/02/2025 12:07, Peter Korsgaard wrote:
> The package has not been updated since it was added in 2016 and the 
> upstream
> Github project has been archived as of Feb 17, 2024 - So drop the 
> package.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
