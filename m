Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D77CA0EFF
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 21:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B19A68156C;
	Wed, 27 Aug 2025 21:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dxHRY6kMQcH; Wed, 27 Aug 2025 21:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC5368154D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC5368154D;
	Wed, 27 Aug 2025 21:55:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67DDD114
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E530407BE
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2kY2mcbS47Z for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 21:55:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71F0540789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71F0540789
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71F0540789
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:55:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 660372003DA;
 Wed, 27 Aug 2025 23:55:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 27 Aug 2025 23:55:03 +0200
MIME-Version: 1.0
Date: Wed, 27 Aug 2025 23:55:03 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250827074928.2078119-1-thomas@devoogdt.com>
References: <20250827074928.2078119-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <70f61f31d1ff43aaa5d03c1ee586b798@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756331704;
 bh=jexvJi0VpIKGHI1Wo0PWIN3767QJnB6ATKitegkXjB0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ukwVv3BXFoHxGRJm9FTwFaRvU0dFprquNL8C+AyVG9E/89XAFUg3/2XQp3T6oDtTB
 ofcXRPHKaG65o6ACbY66zImyiWDSksmD6TUJ1LeshDgjjZiuwgsqc2luG6RF5wWam8
 OPOew7xXjxQbuz/1TjV6XiNke1p9aRvI05m7l1eeiY1bULfXoDuEloPBf7XktkNvQn
 6VqT0dROHtIWymY4oM9TAokBYGa46xHBqK/hov2x9m8cTL5GBweAw/eq7oOgtq649K
 lhHtpVyTuhjQv8QWziGi2PDtZnehamVYueRmaL68Z3iDh/ur8Z75QOhjQvQMSzfHfI
 FdKULrQ3UfwpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ukwVv3BX
Subject: Re: [Buildroot] [PATCH v1] package/libfcgi: update to 2.4.6
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

On 27/08/2025 09:49, Thomas Devoogdt wrote:
> Announcement:
> - https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.6
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
