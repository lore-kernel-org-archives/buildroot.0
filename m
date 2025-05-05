Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D06C3ABB9
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 22:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 348B34084B;
	Mon,  5 May 2025 22:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUKe39xyflK8; Mon,  5 May 2025 22:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C8C14065F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8C14065F;
	Mon,  5 May 2025 22:15:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96C9912E
 for <buildroot@buildroot.org>; Mon,  5 May 2025 22:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 783A1406B8
 for <buildroot@buildroot.org>; Mon,  5 May 2025 22:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBxwXbDmfkBS for <buildroot@buildroot.org>;
 Mon,  5 May 2025 22:15:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=vassilisamir@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 522C34058A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 522C34058A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 522C34058A
 for <buildroot@buildroot.org>; Mon,  5 May 2025 22:15:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso22256935e9.3
 for <buildroot@buildroot.org>; Mon, 05 May 2025 15:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746483309; x=1747088109;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZc1OOaBzoiQfYTImHTRBD1lUdcpG8O8zc5ToDZQ3Iw=;
 b=ak4///K74E+Yf/Grn2fSf/9JrFx+jiUYNLysuHEbHYU5m7iL9gU1HbkDEPkWZugJ1I
 mcXqCjc0srMVo5v00NKtWtK6voy8WDYmw7dJLE9oOAgBv1S0q0dEWGNQ2SeiAVDgUELV
 j0coXTtSLk6BoI/rkMgklMNiV4cE0Re2w4XWPdV9chpC0Re2ulx942Zn1wIF8jv0ThzM
 hX7NEyTcN/K1EPG8CWLLO70V5ZNVgt2fD/+b7YmfGxeiAIvOgn22J7gV8ZrGDjEuUtPI
 T6QRoz1M35mzWUB/wORmVkpJiL4bKmWH0xjhG+9mbzIQ4i4jQUPxYffdQtTjj7jylKDY
 YshA==
X-Gm-Message-State: AOJu0Ywkmzdm5Ly0FEsN0o55UyEErq8Ojf5tEewnFe9EbnBehhU/L0cC
 oeV7VihJqjdU1IXgLASwtR9Wa3ndrcqVeGgqTqTy8ESRky+hD7m+SQtOHw==
X-Gm-Gg: ASbGnctaZxuXzbD8q7EPm72tbAG9T21xsNZuKabfmN6Hglg/DNgua8fiWPtHt77ZPsy
 4T+dn1a9GxoQk9ZSFBscpbwpc2AHtWHnqBjjThG5Bep8pepD1P3aV4gaW7CqqqAkcFvR0CSVrxN
 9JalGgFOqh46tP4+FzVXzaKBDxsRn1chjE+fZCzvLQDZqQccLgBSgN01PTjnhPszMO9G7HV+VAd
 ACG3vpZhCT10gxNQ4QSjNL/6DwOnQgDvCbQLNr7d1PUkgWFmXGLvpWxHXUT4MH9U0b72lcJczHe
 5Qgwz8Hfw3DwKocb1OJbOuxVaDzagbzimevUc1qhlm0VlM6M5i0=
X-Google-Smtp-Source: AGHT+IHIU8/2SOZ8oFLH23hEtoV06YPX6GxUink2pCENc0qhu0VCZ2WatEFiMWn8LoEvMopHakaDZg==
X-Received: by 2002:a05:600c:1c9a:b0:441:b3eb:5720 with SMTP id
 5b1f17b1804b1-441c494727amr66985955e9.29.1746483308904; 
 Mon, 05 May 2025 15:15:08 -0700 (PDT)
