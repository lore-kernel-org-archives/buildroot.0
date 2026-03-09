Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456FFFCA187
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 20:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1238E612FD;
	Mon,  9 Mar 2026 20:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIX1OoNO4OHm; Mon,  9 Mar 2026 20:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 069946126A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773089697;
	bh=aROI9VTiVUqJwSCorVhoDThfxX1iBlY+DgxZSxe02Xw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=isF/ytWgX4WM97Lz1qwW4FAczBBNB0t9UFkEwDnxL04t3FLiZUP2ul6ZR8O2ZOgoc
	 fr9ZNYtAQXsuAM9v70KJgaE3rTwD1zmifOQfVTLUU4whG6CV7eEE+IrJNRibNpocsa
	 2QUuZrEynTry9zhjqvSJhVIGkvb5IRczQDQXoIJd2XZ4UVP4BLMtIWyX8LhqmIXB1j
	 ZYpxDxVue24bXIskQb7Man1iqnn2HL0iQDUTytMOVJoONfT9Ecu2OGu+vVP6I0P3kB
	 nzPVGmoEPCTj7BDs/N8qXDrBPTYolzehmdviu+h1IqE2/GiQoL5O2aPhJf9OoMs5zj
	 QSiIKnmt1hlWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 069946126A;
	Mon,  9 Mar 2026 20:54:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC205B8
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D980060877
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spSlmTSENiLm for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 20:54:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD50A6126A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD50A6126A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD50A6126A
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:54:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 21FD5B0055E;
 Mon,  9 Mar 2026 21:54:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Mar 2026 21:54:50 +0100
MIME-Version: 1.0
Date: Mon, 09 Mar 2026 21:54:50 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260308103044.1719833-1-bernd@kuhls.net>
References: <20260308103044.1719833-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <50b941c3666dd0e285cfb3d3b0f225a7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773089691;
 bh=7QpROAOZ33bkbTAITQPY9Pyew6BSo48Po7GJDju4CZY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cFqXKWdYjy22I4UY7LyChYkeEJCZm5hYLitTx97j9UFK/Yj4dQObL29D+ZYwNccIx
 uusx+La0A6OM1EpPIaSuoKRALgNbczNfSR7kYqY6EhwwJ15QffqIqgV/muT5J3Izcd
 N+h6PyN9jEADlK4BxAKeTurSRH2+cDd+0xKCRHlPoaQDA/yQsc0SVY7KFVhJFtzGLb
 VQTVSiUIYEjV5SA2JGbdRE6oJwhfgigDSdoAu1t9u+gdHSvz9oCgHHn4nQ3zOB/Sew
 +aGKktMtv2Tuz0kGFl0KuErCCKmNLWcRkdn+hw5X8xpIyv+wPF8m+tiUEECc+l8ZKM
 D4m/aUbLStOaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cFqXKWdY
Subject: Re: [Buildroot] [PATCH v2 1/1] package/e2fsprogs: bump version to
 1.47.4, remove autoreconf
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

On 08/03/2026 11:30, Bernd Kuhls wrote:
> https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/doc/RelNotes/v1.47.3.txt
> 
> Removed patch 0001 which is included in this release:
> https://github.com/tytso/e2fsprogs/commit/4aba12dc19a95626eb7fa1df2d19c5235c2bc848
> 
> Also removed autoreconf and its dependencies which were necessary for
> patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
