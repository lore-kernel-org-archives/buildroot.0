Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73235CD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A178461C;
	Fri, 29 May 2026 18:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s11vlGpCXAd3; Fri, 29 May 2026 18:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 503C08461F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780079857;
	bh=NbcXoQODRdevq2JF6IeHGaTcNAESd70R+exIf4Z1Xtw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WwdbPEM1kdtuLCnnRH/P5081CvuOP/0xmN29PB7lc8XuSDfxDr23VwQlwUirWtQBs
	 Ana3qbtmzcQ8if1lsf3ZVp6Gq44NeJLrH1e4bxvtgqVk5qiJCkwNddQI1qVRsZUaLg
	 QNuo3zKqyCtT5+rRZCfqIWDPhYMpl2O0YFbDmI50EEZWvNI04A12L9LoEHSii9wdne
	 2YVPjCLN2Flir8KhgWBWUPiyOHtxA92f0c7vLlIvYsVN5Bty54nxIQYmW0fNNNE+p+
	 Gj2pw+sYosylITyVSh57nrjtF4FHpJ2ehhlRbXX6mwMtC6AUDhQR0wLWl2Rvs5BuqW
	 znHuzp80JN8+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 503C08461F;
	Fri, 29 May 2026 18:37:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D279B288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0D8842462
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4Rf9hA9tO7L for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:37:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF1D842447
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF1D842447
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF1D842447
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:37:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9B65F1A373C;
 Fri, 29 May 2026 18:37:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6642F601FA;
 Fri, 29 May 2026 18:37:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EFC0C10888CBC; 
 Fri, 29 May 2026 20:37:29 +0200 (CEST)
Date: Fri, 29 May 2026 20:37:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <ahnci7WYFV3NQ8rS@windsurf>
References: <20260501183421.2459291-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260501183421.2459291-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780079850; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=/916gt4Z9wscNRPuRIQ5DPlJghUBTqE96D/qNUHRFP4=;
 b=yTNOa96G7Qrnh6KM+jWr6MwZxNiHWFpi3tXSpm191oTLbIN7yzTvDWUTzj5ucMOpY074FF
 64/4J7ij1EDokpKe1WA2utAQDufRtfYtM67qCSjxwcdgopumHWo0eOQWDOJGXjBZaXHVoT
 Kgiv/ErC9b0qK/5R39NkShEgMCv+q8/YdPh+AQlgi/0Xc0xjQZo5GotFihEyKFUeD6dHLn
 dYXHP3/bYFOCzrxxsz5E2tkzNKwpOwM7gVSu14+VzN4oKiwoPpPSrx3nDP6NrNWT1olmO3
 JdaiuapECY6Nl1C6aCPwHaB374GmWVPjsU1ALOB28Ov4e1GsSQrqOSvMeRnyrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=yTNOa96G
Subject: Re: [Buildroot] [PATCH 1/5] package/stellarium: fix qt5serialport
 dependency
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

Hello Bernd,

On Fri, May 01, 2026 at 08:34:17PM +0200, Bernd Kuhls wrote:
> qt5serialport is only needed when GPS support is enabled:
> https://github.com/Stellarium/stellarium/blob/v26.1/CMakeLists.txt#L632

Well, it seems like you're pointing to code that shows your statement
is not correct:

IF(USE_PLUGIN_TELESCOPECONTROL OR ENABLE_GPS)
     FIND_PACKAGE(Qt${QT_VERSION_MAJOR} COMPONENTS SerialPort REQUIRED)
ENDIF()

So Qt is used when gps support is enabled *OR* when the telescope
control plugin is enabled, and this plugin is apparently enabled by
default.

> A backport to the LTS branches should be considered, the wrong order of
> dependencies in buildroot exists for years and is not caused by recent
> upstream changes.

I don't understand the "wrong order of dependencies". Is this fixing a
bug?

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
