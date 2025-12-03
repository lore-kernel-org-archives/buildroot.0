Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B03AD12D56
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 12:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06D9083CCE;
	Wed,  3 Dec 2025 12:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oO-BC2LR_-mh; Wed,  3 Dec 2025 12:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3902383D23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764766110;
	bh=A0hw3Nuh8dyW3O58w2Xm0WJEOXtmphViHSNPPxHMkg8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=YVF58ssf/OZh05srf+TrYPJ3HSDbZHxybdYKFPX8Tmq/mB9dRYjc+lPiAz+kr1KuO
	 PptIxseeof+FZyET0ZFD3VqYX8ZGD83GT/L94FAnDkmXVTn2y3OTVWvcUP18Y7N/nS
	 /xW0MYo5qLkz4D1kd3apVj4W0p4S7zAlverPIO8fvTZEVFVCb1aUADbN+VHZ/DJHpi
	 N6e7lAzgv/0ESt3WHbvH73QFVg6O4qnoBzND9jnI7EkelZuZFkO5CaCM95S4uJh4xD
	 I72hCdBID4G1yCVZ1XDsuGwrx4Mlqi+6iU7JoaWcfuroLbiRFw617uKbNaAVsX+ouK
	 MwMklxZ9dvipA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3902383D23;
	Wed,  3 Dec 2025 12:48:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10A5EE7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 12:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2E0A400FE
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 12:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEQSNfdiGXS3 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 12:48:28 +0000 (UTC)
X-Greylist: delayed 321 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 03 Dec 2025 12:48:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6C4E400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6C4E400C1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:4f8:c0c:9d57::1;
 helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN> 
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6C4E400C1
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 12:48:27 +0000 (UTC)
Received: from localhost (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id E617C4D5;
 Wed,  3 Dec 2025 13:43:01 +0100 (CET)
Mime-Version: 1.0
Date: Wed, 03 Dec 2025 13:42:59 +0100
Message-Id: <DEOL9AU6MC41.U6UK0P298I5S@walle.cc>
To: "Heiko Thiery" <heiko.thiery@gmail.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.0
References: <20250905123754.33866-1-heiko.thiery@gmail.com>
 <CAEyMn7ZE2=2nBQ=TS63Pi1KdfVJr_+1Rvr72apuwCaSycXzchA@mail.gmail.com>
In-Reply-To: <CAEyMn7ZE2=2nBQ=TS63Pi1KdfVJr_+1Rvr72apuwCaSycXzchA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=walle.cc; s=mail2022082101; t=1764765782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4QzQXrfjkKQVz+YMDoIQv158VqVo2oDDYlmAqMlODS0=;
 b=Pv8JTS3jux9uUPrZgQbn2uyuwPz2C68F32hDEcQonekd16+wqhFtoqEi7si+YWC6e5YdEz
 DuZpz3MmC/mQv7y049WM08QvH2LAZH1/hWfvN2SxeahTHLWBUqkI9knP251O1zaYullyM4
 VT51N8NbXoufL1/A4AhhkGtSX8R3Z5OrYlkOgCGdTYrsiDlg3uaSl0TvXSvMGHQsD45FDu
 F4gC6WyhRfO8ge0QY3AUk9+NN0zDRzMPdQp3znw6+9W83Mz4M0vllWVKW8VSDsG1dXLa/w
 XdAJHbtO/Gf+LRE/gLozk4PEDOdsPZhVSShJYlK2Uri6wD2Iyd0ZxmAvq7E8QQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=walle.cc
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2022082101 header.b=Pv8JTS3j
Subject: Re: [Buildroot] [PATCH] package/uboot-tools: use uboot host tool
 printinitialenv to extract env
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <michael@walle.cc>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 Arnout Vandecappelle <arnout@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============9209119963146836104=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9209119963146836104==
Content-Type: multipart/signed;
 boundary=268ef7874217e4c670d78698b3da92396f53d2089556b4d90ea61d38e80a;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--268ef7874217e4c670d78698b3da92396f53d2089556b4d90ea61d38e80a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Sep 8, 2025 at 3:02 PM CEST, Heiko Thiery wrote:
>> If u-boot is compiled with the LTO option, it is no longer possible to
>> use the script 'get_default_envs.sh'. The problem was already observed
>> and a solution available upstream u-boot since the commit 486aef08de09 [=
1].
>> This was first available in release v2023.04.
>>
>> Instead of using the script the new tool 'printinitialenv' is used. The
>> tool is build with u-boot that is a dependency of this package.
>>
>> [1] https://source.denx.de/u-boot/custodians/u-boot-tegra/-/commit/486ae=
f08de091ca35386f32fe961a201c3cfa9d4
>>
>> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Is there any update on this? This really blocks us using the stock
buildroot with CONFIG_LTO in the bootloader (which is the default
for the TI SoCs now) and BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE.

-michael

>> ---
>>
>> The question I ask myself is, how can this problem be solved for older
>> U-Boot versions, or how can both options be supported? With the proposed
>> option, old U-Boats will no longer build.

--268ef7874217e4c670d78698b3da92396f53d2089556b4d90ea61d38e80a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaTAwUxEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+HdVAYC6snAeh1mEL6RLt7bYm5YPhSfJBFmkOYyW
95nr3MkNstzNQPB73xGsft911GGoat0BgL4sHQ1FG+VU2sb+4v7zO+whQtIazBkW
4E25oKAjDl4J1ZUBnO1CHTLWc/uYTSO0yA==
=t/k5
-----END PGP SIGNATURE-----

--268ef7874217e4c670d78698b3da92396f53d2089556b4d90ea61d38e80a--

--===============9209119963146836104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9209119963146836104==--
