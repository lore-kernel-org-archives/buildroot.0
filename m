Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796CAC48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 13:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C292860A45;
	Sun, 18 Feb 2024 13:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_X4nxpoLnCf; Sun, 18 Feb 2024 13:21:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8482F608E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8482F608E6;
	Sun, 18 Feb 2024 13:21:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B9CD1BF31A
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 13:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18273406E9
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 13:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eh3NA91PaMmr for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 13:20:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 288B4406E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 288B4406E8
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 288B4406E8
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 13:20:56 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-dc742543119so2130538276.0
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 05:20:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708262455; x=1708867255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XtWxM1V4b7flkNz/bmAO+7yprPp04eMk9iN860/OPL0=;
 b=MpW4+weAg/QXsKurGm/g33O9bbHPokecTAiTkmWnDsmtUHeiTTdR+14JaA3i4ZCKif
 dg10seryhTwHMCrL6AB6fQdcMK3mPqk7Vn3Km8vRbaJR3RRcBFyNJlMLAHP/eaBU/PNI
 ib8m0Iym0UnwiB3zsUnxaknx8R7tMPGg4ytPh0GGKpoWCWBdZ4G9AdKFx4a/eFxfQ+z0
 qVg/1a7tvd8obYiYeye6PdB5lp+LABRPxGUOnytSOzp//grnEtxcspv4QkopWxTD/vwL
 ENk+gbULoMQjfh8/SorcIqvrwhlWKE/L6ohCiE9lICvA7hHLeQwxzgzSeWJGpdj/LTNr
 N1Og==
X-Gm-Message-State: AOJu0Yx6oC9Rh6K0MY3QeYEywXmKfDEMlM6OH61pcDjVsvi/f9HsPhSh
 qS7bb9lBf9cPOYhE786CKWxIHm/QWv1+VvyqqAT+mYtcoFTMBaMZ4KhCIoxECNp0T162ZPTmo+6
 0oahok4jm7m1J8LJYJB5CSL7caT+rQG/ou9kP/w==
X-Google-Smtp-Source: AGHT+IHVAECIEcnX1ND2Cp+jWbwo8S5VNoyfrBiHVutWJD+n0d8fQmD+Je0IBKkWzBup7KIoHVRSKkijG8tMtQ/bYuA=
X-Received: by 2002:a5b:748:0:b0:dc2:1dd0:1d1b with SMTP id
 s8-20020a5b0748000000b00dc21dd01d1bmr6500076ybq.19.1708262455608; Sun, 18 Feb
 2024 05:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-7-dario.binacchi@amarulasolutions.com>
 <e4952435ad6c259c9fb2df1cc3086c3d4852590a.camel@gmail.com>
In-Reply-To: <e4952435ad6c259c9fb2df1cc3086c3d4852590a.camel@gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 18 Feb 2024 14:20:44 +0100
Message-ID: <CABGWkvpGLieAz1RzN+CWbJF-5yhEX_+=pBXBpUrE7OWWpwR8Yg@mail.gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708262455; x=1708867255;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XtWxM1V4b7flkNz/bmAO+7yprPp04eMk9iN860/OPL0=;
 b=rHWZ3cArpVd6hVd95YpMpJnwms56rWd+5y8HSrPFa3FYAqDGaJxmz4+jomgdDO1ZWB
 mYWU3f9wHwUIrhCTRxjbulbE3s/TzTJIfrW7u+0S8QsMGD+cGSze+5IGrEaZnWYKu4Y5
 Ay9q/n+F2atrx4YeZXgXtY4xyrublIaTccYg0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rHWZ3cAr
