Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87517E77188
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 21:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4268780882;
	Fri,  3 Jan 2025 21:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksLr459nMEzq; Fri,  3 Jan 2025 21:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CCA480B14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CCA480B14;
	Fri,  3 Jan 2025 21:43:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3B54E0F
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 21:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0EA080A89
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 21:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tznWRQz4QGp5 for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 21:43:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E14B80882
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E14B80882
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E14B80882
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 21:43:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 214BE780371;
 Fri,  3 Jan 2025 22:43:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57404])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Jan 2025 22:43:04 +0100
MIME-Version: 1.0
Date: Fri, 03 Jan 2025 22:43:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250103201747.3749714-1-thomas.petazzoni@bootlin.com>
References: <20250103201747.3749714-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <211624fb7afbbb83eb709499c2f37802@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735940585;
 bh=3u0coYtPMFEkbaVscoz5ZUseUm2msiT9rs1bgtth3pg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gNdxeb65CkeWXgaMktcP/eNlSK14uHwci32gKAvMJYikDI717AVSsUePWZrlHSTwD
 O9ThrV7vmLdXCRg9gWas9MrcHES2mxrv4HzqdmaNXo1A4TGE+Jp9UkeDU328vAZcU+
 W50dvp7r7KpsZH99bqRUr/b+/wVTuBzH2NCjnBmH1ekNYR80+gsC9lo/3cksGp+l+q
 Go1c+JF9sbE1HRkDY2jid4WCl0DrHRvs6FxmrqzuxYFMXHbHtcfIjB2IIsmaNB6P8A
 t3Xz7ojbubUB1tfSUKRDyYk+PDe6ai0w0oufY2YMe5A0UV19CDnjcoCXL3VhiHWdnm
 GynasGJUhmJSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gNdxeb65
Subject: Re: [Buildroot] [PATCH 1/2] package/pixman: backport patch to fix
 inlining issue
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

On 03/01/2025 21:17, Thomas Petazzoni wrote:
> pixman fails to build with -Og or -O3 due to forced inlining
> statements:
> 
> pixman-combine-float.c:370:5: error: inlining failed in call to 
> 'always_inline' 'combine_soft_light_c': function not considered for 
> inlining
> 
> The first occurence in the autobuilders is on May 12, 2024, but the
> problem already existed before as we haven't updated pixman in a long
> time. Therefore, the issue started occurring because we started
> testing more random configurations.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/2f3df7961b3181d9eef79893439ae7ebbe4415ad/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
