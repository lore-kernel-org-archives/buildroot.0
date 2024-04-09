Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40E0C67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 21:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD0181BC2;
	Tue,  9 Apr 2024 21:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuVJLBs7WbyG; Tue,  9 Apr 2024 21:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFCD781BCB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFCD781BCB;
	Tue,  9 Apr 2024 21:17:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0987B1BF299
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAAEB4025D
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9CdpBGVA9IM for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 21:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AB96415C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AB96415C3
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AB96415C3
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 21:17:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-343e7c20686so3372098f8f.1
 for <buildroot@buildroot.org>; Tue, 09 Apr 2024 14:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712697429; x=1713302229;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AAI6UeUtt+pBnzHMgh8z6UHnYVYphbHHovz4QeYfIh0=;
 b=YLthOCWpIvDOyjwUEhqjkcYilriwd5F3/0DBXZLAy4vA70QcnyhFOc4A4HVm6ipnoa
 V6AQ+ntOnFyS9OoMvXbAkk0s1qrnLqytsnplbUMtVRoHoQ7SndEg4W6kFaWttZvWHBo+
 jfV2JN2eKjGEh0DluZ/okoeW4b0rJ+7BwEMa+qevDhv1lZgTp/D2hPs2fvUYm+HkyMrt
 5CErDDoZ5iW7QEvvP13g9ZFfZTX3VD0wc4PNgCC3jBGF8sPIHM16UmpfDoFK3+9V4dJT
 Heni99yCBZm9/mfd0qedwvXNIZJWqZhiu37XrAceh7BVZ9cux9vZKQNqFbldObKLIyYH
 IKMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVEb2yLr7KYgp1ap7nkVklzplxLCJwURNg1Ouepp5MDSQ7LhjWmttAKmi+NtQQC2JHEXY73pxJT/eIfKEa82PN1TsgFvYfkQ==
X-Gm-Message-State: AOJu0YyZ7HpjwYzTJnZk3LRoPugmuY/pcUnBIr0HsMToA+lZI7AaU2VC
 7STsG6cBamIvutf1n4OmtBehr0kZUdlrYYVLlihdQCoeZJg3gmLOfCWkNw6iouA=
X-Google-Smtp-Source: AGHT+IGgrMx/0/Ub/aAA2KUmaPlIzHkMvHKkl2a+18eDHAMFqCAepUEegmYkgb7+GDRsvPbtr1D+sA==
X-Received: by 2002:adf:f388:0:b0:342:cd0b:ddac with SMTP id
 m8-20020adff388000000b00342cd0bddacmr576744wro.10.1712697429051; 
 Tue, 09 Apr 2024 14:17:09 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfce92000000b00343d1d09550sm12372991wrn.60.2024.04.09.14.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 14:17:08 -0700 (PDT)
Message-ID: <0ea49f2c-fe1e-4a44-aaf8-90120ef6f9fd@smile.fr>
Date: Tue, 9 Apr 2024 23:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Andreas Dannenberg <dannenberg@ti.com>, Bryan Brattlof <bb@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Michael Walle <mwalle@kernel.org>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <58478029-3c92-497e-bb31-4a1f1119afd4@mind.be>
 <1ec8e03b-f5b7-41cf-bfe4-17f99a871e93@mind.be>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <1ec8e03b-f5b7-41cf-bfe4-17f99a871e93@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712697429; x=1713302229;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AAI6UeUtt+pBnzHMgh8z6UHnYVYphbHHovz4QeYfIh0=;
 b=JYtKokvovfUw26iPDAZPXONXC6StbKetGXnjg/L2Pk//9kR2NXIJhlyfPyg2g8i26n
 cFZdFc7HMANXOURJ54aygwXD9e/yIceYmjSkIYy4BaDYT31YwnXxtghMEJKRi8oeGV7s
 I9zNx+IDtqsJ1lw9GLjiI6ulMyLoancN6gUCKx2obHsnS0ImI3ZUR3UrJIgsvFENbu8o
 N4jQXDzq1oIHkWAWllHwexDbLxJQzhEtwE1A45qIKqr8fa9wmeCOW/C3bCzIABlwonZm
 h9JE3dUf8HqN38lOITslFX/UZtLBjlYWHSkUh/ejj/cd4aPMFtG5HNhITcL3KnHNfejE
 YMkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=JYtKokvo
