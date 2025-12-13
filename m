Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02120D5B15E
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 18:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6541C8056F;
	Sat, 13 Dec 2025 18:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxMQE2yCs5IO; Sat, 13 Dec 2025 18:14:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91C7D8224D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765649660;
	bh=Dr9H5jzbK2Ni6YHRYqlNF4xwbYnjztG7CzOQqkUc3Cs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PYflTY0OkblDWoA/Bf8ouPIiKUx7jJRxUaDPm6MrCteUZ2IFTq+AtN2DphFjwJECw
	 6A7aKCohU99bBKTH5FMYOHtiaHElBsZKRSyFqll9PrpbYFhTm9Iioa2WsZ4pszyZ+l
	 xbtsqEg+lvU6mwyqwLUS+HH380OZ3wZCuoDqFwwNPedrmNlStPuejGsChJR3d0jA1H
	 +RV7nYckuHfVSOGeN0s7vq+G8S3puWfwcEgiDlFrZWsdkdeAmVQVqJPulhFCCFre82
	 ri/ppgsckWTvmWt0eWZXD0aY3JTSa6P9mV49qxIB0phjWTZ9oGTW4wx/+X0oirJhL5
	 0ObFrfvvmjkpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91C7D8224D;
	Sat, 13 Dec 2025 18:14:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4539013D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37B8F409CA
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQ3cGxRLtlPJ for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 18:14:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68475409BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68475409BA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68475409BA
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:14:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3BF8613F8A7;
 Sat, 13 Dec 2025 19:14:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 19:14:15 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 19:14:15 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251208104139.298567-1-dario.binacchi@amarulasolutions.com>
References: <20251208104139.298567-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c534bcd87dfba520ebd4adf7a936458b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765649656;
 bh=b1JIWQr7WLM8nHhTZbZjrG4Y/i1WB6/iNZlsAtlk/js=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bbWZVri5dwtNmrzFPSnPRG4CXkzYt+qePs4HMSQSnlwah28+pxHYE6DiUcUd1n8id
 OyzrXwnYhnQw9BArbMk1f6dVakw5/jY89HFVZjFSEnvPHfwBrFkpIAbPeL4UhODsG/
 Pl4MqQ2gG1mhz6zl4e4wGne3nPmn4TooDwulyCpC6NjSCHlaC+1abw/Lc3Bxlr0+Ed
 Afvhz8LnHkRZm1Px/pxtDmq1/mzI1IHYFgV72FIQQ0UlvkHiNZAjgj5LN3N7fcMbg2
 LiFugXnrd3i6wZyHbIWdHwpUOM9O+G8Ah8i9Rb828Ht1IEVKRlgbupWdHQnzZus7rZ
 70PbIulf6PHqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bbWZVri5
Subject: Re: [Buildroot] [PATCH 1/1] package/pocketpy: bump to version 2.1.5
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

On 08/12/2025 11:41, Dario Binacchi wrote:
> Release notes:
> https://github.com/pocketpy/pocketpy/releases/tag/v2.1.5
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
