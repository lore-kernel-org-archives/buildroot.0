Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F734C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D62D9823FB;
	Mon,  6 May 2024 20:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCCIAgSnO_Wa; Mon,  6 May 2024 20:22:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8487825B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8487825B1;
	Mon,  6 May 2024 20:22:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 355DA1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 223F8608D9
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4RCSIuyX1fn for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:22:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com;
 envelope-from=jesseevg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B52C6069D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B52C6069D
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B52C6069D
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:22:16 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-61bed5ce32fso26617657b3.2
 for <buildroot@buildroot.org>; Mon, 06 May 2024 13:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715026935; x=1715631735;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WDqaYs+N5AjuPEOkY6JJYfmnY09ZEGaJkGWw8D36ahk=;
 b=qXPdDrNTHn0L7In5B0Pjz2hjpzByqzl4zq70b+lm39x07zTWIVz+3W5IXT/vD7TXMq
 bBLW3E9+9zo7kDtxsVJg46nahyQmTAKRj6tvU1pfCZKYAuKUTxlWVMhXbuZSqwVIoKN/
 I6EVY8Jqs2dgT13N23vlAEk6mpei/n7CDk5roiJRn1A94bQ9tkMoicbwkIEoc4hs+m2a
 dIsPce//57OfwgqdWZ8b3fek+PiTJIlXcTgHjjIMTeW4NILKcZEQ0/9dlgob7Vr2JZwc
 +jEVmmuEHtkys6V7MyZZRA7f9JCJoFa5RH25UC5qq8uP4fuK2wMedG/oDSoM+6+9LFJj
 mf5g==
X-Gm-Message-State: AOJu0YyMRSNbBrImtZ4pKiwMvfDN55UKaB1fdAvWX16eNpiBGwVwtJj8
 7itoFTkM1+E3zYNjcTwpPGUSuilpn8/4CJXT6MdpfkajJuzicmb+WihoD2aCpVuFhREVwtT0oBL
 xO0XiHq2PsPTgFuqbQ1o2HZQBZDoqTg==
X-Google-Smtp-Source: AGHT+IEM1DtgUnBr5Iacb4+V26PTJXj4aL1lgsYIcFKafD1LIykMBPEMuirqiBWHv4x28oYmmuTxxp8KQ3MjXhlhVx4=
X-Received: by 2002:a81:4c88:0:b0:61a:b3e8:8d94 with SMTP id
 z130-20020a814c88000000b0061ab3e88d94mr11024540ywa.0.1715026934797; Mon, 06
 May 2024 13:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240430203401.74587-1-jesseevg@gmail.com>
 <20240506121919.118af862@booty> <20240506221450.5fafb5bc@windsurf>
In-Reply-To: <20240506221450.5fafb5bc@windsurf>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Mon, 6 May 2024 22:22:04 +0200
Message-ID: <CAMdwsN_ARDJPia7f7ah_nwA_aNXRPS6Ohszok3XuNP1V9fw-Yw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715026935; x=1715631735; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WDqaYs+N5AjuPEOkY6JJYfmnY09ZEGaJkGWw8D36ahk=;
 b=U2qDbVB/Xb3SVe/ywQJ70q1WwynHKiTdBDLwEt2v7NAOZGY/dwEYc1plSWPti5csXn
 zTpJccrDz0qEcfarL6e+3CgOi0KBGRcS3Z2MUiBI5V53+Wv6hWO+jA9CVghvELx1W3d0
 ExoAietw6WFhOgwsOeWHnGn9FxrVGtlwAdZYeivq9BUmqV6SWvjyyKdWDWRd3RLVvkfz
 7LAbQv1/bpNdp2bYNIEtfwhxf5/TZS4WJEZLChEuQ2d6xDg1Xqf2DOYZzZIQAbYce+es
 yf8xiesI8/Xz4pl2Yax+Y363zFU5vsneXQqXO03NB69ASz/HYlDLFpGL36I4+2zZ3eWT
 WmOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U2qDbVB/
Subject: Re: [Buildroot] [PATCH 1/1] package/agentpp: bump to version 4.6.1
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Luca Ceresoli via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Op ma 6 mei 2024 om 22:14 schreef Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Mon, 6 May 2024 12:19:19 +0200
> Luca Ceresoli via buildroot <buildroot@buildroot.org> wrote:
>
> > Hello Jesse,
> >
> > On Tue, 30 Apr 2024 22:34:01 +0200
> > Jesse Van Gavere <jesseevg@gmail.com> wrote:
> >
> > > This version integrates the patch to fix building without v3 so remove
> > > that patch, there is however  another failure when linking the library,
> > > debugprintf is used which was removed in snmp++, so patch that.
> > > This patch has been sent to agentpp.
> >
> > Sure about this? snmp++ 3.5.1 does not seem to have any changes related
> > to debugprintf compared to 3.5.0. Also, testing with both of your
> > patches (this and the snmppp 3.5.1 bump), agentpp builds fine without
> > the added patch.
>
> Also, we would prefer the added patch to be formatted using "git
> format-patch".
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Hello Luca,

You're correct that it does not seem to fail initially, however when
using the Snmpx class from agentpp in my own application is when I got
a linking error on debugprintf it could not resolve, this I could only
fix with the included patch.
What makes me suspect an oversight is that they mentioned that
debugprintf was going to be removed entirely from agentpp in earlier
release notes but some calls remain in the source code, this issue is
also present in both versions hence no changes there.

Thomas,

They make it a bit tricky with their tarball only approach but I'll
see to resubmit it as a git patch.

Best regards,
Jesse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
