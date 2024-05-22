Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F35EC25B79
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 15:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CAB140025;
	Wed, 22 May 2024 15:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6DqVTkbjdFw; Wed, 22 May 2024 15:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E34D540514
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E34D540514;
	Wed, 22 May 2024 15:59:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 839B31C5C7C
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 15:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D7C460687
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 15:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7wE3_P4yFbP for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 15:59:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C1B4605AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C1B4605AA
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C1B4605AA
 for <buildroot@buildroot.org>; Wed, 22 May 2024 15:59:45 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a59ad344f7dso828976266b.0
 for <buildroot@buildroot.org>; Wed, 22 May 2024 08:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716393584; x=1716998384;
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H80p6KriUF4T/V6Bnb6ChKi97spQkj2zo8+QzGKzLUw=;
 b=rqfVm+CZmar4NLKaZ090DEfLXYvZerjjh1qRtn9STfRCprj4rfu7xCNqmUhR2k58Ey
 okNQPQRGV1XAj9+vjtid9Xc6JyLEbQhueRRO+bKbCu7Ligumv3xiWnZiKMwEYCxY6S9F
 jULSSJQ+tohGhb8es8H6ylUg4VzsFihARCLStsJUmPdtFbWzQIENZJuXAm2Ky9+S2+Y7
 ohdEaq0WezBx6gljywmxMpcQowSwdcmu+8unRBdvBLA0bByGkdi+ugu5c+xicIwVZ7g0
 xep42j90WYMVDCwBlp5cn5uEQBflCj30tbMNWJoUFOB+t7mjgjkwlKsqIL3/cMjig+/0
 ZBGw==
X-Gm-Message-State: AOJu0YzXfgoMjE6y1Gz5AMG8JiKHyqJcvJ+xIALbxCIyOpikgWUlOeDR
 UEBFvYSEQ4rVor/5vXDO0XaefkIuiWSvTtWNV10/BtVdKms4MeKXOI/Gb7niq3U2HtMh4VtRZw9
 sr2THN9FWXOWO7/IinU7OXreKvx2nuqUruRKR5YH3AM8bwlEo1vzCcz8sToI6uA==
X-Google-Smtp-Source: AGHT+IFkrU8UoubmmLIKfc/ZOf46kz2c2V9QssbzYgL6X8pKF3sFUTDSrPhLS5/ybn72xdRgGoMmgA==
X-Received: by 2002:a17:906:3404:b0:a59:c28a:7ec2 with SMTP id
 a640c23a62f3a-a62280970ebmr142474666b.41.1716393583771; 
 Wed, 22 May 2024 08:59:43 -0700 (PDT)
Received: from theia ([2a02:8109:8abb:b200:5511:c468:882a:3860])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781e97bsm1783512766b.32.2024.05.22.08.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 08:59:43 -0700 (PDT)
Date: Wed, 22 May 2024 17:59:41 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240522155941.GB1331364@theia>
Mail-Followup-To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240510215442.3475120a@windsurf>
 <CABGWkvqz7-bnCJ6JBjp3rpbeSnDEZw55jNNHOmpbyGA772xDvA@mail.gmail.com>
 <20240520112336.7431520d@windsurf> <Zk0F1wBKRDcTJl86@landeda>
MIME-Version: 1.0
In-Reply-To: <Zk0F1wBKRDcTJl86@landeda>
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1716393584; x=1716998384; darn=buildroot.org; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H80p6KriUF4T/V6Bnb6ChKi97spQkj2zo8+QzGKzLUw=;
 b=dOY/tS5zNI/471tDyzsG+HN+LkrVKnr3hC2YCezcDo851/piUAoFeBtTmF3LekpLMV
 bJM8Uc4lFw7YBbyagJC2waYo7dW9nPSQ/9f5jmJKhGKdOF9e7/6c9lfZoJ40X2yFcP2P
 MVlOqrMAjmLJclYs1alLAl+g8bHtMY+ttiRU7H1CAJaV+/oxXU5X9sjwhdGy0CG1sEKk
 xesX9lHHkyIKKppCsevnan0cCaSxOU+dmEvc5pPVTlCjXIzZqwq9ENtnvAJXp06s4dSF
 OzYwwEBFgUJXUmnnkwXRt0IRL+mX930eizf0nZ/YdVVy1uDdigLkj7PLBD/JdC3BUKX5
 4/GQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=dOY/tS5z
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Tue, May 21, 2024 at 10:36:39PM +0200, Yann E. MORIN wrote:
> Thomas, Dario, All,
> =

