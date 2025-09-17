Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D566CAC5A0
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E94C6153B;
	Wed, 17 Sep 2025 16:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ebHD72Hwj0_D; Wed, 17 Sep 2025 16:48:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58DA06113F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58DA06113F;
	Wed, 17 Sep 2025 16:48:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87ACD279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78F2D6113F
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VyvSQo3jxxPf for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:48:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C975660E22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C975660E22
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C975660E22
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:48:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D523119F5C2;
 Wed, 17 Sep 2025 18:48:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 18:48:25 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 18:48:25 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250915235324.2448456-1-james.hilliard1@gmail.com>
References: <20250915235324.2448456-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ba2f40ba163b4c0c87f615fa2dd2c030@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758127707;
 bh=LO3jFlrjNd1k6BXjQXLLiDXoN4A14KL97+DOGyUSFfk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FCzp3XxesgknRNgSAgeO9ReFuVZAhzZ9VgeLBTZdtlKMDOwmZjyAbRqSlqOfY2XYQ
 voDfxZl0CJ3l00XjD8+FR1ShWk2InYBx6ZqZfy62MzuQxjV/4h2HIbj1mcelSmZ67T
 MM3Cz/haQZCSPZAMfI4y2a2yA7Lvr7dyO3anYdHKsLiaZBbHqn0e57rNWGjU4mnsrg
 EssQL0KFDJGbrZbmnbfD57A2s4ONlMqlXDG1PKHLZCKyqmueA+2V8YFEoO5BERnKDq
 aHtS/8wo4cKADeRy0ofL4LeYwgaqaPmEM269A4KYqzGBDtisgPEOtqTE5NT1vSCWq6
 av6yam+PgRnSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FCzp3Xxe
Subject: Re: [Buildroot] [PATCH 1/1] package/python-grpclib: bump to version
 0.4.8
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

On 16/09/2025 01:53, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
