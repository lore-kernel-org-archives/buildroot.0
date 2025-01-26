Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F53C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 10:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51BB881412;
	Sun, 26 Jan 2025 10:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbWCYWOhVb4G; Sun, 26 Jan 2025 10:28:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DBB881414
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DBB881414;
	Sun, 26 Jan 2025 10:28:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22F55941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 108C16088F
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApljUEhxalmF for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 10:28:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2577260855
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2577260855
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2577260855
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:28:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 588256013B;
 Sun, 26 Jan 2025 11:28:51 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44068])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 11:28:51 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 11:28:51 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250126083040.629018-1-thomas@devoogdt.com>
References: <20250126083040.629018-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8b7ca2891411bfa306cf291862526086@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737887332;
 bh=BB8mBgSo5cW36cyz9x+WFpHtt1U8e5buvoHFgHLzelg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MMDyENJf8PQ+FV4CPGhbkqalimkRZw6Lu0ZAMM/zoAJUKX4XC9+QsG1amyMYU2/XY
 mnHubSPCClUtMnrSKkezHciJRKRabqFt4T312a1Xr5SIC6BhMZFqcC2Dm5siIWVbhH
 Pzya9h+OOEonRcdx4TGEqmTFmzpEWsRqruSDVEODUaUK28ypEcxF1hS9wnv0Yz4RyY
 RmKqsYIlJFaIuYeO/+c/I6W9yFDycaKkDaNaY9rY4TQlsOCYBAUs2yVuIO8Ifp4KLc
 6kwWGa230jFiZ5szGNqY4cQF4bpIHEUvA8dN8HYOhZG+PGLTIL8eZx6PCxIB1I7JB9
 clibfCR6/AoAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MMDyENJf
Subject: Re: [Buildroot] [PATCH] package/fontconfig: drop the util-linux
 dependency
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

On 26/01/2025 09:30, Thomas Devoogdt wrote:
> Commit 67089f8c11d05147e3def29e226c13a10e913f76
> "package/fontconfig: add util-linux mandatory dependency"
> added the dependency on util-linux because of uuid [1].
> This dependency was later replaced [2], so drop the util-linux
> dependency.
> 
> [1] 
> https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/7b48fd3dd406b926f0e5240b211f72197ed538a9
> [2] 
> https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/c4324f54ee16e648ba91f3e9c66af13ab3b1754c
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
