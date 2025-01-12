Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33748E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1B1F408F0;
	Sun, 12 Jan 2025 11:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08uLJWystr_S; Sun, 12 Jan 2025 11:16:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBE3F408F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBE3F408F8;
	Sun, 12 Jan 2025 11:16:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34E54942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15EAB40908
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NesRRG2HgsAU for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:16:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 48F20408F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48F20408F8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48F20408F8
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:16:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 537E319F576;
 Sun, 12 Jan 2025 12:16:24 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35902])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:16:24 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:16:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111172335.2912542-1-james.hilliard1@gmail.com>
References: <20250111172335.2912542-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <010aa4b62b9e0d3140c80a9a2dcf296e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736680585;
 bh=k+0hrpDPmKbyLGU3/OwMv/cbTLkHnoK19h1v/tRIIbc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SEUQksQ/hqpek3BMpv4nfYbnoBMddVD5e9CbH6f2SPKzev3vG2/XXRgjv83BpV7ny
 /yAUlrhyvPkiho8IzBEYUgDg1YiiAMXuI3cglONyp8Qmour/QUZ8qPVJbDd3aCRtN0
 OzIARObfphTuhgq6psDoJK5clhk7odvbJfgqBXaGL+jUythDUwQMOJydxa34gM2DCd
 Dr22YL7F7vQQkLfveY240NqZUNqsNEmdVUd2TwpEe54x4PFIN6gjPq/0I5ZXc+lOR7
 +zJW4EYt+Rsf2DQ4w0LkBLgKiMubNFIMSd8m77gFfFQ+Reyb5pQELs7WkcYNdrXHNT
 OM/bvRPM1SANQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SEUQksQ/
Subject: Re: [Buildroot] [PATCH 1/1] package/python-smmap2: bump to version
 5.0.2
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

On 11/01/2025 18:23, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
