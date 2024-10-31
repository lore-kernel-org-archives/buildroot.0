Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A23E67480
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 21:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F52C408C7;
	Thu, 31 Oct 2024 21:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFAF4p05u_st; Thu, 31 Oct 2024 21:12:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E84F5408A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E84F5408A6;
	Thu, 31 Oct 2024 21:12:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 943BE5E46
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81DCB400EF
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YiAI7GyGEK_F for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 21:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=194.117.254.33;
 helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9079E400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9079E400D7
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9079E400D7
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:12:08 +0000 (UTC)
Received: (qmail 3548613 invoked from network); 31 Oct 2024 22:12:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 31 Oct 2024 22:12:05 +0100
X-UD-Smtp-Session: l3s3148p1@hwA7RcwlbNvDwPty
Date: Thu, 31 Oct 2024 23:11:59 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <ZyPyn7eBdvkPHFRe@shikoro>
References: <20241030133416.505410-2-wsa+renesas@sang-engineering.com>
 <20241031190915.499a7170@windsurf>
MIME-Version: 1.0
In-Reply-To: <20241031190915.499a7170@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=zv9g
 kPUzVxeJKBDqGAD1JxhPlYoYvpoS8S3mj4ToFJQ=; b=MgEWv9NUcItDRY4080Wd
 WTLFMEVT/SO6ugUEMRqocNgP0xYNkPwsgn517cbKCSBVaaXy4nX1eeYBQcPtPVJS
 nCeHVdo97rkmMPNYHCnhsQMYeamthNEFCtfP8+/sdjdnc3lQNHsO2C3eA5Y4nRkp
 7RERYlkbnGFlIBRwPatA2FfpUVCJZY60q04zdjIBRnV6hdZR543SiLXM4B6/A+Mf
 DtskNfAnqwT6pJH2ual8kKuTBtj+KAaqz5G7TOMCXLLWejLjCaOrim588Px0y87P
 q1QewrGGuzXZN2LTBIs/jUX+i+HFw66Qf2rVpvsTOIjObgu/VTM+whk8uiTl+2cb
 CQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=sang-engineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com
 header.a=rsa-sha256 header.s=k1 header.b=MgEWv9NU
Subject: Re: [Buildroot] [PATCH] package/rtc-tools: bump to version 2022.02
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
Content-Type: multipart/mixed; boundary="===============7352668053364399269=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7352668053364399269==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IkgcPtgoNrdPQ+qa"
Content-Disposition: inline


--IkgcPtgoNrdPQ+qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> It wasn't clear to me what you change the _SITE variable, as it isn't
> needed. So I dropped this change, and applied the rest of your patch.

Well, I am new to updating buildroot, and when my simple update did not
work, I copy&pasted the 'snapshot' addition to _SITE from another
package, and then it worked. It was probably something else, because
your simplified version now works for me as well. Things happen, sorry
about the confusion!


--IkgcPtgoNrdPQ+qa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcj8poACgkQFA3kzBSg
Kbb77A/9F4wVndKE1Ey4cuSO8YOJuvgmu7PKUnCoi18ahSBZw/R5PUq0575oBZSn
3+lxzaSim+67jB93n22u8ppYYYQxDbxnZ1AbcXfl8L5FfDhBPrVcGtZikgyjP+U2
1fbuEcn5aWxRpGMU0J3ZWHAw8J3gCttRRTVHUh35a0rW+0O8q/nJXstX3luMZCfb
SZkd3WNrW5Q0bSBA9XWbKVF63Xhkgvaz8tN0dWGIdlH0NqEGKOoFgM8g/e+c4g8I
AsRM1w6jQsi+jykp9UgXuR7fluiDSArTcr04qaF6jq0hCTZ9+Xho0y7yQuam3htF
BkRGKUzCMj1KBBaitpUoguqbQgjd6KxBXN23lGr2fMm+IBqc1vxm/JGK5fubOzH8
yHFWO4aOcYvxgdonReY0QmQwI6EFhqYdpfmg1zgwSPmUPWMiuvlfLJZ35j/HZoWp
nHCly6fSrEc7EReZXdUTRh2exNipv+dOSr8z4ZjgJZ/9mYHi7b4aBrsdw+d0GVfI
fcB43/Cizdd4KidDg/diCeKvN51R7DUY2P1bP5nf9A2ALBfBQDK19ShZ5Mh9QDZS
Hkjd2S/VorkQjfEtxZuwW82JIbxxRCMJF/59fbO0Y1/LCkmdOSfHbeM5Dxa2HTB6
QIp7c3eUURi5fYPn68kmtssdQ5mrdLWSBjLFQkrQaNp/XxYUuwg=
=081T
-----END PGP SIGNATURE-----

--IkgcPtgoNrdPQ+qa--

--===============7352668053364399269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7352668053364399269==--