Received: from vamoirid-laptop ([2a04:ee41:82:7577:be43:aeb9:2855:fff3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2aecc20sm192130595e9.13.2025.05.05.15.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 15:15:08 -0700 (PDT)
Date: Tue, 6 May 2025 00:15:06 +0200
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <aBk4au4rQpZJMrTQ@vamoirid-laptop>
References: <20250403224419.26193-1-vassilisamir@gmail.com>
 <20250419234047.2a5f229f@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250419234047.2a5f229f@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746483309; x=1747088109; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QZc1OOaBzoiQfYTImHTRBD1lUdcpG8O8zc5ToDZQ3Iw=;
 b=Wa7k+fLmeShZpUurN1o1NBoSrAITBZhfuz2Lb8nYXk9ctqf7ws6FQSLpxQPsL0sQ0H
 Fk1rUMNKvhBXZPxnfBk0pV0rn41XnIeXocdcjjsnA+ErutIVa2moAmOsnhhNkn2/72h6
 Kb1WcJIFR4W6BuVaFf/KF52TGGWhUbt7D5t4OadI2cfhgaq5K4H9E8+fsjm7jv9aWtK0
 Xp2IWLGZyU2i1VwnBV3udhpJulr/I1Na/FR/9FmAID5m3AzBhqdgl3dBARkq6TTeaAn9
 gzxWzpwMTO2xKuOoJXopORFV204IxMFjqDfi770ssoWtlSDRzzyF9J4eV8Fswzu3NEYY
 RSEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Wa7k+fLm
Subject: Re: [Buildroot] [PATCH v4 1/1] package/linux-tools: use
 PKG_CONFIG_LIBDIR in perf make flags
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Apr 19, 2025 at 11:40:47PM +0200, Thomas Petazzoni wrote:
> Hello Vasileios,
> 
> On Fri,  4 Apr 2025 00:44:17 +0200
> Vasileios Amoiridis <vassilisamir@gmail.com> wrote:
> 
> > After commit 440cf77625e300e683ca0edc39fbc4b6f3175feb ("perf:
> > build: Setup PKG_CONFIG_LIBDIR for cross compilation") in the
> > Linux Kernel it is needed to add PKG_CONFIG_LIBDIR in the
> > make flags to avoid warnings from the Kernel, such as:
> > 
> >         Makefile.perf:207: Missing PKG_CONFIG_LIBDIR,
> >         PKG_CONFIG_PATH and PKG_CONFIG_SYSROOT_DIR for
> >         cross compilation,
> >         Makefile.perf:208: set PKG_CONFIG_LIBDIR for using
> >         Multiarch libs.
> > 
> > Signed-off-by: Vasileios Amoiridis <vassilisamir@gmail.com>
> 
> Thanks for the patch!
> 
> > diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> > index d67318571a..1526652ce4 100644
> > --- a/package/linux-tools/linux-tool-perf.mk.in
> > +++ b/package/linux-tools/linux-tool-perf.mk.in
> > @@ -20,6 +20,7 @@ endif
> >  
> >  PERF_MAKE_FLAGS = \
> >  	$(LINUX_MAKE_FLAGS) \
> > +	PKG_CONFIG_LIBDIR=$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig \
> 
> However, this value is incorrect I believe.
> 

Hi Thomas,

Thanks for the reply and you are right here, I totally missed it.

> Indeed, linux-tool-perf.mk.in is cross-compiling perf for the target,
> so pkg-config should look for cross-compiled libraries... and here
> you're pointing to natively compiled libraries installed in
> $(HOST_DIR), so this is not correct.
> 
> I'm not sure what the correct fix is, as PKG_CONFIG_LIBDIR is passed
> internally in our pkg-config wrapper, it's really just the kernel
> Makefile being over-zealous here. Maybe we could play with the kernel
> accepting a $(CROSS_COMPILE)pkg-config, and have such a script in a
> private directory, added in the PATH when building perf? Another option
> is to define PKG_CONFIG_LIBDIR, replicating what our pkg-config uses as
> a value.
> 

Solution no.2 which is about re-defining the PKG_CONFIG_LIBDIR as we do
in the pkg-config could solve this "issue" but I would like to see if
there is a better way than replicating.

Solution no.1 though I feel a bit confused with what you mean. What I
understand from the $(CROSS_COMPILE)pkg-config is that we should
put into the PATH the $(CROSS_COMPILE)pkg-config binary. What do you
mean exactly by script?

Cheers,
Vasilis

> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
