Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5511C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 20:11:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85DAE6126A
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 20:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85DAE6126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 551FC835A3;
	Wed, 29 Sep 2021 20:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZpS05f7nSV7; Wed, 29 Sep 2021 20:11:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3D95835C8;
	Wed, 29 Sep 2021 20:11:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58B1A1BF36E
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 20:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54D8D60736
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 20:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_3r6DAXrarc for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 20:11:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14941606F6
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 20:11:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id x20so6198449wrg.10
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 13:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=QWjejOj0nQ8vrp/yoM++4MpGyrHwnCFElFVLY+DhhSQ=;
 b=DWDgLHXfradl8Z66hVZFkFY2Q/tDYc6EmqqxqxAPK42Fs76RMWdMbLsxx1JDuBhEwv
 GSaqL9+LNI2JiQ7jdaLfmxMQnEKQOGHaHluiRBPZXGfK6M6EOuzV0KXcfX7zTFh21pY/
 NA85ug3Yg8zI2u+AWyJnEC/O3cbut1ZseaDIPIjfOTWRQUB+oNrdpgnVLo0zHQ1Qb9en
 d3ksB4HOf82Gs59LeolnswuSfo/UoSoZwe3mHtyB3/qS2RDePQh+ucXvdh5t+zKTxvZO
 DPeBNc24dJCo/gOotEXqWZwcQ64ssZo/2VxMLfNHXlq2XJDKpaE/YRbiNZQ0+K7Qz/nq
 gUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=QWjejOj0nQ8vrp/yoM++4MpGyrHwnCFElFVLY+DhhSQ=;
 b=qNSVT7vP5uFXSiVfRmgYDToS/JUdflHIddfkEp33qoxiz5VeQa3leNqIMzVR1vRTA/
 jdTJHKlXGGpxZ7BkODkpD5O90SYVnx2zoyAYJ7WpxTi89A/+ngsdC/NBZsqcg7xGThLw
 Lcv4LLoWr0jfb/jebemTK90f3fYr1un/m4O+IZXL32FosyFVVAaC533hgDHiG0Tkq3a8
 /zizfT0qRuDrquAOmgyGPCPcSEk96hD5+vab8ruN+GLJThb4Qq0TNho3sXZUW7DbZFCN
 lU8avlE/nQhoExknkNx8tHx5trvWMC6rIzh4MZ9IS4+Lim5EZxIznrkPvGfakSBpRPlq
 p23Q==
X-Gm-Message-State: AOAM531NPsoaDm+3WjzmJqDTiEDnDgxdirY2NDkSkA/+ws+Lysown4Lb
 iR1tOjwG0vJexgGx3U8lxqA=
X-Google-Smtp-Source: ABdhPJzyJqD+f/wtpZlsl25Jc04ae5JYKRi/JJeMs4oDY9DQMiz2TlUb7OJ8LJdT1CCWFrD5gEeuvw==
X-Received: by 2002:a05:6000:124f:: with SMTP id
 j15mr2232024wrx.366.1632946310236; 
 Wed, 29 Sep 2021 13:11:50 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id l21sm2622640wme.39.2021.09.29.13.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 13:11:49 -0700 (PDT)
Date: Wed, 29 Sep 2021 22:11:46 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <YVTIghzHs82uFBIe@pevik>
References: <20210928195533.1736944-1-mmayer@broadcom.com>
 <a87c586e-1e73-a3e3-7722-c56e48809d76@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a87c586e-1e73-a3e3-7722-c56e48809d76@mind.be>
Subject: Re: [Buildroot] [PATCH 0/1] Build issue related to "command -v"
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 David Laight <David.Laight@aculab.com>, Markus Mayer <mmayer@broadcom.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Markus, Arnout, all,

>  Hi Markus,

>  Thank you for this extensive investigation!

> On 28/09/2021 21:55, Markus Mayer wrote:
> > Hi all,

> > After commit ca6a2907c27c[1], our automated nightly builds started
> > experiencing build failures. It took a little while to track down what
> > was happening. I think I understand now what is going on.

> > This is a bit of a lengthy email as it was a bit of a lengthy
> > investigation, and I want to relay my findings and some concerns.

