Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E98C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:11:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8819261101
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8819261101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37B9560E34;
	Wed, 15 Sep 2021 19:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQrOvktkA8ev; Wed, 15 Sep 2021 19:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B085060C15;
	Wed, 15 Sep 2021 19:11:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BDC71BF30F
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A69560C15
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-cgBRoqpTSZ for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 19:10:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAFF760C06
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 19:10:57 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t18so5595227wrb.0
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 12:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=vSNyzyGR4U/j+aZlMtZwH+Ji+F+5o40//WgEqNiBuWk=;
 b=XCjgLiDX+c7/amtdrDHKxTQpL2ozGi+gCGUMpvQqPnVcVPdzpOo7jXN/x0h/K4AmEM
 e3gp+QygRargbXhdN3NjPOx+z75+0hqCV56mNVucbzMoi4NckjHlzMrllppU2Xb79ipo
 rglepjueaZJew4lUN0eVrW3UzTjNZqpPIRZRHcWwO1OLInRQgyK5WAQnnZhTgz2Ry33m
 hs1+1drq8zVLuE7VptVAVjqtytUahINI2S4651sEK5GN3FQu4EatHSg4bHvxMDm/wZX3
 thQuVhVAH6kCJGE8CzeRPBlZu0Q55s2hd797cq9kKPggKS0oDicN53VwlUpJdOzpY/Ma
 TtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=vSNyzyGR4U/j+aZlMtZwH+Ji+F+5o40//WgEqNiBuWk=;
 b=LansKvZHQKWaL6LhCw7nt6O6eKcWlmzmKz/hWJ23GajXQhV/EywApDDlqCVLw77dOp
 pFh1L0K0G5on0cWUdHPwixaYtGWWVUiJVQrSMVinlaxSd8wdtfxLjDzdNbEx3o2DlNIn
 WRbDUVKJB+zh8c0FSVkEIgIwVmHvrquqBu1nffJDN2adq6TdTrDj/LWX4oAwYecCmlRG
 5t3rrXwKRUnDpjwoKzKuKqfI+yddYCb82UpbwhbtMSeXu/ofRzJ76qZ4hdsOCXwd0zoh
 IWZoaU+myRlqCM/h9Yi6I0AvrV4EGxjMj7CMc2BcRFNYxv3OMw4vi2oqnG76U0DM/dss
 MaPg==
X-Gm-Message-State: AOAM533wKQjaY8UX4Af5SiAyBage9ySWHjDTK8cJrz3Kw1vFD0XA4fZj
 /IgmE18aSRHg//BcOc+qeSQ=
X-Google-Smtp-Source: ABdhPJwV4G16q0UlpqeRSpTPL+aICRvL08+ymMi0aZLsy3JoKrpMk1x+HHpzKcHc4nT2tJO5XD5o4A==
X-Received: by 2002:adf:d216:: with SMTP id j22mr1763594wrh.295.1631733055893; 
 Wed, 15 Sep 2021 12:10:55 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id z17sm876731wrr.49.2021.09.15.12.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 12:10:55 -0700 (PDT)
Date: Wed, 15 Sep 2021 21:10:52 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: David Laight <David.Laight@aculab.com>
Message-ID: <YUJFPP54zlqOJWC/@pevik>
References: <20210914174321.13977-1-petr.vorel@gmail.com>
 <672cac3266544283a755e58c6b021314@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <672cac3266544283a755e58c6b021314@AcuMS.aculab.com>
Subject: Re: [Buildroot] [RFC PATCH 1/1] support: utils: Use python3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

> From: Petr Vorel
> > Sent: 14 September 2021 18:43

> > Python 2 is EOL sice 2020 [1], it's still available on distros, but may not
> > be installed by default (as being replaced by python3).

> ...
> > -#!/usr/bin/env python
> > +#!/usr/bin/env python3

> Doesn't python3 just get installed as python?
No, that's for python2. At least on Debian and openSUSE. On current Debian
testing it's only python3. Sure, I can install python2 package now, but sooner
or later python2 will be removed. And I'm not sure if all distros just change
python symlink to python3 binary, when they remove python2 package.

> So you don't need to change these lines.

> ...
> > diff --git a/utils/check-package b/utils/check-package
> > index dd18d19c25..6540af6b2d 100755
> > --- a/utils/check-package
> > +++ b/utils/check-package
> > @@ -1,4 +1,4 @@
> > -#!/usr/bin/env python
> > +#!/usr/bin/env python3
> >  # See utils/checkpackagelib/readme.txt before editing this file.

> >  from __future__ import print_function

> For p3 you can also remove that import.
Ah, correct, thanks! I'll add it in v2:

Kind regards,
Petr

> FWIW that didn't help me get some python scripts to run under
> p2 and p3 because one of the p2 installations was too old to
> support it.

> 	David
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
