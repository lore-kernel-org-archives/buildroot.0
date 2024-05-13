Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86376C25B74
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 07:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0898D60652;
	Mon, 13 May 2024 07:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tysyv1he3ZA; Mon, 13 May 2024 07:57:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F561606B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F561606B4;
	Mon, 13 May 2024 07:57:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D302B1BF2E5
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 07:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCFBE834F6
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 07:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hpt5S0dCl6b for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 07:57:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=jesseevg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9840834E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9840834E3
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9840834E3
 for <buildroot@buildroot.org>; Mon, 13 May 2024 07:57:13 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-de5acdb3838so4083878276.1
 for <buildroot@buildroot.org>; Mon, 13 May 2024 00:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715587033; x=1716191833;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/JBDjCzx6h1NHyc7MRUNCUJ+teRiW4pf6wlW7NdpZUI=;
 b=SAtmJEXAUG5PSfq2XPDxHYZcWYuBVGU7rIbxTpsmEZ67J3FBfEUTHkTa26ZT5Sbosf
 afYkVAtJLmANjXJTw2zthMJR1bWqLBesujOjDK+H9nJAltWwR9OebcNhtkSjtPioCL0E
 h4FC+PCPixYssTkJVs/YvwpwLLP/HlV5fiETdMr4Z49apAtxITA2mhGQmGeBQW//EePY
 3zKiVcbjrBUAmsoPG31uWZHMOwvv0ibszEbN3Q5LtVDZC6miEk0lNXFgU6DZjRPqDZBJ
 Izi+lPRA4tHGbXNSo2R/yRNXxkH/ueSoKaHV/gmLVTce5ul/a4s/Mx07U71ZLGHDQnRm
 WSBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdHurrWUGC/IPT+Q5foVZbmG9PllH654sFLlWvJhtrF4WQkVQuZqPxk5ggqBNJ/MSNeVkFzNR3n9Dr5Tc0akUh2YkMxeEQHQ==
X-Gm-Message-State: AOJu0YyaAkneOcSeO6dsBc8YqR8rJ3aEjw16Bne09hPWPHjCmk+VJh7v
 05weWrdGYrxqhtJ97aBlR2v3LJw21Cjm7+EbE7dy1E2nbVWvY0uxqpLDKFnU65jTa3h/l3p6R4H
 NWDNwqe72x16EQOUEW17UNJvsVe8=
X-Google-Smtp-Source: AGHT+IFavX4ghl/yauXwCEe5VjTMjHHAzpwthzPrp8T4V9Kh0Yj5moisgU23RkcpNDwHdM7vvtliKesaJDEEO1AbdEo=
X-Received: by 2002:a25:fe05:0:b0:de5:53a9:253f with SMTP id
 3f1490d57ef6-dee4f2d8cbemr7720565276.15.1715587032706; Mon, 13 May 2024
 00:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240512114617.2564569-1-roykollensvendsen@gmail.com>
 <20240512114617.2564569-2-roykollensvendsen@gmail.com>
 <20240513084026.4513d1f6@windsurf>
In-Reply-To: <20240513084026.4513d1f6@windsurf>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Mon, 13 May 2024 09:57:01 +0200
Message-ID: <CAMdwsN8eL5Urj5AyWn0RStgBmeZ0_afz7aRAgr5iwfxjhV_Vgg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715587033; x=1716191833; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/JBDjCzx6h1NHyc7MRUNCUJ+teRiW4pf6wlW7NdpZUI=;
 b=lUhr0176RZhxb49Cv5CueXyb+4UMTipsz+mFLtVfWjhwSM4wTdxfODSJ1Kg4byE6+B
 4rr7ynXaEOnvBJ/VrJVNliVkxQjfk1bfAHCUrgCPomUcIfuIvee3IQo68CQ04ggNoMt6
 ZlIIA9fJ4gChfTej+CvaBOLIEMS3feODMLdu/FwnJKHtWVe0gGgz9yDheDuCN6XGZLsL
 DvTrcXs+9BGKc2RypBtWTx1ll7bVmIsvRe5CnqDV7nc/5+pV+myWyp+LsZQPfhtNjfkZ
 VQAJqUI7Pu5DC+ZMRuaj8BuXIsIjz/qtP5Uq5k9TTOaJFKcvDB6hKBaA287AV5vmm2gc
 fCtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lUhr0176
Subject: Re: [Buildroot] [PATCH v3 02/14] package/qt6/qt6base: patch
 CVE-2024-33861
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

Op ma 13 mei 2024 om 08:40 schreef Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:

>
> Hello Roy,
>
> On Sun, 12 May 2024 13:45:49 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
> >
> > Got patch from:
> >
> > https://download.qt.io/archive/qt/6.7/
> > Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
>
> Thanks for this v3. However, you're again putting a fix as PATCH 02/14
> of the series, after a bump. Is it because this CVE is only applicable
> to Qt 6.7 (and not the 6.4.3 we already have in Buildroot) ? Could you
> clarify this point, which is very important?

This is not applicable to 6.4.3, the affected versions are detailed in
the bugzilla report below and it's only 6.5.0+
So this seems perfectly valid to go along with the version bump.

OpenSUSE report:
https://www.suse.com/security/cve/CVE-2024-33861.html
Bugzilla report clarifying affected versions
https://bugzilla.suse.com/show_bug.cgi?id=1223917

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Best regards,
Jesse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
