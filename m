Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8584FCA0EED
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 17:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0324540A88;
	Fri, 22 Aug 2025 17:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROvKWT7x9BGK; Fri, 22 Aug 2025 17:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E39440A82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E39440A82;
	Fri, 22 Aug 2025 17:37:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BDDCD8
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 17:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48B164031E
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 17:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1VSOr8G3bFX7 for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 17:37:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62A5640289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62A5640289
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62A5640289
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 17:37:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8EC99780505;
 Fri, 22 Aug 2025 19:37:39 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 22 Aug 2025 19:37:39 +0200
MIME-Version: 1.0
Date: Fri, 22 Aug 2025 19:37:39 +0200
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>, Romain Naour
 <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>, Arnout
 Vandecappelle <arnout@mind.be>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250811165531.1533913-2-olteanv@gmail.com>
References: <20250811165531.1533913-1-olteanv@gmail.com>
 <20250811165531.1533913-2-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <04bb93d344c36a6ae073d66e73c2752e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755884267;
 bh=TihRVHtXA24VqBmLWmbfRxO6P9Mez/dRBiNccLC1VKk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m1tmOFjRe+LADA7T7Qezci21lFiT8Kn4JwBdYf4s6dAcaKiT0vpN9rB4O1acA01Pl
 bq8dxN9R+26zlHl0159ODwEgkICy5f2mYVdDt7Zo+27DSTOMTlCbLQY1Je7Eia7e0n
 JDS8LYXVDFLvodH3KBfAN7P4W8G470ubr0wfH1mVgtiqF/mIZ5E+Ujm4krmZDAZIxE
 cWzz0mxBWdUhwgE6ivBVtbKaup4bcFYKQZjUbMiWbTjd7sUL6crNbECJmeVxQZi6J9
 Ndmkd6iIYrQjqrhjJz+Rks790XQbzrEdykH0WInYfTkS1GPK+7IIZOzp20/2F9xXCf
 BGaSuEZnBaBxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m1tmOFjR
Subject: Re: [Buildroot] [PATCH v3 01/11] package/qoriq-rcw: bump to version
 lf-6.12.20-2.0.0
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

On 11/08/2025 18:55, Vladimir Oltean wrote:
> The commit we were previously on, 45e6925, was the head of the master
> branch and now became tag lf-6.12.20-2.0.0, which we can use as is.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

I applied the package bumps and defconfigs updates to next. Thanks.

For info, I added BR2_TARGET_UBOOT_NEEDS_GNUTLS=y in the defconfigs
which is now needed.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
