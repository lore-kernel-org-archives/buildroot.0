Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2128CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54A5F421D2;
	Sat, 30 May 2026 21:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9g7UIVF1UwvY; Sat, 30 May 2026 21:56:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFBA040CE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780178194;
	bh=xAJ5oJaavUmHBqckQeECX9KyCJzrx2gjFFovN+Mg0Ts=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PQFEtKtTWoPMi+rxGng44GNutmE/IPLzoeB46qBVxm45F6VeiKnKEPxuUz1/Ic9QK
	 jiPKjzQzUNVWHFqWy8z2gGLcWZDEs6fm1ZCp9iGzsF9WcAOt1g/VgQCEqoylDbizib
	 +2nlMGIpgBp8XXBTq+orb6GtpxYyJKtbgS5RCxlX9jRchl8XsbemJEKCnSt+r4KszJ
	 N9lwduu8sn7oJVohrlTiXiZFbMOV600omC5ydIXLkK9wt8qYBSOk7sciRZuxq6FXv3
	 xWQRDdLWJXDqiy/9TCXkKOSYzngEFN0pA38+9UT2kVxb56lLn59q3yiqWmfq8whfxW
	 Cdi3E+xESRGrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFBA040CE3;
	Sat, 30 May 2026 21:56:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 384F4F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29C1540CE3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmZ1aiSRq8JU for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:56:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6244740CD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6244740CD8
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6244740CD8
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:56:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2307D4E42DA5
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:56:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D645E6073B;
 Sat, 30 May 2026 21:56:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 22F5C10888CC7; 
 Sat, 30 May 2026 23:56:27 +0200 (CEST)
Date: Sat, 30 May 2026 23:56:26 +0200
To: Viacheslav Bocharov <v@baodeep.com>
Cc: buildroot@buildroot.org
Message-ID: <ahtc_EoARXREZk7x@windsurf>
References: <20260519121814.67471-1-v@baodeep.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260519121814.67471-1-v@baodeep.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780178188; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=0ulGr9Tj47R1lQHqcaHD8SZAbKJMwSVeiVBT07qSjn4=;
 b=rOKlN6Uyw4p1ghsDnbfoCXDtq9pYMO7b2I5dje3i4SUPEvT2kD+oGFFkyrmjQMmxEUux7Q
 oTF0iKrdgMRlfKwp2l0kFg1nr67EyjEN1+gUYZs930Q98zJyI09iGUXorNxVFw+LojhJGI
 ekc3UiyFM1mQRLo2eJsRBtQIn4E2vSlqd1MIqalGMJ2wfTbw6CWeBCwWKjB40RRdVi7ljT
 TWguLe2ofmwrfpRBMJEvkfdqRfNEkeuq0NPGV/AbhSWYjxk48DdXgf46bLuAgobvkGseqx
 MlbhbezwHY8ilIetiM+IiIWHrLkL1JJNjAyXtB6WHA1HrLj4LXnjf25LjSLgXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=rOKlN6Uy
Subject: Re: [Buildroot] [PATCH] package/rtl8822cs: bump driver version to
 latest with support kernel 7.1+
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, May 19, 2026 at 03:18:11PM +0300, Viacheslav Bocharov via buildroot wrote:
> Update rtl8822cs driver latest of the jethome-iot/rtl88x2cs.
> 
> Signed-off-by: Viacheslav Bocharov <v@baodeep.com>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
