Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD56CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F32F407D1;
	Wed, 17 Sep 2025 16:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4p8e9p89NEC; Wed, 17 Sep 2025 16:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DEE8402B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DEE8402B8;
	Wed, 17 Sep 2025 16:48:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60E3D279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47660406DF
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ybxqb-aFxmhR for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:48:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C9FD4020A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C9FD4020A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C9FD4020A
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:48:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 442DEB0056A;
 Wed, 17 Sep 2025 18:48:48 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 18:48:48 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 18:48:48 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250915235915.2456063-1-james.hilliard1@gmail.com>
References: <20250915235915.2456063-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <16767e97944162b54379a3a572c55911@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758127729;
 bh=ggj602a7BtulxDu/gLV8cXYkXx/mlEMXV49j3eCqjNQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i1MXC/zoOsiXwJU79Kmmjfu4/XaNJNFO2q356eNGET9fGAuAqMGRve7N1sxjHLpUv
 1fvvHx3PM5yZM0qp23r+ACe4FUOJX/EJ5O5v4s1BDTiRf5yrJXuqPqIbZ/dO9UyExL
 T6PKMGQ+qp5N+CTnut82zGdqc/SVkg8LZhfX2DrvhJO1G3YkkKsStyYyCgaRpW8qRR
 t3wu8pibRIDFBYiwYbnWHA0UL9Sq17QBnzNQoEU9q682ZW95cIOn4BlKWW0Fx6dIJc
 Sg9SDHUunaVpkKf8TMUdrfJtIUt8FkD51vb900i6q+OD+SUjX5xl79jVgQ0rCzmsr1
 KcsdA50PA4kag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i1MXC/zo
Subject: Re: [Buildroot] [PATCH 1/1] package/python-httpcore: bump to
 version 1.0.9
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

On 16/09/2025 01:59, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
