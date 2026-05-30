Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273F4CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C511540C8E;
	Sat, 30 May 2026 20:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoxnWO6FKNlX; Sat, 30 May 2026 20:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08FB540CBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780173974;
	bh=Q6tXz3fSHXYrgz/he0sS1ERQ7q6/qns+bU4iB2XFHfA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I6QSzYWG1lqHvPAyr+fb/V7FpWFSOqlB7PWeKOdGfL7D6GrknIznxStpQVwSTpkDp
	 WxupdSCHwkbbJkSoJFEHSyt6hAweO7xbXHwgV1r4mlJidDUzv39ly3CQSIvz8RudAT
	 tA5smxL5TGr/fh5d1hUeK/6k8Uj5GGHObEnkxrnt8/Gxo6ra/0AsjO3PJdKLLbYA1x
	 YPCJkfJVjL6WCRCF0tmCjlwAICBUx1HnSRiI92l1djcyr2cVUFIj7r4gOPhvTFjFb5
	 bycJuDh+pxUjb3UFkG58mHv8BRepgg6QYq6ot7v7FiOVWnuc5dQlfV+O9ahCzVPUjv
	 +mj1CtnbCfKhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08FB540CBD;
	Sat, 30 May 2026 20:46:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FAB3F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01BFF617AE
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQSCvohecQuy for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:46:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE55661090
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE55661090
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE55661090
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:46:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BF93F4E42D9B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:46:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8DF046073B;
 Sat, 30 May 2026 20:46:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 87AA610888CCD; 
 Sat, 30 May 2026 22:46:08 +0200 (CEST)
Date: Sat, 30 May 2026 22:46:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <ahtMgPlivULwxRDl@windsurf>
References: <20260530155718.657095-1-bernd@kuhls.net>
 <20260530155718.657095-3-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530155718.657095-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780173969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=fZyqAKEtgHj25kUXnlyxEaKv9J4kKUqjm5+aut0TyOA=;
 b=TWs0cU45za+EoN0D0e0zmLQCG1WFwC6UAaS4X8Dipqz0qoW9Ev3Gcr/0Xc8PNJ8olBGWkK
 SV0av7eNWy4dxWPgti1/wb+m43O6oSE+Pwr1om4u1zC4edAgDxcokbLI6g4MHupZfoQqSj
 y6BpQXdIHAEcrqj4cj/E9DoF53gCGSRwUBZ37OQ+X7GCcIEU72t8KAN+HoTNvvogQwSicF
 V/EEsI2+tU5PBcyWI10LY2kk/AtP5j4wQmxfzuNrMDNpL0UHwp1LsDBFAUnbFOmgP9Pw/O
 qpynzy0Ac5DOjna+uHOm3ojv+JHG3nXFZBmZLUt7k4X5TBobDJdRPuvSQFN9TQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=TWs0cU45
Subject: Re: [Buildroot] [PATCH v2 3/5] package/stellarium: bump version to
 26.1
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

On Sat, May 30, 2026 at 05:57:16PM +0200, Bernd Kuhls wrote:
> https://stellarium.org/release/2026/04/05/stellarium-26.1.html
> 
> Added dependency to qt5svg needed since upstream commit
> https://github.com/Stellarium/stellarium/commit/a5c374bfa314a75c19aa65cc758c68517ef608ad
> which was added with this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
