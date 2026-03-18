Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19ADD10775F9
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 187AC416CD;
	Wed, 18 Mar 2026 18:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMcnQcdXoOff; Wed, 18 Mar 2026 18:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1444A41693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773857703;
	bh=8Gyhr2E6WJhBLTlOGm7hGDLLpJgEIGaqZOk+sFnesig=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XjACJArjN5jTHWHUq/fG0Vx280NGFwJXAqDLFGIS/Pc4PrGV7HvMinGRDhsYy6Frb
	 QUIvPl27UkhaXOTxbd19IYQ7RQcRgCKXe0ZiKI5If+8M3NJJ1QQZ2SdutBFj276oZ3
	 klRKhCH0uEqvLYw5aGj8F8mLoOeoW1BYhzEecNERoK0JjR61d9X0+i/RZGpNgn2tXr
	 MutwN6ZQG3GlkxnUSjFnXzcvOcHc+gR6BYA2E6OOa8G2NZBioY7VSS1kpORLpyhtq2
	 E7MhqFl4k+dJmNar+n+lNUNfEAMywO1v1Xoj1srDLusFNbXuKrCYxXyUVGZUfmEq1K
	 NJOBNp8YYZtNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1444A41693;
	Wed, 18 Mar 2026 18:15:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 665541BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51AF983653
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Agpda1CtCaP for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:15:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D717A835E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D717A835E0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D717A835E0
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:15:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 996D619F5A7;
 Wed, 18 Mar 2026 19:14:56 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Mar 2026 19:14:56 +0100
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 19:14:56 +0100
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>
In-Reply-To: <20260318145831.2940242-1-lazzer@gmail.com>
References: <20260318145831.2940242-1-lazzer@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <e70483b75cc9173c89f68335885e5ffa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773857698;
 bh=tw4siDVKjjJtrLeA/hC5kTrw/CKKcm6dKrivE/IPgCs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qBkgTekYLsFHSAQRLN0ZGmSHc09yZrjesJ4CT0m867rW+jgOSTymNUBl0JwbWgzUM
 DbunfDsQl5wUEVDtFU106W2Z8X4qb276JfSsncIjeTxJhyVGfTEOCIbEsLbr9GeVqD
 ePmASDeOSm1pqr7aeSDMeyEEQZIYq3Gua5BGnf0rDH0lyEwNRwlBTkRK8W5dDBmsRy
 aMXKDOsgGDMHQHU1mFxA7yNczo1drOFG4URn1BodPmB2MU3KOuVsRVGPeehuYFLoyz
 IcDCOxA5ApG/UjxMRQM/IPM2cIPqrAtwytugm7ctHg2O++HHDAePGOCPpFMtwdbGDv
 gsG9OPsVdETMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qBkgTekY
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: Bump version to 10.5.3
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTgvMDMvMjAyNiAxNTo1OCwgTWF0dGlhcyBXYWxzdHLDtm0gd3JvdGU6Cj4gRm9yIGNoYW5n
ZSBsb2csIHNlZToKPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9GUlJvdXRpbmcvZnJyL3JlbGVhc2Vz
L3RhZy9mcnItMTAuNS4zCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLDtm0gPGxh
enplckBnbWFpbC5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
