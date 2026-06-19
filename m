Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4EACD98F6
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 23:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E91F78601B;
	Fri, 19 Jun 2026 23:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsWpIWbg4XV8; Fri, 19 Jun 2026 23:03:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20A7286017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781910192;
	bh=DUzjhayzGjArOt7ZfjnCA8lMTmSeI7gfTyA5ceYd5UQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=kPgLlVpvIqscfeGBwFuFBmhjYvhqBcoVyzIyC2sgoYRzlK/xh6fQaL0hmd5WrGDkC
	 ksf1R3P4R+K+UfQY67IetqlvxISbDe5qdGwFt/4yNApkLM03BmjOR/eI3B0N9QarC+
	 RIx1XDz5EbHPBDiSynvpGxkPaDiAxPvfQz4lUVrOD1fRvT1AsY6MYwSuXnXYwJGk3Q
	 AYmNt4oKKqbYCVIfCZlaU9SVaCwDKwuXCN2Ew8RAv5uUbQUdAqykvOSAk1trZjvdID
	 kv0KbJCrInK5XkZUGNgxqu9ZvsZgadatFCTKk0FcF5G5LBB+jg6vRSJGdvel6e1vnM
	 ms9JgDmwB6SYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20A7286017;
	Fri, 19 Jun 2026 23:03:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C8AF2D7
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F26AB4ED1B
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5y42MGaHaiSZ for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 23:03:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A48F14ED09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A48F14ED09
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A48F14ED09
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:03:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIMfW-1wMT9i1rIC-00FuZw; Sat, 20
 Jun 2026 01:03:06 +0200
Message-ID: <58b7ae7b-049b-4cfd-9198-b6b0d010a1cc@gmx.de>
Date: Sat, 20 Jun 2026 01:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260619181321.3345513-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260619181321.3345513-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:OHoA9bBK5vDdfTS150wbQug9O6LQvFSztgTVb9Fep0c57vQ25Wp
 nCBLRlWFGZ2LfZqvK+0+/66cHvZWiwWd7JWwwsggm4SiqC3uH9tERWszOUyiU2914UFHQf+
 9pwUku2YJ8v6qGZVNJqr/bQqHJjSKNGzki485PKNBEO1R1A9+z+Kskug0rN8FYd/l8U4MmB
 RfkYj0ZPK50Eo/F06TbMw==
UI-OutboundReport: notjunk:1;M01:P0:WAKBFAR1g9M=;zNm71Y2+B0P7bTn3dyluMfEbrmE
 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
 dSGI+Ftgo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781910186; x=1782514986; i=fiona.klute@gmx.de;
 bh=xpW4cgM2tT3ZcBYBiz3W5uPB4bWxdydY+uaIgO2p8iI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=EFrQdgaCCNnIMLO1RKBPftQT1xUlRrsmRQwdpoMJ45qheVgU44WuvuF23GG/OF4s
 0Bjq/hPNgC2gevdIv52STMMs2Vf7EqiSNB1K7FUO70hoIsmtchvx2tKFbpgq1YoEQ
 AhCjh77ZnplmUF3O5vflwzkHFYIlbuOa//UCpQUB29jS751w/BNKN+gbdoSLnCXEp
 swqsAOikbaCWl102z7oKpwQTnMIRX8A/g3x2qk+shmfWl8tlAuDolMKeIDwGiWIHI
 PTBrWGOZFqKaWhaRfLdaYVFGprUwW86reo7Ahzj9+7cHY0Vxz2v1qeV1tPA+tmnCf
 aWg5oAB4mmI/zDYUuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=EFrQdgaC
Subject: Re: [Buildroot] [PATCH 1/1] package/libgsasl: security bump version
 to 2.2.4
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 19.06.26 um 20:13 schrieb Bernd Kuhls:
> 2.2.3: https://lists.gnu.org/archive/html/help-gsasl/2026-05/msg00001.html
>         Fixes CVE-2026-48829: https://www.cvedetails.com/cve/CVE-2026-48829/
> 
> 2.2.4: https://lists.gnu.org/archive/html/help-gsasl/2026-06/msg00001.html
>         https://lists.gnu.org/archive/html/help-gsasl/2026-06/msg00002.html
>         "GNU SASL Security Advisory: NTLM client use-of-uninitialized-value"
> 
> Upstream does not provide sha1/sha256 hashes anymore.
> 
> Updated license hash due to copyright year bump:
> https://gitlab.com/gsasl/gsasl/-/commit/ec96bad53988cb79060964cf1f1568da4e301fd6
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Upstream still provides sha256 hashes, they're just a little differently 
formatted than before. Converting base64 -> hex gives exactly the value 
you calculated. :-)

Applied to master with that fixed, thank you!

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/cacbb2a74a1a47440ad8e193de23bc645f99817d
> 
>   package/libgsasl/libgsasl.hash | 8 ++------
>   package/libgsasl/libgsasl.mk   | 2 +-
>   2 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/package/libgsasl/libgsasl.hash b/package/libgsasl/libgsasl.hash
> index de24d73c2d..4995ffe823 100644
> --- a/package/libgsasl/libgsasl.hash
> +++ b/package/libgsasl/libgsasl.hash
> @@ -1,11 +1,7 @@
> -# From https://lists.gnu.org/archive/html/help-gsasl/2025-03/msg00000.html
> -sha1  8a845b7ec78e5f27bf69438074ad23867c00d4fe  gsasl-2.2.2.tar.gz
> -sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
> -
>   # Locally calculated after checking pgp signature
> -sha256  41e8e442648eccaf6459d9ad93d4b18530b96c8eaf50e3f342532ef275eff3ba  gsasl-2.2.2.tar.gz
> +sha256  d32be15efd3a04cb19b232f721bdca02cc6ad7ab415df7d79fb2dd2c0da3e0be  gsasl-2.2.4.tar.gz
>   
>   # Hash for license files:
> -sha256  e3d1b8a82b97dc6083b2600a6beb0396bbefbe384fc1cd39d0e8cb04bbf2bd33  README
> +sha256  16a8258f525326a71cba997365505ad32089be4be7a7100f64f308ed01419a11  README
>   sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSER
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
> index 8670f43b6f..db3b64e282 100644
> --- a/package/libgsasl/libgsasl.mk
> +++ b/package/libgsasl/libgsasl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBGSASL_VERSION = 2.2.2
> +LIBGSASL_VERSION = 2.2.4
>   LIBGSASL_SOURCE = gsasl-$(LIBGSASL_VERSION).tar.gz
>   LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
>   LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
