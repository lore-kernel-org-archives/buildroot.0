Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051C0CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 971CB6060E;
	Tue, 13 Oct 2026 09:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wKeDUyY4nMq; Tue, 13 Oct 2026 09:16:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9EF0F606E1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791882991;
	b=OVKoi8dqzrgUyScBeBKm7V1q8zLCwgakJYWlQUDzr9zdYghpsCOiZASMQYPOio/ue05a
	 ILNJQ5zUEnoWw04qXXBjekSDJzh2MEOh10ozPvgVV7ubanRhisgDeTPpL5lsSmfxcre3y
	 o5/S7MtuAIk3bUfqO0KW4nfYIg9MS+FmDSw7Lo/0YHRy0ciw4Xd4sLNlWs0jxfz7J6wMa
	 +O3lFLOUDdUH1IkqG7Rz51ih4zMdsmQ42NtFY9LtI7eKBGXLdzdbXdD9UbaWL+KLLDUTS
	 tqtQEGSwz2ap+lSIgYj+fJCiWjgdeXup2y9ZKdcofzjhrOddtfiLhrS2eXimtOceDJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791882991;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QKXIbbzD2bB6L7J6OtpOAIyCpO75uq31lbHJHkWmVdE=;
	b=CiojVY/AHxUjMXJeOKxCHUL7qcDRyi5cUAKIjMVixFWpKtFuRqVeU0hQkZ5qeQQmQizd
	 akhR2sdYAP1FKTPzh/6aYOr4F0azf9mZqDKTE2N9ncv4P/Xl2uH09irRvX21mLvJN+q5f
	 GrXG552/isrMcNwVMawrZrq4Xpy1hakRIHY3r7xGSsCYmNrHBI/6PZepZ+eeG4FPFdzFr
	 bmqpVn/1f1tdVd1YDUI+VbsToEw7ax6fZan2muYbHh6tNbvDCiyFFGC5cyVQOo8GzIy83
	 jjcG+rol4Pgv1AivPKkuTfjcROEdCUYYpEhFdhCaB3mQXckDcu9UBPK6YfscwBL2QcA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791882991;
	bh=QKXIbbzD2bB6L7J6OtpOAIyCpO75uq31lbHJHkWmVdE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lslxpR8GsTAbA+W9aobRiRxOIPpRY+uMY8YJA5DLf0aGb8AK8Pe8q3iIndEbGUMUo
	 ihaM4T927SgHxWOXG01XzRnYLZSDJ0H/fmrQNkG4d6fnJ0akfbilbr9m4FnDMzfhka
	 xp2d9PtlWgjMKsHf3TRuOOPsO+tgMjeD716Ku495IoT5FQmsR89wQtl8+vR1Xyc/Qi
	 gVUi+uoetHWLJSo2qALbe+YTm3sNeofLt6MRNEEAGlG/yVagpnbk7Eb0WR8kKDmoSv
	 8As+L1IvHsEXAB9ftu3bKZAPMd+ngTc9bqKwW5AYS3ovT2+4cJsft3c9IlE8te//Up
	 N1iG6mtWKdrXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EF0F606E1;
	Tue, 13 Oct 2026 09:16:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FD68235
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55BB2606E1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSMv8qdTihQG for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:16:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C7F026060E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791882989;
 b=NZYg2QxBkln50idLtcFxjeqR+4E1xY722p0NXCUMaLRgpaB331IfsdkaUO2zESLRLToO
 vcv/9qcF8H9bQsWq6xlE6toxR1SJ7mizhKuKsrP4CzbOTDtPpTbf3S8/pGIKD4ohniP5A
 AZhjBJG6MXPaSuUe5eyw6AZBOPTZ2kixN3SU97lFCvEossDVgdrGDkhgKhJDcEOv1ZonO
 vxQLXE2K8CzUj61s/Un9LxP2THCIcZbF4PReymsE/u0+waFngTtQDEWBcg8Ep85KJ7RKZ
 ViAo0tSXbyrSMeIm6CDenB9EDhbvrRNwT7RRV73HKyaNK2lLCpDcRTeHtCJijfW9VBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791882989;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=/MKWPppOocbbS6wGGiK8fov2XTTkoonq1fNxEzthiuc=;
 b=Y9Ka/Fv8Frgfji+WMGXb2zjaswi/C4jlXGb2kBuHuJiMIp42Gk1nhGK5Lm9npxPoqK6Z
 ZmaO6nI+J4dr3/arA1SO2zLrHyw/neVtZZtk0pO0oAux6hV04x7cgqG+SORK6L9ChwMnh
 D7qhS6vMWoug/FcfjSo90iaJ4NnFmHG5plVGY4SqGpxs28vwAw4PYmgfPUUYL5OWPJjfy
 qHH5BqLhGVK6XilmRwIdduVlHIGqrLIFUiH2193yz5jGreGgZh39wtmUl5XSGPPRgBMR5
 qSgADRkzGSgt231I1Y7SGmLzU901amFrGuI6Pm8m5rsMHfqWZYjsPYObNUQl2EJM2wg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xNJqnjtv; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7F026060E
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:16:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0B6CCC653DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:17:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8643660362;
 Tue, 13 Oct 2026 09:16:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 872FC11D70CA4; 
 Tue, 13 Oct 2026 11:16:24 +0200 (CEST)
Date: Tue, 13 Oct 2026 11:16:23 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <as32uH-0e7PKayEO@windsurf>
References: <20261013081319.1ADCF95484@busybox.osuosl.org>
 <CAGm1_ksgTJ+hUFmb2QtM7zFT2ZTgCVjOfXf8FUiwmQHKtTTjoA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_ksgTJ+hUFmb2QtM7zFT2ZTgCVjOfXf8FUiwmQHKtTTjoA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [git commit] package/uclibc: add missing sys/auxv.h
 for static builds
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBPY3QgMTMsIDIwMjYgYXQgMTA6MjE6NDhBTSArMDIwMCwgWWVnb3IgWWVmcmVtb3Yg
d3JvdGU6Cj4gV2FsZGVtYXIsIFRob21hcywKPiAKPiBPbiBUdWUsIE9jdCAxMywgMjAyNiBhdCAx
MDoxNOKAr0FNIFRob21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdAo+IDxidWlsZHJvb3RAYnVp
bGRyb290Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gY29tbWl0OiBodHRwczovL2dpdGxhYi5jb20vYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvNDcxZmVhY2IyZDljMTMxOTBkNjM1NzIxMjA4
YjlkMzFlOTk1ZDA0ZQo+ID4gYnJhbmNoOiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9y
Zy9idWlsZHJvb3QvLS90cmVlL21hc3Rlcgo+ID4KPiA+IGdldGF1eHZhbCgpIHdvcmtzIGZpbmUg
Zm9yIHN0YXRpYyBidWlsZHMuIFRoaXMgd2FzIGFscmVhZHkgZml4ZWQKPiA+IGEgd2hpbGUgYWdv
LCBzZWUgdGhlIGNvbW1pdCBtZXNzYWdlIG9mIHRoZSBwYXRjaCBmb3IgbW9yZSBkZXRhaWxzLgo+
IAo+IERvZXMgdGhpcyBtZWFuIHdlIG5vIGxvbmdlciBuZWVkIHRoaXMgZml4Pwo+IAo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9NYmVkLVRMUy9URi1QU0EtQ3J5cHRvL3B1bGwvOTM4CgpJJ2Qgc2F5IGlu
ZGVlZCwgdGhpcyBmaXggaXMgcHJvYmFibHkgbm8gbG9uZ2VyIG5lZWRlZC4KClRob21hcwotLSAK
VGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
