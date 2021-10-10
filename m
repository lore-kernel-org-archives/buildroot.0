Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC885C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:27:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71F9160EE7
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71F9160EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CB174042D;
	Sun, 10 Oct 2021 17:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQ_8AIq5nXH2; Sun, 10 Oct 2021 17:27:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0DC40423;
	Sun, 10 Oct 2021 17:27:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 237A21BF3C2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1347260669
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQL-kkqIK-TT for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 17:27:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03CA4605B2
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 17:27:05 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id x27so63373102lfu.5
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 10:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=NRWdo74pKg1RqPVm9CJr2MQbjyYuEWhDapWBcqABBbE=;
 b=TVIjb4rfkjd3nQVmLkMDmJeqSIQO7Fs7HwZp8DuzQWDhqC0Lyn9sE+g+EF7c62zNtB
 Id5PCyOOQ7hERvwzUxloRpPA3ZqhWkAp3vGFMt2Zlw5gDJT/OI9JX/9620ul3EkOMltm
 xmDzd1OA6bhUeVjSAA19QaJlQqcDcU6AJn2Eg8wuZU2ML8sqk+UEeKJ/pmW4QjXUQ8J/
 1RIXFgJ/gZR6RCgzQdHCvn1zUDslmHqkkghiqO/OA25MTprUHlExj904kySmtQvg8Ead
 U0ADnFXyivm9HhWtLddv5dHun5Sz15VFciMkWVQ+eTZ2dElgEOZCIcvc9+qsykNbkmfT
 Hx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=NRWdo74pKg1RqPVm9CJr2MQbjyYuEWhDapWBcqABBbE=;
 b=DICE7rsF4myUCuyP3I80Sg3hjccoZryxajVcBaybXA2X5cwBcVNCJGTBh/wDSof1v4
 dOWc9XgGCfq1S5B26FN+b3meavAS0xL+aNTTTzG0sJsMO3oUP4O7eoiYLBn1evb2vyY8
 qcaYfv4DXY27LhrurwFmIYOX2u+vXVH8C89ODKiaLMHegQ1Cg37+vF1O/6RxRaZTRbSW
 q+gvwSm/pQUkqLAe5K55pwHkLTGUtukYZrUZSt/nFEA9duvd1R9fPGFxqqSv7cJaaKn0
 omwFdyBiECldvsZvSGMYVbuBATaSI9whBpQFc/iLn+g3bP79CLinF86EFaTV6UL91Qp4
 AqMg==
X-Gm-Message-State: AOAM530BNXdnolYN01hzLpmVyDpjv5ML28o2L5Saf2XgQpmbMklssNLm
 kFAxXIvOEVkU0UbsLC8jgueKBWqGdHHb5A==
X-Google-Smtp-Source: ABdhPJwWJbnRZeVQRayumFSNKBQ5jBAzMowKtAyQSqjEl9iFQq9La2cpAhlwfDpfMI3uQM492Sorww==
X-Received: by 2002:a05:6512:12c6:: with SMTP id
 p6mr21477232lfg.40.1633886823472; 
 Sun, 10 Oct 2021 10:27:03 -0700 (PDT)
Received: from [10.0.196.136] ([94.254.51.197])
 by smtp.googlemail.com with ESMTPSA id q5sm507310lfg.52.2021.10.10.10.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Oct 2021 10:27:02 -0700 (PDT)
To: =?UTF-8?Q?Esa=c3=afe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
 <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <1819f3c3-52db-7e21-8d42-f5c2ae434f33@gmail.com>
Date: Sun, 10 Oct 2021 19:27:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
Subject: Re: [Buildroot] error when i build buidroot
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
Content-Type: multipart/mixed; boundary="===============4334816681105406290=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4334816681105406290==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cgwjmv9u2TksY9mCP5xJBMHMxPdqCJWcg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cgwjmv9u2TksY9mCP5xJBMHMxPdqCJWcg
Content-Type: multipart/mixed; boundary="i0YDwyK8WNr7z5la6W40sDpVDRYOgVuSZ";
 protected-headers="v1"
From: Joachim Wiberg <troglobit@gmail.com>
To: =?UTF-8?Q?Esa=c3=afe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: buildroot@buildroot.org
Message-ID: <1819f3c3-52db-7e21-8d42-f5c2ae434f33@gmail.com>
Subject: Re: [Buildroot] error when i build buidroot
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
 <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
In-Reply-To: <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>

--i0YDwyK8WNr7z5la6W40sDpVDRYOgVuSZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi!

Kali Linux is a Debian derivative, so it should work fine as build host.
I've not used it myself, but I'm installing it in a VM now to check the
build steps to see if I can reproduce your problem.

On 10/10/21 5:48 PM, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:
> Le=C2=A0dim. 10 oct. 2021 =C3=A0=C2=A014:01, Edgar Bonet <bonet@grenobl=
e.cnrs.fr
> <mailto:bonet@grenoble.cnrs.fr>> a =C3=A9crit=C2=A0:
> > Esa=C3=AFe Ledoux Njongssi Kouam wrote:
> > > build for qemu_x86_64 by typing "qemu_x86_64_defconfig"
> > I guess you mean =E2=80=9Cmake qemu_x86_64_defconfig=E2=80=9D.
> > > rsync [...] system/skeleton/ /root/buildroot/[...]
> > You are doing this as root?
> yes , i'm doing this as root

I think you might want to browse through the manual again, in particular
Chapter 4, https://buildroot.org/downloads/manual/manual.html:

| Important: you can and should build everything as a normal user. There
| is no need to be root to configure and use Buildroot. By running all
| commands as a regular user, you protect your system against packages
| behaving badly during compilation and installation.

I'll retry the steps as a regular user in my efforts.

> > > rsync: [generator] failed to set permissions on "[...]":
> > > Function not implemented (38)
> > This sounds like you are using a filesystem that doesn't support
> > Unix-type permissions.[1] Is this the case? What kind of FS is this?
> So the file system that i'm using is ext4

Just to double-check, because "Function not implemented 38)" is really
not expected on a build host with Ext4.  Did you mean the file system
you configured for your Buildroot image, or your build system?

Best regards
 /Joachim


--i0YDwyK8WNr7z5la6W40sDpVDRYOgVuSZ--

--cgwjmv9u2TksY9mCP5xJBMHMxPdqCJWcg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE3gkxgy2/gzkZH7KyLCqwqW4MR1gFAmFjImYFAwAAAAAACgkQLCqwqW4MR1iT
gQf/ZBgHavmdJFY10vDRxtd//o+/RCMXPT3U31hXbRegcG4v/D+1vmk8w14yJfkpSeBsdlIBVlWX
u6kSbEUIui/SvBknt/f0FR0U6BvoieV6roEdrcRmsjj+oNhnOQ0tC2tRFzBX+4QS7YoQX9tlPuaE
tgJzPFmHvvsQ4kLz+YVLkABo0k7V2yoJRTYb+IWF65xOBqqHxBA/g1+H2i+keZPlrKuUOpQeGzhs
okQZqnefXYD7Rku0bWbOHtb9E7EV0spFKJ9zTQ8jGETqKCD67QCjyVFYROljH9oP6wXjjLHI2DCq
qpH2rI2zDUPNaTZzFspIToL4aQCUsjYPGfokzKsWVg==
=tJou
-----END PGP SIGNATURE-----

--cgwjmv9u2TksY9mCP5xJBMHMxPdqCJWcg--

--===============4334816681105406290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4334816681105406290==--
