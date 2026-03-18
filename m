Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D389510775F9
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F8BD40987;
	Wed, 18 Mar 2026 18:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jL25y30EYYfV; Wed, 18 Mar 2026 18:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C75AC4089D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773857211;
	bh=v0+DXvu4wxw2YL4T5U5do00CcLYLgRS9d1LB8bMaKfU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nglRrrJdOY4U0KLBo4wYhrNzyffIjRSoexOk0W7GjkZdbMUE9Qz7xpH74fZFgG33f
	 h8AKoll4M8SVsaMm6Bqs0Cyurp0MYCKECUMzJhEwubopmb1e1eD1ko912Vsph/q54k
	 qRm62xj2mBDu9pW9fS1YTYfGf2A1Wc3lchcEeMVKW1XCqKBjhWCjlmFN5pV9oeNRCs
	 VMiwSJZJKLiax0UUYs1sZtVekxpVT//Vl2h2/e2931Kj3ia8hBNQwya2K6ngwJDqt8
	 oYadr626d28Ytuihb29f3KHoEIBUHXA34JApoYPJindYU5oaxj+uunwZjDebNa4L7b
	 yJCTmox655V0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C75AC4089D;
	Wed, 18 Mar 2026 18:06:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9A2B1BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF04860B73
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d707NxKjFh8Z for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 091C760B6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 091C760B6F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 091C760B6F
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:06:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D5447B0054C;
 Wed, 18 Mar 2026 19:06:46 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Mar 2026 19:06:46 +0100
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 19:06:46 +0100
To: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260318092709.987316-1-manuel.diener@oss.othermo.de>
References: <20260318092709.987316-1-manuel.diener@oss.othermo.de>
User-Agent: Webmail Free/1.6.13
Message-ID: <6645d9732f646e37f9784604bdb772ef@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773857208;
 bh=Ti4IXHTdYkDY/kdvyvzd0yYbI1Fb1H8LjKzeZx9gOP8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T757FjmYobQrY1u0+WEX0BCJRkswZKKFjOHzJGuY7UvteUtwbt9Mu5PRogvlrKfJX
 jCTc4SI7valmjZEgK+JD7my5B3MmVx2T956IafAFIQUeEG/zChoc4gqSLedtLX6sZm
 zFCRPtNIQmokDNbp2Kvo76L+Tpe0duR8OOaYZzZG/wSAyBOkrM+f2f8iX3Mv0SWPUn
 /6pvlcTPrsvVy8E7Z/6shQe6tDSO9Vuh9sxoYorH3BFoFTHrvX3aOvE4xe0xAAOrCX
 k3BacLC6yo/++je5RBuWVrb6FmoWLx3QrlrmwEAv5ceHtqQRB3nS+lu67ZJy6PL+aF
 V8+vnjBisx+aQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T757FjmY
Subject: Re: [Buildroot] [PATCH] package/uboot-tools: bump to version 2026.01
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

On 18/03/2026 10:27, Manuel Diener wrote:
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
