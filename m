Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB99CAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 15:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1115F405BE;
	Sun, 28 Sep 2025 15:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkG-1vYOl_2e; Sun, 28 Sep 2025 15:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 671E040561
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 671E040561;
	Sun, 28 Sep 2025 15:00:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99389111
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 15:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 965E360087
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 15:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQaPnrgMOQ2r for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 15:00:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB98860781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB98860781
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB98860781
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 15:00:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 51E4278050B;
 Sun, 28 Sep 2025 17:00:02 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Sep 2025 17:00:02 +0200
MIME-Version: 1.0
Date: Sun, 28 Sep 2025 17:00:02 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250828164708.1943876-1-peter@korsgaard.com>
References: <20250828164708.1943876-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e077d95fe19dd53adfd660bf69d888fc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759071603;
 bh=43ngiVGvB679mxkweK3WFZ+QkqRNHlZt6+QyQupEjnQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PKnec31r1aeUw4SsaxRLoDwBsBrrUuLzLMXbGgUDESf42eohvqOvtg2BWl/G8HEAV
 b4tF7EA3W2JL9Ix+j855nQWr3fK0/w40qzwH0mW+nvB4EUii4vCGbdniCxxDNhDaJm
 JqVGzSMhKiiCN1CfzfvHcDwICtZg/5bBO/OoOsAMOBSVhOf9KYeXtkjGAmoS1PgMLy
 L2sJi18AWVKMRObXXYCsbI7/zeVsiBKFKA8zuzpEIJFpzM5/nc4hWDUROvhBnnNa7/
 05F3XocmAjaAfoogdLpaW2XKbeCY8F/X6xriipnW0iu2SO22RVi73Aq/9XPdAmNNNs
 rwCFykuBY2XGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PKnec31r
Subject: Re: [Buildroot] [PATCH-NEXT 1/2] fs/axfs: drop support
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

On 28/08/2025 18:47, Peter Korsgaard wrote:
> The file system support is not mainline and hasn't been updated since 
> 2019,
> so drop it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
