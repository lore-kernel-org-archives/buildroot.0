Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1765ACAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 17:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8910D81771;
	Wed,  8 Oct 2025 17:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xVwo5ITotNJ; Wed,  8 Oct 2025 17:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD61981767
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD61981767;
	Wed,  8 Oct 2025 17:41:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DEFD99DA
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 17:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0C0481758
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 17:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nt0tG2XOV74I for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 17:41:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C2B28175E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C2B28175E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C2B28175E
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 17:41:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CE64E13F854;
 Wed,  8 Oct 2025 19:41:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Oct 2025 19:41:29 +0200
MIME-Version: 1.0
Date: Wed, 08 Oct 2025 19:41:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251008151657.20386-1-bernd@kuhls.net>
References: <20251008151657.20386-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <6a596043a61b5987c609720a0899195b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759945290;
 bh=D1b+o0uby0m/XHUpnfY8ct4UgDvVAuIzw5LRozZ4sic=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WsjSK8LtoEOojptL/m4x7F6rez2kz5xGBx8/BjE3ulemPa25jeMPf/GNzYkTQDSGC
 Aj7vWSnrcrkxNc8+nwqzidhCWg2fr6OXa/mIDuHJpr0l0KX7tBXNvfmjvQsTqN/oE+
 v/sV5gZ37KaCGWjoyxz+ja5tg2+OjX1I8RLWY0Bnfym4EjaJbjLPxAKnEx+i6mowiM
 9c+Vu72QQ7zhcsymxJaarBCnMXfeDdJBiomd6//sslygsNM96CT53HYlEsJgZNvnXC
 g30df5TfZeFLnCDBVyr0r3hDTdVuNHGyt+NjS+muDZOBIMx2iscwOMKUBqwvPB2GE+
 c+kZmpFPm2r6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WsjSK8Lt
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: bump version to
 3.6.0
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

On 08/10/2025 17:16, Bernd Kuhls wrote:
> Release notes:
> https://openssl-library.org/post/2025-10-01-3.6-release-announcement/
> 
> Removed patch 0004 which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
