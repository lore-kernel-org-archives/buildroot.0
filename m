Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBFCC4450A
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 13:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE4AB60679;
	Sun, 19 Jul 2026 13:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ER-q60HYKAps; Sun, 19 Jul 2026 13:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EF3660633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784467759;
	bh=WREcjYdZjHPXRsve48jdY2B7imrgEs6eCIWbih2MInQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sHpRXB+EdWTtJ2nY6/JMUqUmucOcYrkpyFMxSTc5cUCKIYqKIogov3V4I148TWAxb
	 8ChrVNJeQZUoGhXfQfbatCx96FaG8i6hkhk5Humr4/OYB3AoC/7gT2c7tJGoVKz6tU
	 y+nJzMH4YmTmVRKuMdTO0FxBQqE5ch0Jgqxan8GkrRpRs4Rz1wpxvMaRb5CMvYokxU
	 LC/0ZrKgnMitRs9RIsIVfg0h9GA17DCMDiBbEoPs9tI09DmtpcY3gL2JmvV0DwsWFZ
	 DiAdAvN9IFbuz9iYXLB4hHDAu926BQMZCb0F2i3cC3UdXfyG6MoWFXNJv6Ev+ek6lI
	 8GzSG3L1Gq+rA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EF3660633;
	Sun, 19 Jul 2026 13:29:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42797206
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 13:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29C3780576
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 13:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIwUSlctI_hb for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 13:29:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26CC580AFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26CC580AFA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26CC580AFA
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 13:29:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 01A5178034D;
 Sun, 19 Jul 2026 15:29:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Jul 2026 15:29:12 +0200
MIME-Version: 1.0
Date: Sun, 19 Jul 2026 15:29:12 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Francis Laniel <flaniel@linux.microsoft.com>
In-Reply-To: <20260714144635.20560-1-fl@n621.de>
References: <20260714144635.20560-1-fl@n621.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <556ea34dbbbbffb1a30a383913c5953d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784467755;
 bh=8B/VQ0JjVtZdEXSSIt/U+QIN0aaiHhnqcJChu7v392Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B9MdMiCMmo3ReliscPLFQ5FCfvxlISdFvb0jcv+DaZ3aoPlZD8EM/zgpbdfroKnmy
 T4+4lOLNOK1VA8T9elSEZTZ/qCPl2rQdRv9hZc30dH9ZIQ4AQFkYcvfSxsWV100rl+
 aT3hZkCd/+nHldDib23AOocmX6JARhfcQXjnaH8zgBNvfeeaaQNp6CcSIN26B8Bs+g
 FB4WQlQi0JyFkyEs/2/czK2pXpj+zmv6K1DMOdn6pupMqCXaEkWAQ2oShjmg3pQsfg
 cxbYr6GTsJpA8BTVB3zp7yfXjT32fsLd7OfxNrRYOz6HSBvQgxOT7KrmWqFM1ebPUD
 JsQqcF7hZEIQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B9MdMiCM
Subject: Re: [Buildroot] [PATCH 1/1] package/pahole: fix build on modern
 toolchains
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

On 14/07/2026 16:46, Florian Larysch wrote:
> When building pahole using a modern GCC (e.g. when building
> host-pahole), discarded-qualifiers and unused-but-set-variable warnings
> are produced. In builds that don't set CMAKE_BUILD_TYPE=Release, 
> -Werror
> gets set and causes a build failure.
> 
> Fix this by backporting an unreleased upstream patch (for
> discarded-qualifiers) and adding another pending one for
> unused-but-set-variable (and, arguably, a correctness issue).
> 
> Fixes: 
> https://autobuild.buildroot.org/results/ba7/ba79fb9d08b2c6ec573b79fdbb6b4880bf603a57
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
