Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E18DCAC5A0
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB84641334;
	Wed, 17 Sep 2025 16:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mi0fuuZWv3AP; Wed, 17 Sep 2025 16:54:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9960F4053A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9960F4053A;
	Wed, 17 Sep 2025 16:54:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7AAF199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAD414079C
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9vOo5XOd2Px for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:54:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C2CB340725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2CB340725
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2CB340725
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:54:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0434B780372;
 Wed, 17 Sep 2025 18:54:02 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 18:54:02 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 18:54:02 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250916012806.2581367-1-james.hilliard1@gmail.com>
References: <20250916012806.2581367-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8f1cd3491e630db9e066dc5208216923@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758128044;
 bh=L0qToi7+OSPHZmpHD+ZNmmAE13YS7QvgIql7W4gGJgo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VHEb0b8eB+8cHpNespraVzQdol6VCq+kpa57Y0MAQJC6zv8ImEDTKRxDjDnpwP54r
 zl4azyyT0MJaMnQu19AYPr/LMIJZPj2JOX9HVxg9NPjvNj+NDcs1fFKzPEgZUMJ+3y
 DNxlbolF8nDkwvzua7P/j/j9ZcY3+IdV0751Osu+DNOz7SLCC/3RNEdNXDXWDopd2J
 WJFzlV9a4Uh10mMYkagatjDhXBBi6zwSWZIVzlGG8DoATntAZPhOtqHqMcGc3v2KNq
 JgsYARnlqdSHZAzu0LdKPYr2O2/+J1PV+WMp1dMw/9awhxIXPEmH3Pb3HFkQ6MkA+S
 XwxZ659zioVtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VHEb0b8e
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.9.4
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

On 16/09/2025 03:28, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
