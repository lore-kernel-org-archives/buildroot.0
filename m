Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1195DCFC539
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 17:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9604821D0;
	Sat, 22 Nov 2025 17:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YETNhdJHQYow; Sat, 22 Nov 2025 17:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7CBA821C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7CBA821C9;
	Sat, 22 Nov 2025 17:30:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1816334E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A5406084C
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sbahawqf6fC for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 17:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5EE560807
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5EE560807
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5EE560807
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:30:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0B1F72003C6;
 Sat, 22 Nov 2025 18:30:32 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Nov 2025 18:30:32 +0100
MIME-Version: 1.0
Date: Sat, 22 Nov 2025 18:30:32 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
In-Reply-To: <20251122124151.2224145-1-bernd@kuhls.net>
References: <20251122124151.2224145-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <d157da7eb9996ea212db4ef3f6ad1e05@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763832635;
 bh=4EUI2V9jcn2TLW9x+hudgtX0h/wTjIixN0RHreGIYzw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XlQc4h7LLtz9UkwQc3hWQTqcbKcze2+zm+L7XzBUEhMUaMwK8oBplqaWMQO4T6hxL
 3Mvyi+MWILHInL96raEQM1S/acwy6RPVphSsBI1PanJVA7J2JV2xBUTKZiQeMQbrT4
 5+ERkejw9+hq3fmBDQPUhj47oD0IcS0qODyTHBbD1LJDKdxvdDGFBjWHl5MfFBLRtg
 Iacb8UpDcB2cJi4WL5rSFIokTV86mQ8c6BWY2v9b+bD+2ZlwWNG53pncMZKXsLaELT
 FgUITrR9fB5AdrqImhceXFZznrKpZ1RlKOQ6OdWAT0weBKg6oiWdUmkaWdzcvHKY5O
 SrG8rDZWRPOhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XlQc4h7L
Subject: Re: [Buildroot] [PATCH 1/1] package/fio: link with -latomic if
 needed
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

On 22/11/2025 13:41, Bernd Kuhls wrote:
> Upstream commit 
> http://git.kernel.dk/cgit/fio/commit/?h=fio-3.41&id=a9ba7cef70a7fc99d406addbdc6479f633d01ec7
> which was first included in version 3.41 and bumped in buildroot with
> commit 215133c0fc2819f059fbb35071ab2e0987f5107d added use of atomic
> functions causing build errors which are fixed by linking to libatomic.
> 
> Fixes:
> https://autobuild.buildroot.net/results/c74/c74529b5a3800af269b6819af3cc742ba348d5fe/
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
