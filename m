Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAC5F01834
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 12:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC30541D68;
	Fri,  6 Mar 2026 12:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9KG_3uur1Zj; Fri,  6 Mar 2026 12:59:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 272CB41D55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772801983;
	bh=Fif/mOMCXaGftAbyav8dDZIc8OmpMcUGUPihYwK/WE8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pIxAsCET35RcM3eU/aZtpacTtqDimrMysJdqbYneRDa+3POyjN4wN5JxScgw9C7Yz
	 h2Lb6/pPiEAXQo12dW4NWo8+3pMv/o+grOhWQ6fxmDkps4StX6S9gVFTgoQSnhNH3B
	 6v1w8V9Fmxbf2U2KtZzjUMSxrt1foce6dwzviuidNlMRfmTHThdL0O3aPab35YumNt
	 DaAO8hfMDgF6G/maVlUUGJZi6ViPOZzatiOSXg3OAIjDnCIvrvBIsy0ahLsS2XjqMT
	 68h+WLWzuBRVPnkT0W+gmPM43F6XVAlq5U9pa1yNcSxJ9bbudJScNC/8yJbWB1bKcS
	 k86dzRsUW3ZBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 272CB41D55;
	Fri,  6 Mar 2026 12:59:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5445223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 12:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2B2F41D55
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 12:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NtoKvc8ixTEk for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 12:59:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 413CD41C59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 413CD41C59
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 413CD41C59
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 12:59:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5A94A2003C6;
 Fri,  6 Mar 2026 13:59:35 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Mar 2026 13:59:35 +0100
MIME-Version: 1.0
Date: Fri, 06 Mar 2026 13:59:35 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Jarkko Sakkinen <jarkko@kernel.org>
In-Reply-To: <20260306074106.124068-1-bernd@kuhls.net>
References: <20260306074106.124068-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <8bf2fda2bd88ca7932c3140e7954a512@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772801977;
 bh=Ls/SH/ZM8NYMs3upmoM0BVetPWy1OHPoSFJ85h7glGY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g7tuzutlzmZnMRRfkAHUnNYwL+UyjYK0OSjwgLDoG/7or00Dd5wsxVRuCUex/ouKX
 alSqkHMDnD/4eQ4fyBtdtumZrpGORA1AXIrYy9UDk60Kb6m31vjiLPGVE6c0fXT5zX
 zQ4S9ZgDF1oHaZmXr6zFK8pLFKMTlqeSDQlv1SZBBLQoY/YzXSW/uCDwl3uDO0EcQM
 iO0LwwiZQeGQ+4G54IO2555FedJlW4uJ2JA8xuf1ugVSMtimzv//4sxGt3Ghb6wU7z
 N6a3TNurbrplq8SwsnsCCu4bDFmdoReReZyinGSRtx9htXzCMMrNFIfePBBaZBk0CC
 F3JaBY+FQwo2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=g7tuzutl
Subject: Re: [Buildroot] [PATCH 1/2] package/libtpms: fix build with host
 gcc >= 15.x
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

On 06/03/2026 08:41, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/7a6/7a6ea7c513e8f1dcc32d868108bfb2a907d6fe85/
> 
> The previous change to src/tpm_library.c dates back to 2024:
> https://github.com/stefanberger/libtpms/commits/master/src/tpm_library.c
> so a backport to buildroot LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
For info, this issue happens only on hosts with glibc-2.43, so I added
that comment in the title. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/f773fd6787491af3c98ae30f5683b8d7a431b0e5

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
