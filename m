Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780CECD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13FF841CE8;
	Fri, 15 May 2026 17:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkZJ6hqCtDbD; Fri, 15 May 2026 17:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5274841CD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778865952;
	bh=Ca+97NHWb50GDzdBSjRnlWM401BA9Yozl2GhFsZoA9Y=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gygHCnOlkCtmsdWfO37+KviB0r5bkJpM3oveGQ3R34PZMRw2GqosJapaY3tlKS11C
	 QU5crS/0P9U41Sz6egcx7095bQd6j7RzPMSt5fREJPbt9+CwHGdXvB30uSTiNEbhsl
	 iZ8BLt4N77b4wU2f9o8v5ytt4TIX+0edgFhBGe23mIpgfkSrjUR2Yh/x7P6oBPsVUm
	 FQuowqWTsbzlE5m3C6N7zjpDMNJWB/4WU1mauiDoOR8NDtoCCalLT1cwYHuaXKQ4UA
	 ZeSUaLpSblnyewlQr3Yyjubz3WIcBWMQbRptUnCwneVVvd5HdSBbhuSrzhfEsaUCmb
	 wxV2Lj2knCl+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5274841CD1;
	Fri, 15 May 2026 17:25:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDC3C45B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF59941CCE
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAvQngjinFOZ for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:25:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7434C41CCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7434C41CCA
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7434C41CCA
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:25:49 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id 48967E0069B; Fri, 15 May 2026 19:25:46 +0200 (CEST)
Date: Fri, 15 May 2026 19:25:46 +0200
From: Florian Larysch <fl@n621.de>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
Message-ID: <20260515172546.zik662ubl3bhqyij@n621.de>
References: <20260416225157.25398-1-fl@n621.de>
 <ee4c15d0-c536-4101-8a25-2e30ce3e44d5@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee4c15d0-c536-4101-8a25-2e30ce3e44d5@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1778865946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JDkfVjQ1QUWNRKq+m3UNWx3bqReh/x5Kopk3VNJC7lY=;
 b=k6zRuQzCmy+q36qm4LZDE6VZMGRb0A6qaZQMGhymlmOnmtwcBPGiZsfyC91jsiFmwuzS1U
 UcSMgAymkter7eYGt8sdaX3zsQHEcsuw4mCnLWAiCIySTx3iz4p/AxD57FFkhQCKZdiJvT
 /CrBbkEBbSNOFlJ9sA/mrR6+thKO6GU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=k6zRuQzC
Subject: Re: [Buildroot] [PATCH 1/2] package/libnfs: fix build on strict
 alignment archs
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

Hello Romain,

thanks for picking up the patch!

The second patch in this series is present because after fixing the
first issue, my tests builds started getting far enough to run into the
one fixed by the second patch. I expect the same will happen with the
autobuilders.

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
