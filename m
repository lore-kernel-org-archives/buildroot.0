Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24D5C3DA45
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 12:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A0BE80C13;
	Wed, 10 Jul 2024 12:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEr5NbK04420; Wed, 10 Jul 2024 12:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E91681FB0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E91681FB0;
	Wed, 10 Jul 2024 12:26:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D68BA1BF5A8
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF01181FEE
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_AOfh8-g579 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 12:26:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C06FC80C13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C06FC80C13
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C06FC80C13
 for <buildroot@busybox.net>; Wed, 10 Jul 2024 12:26:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF60440003;
 Wed, 10 Jul 2024 12:26:44 +0000 (UTC)
Date: Wed, 10 Jul 2024 14:26:43 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240710142643.2e5563c9@windsurf>
In-Reply-To: <20240710090848.2697402-1-francois.perrad@gadz.org>
References: <20240710090848.2697402-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720614405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYR26YSC1B5YNutrTBxJL+tndYXWApyXvOK+3YS/4dg=;
 b=BiW8UbZmmtYwHzMqf4djzoMdzZMVXMD0e81v8um59FSVnzMl3epzwcGMvExpxd4tCHBwcL
 IWSTRsIMo0To/ApiXXJ9omjXQkla6OC3N+fJ3d+uC9AOVy/jYnHtI8IxLXgzjwc+CH6mgZ
 c3dSHv4436N5cOFn4mTWVEvI5nsZAC214asuMIoQvdv+q/EaWNgaGXu5q6xnUIooHyr8BM
 ESFuReqt/g6iz9A/24DAoP7fqs7WG8cH7fWXLhWAXxiaB3QubMJadDD7BwPIW6cjHU50z3
 N8q1NsIfkLrTEq9gu3Lcvkg+dMfOklQqrP3H54HXk1uAatJ80/1JUgFV83PDYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BiW8UbZm
Subject: Re: [Buildroot] [PATCH 1/2] package/lua-livr: bump to version 0.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Jul 2024 11:08:47 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> diff COPYRIGHT:
>     -Copyright (C) 2018-2023 Francois Perrad.
>     +Copyright (C) 2018-2024 Francois Perrad.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-livr/lua-livr.hash | 4 ++--
>  package/lua-livr/lua-livr.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
