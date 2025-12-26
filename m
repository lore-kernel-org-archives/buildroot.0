Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14E9E8FDA6
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 12:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1F5860842;
	Fri, 26 Dec 2025 12:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zN6ZxXRXDOqq; Fri, 26 Dec 2025 12:25:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C90E260821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766751930;
	bh=YTayu1kJcMlO+inbwtC/WXYyVzS32zsUo+IV0j1UO+s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vk+YJcv7POEO99a9twYGegOl5IcptSB+wiEbwqLjcg+GbwAHRkCRVw0m4T3+xljzE
	 EWkAdTYcHh0+p5e79tJkkDekR4/3/heXIVgvzu7LhHXqdNXn/BlFt+3eJgSoeJwce3
	 8VOGCl8YwdvY+fm6bEC/3OdZEsa3gsNH9akjaXY3isoHG0TSFBRNUOn72/nTjFeBZm
	 opEGIBOTRDezu8msPfEdesiRzEzqVaPO/rE6bY2tLYuiC5qguD6R+5m01NXiMYA231
	 Y6isfteGe/znZzF3LrC4XniHdyWCt/UOcu8lfkijWPBRIFdQzH4mM6AUCJ6kzRMkvK
	 e96nBJZeZaOXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C90E260821;
	Fri, 26 Dec 2025 12:25:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64EDDB9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61F3B4051A
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVeYjXxPThIO for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 12:25:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 722B540512
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 722B540512
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 722B540512
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:25:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EC5EE5FFAA;
 Fri, 26 Dec 2025 13:25:24 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 13:25:24 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 13:25:24 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251223194653.3036119-1-giulio.benetti@benettiengineering.com>
References: <20251223194653.3036119-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <9763cd00614505ac8a5b47e93170b86f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766751926;
 bh=+DXX0vNgcthYxHgrcGJzijP5NgkvVwEP/GmqPcqS8VM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jpgZpLrdXPC6WTM/ixQUqw9trLayDBUFmNQWI1Y341yeTlDzc/Wy6tYybVO08WV9F
 w4Hkfnqs7sA0hjF3NpIP+NckEGPBCPzYmB6InjhsiNpoW6Ps/sg41lKBNetL3LdFty
 G88MPyJk9s//ExKCELb0GfpuHM0NP2Vm6QfGfmxbPuUrJVfJAZrQXr/7YxB3aXTM2e
 CwcuAhBecHBWrYSYcuJN5St8Kxdl33JdjerGGUsM+jeHZFc2jBmobIfJ88Dt0SZYWb
 1X1t6EPkDNA2w/C0yOj0ZvM+rT4dDt6wAHgdqpH7QPPdhEyKSLSoL/3ANNUwTb+ptZ
 TWGGLgDZeRKcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jpgZpLrd
Subject: Re: [Buildroot] [PATCH] package/dash: bump to version 0.5.13
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

On 23/12/2025 20:46, Giulio Benetti wrote:
> https://git.kernel.org/pub/scm/utils/dash/dash.git/tree/ChangeLog?h=v0.5.13
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series applied to master. Thanks.
For info, I made few minor changes.  See:
https://gitlab.com/buildroot.org/buildroot/-/commit/3afac89183899ac0f74737043e581fe65a8aac15

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