> On 2024-05-20 11:23 +0200, Thomas Petazzoni via buildroot spake thusly:
> [--SNIP--]
> > Yes, the first patch is reasonable, but if we can't apply something
> > like the second patch, then it might mean that the approach taken in
> > the first patch isn't correct. Indeed, if we can't enable by default
> > the generation of bmap-capable images in defconfigs, it kind of limits
> > the usefulness of this bmap-tool integration.

I disagree, I think not having an option for speeding up image flashing
enabled by default in defconfigs is fair. Defconfigs are intentionally
minimal, and for the sole purpose of getting people started with a
working config.

> > =

> > I was hoping for the other BR maintainers to chime in with some opinion.
> =

> Given the issues on existing setups, I am of the opinion that we should
> not enable the creation of bmap images by default, in any of our
> defconfig.
> =

> Now, do we want to include that support in our somewhat-generic genimage
> helper script? Technically, I don't have a strong opinion against,
> except it would not be exercised very often. We could have our CI jobs
> turn it on explicitly, though, so that's not too much of an issue.
> =

> However, users will not have an easy way to turn it on, except by adding
> somewhat-arcane command line options in the post-image script args.

True, it's not a beautiful solution, but a flexible one. We could also
convert the often used genimage post install step into a kconfig-urable
build step, but I don't think that's much better.

> =

> Also, it is relatively easy to add a site-local post-image script, which
> can be added to the list after the bundled one, and which will call
> bmap-tool, e.g. something like (kinda pseudo shell in places):
> =

>     #!/usr/bin/env bash
> =

>     getopts for -c configfile -z -j -J blablalba
> =

>     # Only the last image is interesting, as it presumably contains all
>     # the others
>     last_image=3D"$(
>         sed -r -e '/^image ([^[:space:]]+).*/!d; s//\1/' "${cfg_file}" \
>         |tail -n 1
>     )"
>     image_path=3D"${BINARIES_DIR}/${last_image}"
> =

>     bmaptool create "${image_path}" -o "${image_path}.bmap"
> =

>     if -z; then
>         gzip "${image_path}"
>     elif -j; then
>         bzip2 "${image_path}"
>     elif -J; then
>         xz "${image_path}"
>     fi

Not sure I understand correctly, but you are suggesting that each user
that wants to use bmap-tools should write their own post install script
and call genimage.sh in it? I think it won't be long until this very
generic wrapper script is requested to be added to support/scripts/. For
me including this in genimage.sh is preferable.

> =

> Ah one point: I think our generic geninage helper should ignore unknown
> options, rather than error out. This would I believe help with users
> adding site-local scripts like the above (notice the -z -j -J options
> for example).
> =

> Still, my opinion is that our defconfigs, and the associated scripts,
> are a starting point for booting known boards and somehow show-casing
> Buildroot, and set the user on tracks for them to further customise the
> configuration and the scripts to match their needs.
> =

> In this case, I don't think bmap-tools provides any special interest for
> that goal, given the integration in Buildroot is really easy, and very
> use-case specific (i.e. I know projects for which bmap-tools would be a
> drawback, given the generated images have zero hole).
> =

> > Do we have a way to detect that the bmap-tool generation will fail, and
> > in this case gracefully skip the bmap-tool logic?
> =

> I kind of disagree there. Given we won't enable the creation of bmap
> images by default, then it means the user will have to explicitly
> request the creation of a bmap image and thus, if we can't generate it,
> then we must fail explicitly.
> =


I think there are three options:

1. don't implement this and let each user figure bmap out on their own
2. implement it opt-in and generate an error if it fails
3. implement it opt-out and generate a warning if it fails

Personally I would prefer the second option: This would mean accepting
the original patch 1/2, but not 2/2. Instead of 2/2, it might be a good
idea to describe this in the manual so this option is easier to
discover. Currently only the genimage.cfg format is briefly described,
but not how this file is usually used in buildroot with genimage.sh. I'd
volunteer to update the documentation if this is accepted.

Best,
Gero

> Regards,
> Yann E. MORIN.
> =

> -- =

> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspi=
racy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___         =
      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspir=
acy.  |
> '------------------------------^-------^------------------^--------------=
------'

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
