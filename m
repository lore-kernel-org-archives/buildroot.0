Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF38C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 16:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C8266067D;
	Sat,  8 Aug 2026 16:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7ki4BvG1nRR; Sat,  8 Aug 2026 16:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75AEA606A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786205249;
	bh=6F90GI2sT5pmlrpfMgZW0BixTVMt1Yd8BTRDBo3togI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bXtUHdCNiN1Ky5M5mlsfN3Vto00AEizLoNugUCAkwjBVg9uEcAvlDPsAxXZB6OA1a
	 R2lpRB0JFb+m6EIxGkC3hvUAiVnqsvFigNjrPEj0TOJGqXGTa+tFaPrWseENkhh2pH
	 mG/2l8vyER9Wu6VNMWHaj63tAjvcY0zoMShMhgICwGNDaZgzMAQTnneVJT0mem4Z3P
	 bd6WhZFbVhQvvzFGo1GK5dz6+Aasowuv8PdMPNMjRxhE5rvQeowbsO5hsUl9PcVQjx
	 LJVJaKZZlTuHoTlT+9vX4ZKRvgSXsv6RXePprslx8SLX6aXyuzUyzxFOtQlr4B67am
	 SR3gXXViH/nzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75AEA606A2;
	Sat,  8 Aug 2026 16:07:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02928218
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E946280E1C
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCfTPWYoFO04 for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 16:07:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0814F80E1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0814F80E1B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0814F80E1B
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:07:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 83B3D13F86A;
 Sat,  8 Aug 2026 18:07:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 18:07:24 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 18:07:24 +0200
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
In-Reply-To: <10beb0cd9d3809081b3800620c88838d112d5f93.1786079390.git.baruch@tkos.co.il>
References: <10beb0cd9d3809081b3800620c88838d112d5f93.1786079390.git.baruch@tkos.co.il>
User-Agent: Webmail Free/1.6.17
Message-ID: <5b6b558ebb476f6c37058a1c4a4602f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786205245;
 bh=6vyY33oLpLUtmVj/fDtfE1h+DsoaaxHl7JnI0e8WqcI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gR4DVZ/BVz/dGLYSk/CLOgodM/iywTayWmRsb6CQgL5TLk+hmUCHVq/2ek6fB3m6q
 qbLW34DU87fa6WbMMW1/bdrsw6V0d2L7xfmVqFwRmf0GShvXlJoxLi+1o+rpUN5zHJ
 vr1u4Ns9wX2VkvN0SKZa0+CNXZK3GkGqhH5Rjhxbe6jav63EK25caFIwY7Fg+m+Fj/
 d6CoQtWJfvmIYt7Lf5QA6ks2eFpqba8ysVPsd3jYFbod1EDm6AhGnEnhMzA55IyOP6
 OiDZ2sjDzpPn/3zwAZTGTSOBf6wiSVCixb93xnH9fIWv7O4aEW+/eL4+LelWhxQEpY
 gkN6HVCnc854w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gR4DVZ/B
Subject: Re: [Buildroot] [PATCH] package/sexpect: bump to version 2.4.0
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

On 07/08/2026 07:09, Baruch Siach via buildroot wrote:
> Changes:
> https://github.com/clarkwang/sexpect/compare/v2.3.15...v2.4.0
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
