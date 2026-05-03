Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1750CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 17:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F027F61195;
	Sun,  3 May 2026 17:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbXVzRum2zdA; Sun,  3 May 2026 17:59:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CC7D6104D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777831164;
	bh=mVaYuqiSpwgq51lkhMu7feDF1Co0LvUqY/tIWaj+PUM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CLhwGvcIG0J0ICwIN+YLiTGzZPUhTbJFhXLtpUbOe3KIrMt2m+7m220idxlnKhTne
	 TukNUAVODJryuj2DgrXMFqFuZzbleUqFyb6XbV0wvShrYa7jd7UQsmRVX22AbwD1qV
	 8FLhSaYqDxt1m2AJnHRHFM01TlGHaVrVsNLDjENGNoIUpgfwgg5FugjOKRJwsk5Lb2
	 hbhK0ALuzlXLKPj9luor8jO4yxoE708Ei2lBkepeWUdaqUx4aeqvicPSUMmbbWsJgy
	 vuEf9gQ/WuIaN0Nxh00KxRmpjrb0/+f8X8kIwr9W1vR/ECyFE6Nv9qKfAl749pMrNM
	 ZiEAoKS68iI0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CC7D6104D;
	Sun,  3 May 2026 17:59:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16CCF190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F08A084228
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxYowjI6b2Mp for <buildroot@buildroot.org>;
 Sun,  3 May 2026 17:59:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3205884226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3205884226
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3205884226
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:59:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0835A13F8A7;
 Sun,  3 May 2026 19:59:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 May 2026 19:59:18 +0200
MIME-Version: 1.0
Date: Sun, 03 May 2026 19:59:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260430051539.2272625-1-bernd@kuhls.net>
References: <20260430051539.2272625-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <a923f3e007f3b18adc34be3c8b37795c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777831160;
 bh=Ito/wM4RC6JiCsCT55LaTzu/hmJg2vcxXAeLj2l/e90=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fXTA1Ri92o9rsHRcw+CxrAjwW2UtTLTcfm0rSpcv5Ke8IMVA7gCXWZ6mRsl6jEWJF
 aysHF3joBRhCr8juWYMJDYhpMPJ5J6xkyw/sbyjT18W/Q6WDJEA4jYSmkIZaIb3jCC
 kkv+3B5Tvs8iy/ga9hkG0VuE5OTmUN9cHhwtB/0HAsXnTOiQtIkq1utU4P9CMSXVDi
 MoxdNyuXX+++XJAGEtPcTqDzMG/jYzCzhqU5qdOLmIrmWg52+7k5wkLm/Mdj0troZx
 SZUemx1hJhS02f7GQp7MH0h+MtGBDCsNp/QdTUzzabejmKwfKt+2NDdBH/lNprn/U6
 pvS7Mvrvd2iFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fXTA1Ri9
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 7.0
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

On 30/04/2026 07:15, Bernd Kuhls wrote:
> https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?h=v7.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
