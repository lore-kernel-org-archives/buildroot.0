Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6E4C02183
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 22:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75AEB611AD;
	Thu, 16 Jan 2025 22:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnt51L86ZLBJ; Thu, 16 Jan 2025 22:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91311611FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91311611FA;
	Thu, 16 Jan 2025 22:45:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6646331
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5393360A4F
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RoQmzp1Q7Gh for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 22:45:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 70B9260AFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70B9260AFE
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70B9260AFE
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 22:45:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C69732003C1;
 Thu, 16 Jan 2025 23:45:45 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47746])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Jan 2025 23:45:45 +0100
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 23:45:45 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250116113039.573702-1-peter@korsgaard.com>
References: <20250116113039.573702-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <0552a70694f9086915a7fb383ae39486@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737067546;
 bh=il6yqlyCe7b33IvF2cw7JVP1gPuOPJjcH2twUrYktgs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vVgW3odIzJb9BCjQpZVf3e1DqXsm5oitMaipa/r+miMFozddWYfknWSi3XHfOikIW
 1ttkSBU31a/7sfJcMRdGeuaqWSBFfofWEgo4H5tlvOuzrViFoo2Gr7qpHHMisHk3Ze
 MpCA4CX4jkqAG31TOAJ2jAuVUD7ta0959yBqsPmyLpznwzgKZK67gNF++IW4MCZpDI
 BQzQWoOQT/+eba2dQ9OumCFL2S46a8/87fgOMz2eIilhldxtcPFnpVjph4Hc/+bTBc
 aGqWGgnwk6WsX+WriOhjatKE9pmYqC6zKrXQ69WqUNmbJ4Hlq47AQtpe2DLAACm8l8
 8a4yY1FDtxkxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vVgW3odI
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to version
 20.11.1
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

On 16/01/2025 12:30, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2024-53566: Path traversal via AMI ListCategories allows access to
> outside files
> 
> https://github.com/asterisk/asterisk/security/advisories/GHSA-33x6-fj46-6rfh
> 
> Release notes:
> https://www.asterisk.org/asterisk-news/asterisk-security-release-20-11-1-now-available/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
