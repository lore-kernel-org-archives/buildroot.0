Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B62FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45D8840E34;
	Tue, 28 Apr 2026 19:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMLCMIyDkJF1; Tue, 28 Apr 2026 19:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E59B407E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777405530;
	bh=q/z89/WvhcBwMJI3gwcRxwwbLA1ChNbnyARddh8AAGY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LEiT7ZPwAUrq5BCKE6j+4zWP5Tk3HkcM6JDOlTMv+iNC1Selnt6CfT/WS8297qqzQ
	 yi6p5sOUkJaxRAD1kdPrWTOI3ievL4smtvwnwspXnNxwW3WqoONjRvY10zjF7x+iUU
	 PfUjDbsmX5V6Q1mCGQQ6XJdiKWyrvkr+w2nYBhEFxCQ3WkX7SmZAgaZVdgBFYIBJ84
	 1G89yIB+aoUcyybHYcB+6Q/9NzzU9on53i89fvQaFIFhnQ002wMOK5NWuLUvuf0nlU
	 FeQ52HUdnG7r4I7UR1r7z7YV09qDxf22h6I9/dshsC6vm8va49xHyqx7eH/oOqWvZS
	 4TjQoRxAeG6VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E59B407E6;
	Tue, 28 Apr 2026 19:45:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C03291B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1ECF60F18
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xUmwbYprlgrr for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:45:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 05A1760F21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05A1760F21
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05A1760F21
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:45:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E5CB378034D;
 Tue, 28 Apr 2026 21:45:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 21:45:25 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 21:45:25 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260428095056.3024331-1-fiona.klute@gmx.de>
References: <20260428095056.3024331-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <79c9c133c36c65fbb24c8b1170fcabcf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777405527;
 bh=vT0+sg7MiOwnmi018zVdjjRxNW7DYjor45zkrvhT7hw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FFTK56yPjHmoE0mumP/QxarAzb+Sqdoy1kMWhP9rU+C0uAKwYlMSqW3ZLrnQCGAgX
 ETRVeKjKqBLk2hQQe9TgKMLtR72FCRkwj8fZYErHoFteXI4KTGcUYWh0oZ3FjkEQwg
 kYia/aRiPG/jU1ejMa/nBAehT6LJB0bP/Zx/fwVNBK6wmcin2HwZT7kusk/jQwDtvn
 wZdYD0GEMeUwO8NfARkRz53o2DZ6BkDy21u/WCbFd4tMd2Awx7ZIRZKDveSd73K1Mx
 i2UsBDfOUCUW9184VcvUtn8KaopdgMGs/mDpDcd2g21FgfsxRj4wm9QMYVlG53JVNZ
 cGgyH8iY3KHDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FFTK56yP
Subject: Re: [Buildroot] [PATCH 1/1] package/initscripts: fix check-package
 warnings & indent
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

On 28/04/2026 11:50, Fiona Klute via buildroot wrote:
> No functional change. Add package-level .editorconfig so indentation
> matches what other init scripts use.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
