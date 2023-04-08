Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20F0C76196
	for <buildroot@archiver.kernel.org>; Sat,  8 Apr 2023 02:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 284CD42137;
	Sat,  8 Apr 2023 02:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 284CD42137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_B6p-vOE4HL; Sat,  8 Apr 2023 02:30:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12D4C42134;
	Sat,  8 Apr 2023 02:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12D4C42134
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 850E11BF39D
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 02:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D7A94211F
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 02:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D7A94211F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WtaCSnZUNho3 for <buildroot@lists.busybox.net>;
 Sat,  8 Apr 2023 02:30:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CA3042134
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CA3042134
 for <buildroot@buildroot.org>; Sat,  8 Apr 2023 02:30:07 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id c3so650741pjg.1
 for <buildroot@buildroot.org>; Fri, 07 Apr 2023 19:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921006;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=il+4THpzHQlGiot48733cxgtbGrxk7ZeeAVhnAewwoo=;
 b=pT44+tLyPbJ5hmjef9mtM5VvgIyLCKn5zNej50PTSvPf7pboS6SS9PvtFKJ2cJOdI3
 cgLC9F3G32HLij0uKnS/bGgjjKXo8w+AoabnRV6SIYBH9aDiGmEOMeom9XhHJI+v6RUF
 LMe+y5q5uEom25KmplkeZvNE1lSdDf7yLwthuoRlBdOsShjA+unBLytSrt7v3FC2BNJs
 UDNEgA8tzV3uNGJYW8Y9J3zHQpJkamOdijdQ42RZXPxfPull//PjyCb3z+c63Thv6J6h
 kR/cuaNqBITzh3TW+dA3zFRKuS9dOt7VZFlk/Q+6G7bu1WIE9J72ojT4xv50/zj0+6i/
 GHJg==
X-Gm-Message-State: AAQBX9fgyme2ordawxt4vXiK0QkFOkI1lAWUhtDasnrCztpzdhtoNDuC
 SUm9Sd5dumR11tIQRlrXpezrMmuXuQ+cDQ==
X-Google-Smtp-Source: AKy350aecSTwcOAhGO7JkG7Anu+y0cctwk7lxmNA3w9znks5WjDqnfulgn8hUqbjtiNn75KmFcF3LA==
X-Received: by 2002:a17:902:d192:b0:19c:e664:5e64 with SMTP id
 m18-20020a170902d19200b0019ce6645e64mr508981plb.2.1680921006407; 
 Fri, 07 Apr 2023 19:30:06 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-90.three.co.id. [180.214.233.90])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a1709028a8100b001a06eb43880sm3533463plo.153.2023.04.07.19.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:30:05 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 4E89B1067FE; Sat,  8 Apr 2023 09:30:01 +0700 (WIB)
Date: Sat, 8 Apr 2023 09:30:00 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Alberto Fahrenkrog <Alberto.Fahrenkrog@rigtechnologies.com.au>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <ZDDRqPqE2WunnW+s@debian.me>
References: <ME3P282MB1347EDB695F6E726349D27E0B9819@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <ME3P282MB1347EDB695F6E726349D27E0B9819@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680921006;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=il+4THpzHQlGiot48733cxgtbGrxk7ZeeAVhnAewwoo=;
 b=V4ic2iB0dLa4Kscwr9w9eXhlq+MU92f8MQMwxS8l9jbVmGs4cFeH9ee1dxT+fZfgU+
 o3Xvye1Aw6JL68nyPa2CoPW7fGIjZZ75voyUl+Xr96lpy558iET2ACWK1FBsoESgspRX
 ipyQDjjg/viOE4DEr8CZ/bGHPWyaWG9AVYMJ9eTJ/rljpyxWDCU+vp6aYI3SMzkc5N5/
 GFWNsvnbACJXS6YzniCAr+47JmnQH+Jwb+ksvk2ESY6NU2wsw6uSD4QRX8E3B5U5fDpH
 ZCTPQTxWGrSnDEqE7xMFo+mgz8Z4Om1HN77oQT0mSmefIxCUhsOFmLhG9Sfg4BpRaI9J
 YhtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V4ic2iB0
Subject: Re: [Buildroot] SSH Reset on Buildroot 2022.02
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
Content-Type: multipart/mixed; boundary="===============7486169671201905602=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7486169671201905602==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NZ4FpO+DlHE/WQ8R"
Content-Disposition: inline


--NZ4FpO+DlHE/WQ8R
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 05:03:33AM +0000, Alberto Fahrenkrog wrote:
> Hi all,
>=20
> I've been tossing around different versions of Buildroot for a De10Nano (=
FPGA + ARM) board on a project.
> 2021.01 has been working very well and stable, but I needed an upgrade to=
 Python 3.11. I switched to v2023.02-rc2 but I had a funky issue with PySer=
ial that is part of another question, but irrelevant here. v2021.02 works l=
ike a charm. I then decided to go in-between with v2022.02, but to my surpr=
ise, the SSH login did not work, even though it does on the other two versi=
ons. I get this back:
>=20
> debug1: kex: algorithm: curve25519-sha256
> debug1: kex: host key algorithm: ecdsa-sha2-nistp256
> debug1: kex: server->client cipher: chacha20-poly1305@openssh.com MAC: <i=
mplicit> compression: none
> debug1: kex: client->server cipher: chacha20-poly1305@openssh.com MAC: <i=
mplicit> compression: none
> debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
> Connection reset by 192.168.1.50 port 22
>=20
> So I'm back to 2021.02 confirming that all works as expected (thankfully =
it does) and have not had a deeper look into the SSH issue. Due to design c=
onstraints, I don't have access to a serial console, however, I could organ=
ise that in time if something needs changing.

Can you please bisect between 2021.02 and v2023.02-rc2?

--=20
An old man doll... just what I always wanted! - Clara

--NZ4FpO+DlHE/WQ8R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQQJRmM4Nl+8BKPNGvtCNk3+7YYOdAUCZDDRogAKCRBCNk3+7YYO
dBucAP9D1EslgvFP0q4iIaJwpTChJvARUM7HRxgwi4PhMLY7zwEAq9VEr/zJyNsL
zs/1CrESQggEWBHNvEmKbI+dqLQeLdk=
=XEPg
-----END PGP SIGNATURE-----

--NZ4FpO+DlHE/WQ8R--

--===============7486169671201905602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7486169671201905602==--
