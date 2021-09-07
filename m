Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D23C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 08:58:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9768610E9
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 08:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9768610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 894DF40528;
	Tue,  7 Sep 2021 08:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TzOTW9Y7cvDP; Tue,  7 Sep 2021 08:58:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A200F406BF;
	Tue,  7 Sep 2021 08:58:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C99B1BF48D
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 08:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B91A60BE9
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 08:58:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eMbqiKgTC0eS for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 08:58:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 096B560BED
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 08:58:02 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id n4so5390521plh.9
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 01:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iZWOqPIwoPsISqIuJ5k8eHB0yxCN4N6P7EOckzXHnKI=;
 b=I+WfCjFiTuPesFedyNzZcQC+mL4ByGhVK95WB5PO3yBDJw2o8AncUK60dtFZKGS7Tg
 25QWN4KXDMsy8ygI02kJXfnbBtIw/8C9MG4xaINgXSGwii3cK4KVhaFsJdh4f+WDl8pI
 S3gvYKVDJkUbMGDnC9GdVMveRK3/Rd9BvJ+Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iZWOqPIwoPsISqIuJ5k8eHB0yxCN4N6P7EOckzXHnKI=;
 b=COPqNF5y6OrYJJdM3kExwS/yQ9Mv+sKazz/neSGAkekiWduDGJhgrMhBYUqc8Mnu7y
 UrpitDo1b1tzLLrUXSt2NExnjz0dLeG8DHuBEfDHvjwREBF/ve/n1fNNDCcYRDjcep9t
 3vFdhgSNXRCdgCemqo8xwFGyyQj8srkUmAU8N3FfQUELaRpNF0jVZnasfnOXPvDsSOYX
 /9bpIDD3RPkNjk7XdPtk/abfWAcBnLfRPiy+sfE84wV2U3jME8+JXpG9P2N0G9fi3EmN
 kVltlqhCz4VNGdHPTHRU5Orru2CtV3oVC+i0XtKfp2JxctorFrPZBJR0ZHaaW44twn9x
 gbJQ==
X-Gm-Message-State: AOAM533v6JTF1EJPhFgaon3Bd6vwhnvL4dv4gRP7jQ06IPxfQxKZ+hBp
 1DkhwDP9BngOpMXgjMqvlGBm5Q==
X-Google-Smtp-Source: ABdhPJyDi4EMlMbYQcIwtv4OadjtjOUBFdtdESr3PYhQ/JaY0Y0PRJF2R5M031A7AvDKatOqy+wExg==
X-Received: by 2002:a17:90a:49:: with SMTP id 9mr3491489pjb.80.1631005082354; 
 Tue, 07 Sep 2021 01:58:02 -0700 (PDT)
Received: from p1g2 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id l14sm1950288pjq.13.2021.09.07.01.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:58:01 -0700 (PDT)
Date: Tue, 7 Sep 2021 10:57:57 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <YTcplRmz8UP33lr1@p1g2>
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
 <CAOMZO5A4FXz+3M1m+aQT4hfWtBCgLo7-3c+pOV8XXrrGGY4-=Q@mail.gmail.com>
 <CAEyMn7ZpntE-ZFPrU09oiB5LStkbf-7BBTV1PqJZ3X48pjmCEQ@mail.gmail.com>
 <CAOMZO5ACyWzrmLjnB5M0We_grP7DMXYUkiTTeghz_EH_6Z0Y_A@mail.gmail.com>
 <CAEyMn7ZKBHc8eCn=Uf_RsmRFrnMAOLVf7m_90fRZi8bCVcZscQ@mail.gmail.com>
 <YTckin7wSQXI4a/c@p1g2>
 <CAEyMn7bqZwYArZ0MV=G95dpuH0U_+YzLO+aV_ZHTDrt=wBiZwg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEyMn7bqZwYArZ0MV=G95dpuH0U_+YzLO+aV_ZHTDrt=wBiZwg@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 0/3] Add support to build imx8 images using
 mainline uboot
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Fabio Estevam <festevam@gmail.com>,
 Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Thiery,

On Tue, Sep 07, 2021 at 10:43:43AM +0200, Heiko Thiery wrote:
> Hi Gary,
> 
> Am Di., 7. Sept. 2021 um 10:36 Uhr schrieb Gary Bisson
> <gary.bisson@boundarydevices.com>:
> >
> > Hi Thiery,
> >
> > On Tue, Sep 07, 2021 at 08:36:30AM +0200, Heiko Thiery wrote:
> > > Hi Fabio,
> > >
> > > Am Mo., 6. Sept. 2021 um 17:23 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
> > > >
> > > > Hi Heiko,
> > > >
> > > > On Mon, Sep 6, 2021 at 10:32 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
> > > >
> > > > > What board are you exactly asking for? the nxp imx8mm evk? I have a
> > > > > tree for the kontron pitx-imx8m [1] that has an i.MX8MQ.
> > > > >
> > > > > Maybe this also answers your question ;-/
> > > > >
> > > > > [1] https://github.com/hthiery/buildroot/tree/uboot-imx
> > > >
> > > > This helps, thanks.
> >
> > I've tried this series with our U-Boot (2020.07 based) and it doesn't
> > work for me as using UBOOT_FORMAT_CUSTOM isn't sufficient as it only
> > copies the binaries selected but doesn't use it as target [1].
> >
> > So I wonder, which U-Boot version are you using? Is the flash.bin
> > created automatically when issuing 'make all'?
> > In my version of U-Boot it requires to use 'make flash.bin' otherwise it
> > simply doesn't generate flash.bin.
> >
> > I believe we would still need a new U-Boot target name [2] but I'd like
> > to understand how it worked for you
> 
> Yes, when switching to binman the "make all" target will create the
> flash.bin (all output that is defined/described in binman). So in your
> case when you use the "old" u-boot way of creating this output we have
> to add a new u-boot target in buildroot.

Thanks for the quick reply. Indeed I just saw in your U-Boot tree how
the binman description was done, it's pretty neat.
So do you know if the flash.bin target is here to stay in U-Boot or is
binman to new way to go and flash.bin becomes an outdated target? I know
it's more of a U-Boot question than Buildroot but just to understand if
it even makes sense to add the target if it's going to disappear in
upcoming releases.

Regards,
Gary
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
