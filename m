Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99D4C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2829741505;
	Mon, 15 Aug 2022 09:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2829741505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 67Ku5ts3fyki; Mon, 15 Aug 2022 09:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC74E409E5;
	Mon, 15 Aug 2022 09:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC74E409E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5461BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBAFB60AF7
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBAFB60AF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e99eSGsO2XM6 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:50:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E08086068D
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E08086068D
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:50:11 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id gb36so12621917ejc.10
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 02:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=5SixJW2N0XphGofOoFEnAj6rKnDKqnLPTbmOf9KceJY=;
 b=bRw8yHAzwMbic9AGLzqsS+BeyPCXUeo/uPaZ5SujrSM0Tbkf491O/jLW8uJjJQnCpu
 KOUa10n8gpcPOiownooABcaZg8nAZN/B6SLlC5fxg/JkYFH6yODWO3LT59rc3pTc14mA
 6bJ90v7vLoS4y71leEec28xKnhoVjrqGCkVGxXrElkzN2z9vc4JOakb7HQKh7s6w7YNc
 VKHzR2wWm2hGpYgAhucfqIX6c5qTKrZdGcOuHlEF6kYxVfIAeis+xPFeX2dVjwPfp8gt
 LoyYgy59FkXa06H7PkDwqcUWywftt5zGL3JRWV9RRS8cpYm6OrG/Cqk/z7bGxS7QfPkr
 lgEA==
X-Gm-Message-State: ACgBeo0RjhRFLEMgx4awmIA1rPZuZlCgTM9efw36+hlBZN0VyHSfJ9kt
 Wghu0uMglnpHi5yPUnZHjpo=
X-Google-Smtp-Source: AA6agR5ceHLx6s9gPl+sLDgNF/ZVVgXGzdY2mu7KhqojItEcV1HQqHb+7sx0ntHBeBa3YUNZOUq1Rg==
X-Received: by 2002:a17:907:3f11:b0:731:57ed:3aea with SMTP id
 hq17-20020a1709073f1100b0073157ed3aeamr9800084ejc.432.1660557010080; 
 Mon, 15 Aug 2022 02:50:10 -0700 (PDT)
Received: from localhost (tmo-096-168.customers.d1-online.com. [80.187.96.168])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a170906948700b0072b32de7794sm3879021ejx.70.2022.08.15.02.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 02:50:09 -0700 (PDT)
Date: Mon, 15 Aug 2022 11:50:02 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220815115002.3724bdec@tuxfamily.org>
In-Reply-To: <20220812155233.132edc8b@windsurf>
References: <20220806224338.0159e15c@windsurf>
 <20220808101452.566fd732@tuxfamily.org>
 <20220808102653.5a7a0584@windsurf>
 <20220808215900.0fc19e1b@tuxfamily.org>
 <20220812155233.132edc8b@windsurf>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Buildroot defconfigs about to be removed
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Filip Skoneczny <fskoneczny@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 "Yann E. MORIN\"  <yann.morin.1998@free.fr>"@osuosl.org,
 Suniel Mahesh <sunil@amarulasolutions.com>, Davide Viti <zinosat@gmail.com>,
 Mike Harmony <mike.harmony@snapav.com>, Peter Seiderer <ps.report@gmx.net>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org,
 Heiko Thiery <heiko.thiery@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Fri, 12 Aug 2022 15:52:33 +0200
schrieb Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello Thomas,
> 
> On Mon, 8 Aug 2022 21:59:00 +0200
> Thomas Huth <huth@tuxfamily.org> wrote:
> 
> > Thanks for the pointers! I had a look at the source for a while, and from
> > what I can see, I came to the same conclusion that the modifications for
> > ARM should really not have been done for m68k / binutils 2.32.
> > 
> > I can get the mcf5208 board back working by applying a patch like this on
> > top of the current state in buildroot (fixes both, the segfault and the
> > section overlapping):  
> 
> FYI, a patch was posted and merged:
> 
>   https://git.buildroot.org/buildroot/commit/?id=95402089c314fbc03b934f5fcf9c29db043d758c
>   https://git.buildroot.org/buildroot/commit/?id=9dd179d43ffe9be98035f921a0db2bf051b632fb
> 
> Don't hesitate to give a test on your side!

Thanks, I've checked it and it works fine for me, too!

 Thomas H
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