> [snip]

> > One thing of note is that our post-build script calls "make legal-info",
> > and that is when the problem happens. The purpose of doing it like this
> > is to include the result of "make legal-info" in the image.

>  Calling into Buildroot's Makefile recursively from within a post-build
> script (or a package or whatever) is not something that is supported, in the
> sense that it's not something that anybody ever tests. The use case
> definitely makes sense though. I even heard of people starting the build of
> a different configuration in a post-build script (e.g. for an initramfs).

>  So maybe we should add a test in support/testing that validates this scenario.
+1


> > However, when make is invoked a second time with HOSTCC already
> > defined to call ccache, it'll still assign
> >     HOSTCC_NOCCACHE := $(HOSTCC)
> > which now redefines HOSTCC_NOCCACHE to *INCLUDE* ccache (since HOSTCC
> > does, from earlier)!

>  This is clearly wrong. Your patch helps, but we still have a similar
> situation with HOSTCC which will be .../ccache .../ccache /usr/bin/gcc in
> the recursive invocation (i.e. with two times ccache). Although maybe that's
> not really an issue - "ccache ccache gcc -v" at least gives the expected
> results.
Ah, sorry for not catching this.

>  I'm thinking that maybe we should detect recursive invocation in the
> top-level Makefile and behave differently. For example, everything that is
> exported doesn't need to be exported again, and stuff like that. Or at least
> we could protect the entire HOSTCC etc. block against recursive override.
+1

>  Also, the entire handling of HOSTCC is a bit flaky. It is still from
> prehistoric commit 8027784 with no clear requirements (e.g. is HOSTCC
> allowed to be a command with arguments? Is it allowed to be a relative
> path?). It has been documented after-the-fact in
> docs/manual/common-usage.txt, but I wonder if we really still need it? I
> guess it's a way for people to use a host compiler that is more recent that
> the distro-provided one, but it could just as well be added to $PATH and be
> done with it...

> [snip]

> > Here is where it gets interesting. "which" will return two lines, one
> > for each of the commands:

> > $ which $HOSTCC_NOCCACHE
> > /local/users/mmayer/buildroot/output/arm64/host/bin/ccache
> > /usr/bin/gcc

>  As mentioned by Nicolas, we really should quote the argument to "command
> -v", or apply $(firstword ...) to avoid this issue. Indepedent of which or
> command -v.
+1 
IMHO quoting would require fixing unwanted redefinition
HOSTCC_NOCCACHE, ($(firstword ...) would not but hide the issue, thus I'd prefer
fixing the redefinition.

> [snip]

> > As such, relying on "command -v" seems a little risky in that it opens
> > up the possibility for strange build errors that others cannot reproduce
> > and that nobody would ever think to investigate as being related to the
> > "command -v" implementation of a specific shell.

>  It is solving an actual problem (i.e. that "which" is deprecated in some
> distros), so the best we can do is make the change early enough before a
> release so people can discover problems with it.


> > There is also the issue of some developers working with different
> > distributions. Somebody developing a feature on distro 1 might create
> > build problems for others using distro 2 and vice versa. Neither would
> > have a way of knowing ahead of time that there will be an issue.

>  That issue exists regardless of "which" (which BTW has different
> implementations on different distros anyway, so it can also cause problems).
+1 FYI there is LTP script to cover some which functionality [1]. IMHO type or
command -v are more tested in shell implementation than this simple test.
> We try to minimise the external dependencies of Buildroot, and removing
> "which" from the external dependencies is a good thing IMHO.


>  Bottom line: I think we need to take four actions here.

> 1. Apply your patch.
> 2. Improve on it by detecting that the Buildroot overrides have already been
> exported and don't need to be exported again.
> 3. Verify all calls to "command -v" and make sure the argument is either
> quoted or uses $(firstword).
> 4. Consider the removal of HOSTCC and friends as user-settable variables.

Thanks for further investigation.

Kind regards,
Petr

>  Regards,
>  Arnout

[1] https://github.com/linux-test-project/ltp/blob/master/testcases/commands/which/which01.sh
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
