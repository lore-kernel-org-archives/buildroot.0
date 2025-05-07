Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231EBC3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 20:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D787B612CD;
	Wed,  7 May 2025 20:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLemGftz719L; Wed,  7 May 2025 20:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21100612E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21100612E8;
	Wed,  7 May 2025 20:23:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1DB6151
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7C54612E8
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UgNCZ4mxFZT4 for <buildroot@buildroot.org>;
 Wed,  7 May 2025 20:23:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D9E46612CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9E46612CD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9E46612CD
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:23:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 29173780389;
 Wed,  7 May 2025 22:23:24 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:39222])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 07 May 2025 22:23:24 +0200
MIME-Version: 1.0
Date: Wed, 07 May 2025 22:23:24 +0200
From: Julien Olivain <ju.o@free.fr>
To: Charlie Jenkins <charlie@rivosinc.com>
In-Reply-To: <20250424-fix_gmp_c23-v3-1-e3e984bd4254@rivosinc.com>
References: <20250424-fix_gmp_c23-v3-1-e3e984bd4254@rivosinc.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <fa9fcbd29adc8179f90f3b2eaaf118e5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746649407;
 bh=zI7KZF9hG5xiJ91ErSOlpiE/NHgRZc4P4PLLxv7eC10=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gg7Juh/ADTrCWi3JZ0GPgPQVHDAysePxyW1mLv+Xb6P6RotQU3tME44yRQi+mK8QS
 bR46CCv0uulab2CBOfEN5UHe9grwdZ6/1ZAmBimSnIgUfK0R/BU4z09UkzaBsnCmi6
 GY+6yXSepkRJOWM0Tg+qQ3NHbEEbhDkzOzEPPjUNriq84EChtqO4ORupDtFmf2DkOa
 /lyXQF4tfrZPOOFnRBRTBxZI3imn3yuS6XZtjQLpmgFwezL6p7edBgi3OVJXbwjR15
 6ALKs4xE7zhb12aXl4fJFHr+qcVPCWCxNvpzMGiSgU8Rbz+48/nqi6trSLNiqWSL34
 +/ytjmL/+7ZyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gg7Juh/A
Subject: Re: [Buildroot] [PATCH v3] package/gmp: Fix for c23
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Charlie,

On 25/04/2025 00:49, Charlie Jenkins wrote:
> GMP will not build for a C compiler configured for c23 because its
> autoconf scripts use deprecated function prototypes. Include an 
> upstream
> patch that fixes this issue.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

I'm sorry I missed your patch. I wrote an apply a similar one at:
https://gitlab.com/buildroot.org/buildroot/-/commit/31569bcc1b0762636d704baad0b35fc37aedb386
I'll mark it as "superseded".

On my side, my main motivation was to quickly fix host-gmp with gcc,
which was at that time generating a lot of build failures. I also
applied the fix for the target package.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
