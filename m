Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25219CF45BC
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 17:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDED940DD6;
	Mon, 12 Jan 2026 17:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nh_7oR4uCtGP; Mon, 12 Jan 2026 17:59:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 054B740DC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240788;
	bh=NQ0oXsVl7wU6ONJaIB/ewgoX7xyH1VV+Z18TLcePh+8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kumhAyaNqd1b+OpPhrumRuoCLNYndRS2doAJn3LpU8pPh4EBMYirrZU2JbkQQa06z
	 4SuVla47v8gxsTdnNQB+sJtKYBvaIH5/kP02p4BE7VhIs0XjbeX1ocnYcSiaCoqh1W
	 +Ub6y0fR/ZteMrxhMc5NMRX/RY0P4vcysQwWjP4WbA8NgsVXetkZ2iiJ+Xenr7Rpkk
	 SuqT+8tQY5eyzk+YV9uADNE3PAkhb0jjQf8spHZ8vaD5NzJXj8V2hVEkxE0efBXUZ1
	 AGADoBdlbgOZpMoGmsuSA4RTaH8PR+jCu6ub114yKrF1XcyBzN39aNpGiD6iVUh2/A
	 kqRRFRO4kdXoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 054B740DC1;
	Mon, 12 Jan 2026 17:59:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59C251CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C6CE40DDA
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pun109bLLPMn for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 17:59:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 974CA40DD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 974CA40DD6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 974CA40DD6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:59:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id ABBAB19F59C;
 Mon, 12 Jan 2026 18:59:40 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 Jan 2026 18:59:40 +0100
MIME-Version: 1.0
Date: Mon, 12 Jan 2026 18:59:40 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Jagan Teki
 <jagan@amarulasolutions.com>
In-Reply-To: <aWTh4cfQ4FN0j_ZT@debian>
References: <20260110160448.3310804-1-ju.o@free.fr> <aWTh4cfQ4FN0j_ZT@debian>
User-Agent: Webmail Free/1.6.12
Message-ID: <cfc78e68cab5e95f6d5f72c6f3ab54a1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768240784;
 bh=kbllCC1xnukeNyThWBWvuv9ltNv7NU2hvhSB90uIdy4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BLzHOT6rmFSsJ10WcruqCqVo5yfq9hLrvr1vsW53PYw5xei9Ama089aWP6LZbRSWE
 6xCYmaMX3M1mdi74XXeQFwkarIpQJHT5M01rW8wQqep8pWMfGdLseQ03iFzbVzlkQh
 VlueSFZ5rVq1H4Dykk/CxzPBPVf8UZzWmYNmBx7+6UXcPRzL0C2/v1BLmbwi6cfRoh
 VV11scRTeLNO6egFwSJQNsaK/un3YmY8DC4xoQFa5ReKTwIwM3W1OneWSOzEbPYYUu
 xJL/vvApwaHTvOPxSiD8Tn77cinpFZS7usdALDKeX6qM8kLYrbzqh6gYfDieHY35FO
 M/KHNZXcba0Rw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BLzHOT6r
Subject: Re: [Buildroot] [PATCH 1/2] configs/rockpro64: update U-Boot, TF-A,
 Kernel
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

T24gMTIvMDEvMjAyNiAxMjo1OCwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IE9uIFNhdCwgSmFu
IDEwLCAyMDI2IGF0IDA1OjA0OjQxUE0gKzAxMDAsIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+PiBU
aGlzIGNvbW1pdDoKPj4gLSB1cGRhdGVzIHRoZSBLZXJuZWwgZnJvbSA2LjEwLjE0IHRvIDYuMTgu
NAo+PiAtIHVwZGF0ZXMgYXJtLXRydXN0ZWQtZmlybXdhcmUgZnJvbSB2Mi4xMSB0byB2Mi4xNAo+
PiAtIHVwZGF0ZXMgVS1Cb290IGZyb20gMjAyNC4xMCB0byAyMDI2LjAxCj4+IC0gc3dpdGNoZXMg
dG8gQm9vdGxpbiBleHRlcm5hbCBnbGliYyBzdGFibGUgdG9vbGNoYWluCj4+IC0gcmVtb3ZlcyBo
YXNoIGZvciBsaW51eC1oZWFkZXJzIChubyBsb25nZXIgbmVlZGVkKQo+PiAKPj4gSW4gb3JkZXIg
dG8gcmVkdWNlIHRoZSBkaWZmZXJlbmNlcyB3aXRoIHRoZSByb2NrcHJvNjRfZWJicl9kZWZjb25m
aWcsCj4+IHRoaXMgY29tbWl0IGFsc286Cj4+IC0gc2xpZ2h0bHkgaW5jcmVhc2VzIHRoZSByb290
ZnMgc2l6ZSBmcm9tIDEyME0gdG8gMTI4TSwKPj4gLSB1bnNldHMgdGhlIHJvb3RmcyB0YXIgYXJj
aGl2ZSB3aGljaCBpcyBub3QgbmVlZGVkLAo+PiAtIHJlbW92ZXMgcm9vdGZzLnRhciBmcm9tIGJv
YXJkL3BpbmU2NC9yb2NrcHJvNjQvcmVhZG1lLnR4dAo+PiAKPj4gVGVzdGVkIG9uIGJvYXJkIFJv
Y2twcm82NF9WMi4xIDIwMTgtMDctMDIuCj4gCj4gSGkgSnVsaWVuLAo+IAo+IFRoYW5rcyBmb3Ig
dGhpcyB1cGRhdGUgdG8gdGhlIHJvY2twcm82NF9kZWZjb25maWc7IGl0IHdvcmtzIGZpbmUgb24g
bXkKPiBzaWRlLCB0aGVyZWZvcmUgZm9yIHRoaXMgc2Vjb25kIHBhdGNoIGZlZWwgZnJlZSB0byBh
ZGQgKG9yIG5vdCk6Cj4gCj4gVGVzdGVkLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3Rl
aGxlQGFybS5jb20+CgpTZXJpZXMgYXBwbGllZCB0byBtYXN0ZXIuClRoYW5rcyBmb3IgdGhlIHJl
dmlldyBhbmQgdGVzdGluZyEKCj4gQmVzdCByZWdhcmRzLAo+IFZpbmNlbnQuCgpCZXN0IHJlZ2Fy
ZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
