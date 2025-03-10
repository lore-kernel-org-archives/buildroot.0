Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC41C282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 22:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5410560674;
	Mon, 10 Mar 2025 22:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0a7E7McbW_yK; Mon, 10 Mar 2025 22:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B40C608AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B40C608AB;
	Mon, 10 Mar 2025 22:55:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37C15AF7
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C07881161
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7KPygr3gzPa for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 22:55:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 38B0D81173
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38B0D81173
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38B0D81173
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:55:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4506C19F57E;
 Mon, 10 Mar 2025 23:55:05 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Mar 2025 23:55:05 +0100
MIME-Version: 1.0
Date: Mon, 10 Mar 2025 23:55:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: Benjamin Kamath <kamath.ben@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250310003721.1642270-1-kamath.ben@gmail.com>
References: <20250310003721.1642270-1-kamath.ben@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <f0c780bfc47a7974b56b9185b0e8d7fd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741647306;
 bh=YZTTIbzu3mK75MK8dvTFN6yMhI41DHgpwwlCGO1FiXQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ACU6EkBaajLZBIx9AH+1hlCmg0BT1x8qijVnFj4b4NYTEMIkVekbGJnphzXsOFC7L
 UNXtGNcBU8cqtRZlMDwIWPUvO6tcxfgczNrpJX0MZGMv2H68qybzuR413s+VVQbM/0
 A12vlMTExpWSlzw053BzE5w/LDpARlon+Cds4F8BYClHqyyMr3tglOGLTGq7md4mij
 /31FX+y4MmoibWsmCm108ij/bhuxatfn2J6Z/EXZwy8p6I3y2gltUy2mbtImltvawX
 Qf+U/LvMw1SeGEaw0WzbaJyEt+juWsEgnKBLFIHQ79iCKcRas5/u/gER9esIhDqUh4
 +xGvoO2UwUzyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ACU6EkBa
Subject: Re: [Buildroot] [PATCH] package/lapack: bump to version 3.12.1
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

On 10/03/2025 01:37, Benjamin Kamath wrote:
> Released in January 2025
> 
> - Updated LICENSE sha for changed year
> 
> https://www.netlib.org/lapack/lapack-3.12.1.html
> 
> Signed-off-by: Benjamin Kamath <kamath.ben@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
