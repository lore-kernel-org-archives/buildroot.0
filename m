Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A857ECA1010
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 06:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54D30402FF;
	Fri,  5 Sep 2025 06:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxfWVA71XNWC; Fri,  5 Sep 2025 06:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 916E440330
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 916E440330;
	Fri,  5 Sep 2025 06:35:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 751FE111
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 06:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66AF1810D7
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 06:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12O4glxBFtci for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 06:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA5B3810CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA5B3810CF
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA5B3810CF
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 06:35:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D943E4E40BE1;
 Fri,  5 Sep 2025 06:35:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A2BF1606C5;
 Fri,  5 Sep 2025 06:35:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1425C102F26A4; 
 Fri,  5 Sep 2025 08:34:49 +0200 (CEST)
Date: Fri, 5 Sep 2025 08:34:36 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20250905083436.2a763904@windsurf>
In-Reply-To: <20250830081150.294e40e0@windsurf>
References: <20250830081150.294e40e0@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757054101; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=j5awSY8FsQm1MN1+/WrfFspAF56SnsfplQoGkBbPcYI=;
 b=Dx29N03y1wghJi+vCMlg7BME87MB18L5ST5d/iCkkwVzaDk8+yLz0+TKpncufUcs+YB16P
 cUQmQHmYEZGUTGjph9t/IqvPR6KvpIOJNRwoGyRacIZxaU4euDpKhEDB7yVaglrx4a6922
 U8Pm1Jt6gjg1Ptj7sFYIL1oqdskc3TnX+5gvQw2itymB8R5yZ2IRgUVFAz3wIXlLW/ySDy
 9gNj5A5MRJMb1j57X9c4gwGcHM2MGTDXam9Q9yB2/AMqn300LYSE+DXAdWRGBjKEWNZJKK
 hgj6G+N7jSYd3zeOkX+vFdeiody/G7rSV5sULp5NjrGoKHzx2sJwfx4U8Mri8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Dx29N03y
Subject: Re: [Buildroot] Status of defconfigs
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
Cc: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 30 Aug 2025 08:11:50 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> - 2 more patches sent to drop two additional at91/atmel defconfigs
> 
> - pine64_star64 has some patches on the mailing list from Thomas
>   Bonnefille that fix the issues => to be reviewed/merged
> 
> - raspberrypi3_qt5we is always too long to build (it includes Webkit).
>   Drop the defconfig? Exclude it from Gitlab CI testing?
> 
> - beagleboneai and roseapplepi are waiting for fixes from Peter
> 
> - snps_archs38_hsdk has only very recently started failing (a week ago)
>   and I don't see what recent changes could have broken it. Ideas?
> 
> - ts4900 has a build failure in glibc due to the version of the kernel
>   headers being used. But that seems like a real issue in glibc, not
>   actually a defconfig issue as any other build using the same kernel
>   headers version would fail in the same way

Updated status, 8 failures:

https://gitlab.com/buildroot.org/buildroot/-/pipelines/2020535236/failures

Basically, same status, except the pine64_star64 which is odd since I
don't see the patches merged in master.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
