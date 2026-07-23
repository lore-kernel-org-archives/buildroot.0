Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379F1C531F7
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 16:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EACB5810FC;
	Thu, 23 Jul 2026 16:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DO96hl0Lawxa; Thu, 23 Jul 2026 16:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FB4C810E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784825227;
	bh=BRyth90541EGLAet6lZpc6l4GaNQ/YJm25feS0pka+c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NMGzCvg2Y/Qh+R+qKc6BQj/vU6S1ndYxxF9u+WFjGrV+pEDw9pfmmGebdKMbkbBMX
	 QWcWd6yBVwDQ0rAB/kwG6GCgU+dPYF74rFiidubVe83DCEnIBzI1vryig2KKjXP64T
	 y2o4aQgFWVMqMLgXBvrZZg53+VlEu1v/f234ZQ7O5fmNyYSQ7z1qo7NME2kQaUz9Ts
	 gASd7/w0FY3kgf5Ys/eP/5QrhE550+QwmJNsGV9i3HSAseIMSBZETpQUSh0oOkfEx9
	 15npcXUfhicYPgZOAdOHkEY53x3HhSGoRlzFTXfSmtzHDArIRFVufzPXmo8G6JYMzO
	 I2qdhtjRmhPNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FB4C810E6;
	Thu, 23 Jul 2026 16:47:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37610788
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 316AB4043A
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tXczSoDhLaq for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 16:47:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36CBD4042C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36CBD4042C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36CBD4042C
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:47:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 009585FFAA;
 Thu, 23 Jul 2026 18:46:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Jul 2026 18:46:59 +0200
MIME-Version: 1.0
Date: Thu, 23 Jul 2026 18:46:59 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260722205142.674788-1-fiona.klute@gmx.de>
References: <20260722205142.674788-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <81657c3f3a9eaad001e9941b5fcb21a5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784825221;
 bh=atpdK75xckA/kdc4tWXZFAvioTtF9MIpPJccUrcO6Sk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ttAXGy7UupjtO/2zhov57r5ivHzblkOWWgDyybxt4aUZq1UWBMNY7OQc8MdfoDjIA
 CNBeIpR44QpmP4+wSKVf9mviJeHleVFDxDXw5wAZki5+k2yqCSm02o4LP8002gkqVo
 qeM6twj/h3YfRrThwQF5vH5aIU4DU/RtRy6JEJjLH8jSq/zpkCwebeF6jBmZcGpkCG
 5um/wPltmvRBLfYhi9kATIISCYJmRotjMHo6qDFVXSyWnL8HWBANLy1rLDenko+hks
 6hyO1o2zPEfEE4fpZHdKO/has5+7hRXp7ZDlv+K9iqsy+Zgp5/uHOFLtVcR9ntYUkl
 tGXfJ1lePpdzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ttAXGy7U
Subject: Re: [Buildroot] [PATCH 1/2] package/ugetty: use correct SPDX
 license identifier
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

On 22/07/2026 22:51, Fiona Klute via buildroot wrote:
> BSD-0-Clause is not a recognized SPDX license identifier. 0BSD is used
> in the LICENSE file, and LICENSE.0BSD matches the 0BSD license text
> [1].
> 
> [1] https://spdx.org/licenses/0BSD.html
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
