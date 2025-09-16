Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D05CAC59B
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24E7961160;
	Tue, 16 Sep 2025 20:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xx9FUDqPrpvU; Tue, 16 Sep 2025 20:19:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7872161131
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7872161131;
	Tue, 16 Sep 2025 20:19:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC0C112D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE5B083422
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1xUnZIFE5qH for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:19:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1343683415
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1343683415
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1343683415
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:19:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E5D7AB0053D;
 Tue, 16 Sep 2025 22:19:01 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Sep 2025 22:19:01 +0200
MIME-Version: 1.0
Date: Tue, 16 Sep 2025 22:19:01 +0200
To: Saeed Kazemi <kazemi.ms@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250915142422.3421361-1-kazemi.ms@gmail.com>
References: <20250915142422.3421361-1-kazemi.ms@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c29cefa29ea594bf45f4e73ebcc674c7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758053943;
 bh=y6DdSSQw/ogg0v6V/sL2pvVLb9SL1p9dRA3fksdf9ys=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o4UZdR03dZwXrzF5nRokzYN7amw/5JpdD1n+FlkHgP8V3I74fgLo4l0JBheoLlAfe
 qswV3Xlzp5KaxdLCV41x+aHP9UETO0/np8MHL0mgoHdh8CURwnlYiB5BEfKchKQkJ1
 PqAdSCKJK9WsgHKgRs6Bb17wUh1yu5o78XEbI711U/rGR5e8UIRG4+/eOekym+9JVo
 YRjeCaLrUfpcGvLjxC3Ip+HpaJjYdMJcaYCgnuB3YtGzdYU95cqky/xQ1BNq7d3toX
 /CMkzDFipiqOqiL4cG2S3AP3Fo8p25jlbvjLaYmiM72fOKsolFfaOLeSVTZ1RFylkH
 VTnEzlQJoyI2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o4UZdR03
Subject: Re: [Buildroot] [PATCH 1/1] package/zoxide: bump to version 0.9.8
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

On 15/09/2025 16:24, Saeed Kazemi wrote:
> Release notes:
> https://github.com/ajeetdsouza/zoxide/releases/tag/v0.9.8
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
