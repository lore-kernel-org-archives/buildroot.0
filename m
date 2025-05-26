Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C16C54FB3
	for <buildroot@archiver.kernel.org>; Mon, 26 May 2025 19:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B67608A2;
	Mon, 26 May 2025 19:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BL_0hubbsBzU; Mon, 26 May 2025 19:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5585660880
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5585660880;
	Mon, 26 May 2025 19:33:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96B4419D
 for <buildroot@buildroot.org>; Mon, 26 May 2025 19:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8887F4006C
 for <buildroot@buildroot.org>; Mon, 26 May 2025 19:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HuAhG8qP4D_U for <buildroot@buildroot.org>;
 Mon, 26 May 2025 19:33:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05C47403EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05C47403EB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05C47403EB
 for <buildroot@buildroot.org>; Mon, 26 May 2025 19:33:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 83530B0059B;
 Mon, 26 May 2025 21:33:50 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 26 May 2025 21:33:50 +0200
MIME-Version: 1.0
Date: Mon, 26 May 2025 21:33:50 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250525215254.449877-1-giulio.benetti@benettiengineering.com>
References: <20250525215254.449877-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <285554407ad3bd09e38e1439a60a81d3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748288031;
 bh=1IDAc7+W4lGwRpA/xkP0QP+trdOk3u+lZKGNJrnIjn4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nXRkWtQNcEa6A6IFXVvvRsmWITjURUlzQEm3K7cBv4Fq1qM90Q6BdnL+fnIJ716fd
 +q2/JcnNIUivjaAOtsb3ijU/FLopWH7QD53jy1LWxu77PBypHAwEgAPvVWow1JJkL1
 6Njp6VEtWyYzmlFof0Zl7YUeYDU+XqMKFObbgsh9Xq0RHy+J7g3rv+Om3hwS76GPk5
 ZbCbi88Vzyvb0Bnj8d3y0RmJSPkCU/qk7a3G/fT/EPMD4vaQev1fE54HksPbgV9mOu
 Hzgza535CPlCzdo6SU80I210MrrPdcCPU0sxpf56cGDdOLMDwyXMsik8J/8++9LC8x
 hSMHCsnqQ4KgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nXRkWtQN
Subject: Re: [Buildroot] [PATCH v2] package/esp-hosted: bump to version
 1.0.4.0.0
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

On 25/05/2025 23:52, Giulio Benetti wrote:
> Esp-hosted project released a new tarball after almost 3 years where 
> they
> only committed patches to git repository. They also defined a template 
> for
> releases[1]
> 
> Release notes:
> https://github.com/espressif/esp-hosted/releases/tag/release%2Fng-v1.0.4.0.0
> 
> [1]: 
> https://github.com/espressif/esp-hosted/commit/ced8383c2b8d44b0d15e04dbb424d5a51e7f468c#diff-2e8cb17d6e84161bc5a232fbdf4c0b8893c4330f185c66c564e33ced6ffc864f
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
