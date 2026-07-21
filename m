Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A55C4452B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B7BC60648;
	Tue, 21 Jul 2026 20:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8g6Eu7xDTjdm; Tue, 21 Jul 2026 20:19:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE78160853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784665184;
	bh=kdDvgWi989yWTK6N8Qbm+i1EyiJhJe+VpG93SAbV5xs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IwZ7NAb/1GPoTlLNFfAY73E/padv0N2/9qd3pRwgDCfYfDWcbwt6p2z/jW3OVfVZN
	 2JdNk8TUuCLhnQHg5vs/S7RkMrMlzxZf/RIg4TrYc6u+R4/dkmzMWAl/qfBXHtkM7f
	 XIJ8yUn7WEviMIpM5pYn+R+HaNrGXu/c/CrTlgykc4MPuNVvJedqkQvtwYVfW7CoTg
	 fTWBfXJrz4AdzcECHY4Sa1YxVbHXjFUdT2dYjU7tI0Vhrz1yk++44RCGPRgvsHWYga
	 SpkVlDXlY7/g4Y9imkq7TaNwb6mVcAMCTMUTS1BTd87yDVSnl8OW4Gz3oo0ZG/nMfj
	 YvyrixqyiN3OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE78160853;
	Tue, 21 Jul 2026 20:19:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28F0C9E5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19DBF40603
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBVUirblNBej for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:19:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1BACB405F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BACB405F4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BACB405F4
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:19:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2DF2C7803A2;
 Tue, 21 Jul 2026 22:19:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Jul 2026 22:19:39 +0200
MIME-Version: 1.0
Date: Tue, 21 Jul 2026 22:19:39 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260721160607.276174-1-fiona.klute@gmx.de>
References: <20260721160607.276174-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <884ba7ff5c8628e34846f0f9cf2d53d6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784665180;
 bh=WZzfP/V+A8f9l/pbzrGp1w6LPteCuh79MC41YdDLVB8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hLPv0yPi1ltDP2sHnyIN4rTnWJGyuS0na8E7qTW4yzv5d7W9Zk4GLCeFjl24w2KWq
 JCVe/NjAvej2QauYe9opfB8P3in8CrNIxJ/l6UKO63j12c7+2OP4Xal/mJZ0MrMrnC
 NkajUuct8hkdyXS0f9jQwh4zqKi2V53/0BmpTwDQt5DJRhR1yck0Hj/x3auQbftksY
 5EWhXKqbPSDZ7vwRmYs5qZ024Robq7UNNbBxo00UvVn6GIcdgc0nIajMrDCt3uazY8
 3tn7aBp251UCRH+RBq3h9SVIr10mRU+JK/Gfp40LquzPM2foIbEKbz+AUUf+J3fmPv
 g08/E9JQDSPlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hLPv0yPi
Subject: Re: [Buildroot] [PATCH 1/1] package/usbutils: update license
 information
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

On 21/07/2026 18:06, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
> 
> According to the upstream changelog LGPL-2.1+, CC0-1.0, and MIT
> licenses were added with v018. Grouping is derived from individual
> SPDX-License-Identifier headers in the source files.
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usbutils.git/tree/NEWS?id=bd86478bb8d09abd0aba8ead781bc8f4609521e6#n159
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
