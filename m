Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650D4C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 18:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E5B281332;
	Tue, 22 Apr 2025 18:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9H_HZw1UVjz; Tue, 22 Apr 2025 18:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C7B58154D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C7B58154D;
	Tue, 22 Apr 2025 18:59:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 057611BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF73940A06
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JeNoAdiIkaX for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 18:59:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0314C4093A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0314C4093A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0314C4093A
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:59:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 37E115FFC0;
 Tue, 22 Apr 2025 20:58:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Apr 2025 20:58:59 +0200
MIME-Version: 1.0
Date: Tue, 22 Apr 2025 20:58:59 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250422025704.782201-1-kadambini.nema@gmail.com>
References: <20250422025704.782201-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e2778d0a9b2f0043f55076f8db070934@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745348340;
 bh=7fkDL9gVo7xhcg70U1aEJsPPH0VdsOlInJOZ1QBB7zo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IdRrBzO7FgXZUf4F3h6NeqQzMbixhzJn/dIOox13KNM8rVEK9hKfhFV4H2DfYeewO
 OK8TnkBDEMDpVUx+fDd921DSNR5+RtHg+uH/OHOhlRL/wvCLFvoLz1kRsUUaDmBurl
 gcT44MSGeoxAvE2Ebk3aO8sK49jaZUKpYAROcX5B8H6sz8IT/zdtoiFQD7lPHqjmq3
 +m2S6A+rML9goAQcGzzEYDEBIdTNIo7Pucrsa5/RTZX/BEkR11q46X3tzWz77Imlvn
 uU/rAOlgaMVvUrb+HJdAISMHQ+deUV28N2qRgZXgjX3V8cy0+jgzu0j+2zD3V06/RH
 i133g00N0P70Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IdRrBzO7
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.14
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

On 22/04/2025 04:57, Kadambini Nema wrote:
> Release notes:
> https://github.com/strace/strace/releases/tag/v6.14
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
