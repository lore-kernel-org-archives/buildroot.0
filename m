Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9357AC36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 20:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BF2E607A4;
	Mon, 24 Mar 2025 20:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAlALUuumIvb; Mon, 24 Mar 2025 20:30:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 842E860811
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 842E860811;
	Mon, 24 Mar 2025 20:30:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0968EE0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF8D240B25
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Ub3cMrkgB7s for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 20:30:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 39C5A40B6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39C5A40B6E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39C5A40B6E
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:30:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 52A4F5FF95;
 Mon, 24 Mar 2025 21:30:39 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41176])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Mar 2025 21:30:39 +0100
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 21:30:39 +0100
From: Julien Olivain <ju.o@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20250324070924.162291-1-fido_max@inbox.ru>
References: <20250324070924.162291-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.10
Message-ID: <5912313f9f6975f1cc472c5c05bd03b6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742848240;
 bh=BCUhyJR+YD8R7/4ea7bwwzk4a2Arqbd7O3qZDnpbvpw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pjpay6kUd3TiMyiw3eScCSeNeDxEixKC+WkYM6PYgwumocGaIRhhQqetEu2eA6DwZ
 1nujDgGdXjOhAmgmsRgUtAmSpLkfLWSVwOxOisPSrkPsl0qo/fk2hLslehHyPPszlT
 hZ7AERVTkQ0RswMSs826nWuL6eARO0M7bJYzLNaVTyUUC0pxlFneeqRhquCdn0Bywc
 QvXA456HKgBjVz202q/5feRXz5TLyuqDUczf0+cQRPWmFbpkvcOVrnGv1fNJDHOycp
 kINzjISUiK1bK3dvTsS4FlEM6gGnW31K5MWogewd4f73LDvlVvTj4VWlUmoqr18yRu
 FRQrEJSx34ftA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Pjpay6kU
Subject: Re: [Buildroot] [PATCH 1/1] package/libosmium: bump version to
 2.22.0
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

On 24/03/2025 08:09, Maxim Kochetkov via buildroot wrote:
> Release-notes: 
> https://github.com/osmcode/libosmium/releases/tag/v2.22.0
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
