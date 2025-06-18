Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05936C71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 20:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C96418049B;
	Wed, 18 Jun 2025 20:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjFABRq-4Mw3; Wed, 18 Jun 2025 20:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DD418062B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DD418062B;
	Wed, 18 Jun 2025 20:07:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E01B016B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1E8E60B55
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zENwSOIdIZZ for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 20:07:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A162F60035
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A162F60035
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A162F60035
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:07:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C113C5FF95;
 Wed, 18 Jun 2025 22:07:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Jun 2025 22:07:34 +0200
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 22:07:34 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250617203439.1053632-1-bernd@kuhls.net>
References: <20250617203439.1053632-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <9902447b7a2298f8e394b759490ea1cc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750277255;
 bh=ob0RMkRhzYq0iotg1GEN64eU7n2Mr0gEGHoQCkGZbyY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RV7cm4HUEEmm6LfqcwSH/P321CrkBU6cB6S+/5gNydcxu/PRGCkt270Ekgt8sRCjx
 hjSgJ2R2CoFZJfzY5iHn5n8kgYZklhH4vSsJCYEVrtIDYzLoa4QZjtaBFZ7PIpsqMJ
 sr0bkwXSqxfpbSxppedLcv48q0O1+gZIY1u/n5t6n3RK2Mf7aEc/pV96PpXw+lWFnM
 N678Cy+ZWzmhoDPJ6WE6fTWxvMtuBtfbq/j3Rsb1GiBPbgRJvfq8GXOo7vuJABPD1I
 8YIW7nV29rvwAnjj59Aypp9WsNZSNUOKvI/mfH/3WEsVCL8dHRzd0efY/mMpcMO7lG
 3C2RZlVSnDs4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RV7cm4HU
Subject: Re: [Buildroot] [PATCH 1/1] package/lpac: needs libqmi for optional
 support of libqrtr-glib
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

On 17/06/2025 22:34, Bernd Kuhls wrote:
> Buildroot commit dad998a8070bc07838f78453fcb7906fefab22ba added this
> package but forgot to select libqmi for optional support of 
> libqrtr-glib.
> 
> Fixes:
> https://autobuild.buildroot.net/results/95e/95e30d1031912efa200edb9c7b926a31f0abe32f/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
