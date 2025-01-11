Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E284CE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B073983B57;
	Sat, 11 Jan 2025 15:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLp-1AtIKTbf; Sat, 11 Jan 2025 15:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D289B83B60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D289B83B60;
	Sat, 11 Jan 2025 15:04:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BAF12940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BA3983B57
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rw3oWqMgqSGE for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:04:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6B9283B60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6B9283B60
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6B9283B60
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:04:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 681757804FD;
 Sat, 11 Jan 2025 16:04:02 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:38930])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 16:04:02 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 16:04:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250111143115.2739414-1-james.hilliard1@gmail.com>
References: <20250111143115.2739414-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <24c29addbe3f85e37dabf92a82527a60@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736607844;
 bh=sXFykITgHoRymb6Y+o6gevtBqzIdAh0QpuPRq2FVm74=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W++kts2YCj3xlDWdppk+iHlyCxM0kAYJAtqTuniRdqziKvSXP/LK11TK3/FNi3cwT
 V1KNZ6cCWhbelbL6mRBI7oqF7mOBfFkoY7J5ua3SaO1Jog5+EryqWWUKBNJBTaDLTP
 jksU9Z0cjyL7bzqBjJfJAGO6SWexBDK6za1+tmV0HSD/tgl0rCg8slw8WqUB0bF+j/
 HUcgeK/1sCFJgQ7I1xsNPldgloJOiAdFojtqORfGJS9BQYtYkMthqTEtn2XRW2r3Vy
 HAnMy0rihTGXXYOeRm+EmTZN/G0QLggNaXmmSIA4IsNaax8b8x7KNZQA7h3c0nWpTF
 1bOtfCu4/JdUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W++kts2Y
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ml-dtypes: bump to
 version 0.5.1
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/01/2025 15:31, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
