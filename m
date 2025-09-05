Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCECCA1010
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 06:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA62814BA;
	Fri,  5 Sep 2025 06:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhz1E7lBjQ_t; Fri,  5 Sep 2025 06:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49309814BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49309814BC;
	Fri,  5 Sep 2025 06:37:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F94C1E04
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 06:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA26C60B29
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 06:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78IIql95QQlc for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 06:37:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7C9A60B21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7C9A60B21
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7C9A60B21
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 06:37:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9DCC2C6B3A3
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 06:37:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B8700606C5;
 Fri,  5 Sep 2025 06:37:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 87FED102F1CEC; 
 Fri,  5 Sep 2025 08:37:43 +0200 (CEST)
Date: Fri, 5 Sep 2025 08:37:42 +0200
To: "Michael Nosthoff" <buildroot@heine.tech>
Cc: "Michael Nosthoff via buildroot" <buildroot@buildroot.org>
Message-ID: <20250905083742.3fada1ae@windsurf>
In-Reply-To: <35281-68b9ee00-5-70e30080@92065202>
References: <20250903133754.1781943-2-buildroot@heine.tech>
 <20250903213428.5740c712@windsurf>
 <35281-68b9ee00-5-70e30080@92065202>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757054264; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QmUqFCD1paqyU8X8lYhqnTOxSUrQf5qUXiv5oJ5RN4o=;
 b=y8saZTyISXaQf5L72R+sYt/zuuaCW2AjNrXN7U4qHBBqzLPf/DEs+xOh0JJFtnH7kayO0F
 v57ZjIHGd+d/wXIWjMP29ytfDfoHUQGIBn+DbqnCGZlq3SMi01TFgPpb9V+6EvqXlCTDzy
 fJu8gdkju87ZHfI11Z+LXNtAAWznI6zzuMgO3zIJIokUszK14SXsTlQkF8Dggy+9DqBdpg
 i7Xl+FeB17ivpHWQMfzPLJEO4kPgcq+PAR5+fFWaj+/X0QMUu6HVLfPIUjE+dHN6gxPHyU
 E4Ldra5rGKG5DDHFWkHPW/LBHZXjuZ38YAlXSw2TAfxHaI3zaN0e/Uxgfo/bLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=y8saZTyI
Subject: Re: [Buildroot] [PATCH] package/boost: remove dependencies on
 Boost.System
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

On Thu, 04 Sep 2025 21:52:00 +0200
"Michael Nosthoff" <buildroot@heine.tech> wrote:

> > Thanks for the patch. It's great to have someone understanding the
> > dependencies between the different Boost modules, because they are not
> > obvious, and not easy to maintain, so thanks a lot.
> 
> The boost guys are currently working on better modularization support. So at least now each
> boost subproject has a dependency list in its build.jam file which helps a lot.
> e.g., https://github.com/boostorg/json/blob/develop/build.jam

Sounds very nice indeed to then have a better representation of those
dependencies in Buildroot.

> I checked all packages that depend on at least one of the boost modules
> where I removed the Boost.System dependency. Only two don't explicitly
> select BOOST_SYSTEM. libcpprestsdk nedded it so I fixed it. The other one
> is log4cxx which really doesn't depends on it in it's CMakeLists.

Great work! You could have mentioned this in the commit log.

> > Note that the fix of package/libcpprestsdk and other packages could be
> > done as a separate, preliminary patch.  
> 
> I will split them and resubmit.

Excellent, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
