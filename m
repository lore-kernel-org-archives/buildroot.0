Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D811C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BB6C81FFC;
	Thu,  3 Nov 2022 21:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BB6C81FFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mGvc_Iqfwh9; Thu,  3 Nov 2022 21:30:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EE3381FEC;
	Thu,  3 Nov 2022 21:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EE3381FEC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECEB31BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C61E040BD3
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C61E040BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tR1t1lTfPI3H for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:26:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 022F740519
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 022F740519
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:26:45 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so6506687pji.1
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 14:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jXvnzNM1/fD5WgLTXZG9hVekebXILiXsRH1ncPe11ms=;
 b=V2E0aG4F9Fdm2TrmCLVBvVTnYhQC9zu0bUHokSXxQqouFSZ4fwJlFqqPA0/3j6GXlf
 MqMHpJ9oZbO1rehCZ/otKc1/Hri3e2jPG7HSob/deIAFTLjqHIq0JuOmgwgxwjFcQyhg
 bhWKxouufsmx+YxDh4d3LEWSFNgYchrpCzL2naaBYE+rljSXIQB3eo/8d1WT6XIVNT5z
 nk8zlBk1ohjvPOiofgzUzh7rZ50QcPUR7TWppkFeJi6ubVW5PEmYTgVyjHuIub73xHu8
 FGRjRL2y0rMd/thurwRK1YsO43J1hqwBBHu2E6+0bgisFYYZYjlqZjMMNpPI2/6S+qFb
 j3gg==
X-Gm-Message-State: ACrzQf3oHWuOXRrQ4sqG57IllTjdSrKQNzhkaCyb9mWVbjFZYHUQ95Bh
 +lBhzWwygah0bXRVNMIrxlh9jRXHziHRdqog/2g=
X-Google-Smtp-Source: AMsMyM6+n+rINo6QcH+YzWDJDqx5dOX1trlvLzIuK76esitozUIGyKZMhbSiL+alRIQmuMJL3LNB2dvy+06nUclGOGo=
X-Received: by 2002:a17:90a:304b:b0:213:d60f:7fc6 with SMTP id
 q11-20020a17090a304b00b00213d60f7fc6mr24919506pjl.92.1667510805354; Thu, 03
 Nov 2022 14:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221103202350.9395-1-james.hilliard1@gmail.com>
 <20221103220710.409e33ea@windsurf>
In-Reply-To: <20221103220710.409e33ea@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 3 Nov 2022 17:26:33 -0400
Message-ID: <CADvTj4q=9OB0Qk-E=UhDj3Dp3KCQsB+cJceZpLvJnoYU7B9vqg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jXvnzNM1/fD5WgLTXZG9hVekebXILiXsRH1ncPe11ms=;
 b=XHEeYJaiYXgo+C2XazkodnLGIB8+B5SFARC5gpHFNyiFkgnjHcUl6rtg3pRZyDZ+Zl
 tDj264v2tJ1DNrzD2N2wItUZF5r+jYpsrHoMuEmcH4KFx3Odw+UO9GfyyDF+s3nugPbS
 TsZgUrHyuQN+/v5ZoOWsGcyk+okZd99gthCkOotb5EMSjHZEj8KEj0/oO9rFR9f5zuOO
 elp7RWX/5gqvBjTEvZHAdWJdrs6/k7OqaRn/0RFlCWLIGM1KhmKbxQlZO/u4tBYNfqIM
 AOwX85HuZ+CzdJ/Hm9zayxcAGBkC7mEnC/2rKrgdH4k+P6ibdELdb2Oxn5wgt1mATtiP
 qUiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XHEeYJai
Subject: Re: [Buildroot] [PATCH 1/1] package/python-twisted: bump to version
 22.10.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Nov 3, 2022 at 5:07 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Thu,  3 Nov 2022 14:23:50 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> >  # When bumping this package, make sure to also verify if the
> >  # python-treq package still works and to update its hash,
> >  # as they share the same version/site variables.
> > -PYTHON_TWISTED_VERSION = 22.2.0
> > +PYTHON_TWISTED_VERSION = 22.10.0
>
> Hm, did you look at the comment above these variables? :-)

Yep, tested that this didn't break python-treq build which only has a 22.2.0
release so far.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
