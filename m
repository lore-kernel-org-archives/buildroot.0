Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFF2D767F7
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CBC960AC9;
	Thu, 31 Oct 2024 18:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6Wf7hK7vluB; Thu, 31 Oct 2024 18:18:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36B7560AFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36B7560AFD;
	Thu, 31 Oct 2024 18:18:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFCF75E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDD4340204
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19S09zt26umF for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:18:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D6B2840207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6B2840207
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6B2840207
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:18:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36B67E0005;
 Thu, 31 Oct 2024 18:18:45 +0000 (UTC)
Date: Thu, 31 Oct 2024 19:18:44 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241031191844.60ba9a59@windsurf>
In-Reply-To: <20241030002020.73963-1-fancp2007@gmail.com>
References: <20241030002020.73963-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730398725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v+aDwp8Ch9kmwl4ZJ4CRwCwsmIddADXzDCRVExafhcc=;
 b=RclvXcLhxe1UerC4AVsHCTKjZJRBFO9w6zaR022+fAost1V2IxWf7a7wxEFbrQqR0DIfnD
 x/T1Z6l7ADCGpnUzgnS+SeJ8z6IytXcFidHSij5YqbfQWpqURw8bTDw9AFjOGYuzX5uzNy
 8CvbW0GfWRgjcFyU9Tk14QxgrCgKNhKcT/cj/rFkEaVoA9rhOYjzNFearE1Q8N16sBvY/H
 nJvvNdTnjNHvhfYLUGd321QFS6+qcI6ePPaBkaIOBrht349kkyyElRZsRG4G1+iPsgxshK
 1I6Ploq3BO+qX7lAwjvi1V8n8Elfa7LMqrLacz7/IwHNAEjYwMLpXzbUtV8NLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RclvXcLh
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix pidfd_open checking
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

Hello Scott,

On Wed, 30 Oct 2024 08:20:18 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> The previous build setup would check for pidfd_open using
> AC_CHECK_FUNC and would be incorrectly reported as true.
> 
> Also, if pidfd_open() and __NR_pidfd_open were not present,
> pidwait would silently not be built.
> 
> So, changes:
>  compile a small programin using pidfd_open to test it properly
>  conditionally try to find NR_pidfd_open if the function fails
>  complain if neither are present
>  have --disable-pidwait configure option so you are explicit in
>  not wanting and knowing you wont get pidwait
> 
> Backport patch from upstream:
> https://gitlab.com/procps-ng/procps/-/commit/2507bc475782ff5e0541d37c780dff1e293c9553
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

So you're no longer setting --disable-pidwait... but that will cause a
failure:

> ++AS_IF([[test "x$enable_pidwait" = xyes -a "x$have_pidfd_open" = xno]],
> ++   AC_MSG_CHECKING([for __NR_pidfd_open])
> ++   AC_COMPILE_IFELSE([AC_LANG_SOURCE([
> ++#include <sys/syscall.h>
> ++#ifndef __NR_pidfd_open
> ++#error __NR_pidfd_open not defined
> ++#endif
> ++      ])],
> ++      AC_MSG_RESULT([yes]),
> ++      AC_MSG_RESULT([no])
> ++      AC_MSG_ERROR([Neither pidfd_open or __NR_pidfd_open found. Disable pidwait with configure option --disable-pidwait])


... here.

So I'm not sure my previous review was clear enough: what is wrong is
the procps-ng patch itself, it shouldn't AC_MSG_ERROR(), but instead it
should automatically disable pidwait, as if the user had passed
--disable-pidwait.

Or am I missing something here?

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
