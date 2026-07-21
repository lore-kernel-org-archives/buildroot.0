Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78893C4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FDC960611;
	Tue, 21 Jul 2026 20:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oqxor6R0bUA7; Tue, 21 Jul 2026 20:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 382C560632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784664234;
	bh=bZLeECy32djETnP4ak+aqIDlbGBLpSJnM9CqjHf5hf4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PzsEHaZBxmsp4GX1zZAU0JPcrtR9v1IMtQeqmmMQkSGGwY58p+RTgty7PGyP6Wg8b
	 M6h1/fu8SN2QMT32NMNsn9/Cs8tEMefSIaX8e004k6j3NVMok2sUAxD7XgzDoQ+g6m
	 VvSuVdZfOlM23r1EbQjr+mgCL1HDXCeP/YfEpoDvQYGDTvT3Pq+Lk9gmlGcVRWywmP
	 BUzgVDVhaQksQtjGjuVitrmx49Mo5XukCfab6KrNY57eLfIpei5Eam0hCPruBxd+it
	 nL/tTYiHtveFtQdYuiA0giQVH+deE7S+Lei1XtMe9wr9Oq2lhB4Dlf1YdRpgFh3NEA
	 I7ioUetJBNs4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 382C560632;
	Tue, 21 Jul 2026 20:03:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E2B042A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0429E60632
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfftjtiPvXcp for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B7A0660611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7A0660611
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7A0660611
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:03:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id DDB7313F86E;
 Tue, 21 Jul 2026 22:03:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Jul 2026 22:03:47 +0200
MIME-Version: 1.0
Date: Tue, 21 Jul 2026 22:03:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260721175941.76461-1-bernd@kuhls.net>
References: <20260721175941.76461-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <f8324719b27c37b9c7d2fd95d66ea0e4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784664229;
 bh=8AGwXzgFGjnKDqb7pcFcv+VVmfjH5hep9sp+H2DFoqo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CxD1YKcs/xql6/7BHcIRuG1oJxrdPwAY72jzAplVLauNhbhWl2Ew82jM/p4857Hkp
 CweL2xCxKCdyb6ocan2Fo9dUo2jAgHqFIwiVg/dS7iUQMn6KXUVgLgFxrjrm8zQHva
 x7hTehMhUSlny038BtbrW/lFUSQ/LJmXiJ9f8XWsypd7mJ5Iepk8dlImE0V1U5B9Nr
 tHj/yq1gnp/Sxt9spcbNhkASAo/rrmi9nSZNV9xPE/FxykyWwLv69IQVcRRWtOEwhr
 0ChDDPqz9tr1jelea2JDFIfhWO2Hv8+AJ9OdqlxaTBDLT1/csvd/4bT478TJeVi3PR
 KLA0NDzfhOntg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CxD1YKcs
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: security bump version
 to 2026.93
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

On 21/07/2026 19:59, Bernd Kuhls wrote:
> https://matt.ucc.asn.au/dropbear/CHANGES
> 
> - Security: Fix a use-after-free in X11 forwarding that could possibly 
> lead
>   to memory corruption. This is vulnerable to authenticated users if 
> X11
>   forwarding is enabled. By default X11 forwarding is not built.
>   In 2026.89 the server is running as the authenticated user for X11
>   forwarding, in earlier versions it runs as root.
>   This removes X11 "single connection" which has probably never been 
> used.
>   Reported by @peter-pe
>   
> https://github.com/mkj/dropbear/commit/882f83806d5e133037cd28e954a878984ef7b9c4
> 
> Added patch to fix build errors which would be introduced by this bump:
> https://github.com/mkj/dropbear/commit/86baa66fc934bb55a911eacec28d93d86fb0e6f8
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
