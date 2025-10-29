Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA707CCF9EE
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 08:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CE4B60EC4;
	Wed, 29 Oct 2025 08:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZZKgUC8CYLK; Wed, 29 Oct 2025 08:13:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43E7560E26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43E7560E26;
	Wed, 29 Oct 2025 08:13:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0367708
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 08:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E02F581D4D
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 08:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3huBSVGQOpk for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 08:13:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=romain.gantois@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C2B0181D47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2B0181D47
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2B0181D47
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 08:13:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 35198C0BEBB
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 08:12:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 888C3606E8
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 08:13:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DA1A710311148; Wed, 29 Oct 2025 09:13:02 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>
Date: Wed, 29 Oct 2025 09:13:02 +0100
Message-ID: <6207213.lOV4Wx5bFT@fw-rgant>
In-Reply-To: <20251020095447.08d46550@windsurf>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
 <22876007.EfDdHjke4D@fw-rgant> <20251020095447.08d46550@windsurf>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1761725583; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=BgaNh0gme5uZgwzlW9cDGV7czKJ59LhNk4zicF0bsig=;
 b=2uoEoRi0d2C21vFJzUnbnWqcaWs47IDh/r22B1s0j8qf4ivPcZfEhong+mzYKjoepPkHjY
 97NEIFaPLA7Nabgo+lHltCjzIglIDlS4PQTOxMxg478xZtvRbpQsmr3B6xjHtCXFIo4IRs
 SLKcJpObThIVMN3oD1i3Z0qklqFxQdvb20UMYdSUOM3Fi+fck0HQuAyifUJ0Hpj2Nbc2VE
 6wc/yvQVSljBuFY0qUlnFbtGQ0vPzfwjnE8woIZp0wSXmGmn7GQkopzJ8DDwamhz/YOr2I
 KnVKprwSLjHXBDTtEN4qFcn9r4nCxdvQh4Bmfl9X9Cd+O0QVxOW8UNeKNYHdzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2uoEoRi0
Subject: Re: [Buildroot] [PATCH 11/11] package/snagboot: new package
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
From: Romain Gantois via buildroot <buildroot@buildroot.org>
Reply-To: Romain Gantois <romain.gantois@bootlin.com>
Content-Type: multipart/mixed; boundary="===============6746152053502745284=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6746152053502745284==
Content-Type: multipart/signed; boundary="nextPart5051878.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5051878.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>
Subject: Re: [PATCH 11/11] package/snagboot: new package
Date: Wed, 29 Oct 2025 09:13:02 +0100
Message-ID: <6207213.lOV4Wx5bFT@fw-rgant>
In-Reply-To: <20251020095447.08d46550@windsurf>
MIME-Version: 1.0

Hi Thomas,

On Monday, 20 October 2025 09:54:51 CET Thomas Petazzoni wrote:
> Hello Romain,
> 
> On Mon, 20 Oct 2025 09:17:49 +0200
> 
> Romain Gantois <romain.gantois@bootlin.com> wrote:
> > Only the "gui" variant of the Snagboot package provides Snagfactory, the
> > base version doesn't, so is this removal really necessary?
> 
> From my testing, the snagfactory main script gets installed, which is
> why I had to remove it.

Okay, lets just keep the removal for now then.

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart5051878.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmkBzI4ACgkQKCYAIARz
eA78rw//dJJTwIMwlOo8NDMaxPuVvYAS7Ekm+FtqYWJZNr2+MZvAuAlWNo/6YGQs
87zlaG7QL5Oci5WUabxmSfs+9fud9JJRBXYETZ854nb4YvNoqO5v9r6mG3LELam/
G2aiK6kUKcEGsNAiTu/H7Sb9HNeCtI3rw5ftt3pCILgVqgduocFTg4uouGetxoNt
lDNsz0kV77X2rWKSvf2h4sPJioJd7+OR17mumH/Y0wi1miWgbHGIQyTtWPRNm8nh
pB8G0FiKzU/Z8ckUtaNoIsPIF/YQOPUTn5lQtx/LoZs63PQB+XkJd4nGJcxIPCzY
Q1dnz4Y6bgOKC7KaVhGNy+N64tiQ0a9VhCUPozwomqqB0KhkPGzFKFaD9xLh7lPG
OAlEpYvlrhLehH5VGBRu42Sk6CRK9Jh3AHaWefnBiX8Fg0WntkmAxJz7wUOqaLnQ
fjgD0LHmk2my8CdtV6MPbamsHJgOG3/nF2fdcH2DJz/HL/GmRvlOSIoyOfbEh3Th
Zw8JQWfZ6QesJHKCaWa09ZESEL5ZcV3X0bK3Z8CNdmBYiqNoI947D/0Gjl0debB6
/XyD/jnCR4tn7G+npPrSKcWY/PZslWQVOPO6FbnfnxlrPWa6XuCvChH44laBOpjk
VOczLsTFZ8bi/t1neWeKpsCDEwDhv3zv+0Up59kiKAZK4isfMMQ=
=Q2/p
-----END PGP SIGNATURE-----

--nextPart5051878.31r3eYUQgx--




--===============6746152053502745284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6746152053502745284==--



