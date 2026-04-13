Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D5DF531C7
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 20:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69DE060EFA;
	Mon, 13 Apr 2026 20:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vPbb_DkHr_e; Mon, 13 Apr 2026 20:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C6BE60EF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776110562;
	bh=YsgHiJJU5AJPg1+i/Er2pbwchxEFHXJMIDel9zBz+wM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GvgfXdxL5YoQKknkY6cTZEVbCDc7+zwXIPCEoEsQN512I6wWBjtgUcFrAl2b2jnpC
	 /EWPQxCmDJKLAIPQv8cP0hFvk5v2K45FD+oroWOcF2khLMJ4GXpeDC7N2nsanDR8jC
	 /Pn7cHK/sA8hhuLuDszIl2A7pSd1G44P0Mx2B2xh8XszEVmLT2Y6V/mXiZsPjNsn9J
	 pYht7uDHcaPgK9zkCk4isOV3pUqPkKBUgsCZCsUwh5Cn2+i56ZkVtF87L4/A62sE/M
	 PSguYaOA/2P/OA0Yy2D/uuKigbTLHQXq3FqtScAlupvCj1kbrWtlSm6L9WPUfbrC3V
	 z3WE3GflcmP4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C6BE60EF6;
	Mon, 13 Apr 2026 20:02:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69D40283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 20:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C1A740FDD
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 20:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lpip974QLmrn for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 20:02:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 690F240FDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 690F240FDC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 690F240FDC
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 20:02:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6AD362003C1;
 Mon, 13 Apr 2026 22:02:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Apr 2026 22:02:35 +0200
MIME-Version: 1.0
Date: Mon, 13 Apr 2026 22:02:35 +0200
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260413111053.3846215-1-lazzer@gmail.com>
References: <20260413111053.3846215-1-lazzer@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <f10e3892298a9e1873d44524f058ee4a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776110557;
 bh=q0bKP93VLPrfsJMlT2qdn8xa1KMuU4oRrUpHiLMCcCo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OCQLNmLdWxop1bvGNvQWqm4wls+n7+CJIxluWK7JwjBiAn3pTwNQHDEBHQfVWtxEV
 E3KAwzMg0MYXGdV6qx9PvonrhwLxVx+9H75d82qyulAvVBvKtFoTvcTaAQStmrHeuJ
 ds1mSoWi88e6jEC3E8sUmyXUZK/kjajkLR/PNDmP9SSTTsdh6X1uHUjuneythhhQ8/
 uI+rbg3exB1cFEnUqwW7O2TqXJ6+TaxYl72IxcoKuFisCdAaAEItIyTV7jhzApPjin
 blMyVyJm5ThuyEs6lM4kkvCTYbk163sp8DyTtNtxmcwxn04iTGnDeLL1eqH/5Q3yw7
 n8fqcK+F408BQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OCQLNmLd
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: Add option to
 install ath11k (WC68655) firmware
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

T24gMTMvMDQvMjAyNiAxMzoxMCwgTWF0dGlhcyBXYWxzdHLDtm0gd3JvdGU6Cj4gQWRkIGZpcm13
YXJlIGZvciBRdWFsY29tbSBXQ042ODU1IFdpRmkgNkUgY2hpcC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBNYXR0aWFzIFdhbHN0csO2bSA8bGF6emVyQGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVy
LCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
