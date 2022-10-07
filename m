Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E52C433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 06:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17EEB419B7;
	Fri,  7 Oct 2022 06:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17EEB419B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AqQNOhQ_zqaj; Fri,  7 Oct 2022 06:46:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DABD541977;
	Fri,  7 Oct 2022 06:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DABD541977
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E828A1BF2C8
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 06:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2CAD83F9A
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 06:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2CAD83F9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id paE1UBykoq0T for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 06:46:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDD7083F95
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDD7083F95
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 06:46:22 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-357208765adso36726987b3.12
 for <buildroot@buildroot.org>; Thu, 06 Oct 2022 23:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HDLkh7TBMtHgVBaifQYy0C0V/NaxfO+/fdCvC7xe3XY=;
 b=rcSxj+cryCBWYt9jJ8eYsJ2Tx2H92XxO0AtYTbDUIZjRUGQoyg8cM+no+oB39foF2H
 XtDqu9IVe+WsuFDK8gICD7mFLDL5Hg5JVnN/cr4BS9FI//U/ZwBygIIIdHuAUU9TDl33
 jcWNyLDF4Tp/vrf+0IZbPE3IlqUCYVVvcqI68P0/dbhj2SByoShbg3EMbBEjI5m3XoSL
 PoN73zrTgOP1U1VmHRlkFNwIaJP1p4vDJe/MDfCL095B9pZA3DyyPFU1Wbfhvu28XbMc
 lK5u6462wd3p+vM6g39aNC6+tBDyX1/2hN+ipb4FO4wV3S2MNYC1MMYybZduLOWdQyu0
 9obw==
X-Gm-Message-State: ACrzQf3gk+lrnccHZ/OrYjWNHQIBisK9IT/tS7v9DLCNrJnKYEJaskXm
 W5hKJWwMwXA62I035g4cYVOk6Nd39LjK+1M0w8buEQI2TfY=
X-Google-Smtp-Source: AMsMyM5EqBQlIuneURsmdN6U6Ki+V0OlT/5LbPh3Yx5DU0l53/OKhUuPhYb9LYPOh7IfSAn3sb5icRVre3O7nucnNUg=
X-Received: by 2002:a81:7bc5:0:b0:357:dea:4e31 with SMTP id
 w188-20020a817bc5000000b003570dea4e31mr3157170ywc.164.1665125181905; Thu, 06
 Oct 2022 23:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221004143943.1456694-1-nunes.erico@gmail.com>
 <20221006221236.7dd6580a@windsurf>
In-Reply-To: <20221006221236.7dd6580a@windsurf>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 7 Oct 2022 08:46:10 +0200
Message-ID: <CAK4VdL3BWokVL9BHrYZqoKC7cfYZ3_znw-cE4pw5JZ_P7Dnqvg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HDLkh7TBMtHgVBaifQYy0C0V/NaxfO+/fdCvC7xe3XY=;
 b=PQ7nwiRdlYBn85wNPSCqIn9+XjZDpauwigN3n9nmkLQoSlKd8IXAuFnGHB7XXUIGLV
 4Q8KTGu+WLxMmrSrJE5eY6Xo3xP+3AsD6zot4DlOG3s5mNQqnNwkgh6VSzeBVa/vRzHO
 zep2TLNK96D2CwQGSFiKEUWfJBaZVdo0Yn7Vl+2hkM/gA4JnahFlRy5bKsCxspatbuB1
 XzvhoAkKtIuas9ix8LyRp+Jh8EOUQaLwdBTl11t2dUXqLLFNxIOZfSlf+MxfIrW9tucy
 mHsrIkobuOtJ0iqKUdlWT2N3jJmUV4NARUjVMiRPhE+v25om17BEE9hOJuvSMaeLGH9d
 Nfzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PQ7nwiRd
Subject: Re: [Buildroot] [PATCH v2 1/2] package/efivar: bump to version 38
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 6, 2022 at 10:12 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue,  4 Oct 2022 16:39:42 +0200
> Erico Nunes <nunes.erico@gmail.com> wrote:
>
> > Drop backported patches and rebase the ones that are still relevant.
> >
> > From version 37 to 38, there is a new build system in place, which is
> > still custom Makefiles.
> > This introduces a host-efivar package to account for the 'makeguids'
> > tool. Previously it was not too cumbersome to work around building that
> > tool for the host, but with the new build system it is increasingly
> > coupled with the target build that the least hacky way to work around it
> > is with a host package and a Makefile patch.
> >
> > Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
>
> I've applied both, but I'm not super fan of the Buildroot-specific
> patch in efivar to not build makeguids. Would it be possible to work
> with the upstream efivar community to find a suitable solution to this
> issue?

Thanks.
I did check for related work in upstream and there are two relevant reports:
https://github.com/rhboot/efivar/issues/130 reports the makeguids
issue in cross compilation. There is no solution proposal for it in
its current state though.
One potential solution is to change the build to something less
custom, like meson, then in https://github.com/rhboot/efivar/pull/216
there is a draft pull request to actually move it to meson.
Assuming that gets in for the next efivar release, the Buildroot
specific patch could be dropped by then.
I think what I can do at this point is test that locally to see if it
addresses the major problem that we have with Buildroot for a future
version bump and provide some feedback there.

Erico
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
