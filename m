Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399A1C54F54
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 18:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECC2940A95;
	Tue, 28 Jul 2026 18:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5dSPDgSTQjE; Tue, 28 Jul 2026 18:53:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E9BA40A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785264834;
	bh=ujRHWzbyX61VIDYmc9skK9x+IhxCP+UpD+B8kgCDCBM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bBtn/sBIZOEyS670YXQt2hD1+3B+KpKZRwJkWXVF/xRaAaPP6fHYM+O1xMAa/XclU
	 4TVryIxceyVnElT0JPqRQog6R/nBFlmE0IJQH74upbNG2BAvkhDJLKCD2cEET7g1TA
	 yD8etf/04iN1JkhBjR275cnaN1FMmmidvdaVvXMoSEKAKfRY4CnYn+EYbGbethHE0k
	 TNnpAbKuuSPO/GWzveFzU9icgNw1muNc1AlOLGzSFP/FfDNI8GVxoiiPav/IM6+ghB
	 XEFAAB4yvR7AEPD79lHeA4fuE2ISXAcMRG0OMxtbh2tlR46JvIp/SFBm1rnuZLoXGK
	 95rMhYONnF6iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E9BA40A4A;
	Tue, 28 Jul 2026 18:53:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36714350
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 18:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C9F181316
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 18:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRueAA4gmlRY for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 18:53:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0A8C81296
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0A8C81296
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0A8C81296
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 18:53:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8FC9913F88D;
 Tue, 28 Jul 2026 20:53:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Jul 2026 20:53:46 +0200
MIME-Version: 1.0
Date: Tue, 28 Jul 2026 20:53:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260728173642.3515075-1-bernd@kuhls.net>
References: <20260728173642.3515075-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <7a07f37de158725221e503508527c3fd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785264827;
 bh=kbydESm75CSc/txvyHcFyjgcFfetRK2n5L2bbmUEjMw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KXBlxuepplH+uBnGFwgZpAviapHgNMEtKIdYDLgewIcoECBgi8OVpliTgvFiX9NcR
 cPe80ZaaltY6P4I/sppCCFnG1j1OK+CFuQvXEI2I2dSTwDv5Tew0utVWdWhPIWp39M
 1KUGflsvjQ7Bg/sPeWq5SktEPDozMJ7VF041MMT7TnCd+E8kdXfmX3W20fUixynvBK
 yLk7yyV+fXtBgu9N9seaI2CDm4l/+zs2pSyH9rR5mFB9KoB/LRTOMn5UQq1oMB8bj5
 FK+obged+4CWF836bxveC19F6nOP2cqaRO078PXQl7V0jgNB+OcrGVC1Aerh+nA4FC
 rcEOgDDcqMreQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KXBlxuep
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.24.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/07/2026 19:36, Bernd Kuhls wrote:
> https://www.samba.org/samba/history/samba-4.24.5.html
> 
> This is a security release in order to address the following defects:
> 
> o CVE-2026-6949:
>   TSIG packet with name compression can crash DNS
> 
>    Incorrect size calculations when a TSIG record contains
>    compressed names can lead to a large out-of-bounds write
>    causing the server to crash.
> 
>    https://www.samba.org/samba/security/CVE-2026-6949.html
> 
> o CVE-2026-58216:
>   An authenticated user could possibly crash a KDC process
> 
>    A kpasswd packet that contains malformed ASN.1 might cause
>    the server to access 6 bytes of unallocated memory. This
>    memory is not exposed to the user, but in some
>    circumstances the server could crash.
> 
>    https://www.samba.org/samba/security/CVE-2026-58216.html
> 
> o CVE-2026-58218:
>   DNS signing DoS via TKEY name cache exhaustion
> 
>    An unauthenticated user can repeatedly register names TKEY
>    names, which floods a cache causing legitimate TKEYs to be
>    expunged. This can practically block the use DNS TSIG
>    signing.
> 
>    https://www.samba.org/samba/security/CVE-2026-58218.html
> 
> o CVE-2026-58221:
>   Samba AD authenticated LDAP access domain takeover
> 
>    Samba AD low-privilege authenticated LDAP access allows
>    modifications to internal LDB special DNs, which permits a
>    domain takeover.
> 
>    https://www.samba.org/samba/security/CVE-2026-58221.html
> 
> o CVE-2026-58222:
>   Samba AD LDAP Compare filter injection and trusted-request
>    confusion disclose protected attributes
> 
>    An ordinary authenticated domain user can bypass access
>    checks and query confidential Active Directory attributes
>    (such as KDS root keys) via LDAP Compare requests. Due to a
>    filter injection flaw and trusted execution context, the
>    LDAP Compare operation can be turned into a
>    protected-attribute disclosure oracle.
> 
>    https://www.samba.org/samba/security/CVE-2026-58222.html
> 
> o CVE-2026-58224:
>   The CTDB protocol has bounds checking issues
> 
>    CTDB fails to do integrity checking of received packets.
>    This includes failure to check field lengths against packet
>    lengths when unmarshalling packets.
> 
>    https://www.samba.org/samba/security/CVE-2026-58224.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
