Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF9AC36005
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 22:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DE7560607;
	Tue, 25 Mar 2025 22:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8LhZcl1-tN2; Tue, 25 Mar 2025 22:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65CF8610E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65CF8610E6;
	Tue, 25 Mar 2025 22:16:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CED4E4
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 22:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E67C40574
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 22:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpMjIyq66AM4 for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 22:16:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DEED240550
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEED240550
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DEED240550
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 22:16:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 86182B0051E;
 Tue, 25 Mar 2025 23:16:26 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44172])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Mar 2025 23:16:26 +0100
MIME-Version: 1.0
Date: Tue, 25 Mar 2025 23:16:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250323190630.3336241-1-bernd@kuhls.net>
References: <20250323190630.3336241-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <70e19b9f2505afc21ae2bd8744ff4d79@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742940987;
 bh=nCda1Vin8h+rRvMt9Eq5xrB5XBvFdqKZ1lyTNbmlzx4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u0m9L6v+ICD6m+VHRiDENxFf6sLoypFJoPCdpxiLIfbh5KjHDx+A75QNxqUv1nXly
 8b/5weERBN4O15wiF6gHAFXk8SlJZwaGwAgneZLfnEdDTvBNFcwlG6C8Wt+ouV+ZQO
 NSmyOfAm+quLK9JEd0f4hU+MKqRUAbL9CQREs2oPs/wyixjl4h3YJookknpWYD+UZA
 cjYRB0Z7LQqREAqyQ3ElzOiqXArsnclPNm7IoAlXNDbFx5rTpWYChAJAQpWuDSSdWj
 /7/gQWfX/JCvzDBaYpmE3FNIlHTWKcMe0SpAp7YlsL0yziYqcTDi9/MmMh52T0ySck
 S3GyPbppm4GBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u0m9L6v+
Subject: Re: [Buildroot] [PATCH] package/kodi-pvr-waipu: bump version to
 21.10.0-Omega
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/03/2025 20:06, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
