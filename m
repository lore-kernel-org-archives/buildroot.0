Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17598CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB7DC61480;
	Fri, 29 May 2026 13:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jk5oBHUJK7Zl; Fri, 29 May 2026 13:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59D486140E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780062288;
	bh=2bYzlDXpGKYOpVWxR+6FuBhVhUIY7vhztcS+TLmMcUk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IWe+Xtcxtmb/LB9vi9rsfOorJB9AIz8mARxMHd9gLXwcgMXrZylnw1ZzSMN2ZaCGg
	 9/7MMJ9Z3Rrsz9KB2i1l30bPYXuyxZIrpvEg6QnSCJbcxpbR52sfPo0zq8FE9NHdAa
	 I2ojVl6MlbfiWSjkifYeVF+TEMUULy5ooC3s6ypjXc7Lk83PQ37TOffUd4xai/3CPZ
	 UxM0CUdR4Kc/duA/C+vtQZLzRyUPD+3egWXjJxYS5wL2giwEW+ddlwk4rSNwBtEDGv
	 rQAkmZHoREAAbjYG51BUXrZN2yDWOO8oEV6H/RP/+TBkcRKqKe2em4coObB+PIe46N
	 lJXYSyYEEXuuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59D486140E;
	Fri, 29 May 2026 13:44:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42B40F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EDD642122
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnPhOdWUTRq7 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:44:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D0EB42121
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D0EB42121
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D0EB42121
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:44:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 85F5B1A373A;
 Fri, 29 May 2026 13:44:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 56097601FA;
 Fri, 29 May 2026 13:44:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 99D6A10888644; 
 Fri, 29 May 2026 15:44:41 +0200 (CEST)
Date: Fri, 29 May 2026 15:44:40 +0200
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Message-ID: <ahmWzUWlNIgPZGjS@windsurf>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-12-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260424132326.825570-12-jeanmichel.hautbois@yoseli.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780062282; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=UVH8O9o3NDogj+ppKE3sDSCumBTW8JG2Q4iEzJegnW0=;
 b=nhktKQrkQJ6bsZzJvbxnvPXGV6Fv4DGuxYW8Md6nOd+lT8lha6eUMSN35awLa4HWAMHwml
 1KPDjKoHcUecLAeXmdoq2s10H2jsAIu5DDOxQio6pEISUeakCtgyi+zePS9xs1ukpM8Ixd
 2QiazKWWgYpzrivGgBYE90FDMYruAxBMyoJJw6CIPwO20F0B9IyVfj0Ira/HxkrDVqg/cM
 E5SfJiDZIFo2OJMJL6qMV+Qo+BfKFkypebBmMrYYLtrvsb5+q2zYTqXhaSFeV83aOMo3Ob
 9Muh1z0aRZBjGecZtGT9Yi0UgGw9U7ujg6ifll3/ZWceE8LSkue2g2xjgBS9Lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nhktKQrk
Subject: Re: [Buildroot] [PATCH 11/11] package/libglib2: add m68k ColdFire
 support
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

Hello,

On Fri, Apr 24, 2026 at 03:23:26PM +0200, Jean-Michel Hautbois wrote:
> On m68k ColdFire, libgio exceeds the default 16-bit GOT entry limit
> (8192 entries). Add -mxgot to use 32-bit GOT offsets.

Why isn't this already happening for existing Coldfire configurations?

> Also enable b_staticpic=true to allow linking static internal
> libraries (girepository-internals) into shared libraries
> (libgirepository), which requires position-independent code.

Why is this Coldfire specific?

> Disable sysprof profiling support which is not useful on embedded
> targets and adds unnecessary build complexity.

This should definitely be done as a separate patch, and even is
something you can send separately from the Coldfire series so that we
can merge it right away.

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
