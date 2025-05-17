Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CAAC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 17:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5D956080C;
	Sat, 17 May 2025 17:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdYizS3GB0U1; Sat, 17 May 2025 17:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B117608A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B117608A3;
	Sat, 17 May 2025 17:35:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67A98201
 for <buildroot@buildroot.org>; Sat, 17 May 2025 17:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C36F4098E
 for <buildroot@buildroot.org>; Sat, 17 May 2025 17:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jV7mZQ2Wxl7Y for <buildroot@buildroot.org>;
 Sat, 17 May 2025 17:35:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A124409B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A124409B1
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A124409B1
 for <buildroot@buildroot.org>; Sat, 17 May 2025 17:35:08 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a36210dbe4so234310f8f.1
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747503306; x=1748108106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEfNzw/Tb/Vu2pHijTIR10dR4XtysHVyln2z51rIiRs=;
 b=TcT1kQbF6qO3X+OFKagsBUcEIVNH+qMu8ceWqJzW3+XjqYRO6qgYoyWNGmVSnEswU1
 ciXSVZy8E9o7aiuBblTWz1HOUMcro6K6hys4vqyZHIl/Mp9wSkgpYVychTQ4RNcLswKp
 JCy+mHfrH0ItcNkCfrr5vzwVe50xroIKDGcjohkfOo0eeRlHYOW9qZvTljvrlyMtj6H4
 F4UANlRjptOj786mBeFHZ7rwpXTTctCpzlg9vogjZ3JWGnm1Y3/8iunb3aA58rGhfOd6
 YrVGFFMWG+lqj4JGixU4l2sR40Wi17QsWlJHZrFXltNeQ3ytatJtB8SOLCXmJenJSQ61
 3QvA==
X-Gm-Message-State: AOJu0YwEs0+819ag+LVySlUgjOONvMCk0byM8o+WXNNKraEE7ururwCg
 Tu9aQ0V9QI356GhSBUf2sc3XUMlSW4kSwdtMN3xReuio/RGe8XfFCQX8
X-Gm-Gg: ASbGncuwPbMSuG9EYF0O+s07g/8J7Q1ZZHTI+37GhSk8hZBl45aS5Q160uQunTkCtmz
 sXvZTs4R5PloDnr97zVxScjw9JxKwgeK1lac4Hpg664uoQt7NkNQiQr5lxLXm2kZ9tJg45sNRfI
 doj4txnJnP8l0QAXfmrCilBvQzDRvJ/9u+hnheOVY/HZwwNFDi+wWSlfKEvGHLBMXZ5hNPNlL94
 PGup6IXWybRqLswy0F/In7FNdRHdXWLQbelZmDd7YvI8/TfdSdPctz3wZ+8/tNm1TpkXjB0S/VF
 jA+4irVCOAmmva2nacq7ITQ9TFVuoYKv9HSF6NA=
X-Google-Smtp-Source: AGHT+IHMHOGCHB9GMNJzavuc1m+KUnWiNr3BBA5Umr6rgHplnPsCjizwiOaDFhsb90qX2O6R8Ujcpg==
X-Received: by 2002:a05:600c:190d:b0:439:a30f:2e49 with SMTP id
 5b1f17b1804b1-442fd670800mr28575855e9.5.1747503306192; 
 Sat, 17 May 2025 10:35:06 -0700 (PDT)
Received: from skbuf ([188.25.50.178]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fd50ee03sm76916395e9.14.2025.05.17.10.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 10:35:04 -0700 (PDT)
Date: Sat, 17 May 2025 20:35:02 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>,
 Vincent Jardin <vjardin@free.fr>, Julien Olivain <ju.o@free.fr>,
 Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <20250517173502.qbcd6au4kavfgsmj@skbuf>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-19-olteanv@gmail.com>
 <20250422234518.2422983e@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422234518.2422983e@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747503306; x=1748108106; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jEfNzw/Tb/Vu2pHijTIR10dR4XtysHVyln2z51rIiRs=;
 b=b+TBd+oARLBDAnsmVKbS77eh2JYtW1JNlho+Yb6q/FAP2WvnOPwAHmxF9IWteoNalY
 PToUDPZH1B+ABiwI9nwC4D6A4TaCKn7aCVkIKzKH7uWR3PNqLFLDPz6i82NzjYmeLOUD
 TryfKDHM71PMpCYD4cesaHAAZxCYesW+oo8eJgJPrU8b8Aj8FvKD9uH0zqQkzniAZNFk
 rpHsAhOcevNDDIQzed2TJYxXG1mGv7qaAQugHY37qK6cmuKyjiYrFnyZe9330SZTy2FT
 og/LC0ILLCrKejR2tpIFVuamscfDudcYdm/Irkfh5YY/UwI00/45p04GUHN4opDUimw7
 pF1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=b+TBd+oA
Subject: Re: [Buildroot] [PATCH v2 18/18] board/lx2160ardb: new platform
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

Hello Thomas,

On Tue, Apr 22, 2025 at 11:45:18PM +0200, Thomas Petazzoni wrote:
> Hello Vlad,
> 
> On Fri, 28 Mar 2025 20:04:26 +0200
> Vladimir Oltean <olteanv@gmail.com> wrote:
> 
> 
> > +The components from NXP are:
> > +  - rcw, lf-6.12.3-1.0.0
> > +  - atf (fork), lf-6.12.3-1.0.0
> > +  - uboot (fork), lf-6.12.3-1.0.0
> > +  - cadence-dp-firmware (blob), lf-6.12.3-1.0.0
> 
> So this line should be dropped, if I understand correctly?
> 
> > diff --git a/board/freescale/lx2160ardb/uboot-env.txt b/board/freescale/lx2160ardb/uboot-env.txt
> > new file mode 100644
> > index 000000000000..ad1e5882dd9e
> > --- /dev/null
> > +++ b/board/freescale/lx2160ardb/uboot-env.txt
> 
> I agree with Vincent that it would be nice to have a simpler U-Boot
> environment if possible.
> 
> > +BR2_PACKAGE_QORIQ_RESTOOL=y
> 
> Due to restool not being applied (build issues), I can't apply this
> defconfig just yet. Can you send a v3 with restool fixed? Thanks!

The upstream restool is now fixed to support 32-bit builds and I am
preparing for a v3.

I want to understand the request for a simpler U-Boot environment
better.

Is it that the U-Boot distro boot environment variables (which form a
majority of the contents of this env) are not welcome in general in
upstream Buildroot, or is it just that the environment file itself is
too large to maintain for a board instance, and contains many
board-unspecific things (which I agree with)?

I want to make sure it's the latter and not the former, because
BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE supports specifying
multiple input files, and I can move the distro boot portion to a
generic location like package/uboot-tools/env-distro-boot.txt, to be
potentially reused by other boards, and simplify the lx2160ardb env.
Does that sound acceptable?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
