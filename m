Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4911061B1F
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 20:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87969408EE;
	Mon, 30 Mar 2026 20:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F92a4v5Fp3ek; Mon, 30 Mar 2026 20:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D45F240857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774901273;
	bh=ovUEV1M3/Y6KT1zu+s1fRdj/V+WH8I4qCrIWOvl7Vew=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kRfVH9WNVg2Byq67Tm5zRj13B/T0Hl7Yt6LK2AbVnldn2Rqa9oPXltw+3hXGlFvyn
	 //q5RFelZnR56fZA77SHpZHSoTikx6hO2waMvdLIy9k8DTKJ43zBfxHG/eAtxE1B9+
	 R7+Y3DthLaym0lGLmFIyhyf3HdMaUQ/Wa1C4fuleb25+aagXcCsGFnmGXCrPIZwvvq
	 CTMpKkll2JRtc9XnTHNV6qauGRGgLe8UblTRxMaA2gUeP+yH1l01lGLoLl/AfFY/r7
	 g5GFZOXNHIrSjkrMCUTLAxZ4hbo+CQ38n/xQZkczzyiifNzO4E56OxuFb14EEkvvtE
	 +/gfgareX6ZTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D45F240857;
	Mon, 30 Mar 2026 20:07:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BDC44D2
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 20:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D4BD81C20
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 20:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UpIm3GJ274ri for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 20:07:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F2C381B53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F2C381B53
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F2C381B53
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 20:07:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8BB062003C1;
 Mon, 30 Mar 2026 22:07:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 30 Mar 2026 22:07:46 +0200
MIME-Version: 1.0
Date: Mon, 30 Mar 2026 22:07:46 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
In-Reply-To: <20260330150605.300571-1-titouan.christophe@mind.be>
References: <20260330150605.300571-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <0099007f28d9e7056ec8c742fd4f7dca@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774901268;
 bh=pfMrbYPuONmOEOBjk70BGTkMSMWSSUPUSpxp9oCgTNg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NceY6J9EDsZre2a7MPXdkkNVAb5qj6/x5eKiHc+KvEdAgWlSXc8b0t9KifVLYJi+h
 QWKJ7t2haQ4y4JwswyMlbrsakuw3jEmnsjG+TJs+GUy5AHxduVh4aAqDgWtRHCLxkn
 bu4tl9DvnIzdy7MwA0aKsKJH8gk/+DFc0PbYdcZ6toS8nc3N3y3l4G+rSklCeTm9Js
 MsY8TWl060bQJ337s+kUtlOlz916VFrzqEpswPG2PnPG593w3ylHsuSEHfRv2KHR/u
 Le++tiqeXJqv0U5YdtYuLoDCBqouqIwcReMiTRx5vw0swhn6VssE/A3oiYy9ceYFG3
 8FxClJGSRVF8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NceY6J9E
Subject: Re: [Buildroot] [PATCH 1/2] package/cpp-httplib: security bump to
 v0.37.2
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

On 30/03/2026 17:06, Titouan Christophe via buildroot wrote:
[...]
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
