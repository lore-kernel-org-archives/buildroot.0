Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11ECD116F1
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 20:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76DE9611C1;
	Mon,  1 Dec 2025 20:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enosm67ZwMKq; Mon,  1 Dec 2025 20:34:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4FFD6118B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4FFD6118B;
	Mon,  1 Dec 2025 20:34:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EBC6D3
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 20:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B88B40671
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 20:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osja2iGKpQut for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 20:34:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2374640644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2374640644
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2374640644
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 20:34:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 355F1B00548;
 Mon,  1 Dec 2025 21:34:46 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 01 Dec 2025 21:34:45 +0100
MIME-Version: 1.0
Date: Mon, 01 Dec 2025 21:34:45 +0100
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Vladimir Oltean <olteanv@gmail.com>, Brandon
 Maier <brandon.maier@collins.com>
In-Reply-To: <20251013031453.566526-1-nemaakhilesh@gmail.com>
References: <20251013031453.566526-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <70c8b09aaf27c8c6fdad346ec8556182@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764621289;
 bh=hsf7Lzesyqj4HjCFD277pUFZv5otMz01dxw0ub/QSbI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LGxLoJW3ftNubQzFJJa7gjVlW15iS2ae0jnK7caftnWYi6HPvpaDfYU+RdHM3SIld
 ccqab8EXX6pxLipp+MudwQ71tjGZUK0tUpXlfBkTpYiAW5de2MHMDcdpuPtFKPmY8U
 OYwKW2oc5jni6K2cnGuSBb2ZQNjyez8RPjZ8d/KuIjWOqlN8SNoarVzVhSMora9IGp
 2BUsKbTqNBY2QMBA1gcv69Vai5WeJvikscB1y44u0AdranZrRjSs/kQb5CfA22I26p
 pFxxZ5msderUSccB3CjOy8GmSGwvPK4X3mlxoit/2HC97NljgM9zt17VCho20iGSuf
 Qvr+syRCVbzSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LGxLoJW3
Subject: Re: [Buildroot] [PATCH 1/9] configs/ls1046a-rdb: bump BSP tag to
 lf-6.12.34-2.1.0
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

On 13/10/2025 05:14, Akhilesh Nema wrote:
> Update the kernel, U-Boot, ATF tags and readme.txt.
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
