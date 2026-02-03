Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54620E8784D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 17:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29F026067A;
	Tue,  3 Feb 2026 17:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xReRzu-Xzeq; Tue,  3 Feb 2026 17:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44C1260858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770139759;
	bh=xY4h2rrHwrz+XarJnUjTsea9xsDfK5L3ZnrAnIq2SzM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lR/dHx+orUQnC22S5AXcuGzQJTBfHnJbelp4s2blDp4H/eDVD8nHJY4/mHkcYW448
	 lkd4P6MSqPZ7zsQkYkk5GbUdkgNzR1Cvz0h+LxTTB6j9ddKpWvMiChl/TsPrHv96ts
	 WdkumDKvfiKnRguL3CPBanI5izkxhO68wxbySGHfueUcML/i4DWEfB+VnCLl/4BAX2
	 nzgEcGspcTEDCaO1Kfqk4+MfhGvVJzacFyAb0H3WzNKZRTJpxP596ZOvEVMaqpoyZg
	 LEEwOhNdEkH2rTAna4Kcail1lmFRhDFH1d9xj3FwaG+yR/Bd/Uiacnh0g4052qQfqF
	 dHWgKvOL66uMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44C1260858;
	Tue,  3 Feb 2026 17:29:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CAA2F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 197AF83D60
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gda2IG4iWLbe for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 17:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DAD883D5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DAD883D5E
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DAD883D5E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:29:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 357F8C24384;
 Tue,  3 Feb 2026 17:29:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DC70160728;
 Tue,  3 Feb 2026 17:29:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9DED5119A88FA; Tue,  3 Feb 2026 18:29:09 +0100 (CET)
Date: Tue, 3 Feb 2026 18:29:08 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Michael Vetter <jubalh@iodoru.org>
Message-ID: <aYIwMC9z_CK0SjmC@windsurf>
References: <20251202175915.1616935-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251202175915.1616935-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770139751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=xoJ+CtnqKwfflK75ChT8aBeBwDlpHyGa8QmDvIsiqEY=;
 b=cqglK1c9spTQD4HmWN93C9T1Emh7IP8yntEWnap3dV0yyIr+Y6k5RtpwC2BSPhaPFmUJDB
 m0Jag5O9FJweLZ+Oe2UOEk/bWc9TWaBFKMOjWhvm/6EScL/+8BEllvQQ3KKor+W6eqReHd
 XCWRLzg+EetZ4ts/IP/yjBxBYDZrlCKhaE75CJO/K0jnCX0/Po+00c8ugmc/1IaiO2ZX01
 3HcDK52MjFhij6mB5sK5Cn1CG5luAJVop9Fvls8Ot4oXZ8jBFOMh7XpYWHjTBl2ElNOEDq
 kCr8hLTX5qvinKMaKOilK4BeCeHkNnkHy6F1eXxG03EWopRz18CqzLMxDO4/Lg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=cqglK1c9
Subject: Re: [Buildroot] [PATCH/next 1/1] package/jasper: bump version to
 4.2.8
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

On Tue, Dec 02, 2025 at 06:59:15PM +0100, Bernd Kuhls wrote:
> Removed patches which are included in this release.
> 
> License file was renamed upstream:
> https://github.com/jasper-software/jasper/commit/688601c736165d424b95413ea40d5571a5ccfe02
> 
> Added configure option to force builddir:
> https://github.com/jasper-software/jasper/blob/version-4.2.8/build/cmake/modules/InSourceBuild.cmake
> 
> Added configure option for JAS_STDC_VERSION:
> https://github.com/jasper-software/jasper/commit/b8ecbfbf293ee6086e4d40108ad730229388cd8d
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
