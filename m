Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E81F94CD9
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 07:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA59560A55;
	Wed, 22 Apr 2026 07:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyV2COqeVLag; Wed, 22 Apr 2026 07:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD58460BAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776841351;
	bh=UPmZehYY85m3OMKvCCECgT98o9XVjX58nlGLO0ATZm0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=GWu7sLAvQqoJOU10XMZ/UDXpk9tgyPnNKHeyJGzrA/av1sLv2WuSPP0qGIgZAx4qi
	 DBrJ7w1Yl1f/71Am66wfuLPQzAWqqMcGxeNj9238GO222NbLMCjheOWLRORAjAmWVt
	 L8gg2x+swKNvup3Mexe5K2fCbAduYWVcmFoG/6ew9+RzgJRywL/AO/pntnaRhFPj3N
	 n68Y2VJr80hqomYrnvEsPcioQ0mErMQFJ7Nx1N7XeYd9UINmVp7yP7EvsXQ+ojhyU3
	 LZTQ/Cu6kf+ECsHsQUuXwmp7L+wGliNSsg6tJdqpZem6LZXjPZmle/N+kGb3ztJyqa
	 wLT15LC7PcHBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD58460BAB;
	Wed, 22 Apr 2026 07:02:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD3D724D
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 07:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF2F8845A1
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 07:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giGRU75cEGrh for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 07:02:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8EECA845A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EECA845A3
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EECA845A3
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 07:02:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id ED4451A339F
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 07:02:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C567F600DD;
 Wed, 22 Apr 2026 07:02:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AD44410460B45; 
 Wed, 22 Apr 2026 09:02:24 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 22 Apr 2026 09:02:24 +0200
Message-Id: <DHZHOSWG9CZH.3S7LVK019ZYTP@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Bernd
 Kuhls" <bernd@kuhls.net>, <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260421184831.2576691-1-bernd@kuhls.net>
 <DHZHN47Y9XYT.1PHQZCSLUKW7Z@bootlin.com>
In-Reply-To: <DHZHN47Y9XYT.1PHQZCSLUKW7Z@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1776841345; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JMsmB5jqH1iOpKrdSd8qtiTDIk4eSoGwW5ioe63DUSM=;
 b=uvbvXCMaEtvSNE8NsGT7UW14AlgNx4DWTxGF5co4y9njPVN8hy7QRuYTtP6je7IXTFTW6K
 P7UiLfZmqTjFilM3PAXz3IyMXJRrM9Yyr2t5A8bqgmvtMAu7ZwZNiXh8U3O8DtvW0TFOKP
 ytzp4ErVMtSq6WxB3/2fQrO8Lj2QoxETY4KWxrS5tXbKPm647GVbkX5Vw0CDjve0LPRqXr
 QcZZFIE/YKAD2SDbb4OWnDdPb7UpZqcj3Q28M9U0iE3NW+0THNXTgwUeup1tXhiSqgfkjC
 nlZt43fuU9h35g+hpyKA6IS/19U2P16MiY4hxfK165uyNRwwmehSdtx2b+Vz3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=uvbvXCMa
Subject: Re: [Buildroot] [PATCH 1/2] package/opensc: security bump version
 to 0.27.1
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkIEFwciAyMiwgMjAyNiBhdCA5OjAwIEFNIENFU1QsIEFsZXhpcyBMb3Rob3LDqSB3cm90
ZToKPiBPbiBUdWUgQXByIDIxLCAyMDI2IGF0IDg6NDggUE0gQ0VTVCwgQmVybmQgS3VobHMgd3Jv
dGU6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0MvT3BlblNDL2Jsb2IvMC4yNy4xL05FV1MK
Pj4KPj4gU3dpdGNoZWQgdG8gc2hhMjU2IHRhcmJhbGwgaGFzaCBwcm92aWRlZCBieSB1cHN0cmVh
bS4KPj4KPj4gUmVtb3ZlZCBwYXRjaCB3aGljaCBpcyBpbmNsdWRlZCBpbiB0aGlzIHJlbGVhc2Uu
Cj4+Cj4+IEZpeGVzIHRoZSBmb2xsb3dpbmcgQ1ZFczoKPj4gKiBDVkUtMjAyNS0xMzc2MzogU2V2
ZXJhbCB1c2VzIG9mIHBvdGVudGlhbGx5IHVuaW5pdGlhbGl6ZWQgbWVtb3J5Cj4+ICAgICAgICAg
ICAgICAgICAgIGRldGVjdGVkIGJ5IGZ1enplcnMKPj4gKiBDVkUtMjAyNS00OTAxMDogUG9zc2li
bGUgd3JpdGUgYmV5b25kIGJ1ZmZlciBib3VuZHMgZHVyaW5nIHByb2Nlc3NpbmcKPj4gICAgICAg
ICAgICAgICAgICAgb2YgR0VUIFJFU1BPTlNFIEFQRFUKPj4gKiBDVkUtMjAyNS02NjIxNTogUG9z
c2libGUgd3JpdGUgYmV5b25kIGJ1ZmZlciBib3VuZHMgaW4gb2JlcnRodXIgZHJpdmVyCj4+ICog
Q1ZFLTIwMjUtNjYwMzg6IFBvc3NpYmxlIHJlYWQgYmV5b25kIGJ1ZmZlciBib3VuZHMgd2hlbiBw
YXJzaW5nCj4+ICAgICAgICAgICAgICAgICAgIGhpc3RvcmljYWwgYnl0ZXMgaW4gUElWIGRyaXZl
cgo+PiAqIENWRS0yMDI1LTY2MDM3OiBQb3NzaWJsZSBidWZmZXIgb3ZlcnJ1biB3aGlsZSBwYXJz
aW5nIFNQS0kKPj4KPj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5l
dD4KPgo+IEkgc3VzcGVjdCB0aGUgQ0Mgb24gbXkgYWRkcmVzcyB0byBiZSBhIG1pc3Rha2UsIGFz
IG15IG5hbWUgY2FuIGJlIGZvdW5kCj4gZm9yIHRoZSBvcGVuc2NBUCBwYWNrYWdlLgoKQWgsIG5l
dmVybWluZCwgSSBtaXNzZWQgdGhlIG9wZW5zY2FwIHJlbGF0ZWQgcGF0Y2ggaW4gdGhlIHNhbWUg
c2VyaWVzCgo+Cj4gTEdUTSB0aG91Z2ggOykKPgo+IFRoYW5rcywKPgo+IEFsZXhpcwoKCgoKLS0g
CkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
