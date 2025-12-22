Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B79E6ADE7
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 21:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2F20408C5;
	Mon, 22 Dec 2025 21:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hTO8r60Btyk; Mon, 22 Dec 2025 21:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1022C40856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766437657;
	bh=bh9t61HFePjGPRnSB2QkIfxld55lklyQPzFSSsFXBJA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y8W4OfTbxfEivvnrv1A4zsOboV9B4ZBSua9GiBp1q2cMIFe41thpmZAvUAnJNwvZ9
	 06iGt+5ScSDLDdDiv0Wan3C1IsCbvWl8MvyOH6JFdQpt2vhEgFFIirwl2nrnoyPaaS
	 cs+hVe1RS3efGNLo+prQAWrECZSmGXcs0UoS+MumW2zVdPvJdqjti4iuqjjzD8pmsO
	 I8Ii17RgTVtDkE+gBUxU4hHvV/n6EtvdOWvS7a4uPD//HnK5i7xFume0pi7DqqZeZe
	 nRWUGFoUX577wdgiGLJFUexzTVWGNDKAp0rVH+bckjXp3hX5gIrPvkc4vm0KOTgS/h
	 P6OgjGPobETiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1022C40856;
	Mon, 22 Dec 2025 21:07:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ECAD6BC
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DECAC40856
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7VZw7ALJTDf for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 21:07:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D69040835
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D69040835
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D69040835
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:07:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6636178032A;
 Mon, 22 Dec 2025 22:07:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Dec 2025 22:07:32 +0100
MIME-Version: 1.0
Date: Mon, 22 Dec 2025 22:07:32 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251222180545.2126505-1-giulio.benetti@benettiengineering.com>
References: <20251222180545.2126505-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <cd63b6f95c4cd4e73830a0dcaae17018@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766437653;
 bh=WZHQhmdBTtzvmDgLptOJIm06svPVjGCcF46guEGIILk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TOY+5l6ky3w1hx989oUl7QN4FqNy92+FutEAxQ9DJsUxw4yVcv7SxnwhTAQpXSSEU
 MWgkHD7nfOk//c3b6NX001FPVxRXTbyxNlQZ6rd8jt3YZmRg5fEx3TLaD2FM2farP2
 jtjtp7/bxyV925W3yep9jAfaaNlJcm7VDf8JPvKfG6Si+p62GU1dOH+pIEAuDK7ONv
 zWgflFe5rUn46WvFam5UnFQgyQCu6ak94ujym9JQI69mR68kVRUg0C/AATDiSVuCrm
 7tw81jurUYeMuvZGO+Bgu1iIRWGvWWVM+fn33AWfZR5APeItKxCus5Ek5lALnHD13g
 7yc29iQ23cbyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TOY+5l6k
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump to version 3.18.1
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

On 22/12/2025 19:05, Giulio Benetti wrote:
> Release notes:
> https://github.com/libfuse/libfuse/releases/tag/fuse-3.18.1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
