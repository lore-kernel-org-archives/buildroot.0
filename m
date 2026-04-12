Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A23DE937E3
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 14:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E2C461669;
	Sun, 12 Apr 2026 14:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPW7KepRCNfU; Sun, 12 Apr 2026 14:10:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55A9760758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776003024;
	bh=P5msM9gK/tKT79Ztg/ts0i8oICOJKM9SmHtIOszZ3Cw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PXCOFpp0lFso8MvX14QKRyVlTvvT4sbXDfmmNG9aOoifOmpwoA5lo9BDuhqWIPend
	 jDiNDhjNQD6f/XAEyds16Wu0qJXjW3EK0ZCsvyX0BWJA3z2oYmNapfmUO8pUPhR806
	 NitoYJcIqyyGddDRFk+u7L6TWELkPtQcQhW4tBFaJD9EW2iWoco/t0RhQXNYOV83kv
	 Zopr6uMAMUBXTeSQKt/tesT50e7nSlu0OyFOcvEu/UUAG8hv83nV0mTiRueA8VW31i
	 KgYKkfo3PqcC987jRmQ5riwqPW/kISsFxgbuhogt26kP/2AcQuXVPgW7fKuJHL4MIr
	 g40hFG0pNwHqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55A9760758;
	Sun, 12 Apr 2026 14:10:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C34B8194
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 14:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B484084339
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 14:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVEAxdws0ruK for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 14:10:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF8F4842CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF8F4842CD
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF8F4842CD
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 14:10:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4BCF819F5BE;
 Sun, 12 Apr 2026 16:10:15 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 16:10:15 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 16:10:15 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, Romain Naour
 <romain.naour@smile.fr>, =?UTF-8?Q?Vincent_Stehl=C3=A9?=
 <vincent.stehle@arm.com>
In-Reply-To: <20260408195139.715468-1-ju.o@free.fr>
References: <20260408195139.715468-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <b5e666cb4063d7b9bbe5e307450b6e8c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776003020;
 bh=8nOsdH63jVkghV3idjf0N74ly8pwSw3wBeLkA+yRJTE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b6xASGaHSb+Aywpz3HuyPfE1SLwXjw9t6TuU9tuRpEryjec+UXBsLBN1p1L68aK9z
 9FQeAgJQ/NtxBC1xstQ5sdFjZcyVJ0kSyS8mlYO+Y+Y3irkO9LphHf1Yz0FGQ5+yV9
 H/0Z3xJLURBA0bYDlb+DclBj6Gsr4GrYsoKZpuaE5V23zMozm2Kcg5RZrNkdtZTVn0
 KL0x4ISnGKv2gdXdDHJvAjqffH7ejZ85JwH97qWJUe9KuPn3u/6xniC26M04nrUyjJ
 GOYyQc4UxwzGpKOIGGgzBtbhOodsa5uORgllImhiAs94+t9TH17mS+2PNz1tRc5GCe
 ms0Mg7KXLnrWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b6xASGaH
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/edk2: bump to version
 edk2-stable202602
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

T24gMDgvMDQvMjAyNiAyMTo1MSwgSnVsaWVuIE9saXZhaW4gdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBGb3IgcmVsZWFzZSBub3RlcyBzaW5jZSBlZGsyLXN0YWJsZTIwMjUxMSwgc2VlOgo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9yZWxlYXNlcy90YWcvZWRrMi1zdGFibGUyMDI2
MDIKWy4uLl0KPiBDYzogRGljayBPbHNzb24gPGhpQHNlbnppbGxhLmlvPgo+IENjOiBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPiBDYzogVmluY2VudCBTdGVobMOpIDx2aW5j
ZW50LnN0ZWhsZUBhcm0uY29tPgo+IFRlc3RlZC1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJl
ZS5mcj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoKSSBh
cHBsaWVkIHRvIG1hc3RlciwgYWZ0ZXIgYWRkaW5nIHRoZSAiVGVzdGVkLWJ5OiIgZnJvbSBWaW5j
ZW50CmZyb20gdGhlIHYxOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvYWRrS3Zi
emRkNkRPcWFIVUBkZWJpYW4vCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