Subject: Re: [Buildroot] [PATCH v12 00/16] Add support for AM62x-SK HS-FS
 devices
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
Cc: =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LCBBbGwsCgpMZSAwOC8wNC8yMDI0IMOgIDE1OjQ3LCBBcm5vdXQgVmFuZGVj
YXBwZWxsZSBhIMOpY3JpdMKgOgo+IAo+IE9uIDA3LzA0LzIwMjQgMjI6MzAsIEFybm91dCBWYW5k
ZWNhcHBlbGxlIHdyb3RlOgo+Pgo+Pgo+PiBPbiAwNy8wNC8yMDI0IDEyOjM0LCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4+PiBUaGlzIHNlcmllcyBhaW1zIGluaXRpYWxseSB0byBmaXggQU02MngtU0sg
SFMtRlMgZGV2aWNlcyBidXQgZG9pbmcgc28KPj4+IHdvdWxkIHJlcXVpcmVzIGFkZGluZyBhIFRJ
IGxlZ2FjeSB0b29sICJ0aS1rMy1jb3JlLXNlY2RldiIgaW50byBCdWlsZHJvb3QuCj4+PiB0aS1r
My1jb3JlLXNlY2RldiBpcyByZXBsYWNlZCBieSB1LWJvb3QncyBiaW5tYW4gdG9vbCBzaW5jZSB2
MjAyMy4xMCByZWxlYXNlCj4+PiBvZiB1LWJvb3QuCj4+Pgo+Pj4gSW5zdGVhZCwgd2UgYnVtcCB0
aGUgQlNQIHRvIHVzZSB0aGUgbGF0ZXN0IHUtYm9vdCByZWxlYXNlICgyMDI0LjAxKSB0byB1c2UK
Pj4+IGJpbm1hbi4gRG9pbmcgc28gcmVxdWlyZXMgdG8gcmV3b3JrIHRoZSBUSSBLMyBTb0Mgc3Vw
cG9ydCBpbiBCdWlsZHJvb3QuCj4+Pgo+Pj4gVGhpcyBuZXcgdmVyc2lvbiAodjEyKSBvZiB0aGlz
IHNlcmllcyByZW1vdmUgdGhlIHRpLWszIHBhY2thZ2UgYW5kCj4+PiBhbGwgU09DIGFuZCBTRUNU
WVBFIG9wdGlvbnMuIEFzIHN1Z2dlc3RlZCBieSBNaWNoYWVsIFdhbGxlLCBjb3B5IHRoZQo+Pj4g
ZGVmYXVsdCB0aWJvb3QzLmJpbiBhbmQgc3lzZncuaXRiIChpZiBhbnkpIGlmIG5vIGN1c3RvbSBm
aWxlIG5hbWUgaXMKPj4+IHByb3ZpZGVkIG9uIHRoZSBkZWZjb25maWcuIFNpbmNlIHN1Y2ggZmls
ZSBuYW1lIGNhbiBiZSBjdXN0b21pemVkLAo+Pj4gdGhlIHVzZXIgbXVzdCBwcm92aWRlIHRoZSBj
b21wbGV0ZSBmaXJtd2FyZSBuYW1lIGlmIG5vdCB1c2luZyB0aGUKPj4+IGRlZmF1bHQgb25lLgo+
Pj4KPj4+IGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjQt
QXByaWwvNjg4OTQzLmh0bWwKPj4+Cj4+PiBXaXRoIHRoZSBhZHZpY2Ugb2YgQW5kcmVhcyBEYW5u
ZW5iZXJnIChUSSBLMyBhcmNoaXRlY3QpLCB3ZSBzd2l0Y2gKPj4+IEFNNjJ4L0FNNjJBeC9BTTY0
eCB0byBIUy1GUyBieSBkZWZhdWx0Lgo+Pj4KPj4+IFRlc3RzIHBlcmZvcm1lZCBvbiBlYXJsaWVy
IHJldmlzaW9uIG9mIHRoaXMgc2VyaWVzOgo+Pj4KPj4+ICogY29tcGlsZWQgdGlfYW02Mnhfc2tf
ZGVmY29uZmlnCj4+PiDCoMKgICogc3VjY2Vzcwo+Pj4gKiBib290ZWQgb24gQU02MnggU0sgRVZN
IChFMykKPj4+IMKgwqAgKiBzdWNjZXNzCj4+PiDCoMKgICogbm8gb2J2aW91cyBlcnJvcnMgaW4g
ZG1lc2cKPj4+Cj4+PiBUZXN0ZWQtYnk6IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8uc2Nod2Flcmlj
a2VAZ3JhbmRjZW50cml4Lm5ldD4KPj4+Cj4+PiBEYXJpbyBCaW5hY2NoaSAoMTApOgo+Pj4gwqDC
oCBib290L3RpLWszLXI1LWxvYWRlcjogZHJvcCBoYXNoIGZvciB2ZXJzaW9uIDIwMjIuMTAKPj4+
IMKgwqAgYm9vdC90aS1rMy1yNS1sb2FkZXI6IGFkZCBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURF
Ul9VU0VfQklOTUFOIG9wdGlvbgo+Pj4gwqDCoCBib290L3Vib290OiBhZGQgQlIyX1RBUkdFVF9V
Qk9PVF9VU0VfQklOTUFOIG9wdGlvbgo+Pj4gwqDCoCBib290L3RpLWszLXI1LWxvYWRlcjogaW5z
dGFsbCB0aWJvb3QzLmJpbiBhbmQgc3lzZncuaXRiIHRvCj4+PiDCoMKgwqDCoCBCSU5BUklFU19E
SVIKPj4+IMKgwqAgY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWc6IGJ1bXAgVS1Cb290IHZl
cnNpb24gdG8gMjAyNC4wMQo+Pj4gwqDCoCBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZzog
YnVtcCBMaW51eCB2ZXJzaW9uIHRvIDYuNi4xOAo+Pj4gwqDCoCBib2FyZC90aS9hbTYyeC1zazog
Z2VuZXJhbGl6ZSBwb3N0LWJ1aWxkLnNoCj4+PiDCoMKgIGJvYXJkL3RpL2FtNjJ4LXNrOiBtb3Zl
IHBvc3QtYnVpbGQuc2ggdG8gYm9hcmQvdGkvY29tbW9uL2FtNnh4Cj4+PiDCoMKgIGNvbmZpZ3Mv
dGlfYW02NHhfc2tfZGVmY29uZmlnOiBidW1wIFUtQm9vdCB2ZXJzaW9uIHRvIDIwMjQuMDEKPj4+
IMKgwqAgY29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWc6IGJ1bXAgTGludXggdmVyc2lvbiB0
byA2LjYuMTgKPj4+Cj4+PiBSb21haW4gTmFvdXIgKDYpOgo+Pj4gwqDCoCBib2FyZC90aS9hbTZ7
Miw0fXgtc2s6IGFkZCBhcm0tdHJ1c3RlZC1maXJtd2FyZSB2Mi43IGhhc2gKPj4+IMKgwqAgYm9v
dC91Ym9vdDogcmVuYW1lIFRJX0szX0RNIG9wdGlvbiB0byBjb3ZlciBmdXJ0aGVyIFRJIEszIFNv
Q3Mgc3VwcG9ydAo+Pj4gwqDCoCBib290L3Vib290OiByZW1vdmUgQlIyX1RBUkdFVF9VQk9PVF9U
SV9LM19ETV9TT0NOQU1FCj4+PiDCoMKgIGJvb3QvdGktazMtaW1hZ2UtZ2VuOiByZW1vdmUgcGFj
a2FnZQo+Pj4gwqDCoCBib290L3RpLWszLXI1LWxvYWRlcjogcmVtb3ZlIEJSMl9UQVJHRVRfVElf
SzNfUjVfTE9BREVSX1VTRV9CSU5NQU4KPj4+IMKgwqAgcGFja2FnZS90aS1rMzogc3dpdGNoIEFN
NjJ4L0FNNjJBeC9BTTY0eCB0byBIUy1GUyBieSBkZWZhdWx0Cj4+Cj4+IMKgUGF0Y2hlcyAxLTUg
YXBwbGllZCB0byBtYXN0ZXIuIEFuZCB0aGVyZSBJIHN0b3BwZWQsIGR1ZSB0byB0aGUgU1dTRlcg
dHlwby4gSQo+PiBjb3VsZCBoYXZlIGZpeGVkIGl0IHVwIG15c2VsZiBidXQgaXQncyByZWFsbHkg
ZXZlcnkgcGF0Y2ggdGhhdCBuZWVkcyB0byBiZQo+PiB1cGRhdGVkLi4uCj4gCj4gCj4gwqBJIGFs
c28gcmV2aWV3ZWQgdGhlIHJlc3Qgb2YgdGhlIHNlcmllcyB3aXRoIG1pbm9yIGNvbW1lbnRzLCBz
byB5b3UgY2FuIGFwcGx5Cj4gdGhlbSBkaXJlY3RseSAod2l0aCBteSBSZXZpZXdlZC1ieTogQXJu
b3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPikKClRoYW5rcywgdGhlIHNlcmllcyBp
cyBtZXJnZWQuCgpUaGFua3MgdG8gRGFyaW8gYW5kIE1pY2hhZWwgZm9yIHRoZSBpbml0aWFsIHdv
cmsgb24gdGhlIEhTLUZTIHRvcGljIQoKVGhlIGluaXRpYWwgc2VyaWVzIHNob3dlZCB0aGF0IGl0
IHdhcyBuZWNlc3NhcnkgdG8gcmV3b3JrIGhlYXZpbHkgdGhlIFRJIEszIFNvQwpyZWxhdGVkIHBh
Y2thZ2VzIGluIEJ1aWxkcm9vdC4gVGhpcyB3YXMgdGhlIG9wcG9ydGluaXR5IHRvIGFudGljaXBh
dGUgb24gdGhlCmFkZGl0aW9uIG9mIG5ldyBUSSBLMyBTb0Mgc3VwcG9ydC4KClRoYW5rcyB0byBB
bmRyZWFzIGFuZCBCcnlhbiBmcm9tIFRJIGZvciB0aGUgcmV2aWV3IGFuZCBmaW5lIGRldGFpbHMg
YWJvdXQgVEkgSzMKU29DIGZhbWlsbHkgYW5kIHRoZSBydW50aW1lIHRlc3RpbmcuCgpUaGFua3Mg
dG8gYWxsIHRlc3RlcnMgYW5kIHJldmlld2Vycy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+
IAo+IMKgUmVnYXJkcywKPiDCoEFybm91dAo+IAo+IAo+Pgo+Pgo+PiDCoFJlZ2FyZHMsCj4+IMKg
QXJub3V0Cj4+Cj4+Pgo+Pj4gwqAgQ29uZmlnLmluLmxlZ2FjecKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNSArKysrCj4+PiDCoCBE
RVZFTE9QRVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiAtCj4+PiDCoCBib2FyZC90aS9hbTYyeC1zay9n
ZW5pbWFnZS5jZmfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDcgKy0KPj4+IMKg
IC4uLi9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDIgKwo+Pj4gwqAgLi4uL3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFk
ZXJzLmhhc2jCoCB8wqAgMSArCj4+PiDCoCBib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL2xpbnV4
L2xpbnV4Lmhhc2jCoMKgwqAgfMKgIDIgKwo+Pj4gwqAgLi4uL3RpLWszLXI1LWxvYWRlci90aS1r
My1yNS1sb2FkZXIuaGFzaMKgwqDCoMKgwqAgfMKgIDIgKwo+Pj4gwqAgYm9hcmQvdGkvYW02NHgt
c2svZ2VuaW1hZ2UuY2ZnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA3ICstCj4+
PiDCoCAuLi4vYXJtLXRydXN0ZWQtZmlybXdhcmUuaGFzaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAyICsKPj4+IMKgIC4uLi9wYXRjaGVzL2xpbnV4LWhlYWRlcnMvbGludXgt
aGVhZGVycy5oYXNowqAgfMKgIDEgKwo+Pj4gwqAgYm9hcmQvdGkvYW02NHgtc2svcGF0Y2hlcy9s
aW51eC9saW51eC5oYXNowqDCoMKgIHzCoCAyICsKPj4+IMKgIC4uLi90aS1rMy1yNS1sb2FkZXIv
dGktazMtcjUtbG9hZGVyLmhhc2jCoMKgwqDCoMKgIHzCoCAxICsKPj4+IMKgIGJvYXJkL3RpL2Nv
bW1vbi9hbTZ4eC9wb3N0LWJ1aWxkLnNowqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA1OCArKysrKysr
KysrKysrKwo+Pj4gwqAgYm9vdC9Db25maWcuaW7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSAtCj4+PiDCoCBib290L3Rp
LWszLWltYWdlLWdlbi9Db25maWcuaW7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA3
NyAtLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiDCoCBib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1p
bWFnZS1nZW4uaGFzaMKgwqDCoMKgIHzCoCAzIC0KPj4+IMKgIGJvb3QvdGktazMtaW1hZ2UtZ2Vu
L3RpLWszLWltYWdlLWdlbi5ta8KgwqDCoMKgwqDCoCB8IDU0IC0tLS0tLS0tLS0tLS0KPj4+IMKg
IGJvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDMzICsrKysrKysrCj4+PiDCoCBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1s
b2FkZXIuaGFzaMKgwqDCoMKgIHzCoCAxIC0KPj4+IMKgIGJvb3QvdGktazMtcjUtbG9hZGVyL3Rp
LWszLXI1LWxvYWRlci5ta8KgwqDCoMKgwqDCoCB8IDQwICsrKysrKysrKy0KPj4+IMKgIGJvb3Qv
dWJvb3QvQ29uZmlnLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCAzNSArKysrKy0tLS0KPj4+IMKgIGJvb3QvdWJvb3QvdWJvb3QubWvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTIgKystCj4+
PiDCoCBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMjEgKystLS0KPj4+IMKgIGNvbmZpZ3MvdGlfYW02NHhfc2tfZGVmY29uZmln
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyMCArKystLQo+Pj4gwqAgMjQgZmls
ZXMgY2hhbmdlZCwgMjIxIGluc2VydGlvbnMoKyksIDE3OCBkZWxldGlvbnMoLSkKPj4+IMKgIGNy
ZWF0ZSBtb2RlIDEwMDY0NAo+Pj4gYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy9hcm0tdHJ1c3Rl
ZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoCj4+PiDCoCBjcmVhdGUgbW9kZSAx
MjAwMDAgYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhlYWRl
cnMuaGFzaAo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjJ4LXNrL3BhdGNo
ZXMvbGludXgvbGludXguaGFzaAo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4+PiBib2FyZC90
aS9hbTYyeC1zay9wYXRjaGVzL3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaAo+
Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4+PiBib2FyZC90aS9hbTY0eC1zay9wYXRjaGVzL2Fy
bS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2gKPj4+IMKgIGNyZWF0
ZSBtb2RlIDEyMDAwMCBib2FyZC90aS9hbTY0eC1zay9wYXRjaGVzL2xpbnV4LWhlYWRlcnMvbGlu
dXgtaGVhZGVycy5oYXNoCj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvdGkvYW02NHgt
c2svcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQKPj4+
IGJvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRl
ci5oYXNoCj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA3NTUgYm9hcmQvdGkvY29tbW9uL2FtNnh4L3Bv
c3QtYnVpbGQuc2gKPj4+IMKgIGRlbGV0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWltYWdlLWdl
bi9Db25maWcuaW4KPj4+IMKgIGRlbGV0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWltYWdlLWdl
bi90aS1rMy1pbWFnZS1nZW4uaGFzaAo+Pj4gwqAgZGVsZXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGkt
azMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tawo+Pj4KPj4+IC0twqAKPj4+IDIuNDQuMAo+
Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+Pj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
