Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806E5CA1013
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 20:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 491DE60B76;
	Thu, 18 Sep 2025 20:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6Qcqb3iyTRJ; Thu, 18 Sep 2025 20:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DACA60B71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DACA60B71;
	Thu, 18 Sep 2025 20:25:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDBF2E7
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 20:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF5D68227F
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 20:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzetyL5_uNxq for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 20:25:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8F1A8227B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8F1A8227B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8F1A8227B
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 20:25:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id DE69F5FF95;
 Thu, 18 Sep 2025 22:25:54 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 18 Sep 2025 22:25:54 +0200
MIME-Version: 1.0
Date: Thu, 18 Sep 2025 22:25:54 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aMuoZp7b7IWmRRXs@waldemar-brodkorb.de>
References: <aMuoZp7b7IWmRRXs@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <acd457ffee7dbf21cac557dea41c1237@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758227156;
 bh=j+UmIpw1QnB0f8WD+krqPUqMdVfpaodmAjHUuoajrKY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G+jz2iITJlntVAOSIPwPc5l4qGPGtFhAyJTeaYBTqzmgnzcoxzOujHMQTB52Sksxn
 y2bZyr0fMaCt9aYUyRmojg2P6jJCNbl6NG0xUb+MgMZThvLCE7eW7/AnTGZhVgQapx
 cGMEiG9qgp/E/vGAQkW+vF6mQY7ZMIfEqCA84SNnSzAeIJGd8u8841NVXYbvNFbDdk
 FoS7yaQ4CfBYyOvId++X5Ldok6S4XGamWnHDpFxxY3lwgpsVCfhehaMFLtxQ9Xd4SB
 XMsuqfejat368ETu5Z6e1+VkBKiD/SmXv+ztT82ykuqtRdLr13KsbAxxfpM9g6p5/9
 Ue6uuTU4Db9uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G+jz2iIT
Subject: Re: [Buildroot] [PATCH] package/x11r7/xapp_xdm: needs libxcrypt
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

On 18/09/2025 08:36, Waldemar Brodkorb wrote:
> While doing a per-package build the package is failing to
> compile with this error (gcc 13.x glibc toochain):
> make[3]: Entering directory
> '/home/wbx/buildroot-2025.02.3/output/build/xapp_xdm-1.1.14/xdm'   CC
> session.o session.c:146:11: fatal error: crypt.h: No such file or
> directory   146 | # include <crypt.h>       |           ^~~~~~~~~
> compilation terminated.
> 
> Fix this error by providing the needed glibc dependencies.
> 
> Fixes:
>  
> https://autobuild.buildroot.org/results/b75/b75ad8f1159613656dce482992c800545d60ae69/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
