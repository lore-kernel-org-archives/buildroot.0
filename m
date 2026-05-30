Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19529CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E144185448;
	Sat, 30 May 2026 21:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4yA6D5a0bvT; Sat, 30 May 2026 21:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14B4B8544C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176835;
	bh=TKq4ptdEhJlWyYWJSn9ArdwBVdC81tZwju8Dz9igX/g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QzYXygd45sdwR5JbdG0VXsDCSdinhJFv+xLVtZILEXqqoJOE1Yztpozm5FWrRHpSh
	 N69zjY1Hk44VMT9gCCnnh1a3qlItrMlLa5qtPL4RfVr3nOD0Jv5h+ZYZW4SKUgKj0z
	 p3+ewS3JxID3A6QCQL8EB4osWcSD5avu8Xbq+JfFefuyQTmllqSTFvmjZ61d7k3N/5
	 Gn4vEzYJZTKnTbWh9EWciJjLD+SquqqPj1nVKC6VfB9uoGn89rvWGGi5o4dl9wm24H
	 IaqP9HXpLmzegu6V320yOhQGOiCIJF1U6u5fbyumkWGIm4PiZR5pdfVwIY8SXlGOP6
	 JiasSe61ldNaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14B4B8544C;
	Sat, 30 May 2026 21:33:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76CB7F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D72861C37
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWpSIMBJPXcp for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:33:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D49F60E98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D49F60E98
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D49F60E98
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:33:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 687CA4E42D86;
 Sat, 30 May 2026 21:33:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 210FD6073B;
 Sat, 30 May 2026 21:33:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D2DCB10888CC7; 
 Sat, 30 May 2026 23:33:48 +0200 (CEST)
Date: Sat, 30 May 2026 23:33:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ahtXpTj6fCIpUAWR@windsurf>
References: <20260518181226.112680-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260518181226.112680-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780176829; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=L9pT7867IewJgIJ/Klv0+zRwG5VLaPhV50JqsWRhk2o=;
 b=LaNuNrIBL0i98PioXCJH5MCEMRtP6Y6ApJvLl1rDCelPxC0P3dMgAHK0PaPT16imhMI3zB
 2DHA0Dugdd2r9XmDlcR3YaHesQymOuACe0FICiiCWtUWBYxMbSpSFsCYmMFdhmgjOxHlib
 VGwjdxAF+rPrBHxM9R41E4fRXJzflSqS7OeX4afempTF8jJe5d7ebiUBuDjwNGzh8rWx2L
 FCNFoTsX4V5Xob68ar7s0fEPTCkCiMACl4q2pKSI3GoDuwuU2Q5AcLsmd6X1ADcasg39X4
 S3v4dW+V97SyiongAt+QtmwRkTmxsbT0OWkPTgAIWerSFw15p6Grl04jhaYnRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=LaNuNrIB
Subject: Re: [Buildroot] [PATCH 1/1] package/lcms2: bump version to 2.19.1
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

On Mon, May 18, 2026 at 08:12:26PM +0200, Bernd Kuhls wrote:
> https://github.com/mm2/Little-CMS/releases/tag/lcms2.19.1
> "lcms2-2.19.1 is a hot-fix release"
> 
> https://github.com/mm2/Little-CMS/blob/lcms2.19.1/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I've applied to master, because it's a hot-fix release with very few
changes, only fixes.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
