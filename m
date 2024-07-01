Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB359C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 07:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EFE08135B;
	Mon,  1 Jul 2024 07:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vb4y4uFQB10; Mon,  1 Jul 2024 07:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A59C8146F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A59C8146F;
	Mon,  1 Jul 2024 07:50:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9EAB1BF340
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95A05409B1
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JP_zVZU6g9Py for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 07:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6A41400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6A41400D3
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6A41400D3
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 07:50:14 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 85C6BC0BAD
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 09:50:11 +0200 (CEST)
Message-ID: <19e993f6-3b05-4749-8265-f68909269ddb@grenoble.cnrs.fr>
Date: Mon, 1 Jul 2024 09:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240701024316.19646-1-zhangdongdong@eswincomputing.com>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <20240701024316.19646-1-zhangdongdong@eswincomputing.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1719820211;
 bh=8I+lVDZqP1E/nIk8Xx4jkmBX/pe15tePiJfAnNHjuTI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=c/FZVI84tKSSfvY2B3Hw6h1CDzb/BmDrWV7jy5nXjEVOFF8qK3oqGXJzAbbAGOIvs
 l4LBNwXsD9JqEI5465GaG/qfvdY8G0aE1q8vh57gx+PXsRuytcCOSRrMz4rtLZo8i4
 Ste8ajUcTGmGCOou+SJfPYrd7B0oLrFiWg6Gi0popkhlzx6/hhg1E8r1BjcvK14rDf
 R9+lsXv1NjxvFVn6prNr1HjM5xkKO6H2obqcBfdGau/UUMvuoHs5+dW2rjU7F2tKR1
 dSmYPxfPfyO5iyoszU4WRsgH83S82WSpf92ELjeDxcL6sH1U+HxdqHQzI8KZ63jdph
 nwd0Qb2HrnR6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=c/FZVI84
Subject: Re: [Buildroot] [PATCH] .github: add github action to automate PR
 handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

Dongdong Zhang wrote:
> This patch [...] Removed the existing pull request template that
> advised contributors to use the mailing list for patch submissions.

What is the rationale for doing so? The sooner the contributor learns
about the procedure, the more convenient it is for them. Keeping this
template would then be friendlier to would-be contributors.

Of course, there is still the possibility that they do not read the
template, so there is value in having the workflow *in addition to* (not
instead of) the pull request template.

Regards,

Edgar Bonet.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
