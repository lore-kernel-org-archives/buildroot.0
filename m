Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F7AE93805
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 20:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D4A61735;
	Sun, 12 Apr 2026 20:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXQIlqFAsN4Q; Sun, 12 Apr 2026 20:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46C836172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776026635;
	bh=R5XSZYHzZ0ghzPS7EkQtMwYonuMU/uVFl69Z8yRqehE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r4RbgWPzgFsL74DGNq0n6HjfT6T67Pd6E/EsiMYaFsNP18Q8PMI6ff+TeAz/6DoN0
	 MTV+ze/tWYZZrHN6JLB9+0NrSX/dZvZueECenIIbmpcrvL5WaeqcEzcLkFX1cueZkX
	 XFb8aPhGu+QMxNh+Xz1VrYthXSRiVYno9uYt54vkR+/+5daGZhUGZSQzfiwdF2Zc6F
	 8yQjEJQdEDSU750KgkrdHaXhWuFaHIu3xdQqu/vHNbW2D2OK76cuWyKJewU/45P6kp
	 c2CDOUzG6CBJP8Km3lH/XCwkN20kP00kjkZH4rcPTecZYSiQte2MUBffMugvim5Rrj
	 j9RmzIKp18VRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46C836172C;
	Sun, 12 Apr 2026 20:43:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F5FE194
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 20:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 716948462D
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 20:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDK0o-FYdoAX for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 20:43:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6633A84624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6633A84624
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6633A84624
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 20:43:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 775B32003C1;
 Sun, 12 Apr 2026 22:43:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 22:43:48 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 22:43:48 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260412190522.2350896-1-peter@korsgaard.com>
References: <20260412190522.2350896-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <daf4571f9f2155a50de1b89feeee7356@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776026630;
 bh=jo8S6IprYYHu78EutSR6umnwLtOUQ7WGMpyISJkLegw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XIiZkGz84W4SqPHvggPdy8elJbYiIfsvlSJiRk3pUn+MtCRw9+7vbNV0t0vJFzndj
 zy4pLh/6938xbkuVpCTGG+D6GzfJ2MI0BDNyglWEDkrZV5taPm2aSDvkqFnLLmBeDw
 CS7kIQTn42lmgL7RRm2JzHfK45clNfahzi4wJxZbJnac2kc5X7PyxfvqxUnmrTj1UX
 gMg8Q3MDD7pvIq7Lj3nlRDCFrcoM4cX1nUo5I11Sy0OXOCGY7PjOqDZ62zA3CAwtj8
 Wlz+kubjQNAcYB3PJKaOQyT6cgYb7N9HSHdZNBivrSfJdhHPiVXsvQ7rVT6n2NBYg7
 WIYPDeCcy1GRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XIiZkGz8
Subject: Re: [Buildroot] [PATCH] package/ugetty: new package
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

On 12/04/2026 21:05, Peter Korsgaard wrote:
> Minimal getty implementation with optional ppp and ssh multiplexing 
> support.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
