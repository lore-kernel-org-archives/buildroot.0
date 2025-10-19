Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2763DCCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 19:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F18FF84061;
	Sun, 19 Oct 2025 19:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bFA6FTW5OGq; Sun, 19 Oct 2025 19:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCD2684035
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCD2684035;
	Sun, 19 Oct 2025 19:32:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52AA143F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3809C60E57
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqFDRM6K0ArF for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 19:32:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6122B6114B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6122B6114B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6122B6114B
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:32:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 057562003D0;
 Sun, 19 Oct 2025 21:32:28 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 21:32:28 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 21:32:28 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
In-Reply-To: <20251016182815.166644-1-dario.binacchi@amarulasolutions.com>
References: <20251016182815.166644-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <56e649a46112b30fbac21404e4160195@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760902351;
 bh=0d25MOXHDZ4IQCcQAjK0HnbI4246Cv4SLAp1m816J7M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FOSBEbj19mlcdqoyF9/4ECDyt14h1d72egw0MRUblviwD893sQf1q7D2cvxdVwFor
 SIa86VYX9BVZdq+cpOwHHtUXw94nfWKl2QxTtmIPzvqs7G3E+FZgN7Ed0AnR0/P8Ro
 QqT7r9QwzR3G3mUZ6JJQ8YTgIjo9Uf0WVbepJnYHJeJ8xdma7Moi7Rqgrbk/4PHhAU
 tC0KhCByGcWH3wIwf45+qKf8+HL0cXUgfyKhNxR/lrUi6s8X5o6KHCkstPYIvA/KTa
 CPVItK7tniL4pi0G1MYFFMx0o+XxKelcF53DQjCnz6nZIUhwukFgeEbSXOpchUFFDl
 9gzDPrY0sj3yQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FOSBEbj1
Subject: Re: [Buildroot] [PATCH 1/1] package/jimtcl: bump to version 0.83
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

On 16/10/2025 20:28, Dario Binacchi wrote:
> Release notes since 0.81:
> https://jim.tcl-lang.org/home/doc/www/www/articles/jim-release-0-82/
> https://jim.tcl-lang.org/home/doc/www/www/articles/jim-release-0-83/
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
