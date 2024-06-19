Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBB8C27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 11:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADFE140182;
	Wed, 19 Jun 2024 11:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qY1L2yH3UaKh; Wed, 19 Jun 2024 11:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F672402E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F672402E8;
	Wed, 19 Jun 2024 11:15:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 393EB1BF27E
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 11:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 313EB402E8
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 11:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tcAmusNKHz9 for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 11:15:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1917440129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1917440129
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1917440129
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 11:15:18 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe6392eso8656407a12.0
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 04:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718795717; x=1719400517;
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r0cc0u/noCdvd3tuNHSRKDef+uOlzB8bMy8JIFlYxMw=;
 b=lt9kaF51GCLB0fGd6+289DzQYr9JOXMjZKzSmx4OSC295ANW7+28q/aT3nFGifYhvz
 IiaG+4UaxEErQEJjFvB+m11KH9uvSdp+ffdtXxP8u4TPdi/hQOjPPYVpj4a3cCzb3vg3
 K+xxMPf9Nn4z3XGMiFyzjNw/z/7IE2ZV/EhS9Ab/pf4P/3AviiBvbRjxCLUoUIPd1VEu
 r6IKwLTpme6y/RiaobZ4qkTH6IoXW6grnecpXODcFiR9NMw2vq7LxnmTsLPkzjiDAOHU
 z8pG8RUmAUriaskzCedS9P6vSY2bCFCgzEr6Q9uvSWqWILr2lTYkZtmBCqeTVvJavjPx
 ctcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUohBqIGgkcSNBaJxpnrIdleeDzglGsLcYMl8qwLOJcBCYzzsBbHQnieqM42iXYezV7l6WbzRsDaVFh+xxYqlzpqr8NkdbjIg==
X-Gm-Message-State: AOJu0YzXCA4BkUpKuoJTRt+yhmL6A01sENZKZJjwLqZwlaEkvlOspdbY
 Smp8lFgQ+tpK++KJo+3DDu2YxEIlMQnqgAjgLoagsit5g4Bag/bGnCpHDcviqnk5WGSeDqRWK8y
 /lw/O+fILOVRPMc+FZ09wBaMsglFA+MiRTpGDU3X0j3th9coLyBNR8HYZrKSdFA==
X-Google-Smtp-Source: AGHT+IFdXImgZBLQEs8WQzxRQTjRH+hNSeK7tHJ4AuHP4fhmWDJr+t8ZeEKhlue2byZVC4uannr6iw==
X-Received: by 2002:a50:c012:0:b0:57a:24db:f389 with SMTP id
 4fb4d7f45d1cf-57d07e83b95mr1251533a12.21.1718795716760; 
 Wed, 19 Jun 2024 04:15:16 -0700 (PDT)
Received: from theia ([2a02:8109:8abb:b200:de95:eabd:94c6:f6df])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb741e78fsm8335764a12.71.2024.06.19.04.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 04:15:16 -0700 (PDT)
Date: Wed, 19 Jun 2024 13:15:15 +0200
To: Bryan Brattlof <bb@ti.com>
Message-ID: <20240619111515.GA1753832@theia>
Mail-Followup-To: Bryan Brattlof <bb@ti.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <20240610-k3-mainline-v1-0-57ec7cfa0bfb@ti.com>
 <d99de7e0-4775-4bd9-b60c-4ba79c513708@benettiengineering.com>
 <20240610190816.vq3vmlpzeaomecvk@bryanbrattlof.com>
MIME-Version: 1.0
In-Reply-To: <20240610190816.vq3vmlpzeaomecvk@bryanbrattlof.com>
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1718795717; x=1719400517; darn=buildroot.org; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r0cc0u/noCdvd3tuNHSRKDef+uOlzB8bMy8JIFlYxMw=;
 b=Bj5kyeLaLqaaWAS9adOT+eTjqN26DT/514Mm1krPGys03/oV0WsANKwz0Aeh5bDoHx
 gi7rLTYCC7BBt3+vy/tTEob6LPXfAuSGk4sBs0DIxg0uKT5IVzrG45nuwNsf1pSv7kP6
 hZjcZxprXX0dr8uRj6GPj7neuuEYqDLmkjvnPalOvFUWTvEtnQdMO/qnBeZfpabmhH7x
 mZ/JukKcXY+jgzivHZW3SygXpp95qzVNzy7lfK81Ab5QIE2pu1BI/9Q0xlkh1gOgc+TU
 O8Puaa0BnwcNMH57sTpLJ/xjzldnbXT3Oy9JYO78KAnYd0Vax0rznW/wdk0JGZaHbanO
 ZDUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=Bj5kyeLa
Subject: Re: [Buildroot] [PATCH -next 0/2] configs/ti_am6*: move to mainline
 Linux
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bryan,

On Mon, Jun 10, 2024 at 02:08:16PM -0500, Bryan Brattlof via buildroot wrot=
e:
> On June 10, 2024 thus sayeth Giulio Benetti:
> > Hello Bryan,
> > =

> > On 10/06/24 20:20, Bryan Brattlof via buildroot wrote:
> > > Hello everyone,
> > > =

> > > TI heavily encourages developers internally to work with the open sou=
rce
> > > community to enable all our SoCs there rather than develop these
> > > features on our vendor trees. Because of this there are very few
> > > features or bug fixes in our vendor trees that haven't been sent to t=
he
> > > project's source.
> > > =

> > > So for the next Buildroot release I would like to migrate TI's refere=
nce
> > > boards to track the latest Linux release to ensure we will always have
> > > the latest features and bug fixes for the reference boards and SoCs.
> > > =

> > > This small series moves the AM62x and AM64x to the latest Linux relea=
se.
> > =

> > You can't keep defconfigs without predetermined linux versions. The 2 TI
> > defconfigs already point to mainline Linux. This is done for
> > reproducibility. I don't know how  you can achieve what you mean to be
> > honest.

I also ran into that before, I think the rational is that we want a
known good starting point for users.

See also: docs/manual/adding-board-support.adoc:31

  Always use fixed versions or commit hashes for the different
  components, not the "latest" version. For example, set
  +BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy+ and
  +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE+ to the kernel version you
  tested with.

Which was added in

  af6cffb64e manual: board support: add more of our expectations

I think currently the idea is that if you as board maintainer deem it
useful to update the fixed versions, you have to do that manually in a
patch series.

> =

> Ah that makes sense. I guess if we need to keep a version pinned,
> do you think some type of scripting in utils/ to update the various =

> baseport packages be welcome?

I agree that this could reduce the burden on the board maintainers if
you need to bump the versions often (active upstream development). But
maybe some folks are against it because it potentially increases traffic
on the ML if everyone updates their fixed versions every linux release.
I think we'd need a BR maintainer to comment on this.

Another option would be to explain about your reasoning in the board
readme (and maybe even in the user guide), so users may choose to remove
the fixed versions if they find that appealing.

Best,
Gero

> =

> ~Bryan
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- =




---


grandcentrix GmbH | A Vodafone Company =B7 Holzmarkt 1 =B7 50676 =

*Cologne* | Phoenixseestrasse 18 =B7 44263 *Dortmund* =B7 Germany
| in =

<https://www.linkedin.com/company/grandcentrix> | phone: +49-221-677-860-0 =

| email: hello@grandcentrix.net <mailto:hello@grandcentrix.net>


grandcentrix cares about privacy =

<https://grandcentrix.net/de/pages/privacymail/>

Amtsgericht K=F6ln | HRB  =

70119 | Gesch=E4ftsf=FChrer: M. Kr=F6mer,  R. H=E4nel | USt.-IdNr.: DE26633=
3969

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
