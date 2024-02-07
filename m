Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CF7C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CD65416D3;
	Wed,  7 Feb 2024 10:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djUIEONZyM7J; Wed,  7 Feb 2024 10:21:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82F5840AAE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82F5840AAE;
	Wed,  7 Feb 2024 10:21:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8C61BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 592A142099
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smQ0h5G2HZEy for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:21:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B388641F5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B388641F5C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B388641F5C
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:21:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 610D540005;
 Wed,  7 Feb 2024 10:20:59 +0000 (UTC)
Date: Wed, 7 Feb 2024 11:20:58 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <20240207112058.37534f3d@windsurf>
In-Reply-To: <9dcac81b-522c-4ea3-80ed-7d9544cea12f@bubu1.eu>
References: <20231126180840.2081945-1-james.hilliard1@gmail.com>
 <20231126180840.2081945-3-james.hilliard1@gmail.com>
 <9dcac81b-522c-4ea3-80ed-7d9544cea12f@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707301260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bxpm+xwggcm6409wD3l6GX8SlqKUIfVHHNOWMSxOuNk=;
 b=RWGvA9wAUpIuI5HMlnVjzt81U6xr9LeVNSvCWz+LmIA7O4CI+V/OmnTuup+KrjdFZ0I4ul
 B/+1p0EvR5ArlP0azGvWnNTjFTEhXoMD3MO5/H/z7BXTGNeBhfc/zXJa1qliSFe82ZCpGH
 7UYwckFGXmNfdgLlb5s6J7okyKIbp3VLAT0BxuGviN5cT176O9pveo/5dtmJqyY+rSkq4g
 vbEufL/x+jbyihYDlTO1vSwoPRgVLDi3XA3eMSaicRAVPuDkO78cmALTA0Lb7YJXxtSnbX
 M7acuAT8s5kkY/p//tHTQEi+tbLOtAQk74U+0yXSrMZS4fbmKhYWQ2jUkZCRaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RWGvA9wA
Subject: Re: [Buildroot] [PATCH v6 3/5] package/python-msgpack: add host
 cython dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech
 M . Zabolotny" <wzab01@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 7 Feb 2024 11:16:27 +0100
Marcus Hoffmann <buildroot@bubu1.eu> wrote:

> Unfortunately msgpack 1.0.7 which buildroot has now requires cython ~3.0 
> [1], which we don't have yet. cython 3.0 and cython 0.29.x (which uvloop 
> still uses) also seem to be still developed in parallel. So maybe we 
> need both as build host packages? Or do you see another solution?

If we were to have both in parallel, then the big question is whether
it is possible to install them both in parallel without them
conflicting with each other.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
