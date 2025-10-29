Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0195FCCF9EB
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 21:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBA3B40F06;
	Wed, 29 Oct 2025 21:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBe-O0O2i_6q; Wed, 29 Oct 2025 21:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABF4D40ED2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABF4D40ED2;
	Wed, 29 Oct 2025 21:35:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46FB7707
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 21:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 387164131F
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 21:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ru-Upk6NoPiF for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 21:35:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C810412FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C810412FD
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C810412FD
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 21:35:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 209B719F57E;
 Wed, 29 Oct 2025 22:35:43 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Oct 2025 22:35:43 +0100
MIME-Version: 1.0
Date: Wed, 29 Oct 2025 22:35:43 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251027172814.839233-1-james.hilliard1@gmail.com>
References: <20251027172814.839233-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ba040ecf45de1ad76b571f8a641d55c8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761773744;
 bh=5OOuwN5taxQ7wCHn6cuNsGlPbXA4QUo15Xsk6Qr7VtE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tkd4rT5p09J7t+O3mYq16CUB3i9FW3Rk765zK6stM+3R5ds3TfQawbisq3ZZ3FHlA
 UwZEbRWwJCoa5xJyQFgFqoG7lS2ucoefPbZvYrjkiVtH0ebtc+X/0Gv/WzskeN1DRl
 0bSrBTS76GYQiICbhGC7tKET2b3x/iZ8IZ6k/vMee7jAz5C2dLtySXgk9J69a68biJ
 Oez5JWgETqswLm1/UVUhg/HwXa+xg0IfHk8DVkZkJ75bYOQvDjdg/7ZgL47iJ5ZFYY
 c7Two/CPixCGJGhIrmxtWv68Vmry9lufI2hTTwC07D+AWLm1Twuby7TJtgq3yO9MEm
 RHdWKaplgsr4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tkd4rT5p
Subject: Re: [Buildroot] [PATCH 1/1] package/python-meson-python: bump to
 version 0.18.0
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

On 27/10/2025 18:28, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
