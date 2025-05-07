Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1102DC3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 20:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD35C83D50;
	Wed,  7 May 2025 20:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBc9omiCjIs1; Wed,  7 May 2025 20:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F397883DA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F397883DA1;
	Wed,  7 May 2025 20:45:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BDA1439
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01330610F6
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCmon-FrqkXL for <buildroot@buildroot.org>;
 Wed,  7 May 2025 20:45:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 492D760F98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 492D760F98
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 492D760F98
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:45:55 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id 06019E002ED; Wed,  7 May 2025 22:45:52 +0200 (CEST)
Date: Wed, 7 May 2025 22:45:52 +0200
From: Florian Larysch <fl@n621.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <20250507204552.gs5c6pm36nqosyua@n621.de>
References: <20250507185311.7581-1-fl@n621.de>
 <20250507185930.6cosxy42ale5wqw2@n621.de>
 <20250507222829.2fee8926@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250507222829.2fee8926@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1746650753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qx/d1KXJ+imWGV5IzeKC32/uhsypnPjlDrCb7VHL//M=;
 b=xWCtIaqlGb4TcZC2Hj9MhaDi1IrRY3yDvs3dA46/gf65zr5M38DAxM9dJsyCEJvVQ+3/oq
 5p7yC7FG5hjyyvhbuTVBEwvrPtsUuEUVyKpXbY9hOsI6+yD/o3gYaJJcrwWQP94d/Yu4h2
 G8hSKgZCgNGufgtTC+NwSb0/78yAqP0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=xWCtIaql
Subject: Re: [Buildroot] [PATCH 1/1] package/bash: fix build with host GCC 15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Wed, May 07, 2025 at 10:28:29PM +0200, Thomas Petazzoni via buildroot wrote:
> I already posted patches to add GCC 15.x support in Buildroot:

Ah, thanks for pointing that out. I was focused on getting my firmware
building again and hadn't checked yet.

> We expect to merge the GCC 15.x support after Buildroot 2025.05
> has been released.

Okay, that is probably the wisest option.

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
