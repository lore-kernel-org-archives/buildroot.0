Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956B8C87FCB
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 15:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6808F428DB;
	Tue, 12 Aug 2025 15:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0D62jKugoEfq; Tue, 12 Aug 2025 15:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8698B4290F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8698B4290F;
	Tue, 12 Aug 2025 15:56:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E140183
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B39641BE0
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyT4BVi370Ti for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 15:56:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A181403B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A181403B1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A181403B1
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:56:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E1F9219F73B;
 Tue, 12 Aug 2025 17:56:46 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 Aug 2025 17:56:46 +0200
MIME-Version: 1.0
Date: Tue, 12 Aug 2025 17:56:46 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250812061408.1187401-1-nemaakhilesh@gmail.com>
References: <20250812061408.1187401-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <9ecbf5b804a58e4d7b03ff4d21851294@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755014208;
 bh=FwM11xyXNnchAdQ31nwDXOFa63DNnHB0b4vbkmDPskk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IRodvDHjLQxNUSfdqr9MSZGqYCoy3EKUnRCREmuqCVOe2I71NSXu5bECAKvfw+aGu
 79hgUsyDC05vCZm/3Lr8mXZmyP2sbxGiJsVLodehz8nfmyA21peq95Lu5100IImSwI
 ijn1ztEDEP2Uxi7A3kIeE8i8AhcXNseteTBrQ+WiO1XlGfyD2b1tLJ6mIfFLNyglvx
 l19gSJTghBnEl+wt3MdoyIGOicyoZLfLBo6jl5/+gFW6NwWK4zL68GNaUI4Uj2kOAi
 6sv06cVPesEgCPKfd8QfoY0vgaOnj84uAi3NhwiJLNlT4YN3TyQKKzeESeihb6Kue6
 rd93B9Pjmx39g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IRodvDHj
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.398
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

On 12/08/2025 08:14, Akhilesh Nema wrote:
> Release notes:
> https://github.com/vcrhonek/hwdata/releases/tag/v0.398
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Since this bump is mostly data updates, I applied on master. Thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
