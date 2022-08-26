Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3678EECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 16:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A41A961136;
	Fri, 26 Aug 2022 16:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A41A961136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pRWtKeC9zhSg; Fri, 26 Aug 2022 16:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D58E61134;
	Fri, 26 Aug 2022 16:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D58E61134
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 272111BF2C7
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 16:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7F3761134
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 16:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7F3761134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q6l2_sJEoiga for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 16:22:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A85E61133
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A85E61133
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 16:22:36 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id t5so2121602pjs.0
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 09:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=0frT8qHswAUS2iCOZxk86tbjg4CqT2NaZJz/04RaQiI=;
 b=z7BW5+fDTW9vNKVJCCuhOkj3go8Io2YtOrcVPGw6QBNi/VCwqa5Fd2577DnL5TibQZ
 t+9QWTYZVU6ScwLp/mV7IV0Jkrn8bC2P5a5qVUPxudV+GUAkNrf4nIC0/ld9cOy1Q0PR
 npHEIc+24+HNWKkdNtrvbAQlrZmhKrxxcVolizHr+keaVqmR5xvDNUd/u0rDj3tkAplU
 1iE6cfhoPoV/jTIf3c+pDM1K+11PO17ZBvnrYp0Pa3dvpt9+kOhKs/ss/IoKInlc4jeI
 OFjJPb/mG1iLdVc4980CgjNvxhghtfuYobnnHr8OtEZHA3y94IUicaqPFtS6WCbQ7C8F
 CCGA==
X-Gm-Message-State: ACgBeo2Jkeq2j4Lzc/JUwMY1PgealxuS1EtcNalBiqqX1jV8aD/UjyYd
 /rRixjoqG9DZKaVTS45iUIhLypJnU8u6egkLVUq+pE1E0no=
X-Google-Smtp-Source: AA6agR7c/D8C4pfVXqoDh463/JzTVymSId56Lhi8h1NUftgRUIbT25cXbcifNxQKh5Vw0WwjZaRgc+4hzgsBiUMUWzA=
X-Received: by 2002:a17:90b:4acc:b0:1f5:7f05:12e8 with SMTP id
 mh12-20020a17090b4acc00b001f57f0512e8mr5011559pjb.92.1661530956521; Fri, 26
 Aug 2022 09:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
In-Reply-To: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 26 Aug 2022 10:22:23 -0600
Message-ID: <CADvTj4qXmsVMsXjKEAFV=s7xUj1odn9J9i-J7vf+rcMM3zRpjg@mail.gmail.com>
To: Federico Pellegrin <fede@evolware.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=0frT8qHswAUS2iCOZxk86tbjg4CqT2NaZJz/04RaQiI=;
 b=BXhjOD1cWVvnyQXsp3mI+0KJsKrSLhXgmddxMLMi/z9ZPmi4jo5yPSqjZpq+0Vau52
 rUD8qr6YZ6BXcO/19xF9yiPh+APp/xljsQM6a6aidA0TFQoRhI+Cn0KWf3a7XvIZpoQu
 IzSuhbZnHG07ckS+n3b3Zli+IYUjKr1aCaLYxJ+7HYeDCYhb973Cdgki4GNKHlqbsvBr
 tYQX+PnIrauIjbL+92uKzvsFFhUrAAuAtcYSrqqMzeamdsFvS9oHdnGxP9eJZA6IJW7w
 +GO3JB67hy9msz6R9RcJjtXRxyWkMBS/OiUnz2WPIsdngF3my98xWU0bb+gZyVfytqG/
 tDjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BXhjOD1c
Subject: Re: [Buildroot] Python pyc only and problem with scripts
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Aug 8, 2022 at 1:40 AM Federico Pellegrin <fede@evolware.org> wrote:
>
>
>
> Hello all,
> I've found a minor problem related to the rt-tests package, but that maybe is slightly more generic and wanted to report and in case understand which approach would be best to fix it (and contribute a patch then if possible).
>
> The specific problem: rt-tests, besides a few compiled executables, installs also two tools which are written in Python, namely hwlatdetect and get_cyclictest_snapshot. These are Python scripts which get installed in the PYLIB and then a symbolic link is done from /usr/bin to them, so ie we have: /usr/bin/hwlatdetect -> /usr/lib/python3.10/site-packages//hwlatdetect.py

This looks wrong, hwlatdetect is just a script, it's not a python
package so it shouldn't even go in site-packages at all, just directly
install it to /usr/bin/hwlatdetect.

>
> Needless to say that once the pycompile.py script is run and original .py files are removed, of course in the "PYC only" setup (which is the default), then the link is broken and it will not work.
> Additionally that pyc files will not work for scripts like that, so just somehow fixing the link mentioned above would anyhow not work, as you need to execute them eventually by explicitly naming the interpreter.
>
> I could imagine that we could have some similar other cases when we are installing Python scripts directly executed in PYLIB and not modules. But I'm not sure that installing the scripts there is a good idea as well, comparing with other distros that doesn't seem to be the case.

Our infrastructure should handle entry points already which generates
wrappers that shouldn't care about the extension of the module in
site-packages:
https://packaging.python.org/en/latest/specifications/entry-points/

> So maybe the problem is really in rt-tests after all and the location those scripts get installed and I may just fix it that way (and contact upstream)?

Yeah, not sure why rt-tests would be touching PYLIB in the first place
if it isn't installing a python package.

> Otherwise should it be more generic maybe could make sense to have a facility to list some files that should not be converted to PYC?
>
> Thanks for any input,
> Federico
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
