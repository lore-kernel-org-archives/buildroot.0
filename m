Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DF7CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 14:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57BB860F75;
	Sun, 31 May 2026 14:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzVJ-mAnlqHX; Sun, 31 May 2026 14:32:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DAE760F2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780237962;
	bh=qCXPyFpVEGuT8sLIT3FusDIivV8DcrRC+YHo08ImAxU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nFmuoSJYV1Af/BAeB6VU4eIbnnYQcaSheEookvEI/0WDnykJqu1CG7o91L8hZ68t+
	 7LK2uHGKceAaX/nvv6XmtEZ3VDrifEnP2QJA1DswgnjcLPFHwgrfSGjZ63TIos+liz
	 GJXYgKNChkGA8RNGCEx04zNNdWmf5glvW3QRlIBasBx0cJcb90W6cLngjdm2xbDQhf
	 LK9Idf4DHuvndCzDWBG2R1w0V5pRZJBfK8hk3Jo8bHk1mQugwQfPIzxgnauCtN4pJm
	 H+8KAztIWsn+Wzjix1bELIgG67qNZ0jDPdKY6g1kaClKqgKsZqmi6qI4AMpA4475LH
	 +6INg8UVJ0XHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DAE760F2E;
	Sun, 31 May 2026 14:32:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3366F2AA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 251C760F2E
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rUOKvc-wYgy for <buildroot@buildroot.org>;
 Sun, 31 May 2026 14:32:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17DA460F1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17DA460F1C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17DA460F1C
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:32:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8C0B42003C1;
 Sun, 31 May 2026 16:32:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 31 May 2026 16:32:35 +0200
MIME-Version: 1.0
Date: Sun, 31 May 2026 16:32:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260531062526.7792-1-bernd@kuhls.net>
References: <20260531062526.7792-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <9aa9aa04abf1b38644f40ca8ceaeb6a3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780237957;
 bh=+/npoR8cJIyr8zg+HM8Qe8jcFiKptS9MdCBfEMM001M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=raWH38+OS7xWp0H7aTKMJjnXgbon+KaKXAijUfKq/GzQNZ76WD5hqzn3HZtA4oDWF
 3R1DX8L71AzV6KlkQjljDso6dgSUEKpWWYT7HBmNCFGohtDr7oFaiXq9k9B8BS1ooG
 1830XgwB1Mw7qLsvCGfSV8Ry+kyvBCnBUTJrEoteh+H3XSXwX8C98O2ImvUeXH9wai
 bbrmRMETftHeBbM7ra/Cpzgu13CY1wlhrNJjqlsfFCQiSj1JeEu8KAxEuEFUhVOviK
 GDWbG/VhphLGv46tdf4L5e3ydi7SZF8L/JQN/5BlE08VjPJCVdJvWRE/keTyrh+Nz+
 sd07kp/hdX+lQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=raWH38+O
Subject: Re: [Buildroot] [PATCH/next v2 1/4] package/pipewire: bump version
 to 1.6.6
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

T24gMzEvMDUvMjAyNiAwODoyNSwgQmVybmQgS3VobHMgd3JvdGU6Cj4gUmVsZWFzZSBub3RlczoK
PiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvcGlwZXdpcmUvcGlwZXdpcmUvLS9ibG9i
LzEuNi42L05FV1MKPiAKPiBmZm1wZWcgc3VwcG9ydCBuZWVkcyBzd3NjYWxlIHN1cHBvcnQ6Cj4g
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BpcGV3aXJlL3BpcGV3aXJlLy0vY29tbWl0
LzJjYmNkYmM1NzliYmZmYTY4MjA4OGZiZWRiY2ExMGUyNzhlMDYxZGQKPiAKPiBSZW5hbWVkIGNv
bmZpZ3VyZSBvcHRpb24gJ3N5c3RlbWQnIHRvICdsaWJzeXN0ZW1kJyBkdWUgdG8gY29tbWl0Cj4g
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BpcGV3aXJlL3BpcGV3aXJlLy0vY29tbWl0
L2YyYzg3OGEyYzE3NWQwYmVjZTQ1NzFkZjY5MWE4YWYwMmU3YTNhYjcKPiAKPiBEaXNhYmxlZCBq
YWNrMiBzdXBwb3J0IGZvciB1Q2xpYmMgdG8gZml4IGEgYnVpbGQgZXJyb3I6Cj4gCj4gLi4vcGlw
ZXdpcmUtamFjay9zcmMvcGlwZXdpcmUtamFjay5jOjEzOjEwOiBmYXRhbCBlcnJvcjogdGhyZWFk
cy5oOiBObyAKPiBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gICAgMTMgfCAjaW5jbHVkZSA8dGhy
ZWFkcy5oPgo+IAo+IFJlbW92aW5nIHRoaXMgaW5jbHVkZSB3aWxsIG5vdCBmaXggdGhlIHByb2Js
ZW06Cj4gCj4gLi4vcGlwZXdpcmUtamFjay9zcmMvcGlwZXdpcmUtamFjay5jOjEyNzoyMDogZXJy
b3I6IGV4cGVjdGVkIOKAmDvigJkgYmVmb3JlIAo+IOKAmGZsb2F04oCZCj4gICAxMjcgfCBzdGF0
aWMgdGhyZWFkX2xvY2FsIGZsb2F0IG1pZGlfc2NyYXRjaFtNSURJX1NDUkFUQ0hfRlJBTUVTXTsK
PiAKPiBGaXhlczoKPiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMjE3
LzIxN2Y0NTAwYTdkYWRmMDg5YjkwNDM4ZTFlYjA2YWFhOWM1MGY0YzUvCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KClNlcmllcyBhcHBsaWVkIHRvIG5l
eHQsIHRoYW5rcy4KCj4gdjI6IEdpdGxhYiBwaXBlbGluZXMgcGFzc2VkOgo+IGh0dHBzOi8vZ2l0
bGFiLmNvbS9ia3VobHMvYnVpbGRyb290Ly0vY29tbWl0cy8xMzI5YTEzMDdiMmNhZWI5ODliOTBm
NTIyODlkMmRlY2ZjNGY2Y2UxCgpBbmQgdGhhbmsgeW91IGFnYWluIGZvciBwcm92aWRpbmcgdGhl
IENJIGxpbmtzLiBUaGlzIHJlYWxseSBtYWtlcyAKcmV2aWV3cyBmYXN0ZXIuCgpCZXN0IHJlZ2Fy
ZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
