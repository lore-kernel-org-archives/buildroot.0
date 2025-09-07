Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1262DCA101F
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 15:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC60061BF2;
	Sun,  7 Sep 2025 15:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITiafFxZNhlu; Sun,  7 Sep 2025 15:06:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EE3261B4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EE3261B4E;
	Sun,  7 Sep 2025 15:06:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22322273
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 071A04141E
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ePmBFrOl-DU for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 15:06:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 59B07413FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59B07413FF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59B07413FF
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:06:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7290C5FFB4;
 Sun,  7 Sep 2025 17:06:19 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Sep 2025 17:06:19 +0200
MIME-Version: 1.0
Date: Sun, 07 Sep 2025 17:06:19 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250907095717.2202752-1-romain.naour@smile.fr>
References: <20250907095717.2202752-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <79c24dcf9c70274ef50a76ad6791c0e0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757257580;
 bh=3DfY+GpBAfDe2BAVHZVscWR3XmzkWIC69apOsovGx9g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V8//IwMYcgXzVYKim+0l0pLSlov+TR4q9ALsLuGCBfhudeZqRlIRc595dm+7WqUy7
 McqggHU1Jv+IyZVwBFXEs22HJ4v2z14ii1srGYRFp+JJMbNORaDGF7yhWYPNbH7acT
 efI7eGXRhfXLfLu/01wBblc9UEyBmngU9iSpuWE7/vNWHV+6Ln6s7OdrIi3tvoA+m8
 nRlN2PoakY/5zKilVQTfw6Rc2mlEuOYGmEFFvBfszShX+p/VE2zwebmBD7goghmvc5
 4JwJ6m4l6lVHcyjAEjt01RU7znXfNVQir61A8dp2rP5rSgodZXEP6C1yzQPxIPMjFw
 ef5CNG1GgksMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V8//IwMY
Subject: Re: [Buildroot] [PATCH] package/micropython: fix segfault at exit()
 with gcc >= 14
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

On 07/09/2025 11:57, Romain Naour via buildroot wrote:
> Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
> the TestMicroPython segfault when testing if micropython can return a
> non-zero exit code.
> 
>    micropython -c "import sys ; sys.exit(123)"
> 
> This issue is related to the gcc version used to build micropython
> (gcc 14 or newer). Using gcc 13 (like Bootlin toolchain 2024.05-1
> previously used) micropython run without issue.
> 
> The issue has been reported upstream [2] and fixed in newer micropython
> releases [3]. For now, apply a temporary workaround (suggested in the
> bug report) using -DMICROPY_NLR_SETJMP=1 only for gcc 14 or newer.
> MICROPY_NLR_SETJMP avoid the architecture specific implementation of
> nlr_push.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774762 
> (TestMicroPython)
> 
> [1] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
> [2] https://github.com/micropython/micropython/issues/14115
> [3] 
> https://github.com/micropython/micropython/commit/35f3f0a87db2580041dd0f7dfd4361df48887796
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
