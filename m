Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF13C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 20:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B1178435E;
	Fri, 21 Jun 2024 20:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ScYVmQGmEU9; Fri, 21 Jun 2024 20:57:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8B9084373
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B9084373;
	Fri, 21 Jun 2024 20:57:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CAF541BF344
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 20:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8B4A60725
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 20:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzYslYr1-SYD for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 20:57:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:0:465::103; helo=mout-p-103.mailbox.org;
 envelope-from=a.wellbrock@mailbox.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3ABEC607A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ABEC607A2
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org
 [IPv6:2001:67c:2050:0:465::103])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3ABEC607A2
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 20:57:51 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4W5V6w6vJPz9sbL;
 Fri, 21 Jun 2024 22:57:44 +0200 (CEST)
Date: Fri, 21 Jun 2024 22:57:44 +0200 (CEST)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <1625348116.29441.1719003464483@ox75.mailbox.org>
In-Reply-To: <ZnXe4zvx1Dm_Yk34@landeda>
References: <20240617180157.3771298-1-a.wellbrock@mailbox.org>
 <ZnXe4zvx1Dm_Yk34@landeda>
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-MBO-RS-ID: c0aba077fbd2983829d
X-MBO-RS-META: znknc3sj6dposbwitjjxrzqjjfqz1bjz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbox.org; s=mail20150812; 
 t=1719003464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DhtH3fTmwdl8ExNCpWAc/MuqU0opQTIInBM5l5kc9Xc=;
 b=q0fbEGTUrIidUHnGY5dBG8pe0rkcbs31qzBzHJWzfpy+r+oziRcZ7ipcsF86GZBlf93lUH
 gN5fc7v/1vLBw/4cOKBCoGEhKwrwRMiLwbgWPQaP8KPS75phcejhmp+PTa5dcqKnNb4jbX
 Lnrw0yZmmFHgo6IYsjOUNIw7SIXOF8G9mL3SJ+6LBStu4aQbXVSwtqoVd/hf1t3j7Q25P2
 KdlpVtYUMuSn369bIe54+QYJP4kFaOoqTQNvb3ojXeZPON4wdX/SXyneNvtwczKDYUJ0Q/
 jMagxUrjdy2hIt64uMOfyL5USQrmaUgfnNnY3GRDlxgO+xw2r7Omg7UxwFP2/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=mailbox.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256
 header.s=mail20150812 header.b=q0fbEGTU
Subject: Re: [Buildroot] [PATCH 1/1] package/c-ares: update site url
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
From: Alexander Wellbrock via buildroot <buildroot@buildroot.org>
Reply-To: Alexander Wellbrock <a.wellbrock@mailbox.org>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3135934052547285825=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3135934052547285825==
Content-Type: multipart/signed; micalg=pgp-sha512; protocol="application/pgp-signature"; 
	boundary="----=_Part_29440_1747369335.1719003464483"

------=_Part_29440_1747369335.1719003464483
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Ah, damn. alexander.wellbrock@othermo.de is my work email (found this at work). My intention was to contribute using my private address a.wellbrock@mailbox.org.

> Yann E. MORIN <yann.morin.1998@free.fr> hat am 21.06.2024 22:13 CEST geschrieben:
>
>
> On 2024-06-17 20:01 +0200, Alexander Wellbrock via buildroot spake thusly:
> > From: alex <alexander.wellbrock@othermo.de>
>
> This, the authorship... [0]
>
> > Download URLs changed after hosting of the c-ares website changed
> > ownership:
> > https://daniel.haxx.se/blog/2024/06/06/bye-bye-hosting-c-ares-web/
> >
> > This cannot be fixed upstream as github pages does not support .htaccess
> > files according to:
> > https://github.com/c-ares/c-ares.github.io/issues/2
> >
> > Signed-off-by: Alexander Wellbrock <a.wellbrock@mailbox.org>
>
> [0]... does not match your sign-off tag, neither in real name nor in
> email.
>
> Can you just reply to clarify this, please?
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/c-ares/c-ares.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
> > index c4441255a2..a75a40da70 100644
> > --- a/package/c-ares/c-ares.mk
> > +++ b/package/c-ares/c-ares.mk
> > @@ -5,7 +5,7 @@
> >  ################################################################################
> >
> >  C_ARES_VERSION = 1.27.0
> > -C_ARES_SITE = http://c-ares.haxx.se/download
> > +C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/cares-1_27_0
> >  C_ARES_INSTALL_STAGING = YES
> >  C_ARES_CONF_OPTS = --with-random=/dev/urandom
> >  C_ARES_LICENSE = MIT
> > --
> > 2.42.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

------=_Part_29440_1747369335.1719003464483
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: BCPG v1.65

iQIcBAABCgAGBQJmdelIAAoJEEt5V9I9V2bP9nMP/i93aSGd/o7oJ2wjG1UnEFuw
Jk75tYJmvSAeYFUd90HES2mV8KKJfZGDy0MYO/3MNJNRRy7rwqOQCUF1C+JLvFMI
ixtYRBt+GQ6uNQ4gNNuscju3k2ymk1aV55+lEvndxgeqMVSwH2dUT60MiYfsX+LK
5rXEoaoK7UoKfNptM6TBTDMnn3kHQ5HDCMGuTASgrornv/bHXpscSLERW5zYNgIG
3ggQX0yApm0kL6j44EFQ+uaBLvCpdI8ripHpBXS5rsOmZwig9y6FjV1c5z3Cr15N
vS1MoTWD2HK5WLrqPoLdoqMsZUy2StNtUQ+WAHEUCWpOraqTEcVDTDyw4Mxk5Lca
KMMnPz2ALrpnQa1ACvZ9ZHBd117gNwyFy/zYGGK45woiBdpFbp4T0tPvqV0pUIkF
ttTnvti4NzvANvr11okeYkHO3wK7GJtmBVdivvPw0HdQj6VOrqKB2lCy8MrIKEkf
m1qDofdATuTAmP+sv1ESrSeXzo7CrTAryb5ok1P46GVtxU3Vt2yZDOBXaB3IUF9m
YocaIPwrdsYFtUocZSUwC91ayNdMOk08cDWrIRx3mwYBIAXbbEZRqUJJkeDQMiJh
ReaLPD9sRkTvjaJHkaJQmc8ECp2X3Jbj2rszQ9kk1VhrrqaaoPRs1CJV6KS9ReP9
ZTB+BQ2txk4+QTZSjBtO
=ytOg
-----END PGP SIGNATURE-----

------=_Part_29440_1747369335.1719003464483--

--===============3135934052547285825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3135934052547285825==--
