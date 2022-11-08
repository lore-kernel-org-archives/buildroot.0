Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF64C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 21:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D0DE41731;
	Tue,  8 Nov 2022 21:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D0DE41731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OAMXRZ8kPdwL; Tue,  8 Nov 2022 21:50:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 056934031E;
	Tue,  8 Nov 2022 21:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 056934031E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3755C1BF5EA
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 21:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1459D60E8E
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 21:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1459D60E8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8qLi54ZO95PL for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 21:49:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3123860E81
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3123860E81
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 21:49:57 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so91022pjk.2
 for <buildroot@buildroot.org>; Tue, 08 Nov 2022 13:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AXRb9uouBlfYGpcBw4rZWapywNn9Jbnv6LXAJlMeIN0=;
 b=AEVtaOG9kmCsXZK2fnLvlbV5czkpBw8j6h69+TBIm20fCk+0m/3LNZq2sr78VbTtV5
 vIxccV9LWMOpcqbvynAyFtnHdLC8aKjsSVZlzXjuHKL6YF8iEvXrW8JRzM1dALn22xQQ
 4ZejkUeQ/0PnlhIorQWxc/cRyg+xukNSTly2az+iiwXIOhu/9RRe90knUxIx3Amdo9Oz
 rh0LKX/CK4WUzV8Pd5l5SkprgybwsbrR9tkvbQDp/lemZd1G6k44ZyjcmRLgsTKuLoHo
 DbMR7nXR4zBU/hndu9Fl/hpu10lU3vTrSM0Jo8298+jw+qaw/IEH0V5aPtqkEcXxkfFV
 jPaQ==
X-Gm-Message-State: ACrzQf00xQ997JH2FYg8cBmR/zqbQCOtFm3Koe+gWQV6Lf89Jk/+N21a
 /nmZbBFEA9Gc+o561ES4HJ9SzvPjG491uDYonCv1nSwDOxHvYQ==
X-Google-Smtp-Source: AMsMyM4KPLlhNXyDQ9Q/Bsixolbe05OllgRjrXpTIoJaZ+VYp/OFKA/OKlNDezh/S6CV44Ew2WTZmJ7VfgkNI0FKHm0=
X-Received: by 2002:a17:902:e552:b0:179:e795:71c5 with SMTP id
 n18-20020a170902e55200b00179e79571c5mr57246387plf.57.1667944196366; Tue, 08
 Nov 2022 13:49:56 -0800 (PST)
MIME-Version: 1.0
References: <20221103202350.9395-1-james.hilliard1@gmail.com>
 <20221103220710.409e33ea@windsurf>
 <CADvTj4q=9OB0Qk-E=UhDj3Dp3KCQsB+cJceZpLvJnoYU7B9vqg@mail.gmail.com>
 <20221103230030.5b78b481@windsurf>
In-Reply-To: <20221103230030.5b78b481@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 8 Nov 2022 17:49:44 -0400
Message-ID: <CADvTj4rqJ2OH+3t8jEtS32eC-H+513=unOhEzp_YHYD0kf+FUA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AXRb9uouBlfYGpcBw4rZWapywNn9Jbnv6LXAJlMeIN0=;
 b=jhnRoODnIQwLtAe7qh9/v6vBAqZtWyNpXRz8wjuQGF/w6Ehkzkhca68SBQkWiHCczN
 KVwzVy883f7K585qY0+9hoL9h/PJcbPGGaCBQxQeMwAgh8luIHz9XTKoGegzpm0Fha20
 dXJ4wp4g4HMunrOK8b2yDjLzGZZ8BBA7HWjjC0YUHTO0m7DBcHM4Jn1PXWsC8A8fLgAq
 h9taiDYePTd9pBSkfOCWI65EqWA7jt3qL3n8JHXXceStFfhNsFkcSLvYhc2Cyq/bxM29
 A8GB4zGs4I7EKFho34aib0tp6z574Bg1iQru8/GafpoZNa+2bkSK37WH8xLF/Is87EcZ
 43nQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jhnRoODn
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

On Thu, Nov 3, 2022 at 6:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu, 3 Nov 2022 17:26:33 -0400
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > > Hm, did you look at the comment above these variables? :-)
> >
> > Yep, tested that this didn't break python-treq build which only has a 22.2.0
> > release so far.
>
> Something to note in the commit log? :-)

Noted in commit log and also removed the bogus makefile comments in v2:
https://patchwork.ozlabs.org/project/buildroot/patch/20221108214826.3564056-1-james.hilliard1@gmail.com/

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
