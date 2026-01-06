Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8040CE9D6B
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 15:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E6AA402CC;
	Tue,  6 Jan 2026 15:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYsfQtxLrD76; Tue,  6 Jan 2026 15:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF9FC4033C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767714654;
	bh=mbZTtRvRl4+85wnDqSk1Ko6JicT8KTuF6xjjy3Y4IXs=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SHsXH9Lb3/ioehb1Q20sUfASyX1YFMPrCVqPEoCvIw5BaSaGfWkzhfN32iFbPLozf
	 eRuHs6cLqxERKsPkPl5Tkqha/NCm2MkXSoJODLlj9uXRKvtk2SNKRgIrXUljS6FdYO
	 66VQzfgbadtb4KEsPZVqd/MFfgwDalDoAQqgXnvHgIcK9QoBG3JtZU8Z2zqqaT8ftt
	 dV+uoh0wBtR8vmUFoZ4UkvVn6W9L2xDD1+IDXZZUukCDnPFVDB+Hq32uz8jUse7c21
	 hxG5ro0QGAfAoWgqgS7TNt5JN7iNRDZ+0WW4yasWWImKyhuUK8SIgJCrQeEv8RwqSh
	 u83+w0I18cXDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF9FC4033C;
	Tue,  6 Jan 2026 15:50:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 145F72A3
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A48E40420
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 630okS4UQA5R for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 15:50:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 20BD640060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20BD640060
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20BD640060
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:50:51 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5959d9a8eceso1220176e87.3
 for <buildroot@buildroot.org>; Tue, 06 Jan 2026 07:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767714650; x=1768319450;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mkPB78o0yccWem09D9Y9nHjaotfiTyVuZSemxC+D/pQ=;
 b=o73uP/O1VzwieapY5aY+RdgfvcWLWktVl2/mzt4tb4K9v5IGqirSmzG4sXWzav3Ylq
 bSFuQUnoKSSlN7U4ZcwJ8AmoRrjSeo+4t8/rKBkRO3h//kxZqAMxO8reDXMelNRxRyuy
 t5y4YTYBQxYioHvmiyZeFCxb48wITnpfK3lS9pg+VHQvEkAny016+066m6keoDeUDlVL
 YZxuCSyeK6wtQiZfmiLHQFoEspWOsMUmxAlUdiUFn5H2vk2upPoYBk6+RLEV6tQ9fQjQ
 rjJfToEGtxuMEBj8AA+zkfQtS7T120csxiyiYnOnS4YsAX5O4pjXIaxcaTDBViT6IbeA
 0uww==
X-Gm-Message-State: AOJu0YwUrdDeSYP3uPnBPQV3mjipMm2QtBuHHS54mjQOU88EbB8T/9e9
 16q52IZfBeGYscByaD33sSTe/k3v2GJEq51PfsHQeazCXSLR837zQZ/U/kLufVNA5V8EDte/ggD
 0FhsCMBV6UN4foic2sS80+gl/wZft7p0=
X-Gm-Gg: AY/fxX5E/lRCRE9CbfUdw3+OpEuIHArn2Jw7/zgvY744ebRh4H8wp98mCu13nGRTeKL
 Ilv4ws+JAAtO/+jVhxS/MIwvydFmCxolFRVWoJBM9UsazhFyPzkIe+gCuXsoctUMzyRXtJrnltz
 f2NOu9XZ870s2uv3MXB7XJdA3u4LXE7hDbigv4cApHXrvN92/dPD4o+dprLWe0afIjrGYMnuAuP
 GX7qHLvJZEYgjvlUEKKHmjiRj9AadvgDQ7ajQ7vSuEQ9E9JxKgpkNhUbOaCY20wVx3xbhgR
X-Google-Smtp-Source: AGHT+IGG9KmSaKO9k3eFRACw6Pv+JGN1jg+vo6iowXl89kvf/JWCrXHbjw+j90V8L2c7mSjnaZE5Bwa+++Y11bF6HPI=
X-Received: by 2002:a05:6512:3ba2:b0:598:8f90:eff2 with SMTP id
 2adb3069b0e04-59b65266282mr1328758e87.50.1767714649275; Tue, 06 Jan 2026
 07:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20260106151022.29135-1-heiko.thiery@gmail.com>
 <20260106164314.142d9032@windsurf>
In-Reply-To: <20260106164314.142d9032@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 6 Jan 2026 16:50:36 +0100
X-Gm-Features: AQt7F2qDwTWAgPQb0KdlJi0IO2c50d6ESFWlCOQrbFmuiVrUJOfHo9iQHFjqRR4
Message-ID: <CAEyMn7Z9S2_u9=6_c93OTZ6fY-mZkjaJpux=CPSfur-fq2O7Rw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767714650; x=1768319450; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mkPB78o0yccWem09D9Y9nHjaotfiTyVuZSemxC+D/pQ=;
 b=cjwQelW9I/R3PpJHVa+HD6xdrRNS5mD0y4Nw+YUmEOO0vpKoHtK8o8efnPOsjpejZh
 XxKEZuwb+Jva6r8G4zSbEWTAu+QOC6b32QQ+AWm6bILgMON0IRF041zsYK6UG7Cx4UBF
 V7pJA4aOPbQp6n6T3q0K1RNOKcGuG/qAakFyZycSicV/ZjXOvWDHoMDtN7A52TnU6pWe
 BhyDb+ZydANcf8GuxcaQTWGl6Bx7CjWWRiU0CM0GK2PUBN6FcH/lm6DSAMS/vI6qc+fU
 /CGoewDIhhwH1ZCKFc5tC/DKeCuaC8/zi2eikXNMnkX84oMNybT7cuNrcqzigmNZ/Fpe
 2bSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cjwQelW9
Subject: Re: [Buildroot] [PATCH v3] package/uboot-tools: use uboot host tool
 printinitialenv to extract env
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
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 Michael Walle <michael@walle.cc>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am Di., 6. Jan. 2026 um 16:43 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Heiko,
>
> On Tue,  6 Jan 2026 16:10:23 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> > index 1925047ccd..69e03f40d8 100644
> > --- a/package/uboot-tools/uboot-tools.mk
> > +++ b/package/uboot-tools/uboot-tools.mk
> > @@ -154,10 +154,11 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += uboot
> >  ifeq ($(UBOOT_TOOLS_GENERATE_ENV_FILE),)
> >  UBOOT_TOOLS_GENERATE_ENV_FILE = $(@D)/boot-env-defaults.txt
> >  define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
> > -     CROSS_COMPILE="$(TARGET_CROSS)" \
> > -             $(UBOOT_SRCDIR)/scripts/get_default_envs.sh \
> > -             $(UBOOT_SRCDIR) \
> > -             > $(UBOOT_TOOLS_GENERATE_ENV_FILE)
> > +     if [ -x $(UBOOT_SRCDIR)/tools/printinitialenv ]; then \
> > +             $(UBOOT_SRCDIR)/tools/printinitialenv > $(UBOOT_TOOLS_GENERATE_ENV_FILE); \
> > +     else \
> > +             CROSS_COMPILE="$(TARGET_CROSS)" $(UBOOT_SRCDIR)/scripts/get_default_envs.sh > $(UBOOT_SRCDIR); \
>
> The redirect is still broken here, this command line is not correct, as
> it's not the same as it used to be.
>

shame on me .. I shouldn't do things like that on the side and then
send them out untested.

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
