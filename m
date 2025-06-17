Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA40CC71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FA95832E6;
	Tue, 17 Jun 2025 19:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEh8PU4fLvcx; Tue, 17 Jun 2025 19:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D98CA83312
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D98CA83312;
	Tue, 17 Jun 2025 19:16:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42B5DD79
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 347C161006
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLTx4V8vjVwg for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:16:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD32161007
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD32161007
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD32161007
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:16:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9B7F7780395;
 Tue, 17 Jun 2025 21:16:45 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 21:16:45 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 21:16:45 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250617131250.1005533-1-dario.binacchi@amarulasolutions.com>
References: <20250617131250.1005533-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <624c2cca6ea826e11419c7887f502691@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750187808;
 bh=cmK/bEV7f3tYUq5Co30+zfn33aGxEvCywbcQ+Cv+EIM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=thzmZUSakbfkxO61Vll49HpSb8Z5HmbDWnkjrrkitnTdZtgYapy+gb3JmiKjypvc2
 47LUiDInwf7QvPDeXZlJLcEpymeAnEcLfWznJrd+1EcqkJ2QaTky7LkDGaxQQQtuJM
 pTaHwpWdnqNpy1uDb9XKSo9wjF6A5DN3X1oUDMqYbvs/OhpLFRPp89gn3dJ39yelVr
 kwcOcZoB0XgLoGURsujnG3llFT+IO1vpSqMRYox8cBnUMglU7LSVRb3d60vmKWbo45
 Sr981Bu2xnHPDikpfa5A9rPfhbRlNHANmxi1DfPPGNUVNNy5luCJUKWU+AvmfikKxn
 Dr8X1++ixOizw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=thzmZUSa
Subject: Re: [Buildroot] [PATCH 1/1] package/ufs-utils: bump to version
 6.14.11
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

On 17/06/2025 15:12, Dario Binacchi wrote:
> Release notes:
> https://github.com/SanDisk-Open-Source/ufs-utils/releases/tag/v6.14.11
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
