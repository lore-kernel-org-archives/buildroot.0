Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA0EC282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 13:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6CE483B3C;
	Sat,  8 Mar 2025 13:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0-n6NSR7Xhv; Sat,  8 Mar 2025 13:52:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD6CC83B77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD6CC83B77;
	Sat,  8 Mar 2025 13:52:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C1C321C9
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 13:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FF1540441
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 13:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfeSe1qm5Bkt for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 13:52:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59F68400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59F68400F1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59F68400F1
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 13:52:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6B9CF13F89C;
 Sat,  8 Mar 2025 14:52:28 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Mar 2025 14:52:28 +0100
MIME-Version: 1.0
Date: Sat, 08 Mar 2025 14:52:28 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20250306234919.140543-1-giulio.benetti@benettiengineering.com>
References: <20250306234919.140543-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <b004742091cb13e4dc78074b1ae38437@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741441950;
 bh=BjftSPUHAIT1AxAVv3EF6IcgzzMFNwx/XhR02yNA1Yg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dz6BLsVPWRduKU5ST+Hl3zXthdxDXiUvyWUIWyhKjd4iAPDSDO3c6AoKrBCl9fwto
 py+jN7WkEAnPsbkyDohPgDGih4yfqVsySGz51umppo+q8oGRDbwZmFOdJJw+/2+4J6
 wG27IrQ5r6ogUZBY/Qk4mbsQRmCykvf/8oMlsBSpS7h7393+6tKPFfrWrBxtG6HMJq
 SdJYKmCSf148PP88HbfzFqHQMknaGtuJNj9hnOAF9KlvEY0QkFa46Q3mFRRigNoE40
 mqAoQliv81EyeoZJa6GxRRe9b3EsPjH6ynP6HRbjk5cTrUkVAahsKvi1W0Vbc8h+/D
 wGzq+Ee76Ik7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dz6BLsVP
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.109
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

On 07/03/2025 00:49, Giulio Benetti wrote:
> For release note, see:
> https://hg.mozilla.org/projects/nss/diff/82eb56300e9d8e1e65312acc8ed11b26de8de222/doc/rst/releases/nss_3_109.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