Subject: Re: [Buildroot] [PATCH v4 06/20] boot/ti-k3-core-secdev: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, Anand Gadiyar <gadiyar@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleGFuZGVyLAoKT24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgNjowNuKAr1BNIEFsZXhh
bmRlciBTdmVyZGxpbgo8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBI
ZWxsbyBEYXJpbywKPgo+IE9uIFNhdCwgMjAyNC0wMi0xNyBhdCAxNzowMiArMDEwMCwgRGFyaW8g
QmluYWNjaGkgd3JvdGU6Cj4gPiBUaGlzIGlzIGEgc2VjdXJpdHkgZGV2ZWxvcG1lbnQgcGFja2Fn
ZSBjb250YWluaW5nIHRvb2xzIGZvcgo+ID4gSGlnaC1TZWN1cml0eShIUykgVEkgSzMgcGxhdGZv
cm0gZGV2aWNlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4KPiBhcyBJIHVuZGVyc3RhbmQgc2VjZGV2
IHBhY2thZ2UgaXMgbm90IHJlcXVpcmVkIGZvciBiaW5tYW4tYmFzZWQKPiBVLUJvb3QgZGVwbG95
bWVudHMgc3RhcnRpbmcgZnJvbSB2MjAyMy4xMC4KPgo+IFNvIHdoYXQgaXMgdGhlIHBvaW50IG9m
IGludHJvZHVjaW5nIHRoZSBwYWNrYWdlIG5vdyBpZiB5b3UgdXBkYXRlCj4gVS1Cb290IHRvIHYy
MDI0LjAxPwo+Cj4gSSBiZWxpdmUgaXQncyBhcyBsZWdhY3kgYXMgdGktazMtaW1hZ2UtZ2VuICh3
aGljaCB5b3UgYXJlIGZpeGluZykKPiBidXQgUm9tYWluJ3MgcGF0Y2hzZXQgcmVtb3ZlZCB0aGUg
cGFja2FnZSBhbmQsIHF1aXRlIHN1Y2Nlc3NmdWxseSwKPiBmcm9tIHRoZSBwZXJzcGVjdGl2ZSBv
ZiBidWlsZGluZyBmb3IgSFMgdmFyaWFudHMuCgpUaGUgc2VyaWVzIGlzIGEgY29udGludWF0aW9u
IG9mIHdoYXQgSSBzdWJtaXR0ZWQgZm9yIHRoZSBmaXJzdCB0aW1lIGF0CnRoZSBlbmQgb2YgTm92
ZW1iZXIgd2hlbiBJIHN0aWxsCmRpZG4ndCBrbm93IHRoYXQgQmlubWFuIG1hZGUgaXQgcG9zc2li
bGUgdG8gZG8gd2l0aG91dCBleHRlcm5hbCB0b29scy4KSSBoYXZlbid0IHJlbW92ZWQgaXQganVz
dCB0byBnaXZlCmEgY29tcGxldGUgb3ZlcnZpZXcgb2YgdGhlIHBhdGNoZXMgYXZhaWxhYmxlIGZy
b20gdGhlbiB1bnRpbCBub3cuIEluCnRoZSBuZXh0IHZlcnNpb24sIEkgd2lsbCByZW1vdmUgdGhl
bSwKb3IgcGVyaGFwcywgaW4gdGhlIGV2ZW50IHRoYXQgYSBzaW5nbGUgdmVyc2lvbiB3aXRoIFJv
bWFpbidzIHBhdGNoZXMKaXMgY2hvc2VuLCB0aGV5IHdpbGwgbm90IGJlIHNlbGVjdGVkLgoKVGhh
bmtzIGFuZCByZWdhcmRzLApEYXJpbwoKPgo+ID4gLS0tCj4gPgo+ID4gQ2hhbmdlcyBpbiB2NDoK
PiA+IC0gUmVtb3ZlIHRoZSB0cmFpbGluZyAnLycgYXQgdGhlIGVuZCBvZiB0aGUgdXJsIGluIHRo
ZSBoZWxwIG9mCj4gPiAgIENvbmZpZy5pbgo+ID4gLSBGaXhlZCBsaWNlbnNlIGlzc3Vlcwo+ID4g
LSBVc2UgJChCSU5BUklFU19ESVIpL3RpLWszLWNvcmUtc2VjZGV2IGFzIHRoZSBkaXJlY3Rvcnkg
d2hlcmUgdG8KPiA+ICAgaW5zdGFsbCBmaWxlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJp
byBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiAtLS0K
PiA+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAr
Cj4gPiAgYm9vdC9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEg
Kwo+ID4gIGJvb3QvdGktazMtY29yZS1zZWNkZXYvQ29uZmlnLmluICAgICAgICAgICAgICB8ICA5
ICsrKysrKysrCj4gPiAgYm9vdC90aS1rMy1jb3JlLXNlY2Rldi90aS1rMy1jb3JlLXNlY2Rldi5o
YXNoIHwgIDMgKysrCj4gPiAgYm9vdC90aS1rMy1jb3JlLXNlY2Rldi90aS1rMy1jb3JlLXNlY2Rl
di5tayAgIHwgMjIgKysrKysrKysrKysrKysrKysrKwo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMzYg
aW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWNvcmUtc2Vj
ZGV2L0NvbmZpZy5pbgo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWNvcmUtc2Vj
ZGV2L3RpLWszLWNvcmUtc2VjZGV2Lmhhc2gKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9vdC90
aS1rMy1jb3JlLXNlY2Rldi90aS1rMy1jb3JlLXNlY2Rldi5tawo+ID4KPiA+IGRpZmYgLS1naXQg
YS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+ID4gaW5kZXggMGQxMmMzYWJjYjExLi4zM2Q5OWFi
MjQ0MGYgMTAwNjQ0Cj4gPiAtLS0gYS9ERVZFTE9QRVJTCj4gPiArKysgYi9ERVZFTE9QRVJTCj4g
PiBAQCAtNzUzLDYgKzc1Myw3IEBAIEY6ICAgICAgICBwYWNrYWdlL3hpbmV0ZC8KPiA+ICBOOiAg
IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+
ICBGOiAgIGJvYXJkL2JzaC8KPiA+ICBGOiAgIGJvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9zdG0z
MmY3NjktZGlzY28vCj4gPiArRjogICBib290L3RpLWszLWNvcmUtc2VjZGV2Lwo+ID4gIEY6ICAg
Y29uZmlncy9pbXg4bW5fYnNoX3NtbV9zMl9kZWZjb25maWcKPiA+ICBGOiAgIGNvbmZpZ3MvaW14
OG1uX2JzaF9zbW1fczJfcHJvX2RlZmNvbmZpZwo+ID4gIEY6ICAgY29uZmlncy9zdG0zMmY3Njlf
ZGlzY29fc2RfZGVmY29uZmlnCj4gPiBkaWZmIC0tZ2l0IGEvYm9vdC9Db25maWcuaW4gYi9ib290
L0NvbmZpZy5pbgo+ID4gaW5kZXggZTVmZGY3YWQ0MzllLi4xOGE3ZDI2OGY5NWEgMTAwNjQ0Cj4g
PiAtLS0gYS9ib290L0NvbmZpZy5pbgo+ID4gKysrIGIvYm9vdC9Db25maWcuaW4KPiA+IEBAIC0y
MCw2ICsyMCw3IEBAIHNvdXJjZSAiYm9vdC9zNTAwLWJvb3Rsb2FkZXIvQ29uZmlnLmluIgo+ID4g
IHNvdXJjZSAiYm9vdC9zaGltL0NvbmZpZy5pbiIKPiA+ICBzb3VyY2UgImJvb3Qvc3lzbGludXgv
Q29uZmlnLmluIgo+ID4gIHNvdXJjZSAiYm9vdC90aS1rMy1ib290LWZpcm13YXJlL0NvbmZpZy5p
biIKPiA+ICtzb3VyY2UgImJvb3QvdGktazMtY29yZS1zZWNkZXYvQ29uZmlnLmluIgo+ID4gIHNv
dXJjZSAiYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluIgo+ID4gIHNvdXJjZSAiYm9vdC90
aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluIgo+ID4gIHNvdXJjZSAiYm9vdC91Ym9vdC9Db25maWcu
aW4iCj4gPiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1jb3JlLXNlY2Rldi9Db25maWcuaW4gYi9i
b290L3RpLWszLWNvcmUtc2VjZGV2L0NvbmZpZy5pbgo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjdiNGUyOTYyMDQyCj4gPiAtLS0gL2Rldi9udWxsCj4g
PiArKysgYi9ib290L3RpLWszLWNvcmUtc2VjZGV2L0NvbmZpZy5pbgo+ID4gQEAgLTAsMCArMSw5
IEBACj4gPiArY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfQ09SRV9TRUNERVYKPiA+ICsgICAgIGJv
b2wgInRpLWszLWNvcmUtc2VjZGV2Igo+ID4gKyAgICAgZGVwZW5kcyBvbiBCUjJfYWFyY2g2NAo+
ID4gKyAgICAgaGVscAo+ID4gKyAgICAgICBUaGlzIHBhY2thZ2UgZG93bmxvYWRzIGFuZCBpbnN0
YWxscyBkZXZlbG9wbWVudCB0b29scyBmb3IKPiA+ICsgICAgICAgSGlnaC1TZWN1cml0eShIUykg
VEkgSzMgcGxhdGZvcm1zICh3aGljaCBpbmNsdWRlIEFNNjJ4LAo+ID4gKyAgICAgICBBTTY0eCwg
QU02NXggYW5kIG1vcmUpLgo+ID4gKwo+ID4gKyAgICAgICBodHRwczovL2dpdC50aS5jb20vY2dp
dC9zZWN1cml0eS1kZXZlbG9wbWVudC10b29scy9jb3JlLXNlY2Rldi1rMwo+ID4gZGlmZiAtLWdp
dCBhL2Jvb3QvdGktazMtY29yZS1zZWNkZXYvdGktazMtY29yZS1zZWNkZXYuaGFzaCBiL2Jvb3Qv
dGktazMtY29yZS1zZWNkZXYvdGktazMtY29yZS1zZWNkZXYuaGFzaAo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZTMwNzRhMzk4ZDYyCj4gPiAtLS0gL2Rl
di9udWxsCj4gPiArKysgYi9ib290L3RpLWszLWNvcmUtc2VjZGV2L3RpLWszLWNvcmUtc2VjZGV2
Lmhhc2gKPiA+IEBAIC0wLDAgKzEsMyBAQAo+ID4gKyMgTG9jYWxseSBjYWxjdWxhdGVkCj4gPiAr
c2hhMjU2ICBiNmQzYmNhMGQ1NjFkMDU1YzY4NjljNTU2NGIwNmYyZmIxYjlmNjdlNGVmMTgwYzJi
YWY4YTE0YTZhNmFmYTA2ICBjb3JlLXNlY2Rldi1rMy0wOC4wNi4wMC4wMDcudGFyLnh6Cj4gPiAr
c2hhMjU2ICAzZTVjZjRmNWFiOWYwMzMzZjQ2Y2Q2OGZhYmVkZTNmMjFlNTVkZTFhOWUzYzZhZDY3
M2YyNDFmNDUxNGQ4MzY5ICBtYW5pZmVzdC9rMy1zZWNkZXYtMC4yLW1hbmlmZXN0Lmh0bWwKPiA+
IGRpZmYgLS1naXQgYS9ib290L3RpLWszLWNvcmUtc2VjZGV2L3RpLWszLWNvcmUtc2VjZGV2Lm1r
IGIvYm9vdC90aS1rMy1jb3JlLXNlY2Rldi90aS1rMy1jb3JlLXNlY2Rldi5tawo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjc2NTVhMGZlZmM4Cj4gPiAt
LS0gL2Rldi9udWxsCj4gPiArKysgYi9ib290L3RpLWszLWNvcmUtc2VjZGV2L3RpLWszLWNvcmUt
c2VjZGV2Lm1rCj4gPiBAQCAtMCwwICsxLDIyIEBACj4gPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPiA+ICsjCj4gPiArIyB0aS1rMy1jb3JlLXNlY2Rldgo+ID4gKyMKPiA+ICsjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwo+ID4gKwo+ID4gK1RJX0szX0NPUkVfU0VDREVWX1ZFUlNJT04gPSAwOC4w
Ni4wMC4wMDcKPiA+ICtUSV9LM19DT1JFX1NFQ0RFVl9TSVRFID0gaHR0cHM6Ly9naXQudGkuY29t
L2NnaXQvc2VjdXJpdHktZGV2ZWxvcG1lbnQtdG9vbHMvY29yZS1zZWNkZXYtazMvc25hcHNob3QK
PiA+ICtUSV9LM19DT1JFX1NFQ0RFVl9TT1VSQ0UgPSBjb3JlLXNlY2Rldi1rMy0kKFRJX0szX0NP
UkVfU0VDREVWX1ZFUlNJT04pLnRhci54ego+ID4gK1RJX0szX0NPUkVfU0VDREVWX0lOU1RBTExf
SU1BR0VTID0gWUVTCj4gPiArVElfSzNfQ09SRV9TRUNERVZfTElDRU5TRSA9IEJTRC0zLUNsYXVz
ZQo+ID4gK1RJX0szX0NPUkVfU0VDREVWX0xJQ0VOU0VfRklMRVMgPSBtYW5pZmVzdC9rMy1zZWNk
ZXYtMC4yLW1hbmlmZXN0Lmh0bWwKPiA+ICsKPiA+ICtUSV9LM19DT1JFX1NFQ0RFVl9JTlNUQUxM
X0RJUiA9ICQoQklOQVJJRVNfRElSKS90aS1rMy1jb3JlLXNlY2Rldgo+ID4gKwo+ID4gK2RlZmlu
ZSBUSV9LM19DT1JFX1NFQ0RFVl9JTlNUQUxMX0lNQUdFU19DTURTCj4gPiArICAgICBta2RpciAt
cCAkKFRJX0szX0NPUkVfU0VDREVWX0lOU1RBTExfRElSKQo+ID4gKyAgICAgY3AgLWRwZnIgJChA
RCkva2V5cyAkKFRJX0szX0NPUkVfU0VDREVWX0lOU1RBTExfRElSKS8KPiA+ICsgICAgIGNwIC1k
cGZyICQoQEQpL3NjcmlwdHMgJChUSV9LM19DT1JFX1NFQ0RFVl9JTlNUQUxMX0RJUikvCj4gPiAr
ZW5kZWYKPiA+ICsKPiA+ICskKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQo+Cj4gLS0KPiBBbGV4
YW5kZXIgU3ZlcmRsaW4uCj4KCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQg
TGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoK
VmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQy
IDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25z
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
