Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4606BC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EC6582C98;
	Fri,  2 May 2025 10:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMQKA58RfEoy; Fri,  2 May 2025 10:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 160E281778
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 160E281778;
	Fri,  2 May 2025 10:57:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33441EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19383606CB
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76SooojIo9QJ for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:57:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E7426074F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E7426074F
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E7426074F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:57:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 072E61C0F8A; Fri,  2 May 2025 12:57:51 +0200 (CEST)
Message-ID: <91ec0dca-53da-4f10-8fec-83228fad1b5f@rnout.be>
Date: Fri, 2 May 2025 12:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20250414170922.1230348-1-raphael.melotte@mind.be>
 <20250414171433.1233576-1-raphael.melotte@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250414171433.1233576-1-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183471; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4o3BEigUUDEmo7uoco3O+PMbkBUY4uYYbZ/BywEAMPQ=;
 b=Mxwm8zNvDDIE4g9B6GWCoPCWMGd/0wHIP5Ogw5+0zVrvoTNcMv1Mkf9fM4+jSyNiMjbwcA
 xoAi05uhDC1G+T+BvNEMofvDDlML/SEVYWgHVyQG2hzlxz5JXPoIJtX4U58je29eyfqPqj
 TLNYpERotCXX3DfZDO2X5weBgIvtB3e4zrElH36AjIcfeZGsClqiYguMNDowyEvB3myhDt
 gxc9EyJyP54yLYArTNnpZNpkdk02kVqALSR/upaG7DL+Wow5t3e7TvwiHA1NGbTiImvT31
 0YsbHdTVXcsPhE2504g5tg5Cwjis+2ZEb11Kl1vu4ewpeLGXzOxuZpq4u+R4FA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Mxwm8zNv
Subject: Re: [Buildroot] [PATCH v2 1/2] support/testing: add new test for
 python-urllib3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC8wNC8yMDI1IDE5OjE0LCBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IHdy
b3RlOgo+IEltcG9ydGluZyB1cmxsaWIzIGFscmVhZHkgYWxsb3dzIHVzIHRvIGNoZWNrIHRoYXQg
Zm9yIGV4YW1wbGUgemxpYiBjYW4KPiBiZSBsb2FkZWQgYXQgcnVudGltZS4KPiAKPiBGb3IgZ29v
ZCBtZWFzdXJlLCBhbHNvIGNyZWF0ZSB0aGUgUG9vbE1hbmFnZXIgb2JqZWN0IG1lbnRpb25lZCBp
biB0aGUKPiB1c2VyIGd1aWRlIChbMV0pLCBhbmQgY2hlY2sgdGhhdCB3ZSBjYW4gbm9ybWFsaXpl
IGEgVVJMIGxpa2UgaXQgaXMKPiBkb25lIGluIHVybGxpYjMncyAndGVzdC90ZXN0X3V0aWwucHkn
Lgo+IAo+IFsxXTogaHR0cHM6Ly91cmxsaWIzLnJlYWR0aGVkb2NzLmlvL2VuL3N0YWJsZS91c2Vy
LWd1aWRlLmh0bWwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFl
bC5tZWxvdHRlQG1pbmQuYmU+CgogIEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0aGFua3MuCgogIFJl
Z2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gICAgICAtIHJlbW92
ZSB1bnVzZWQgaW1wb3J0Lgo+IC0tLQo+ICAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCj4gICAuLi4vdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3NhbXBsZV9weXRob25fdXJsbGliMy5weSAgIHwgIDkgKysrKysrKysrCj4gICBzdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl91cmxsaWIzLnB5IHwgMTIgKysrKysr
KysrKysrCj4gICAzIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3Vy
bGxpYjMucHkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X3B5dGhvbl91cmxsaWIzLnB5Cj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMg
Yi9ERVZFTE9QRVJTCj4gaW5kZXggMGQ3ODQxZWI5NC4uNTU0YzE4OTg0NiAxMDA2NDQKPiAtLS0g
YS9ERVZFTE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0yODE3LDEyICsyODE3LDE0IEBA
IEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fcnNhLnB5Cj4g
ICBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3MzdHJhbnNm
ZXIucHkKPiAgIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25f
c2RidXMucHkKPiAgIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRo
b25fc2RidXNfbmV0d29ya21hbmFnZXIucHkKPiArRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2Uvc2FtcGxlX3B5dGhvbl91cmxsaWIzLnB5Cj4gICBGOglzdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X3B5dGhvbl9qbWVzcGF0aC5weQo+ICAgRjoJc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fcHltdXBkZi5weQo+ICAgRjoJc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fcnNhLnB5Cj4gICBGOglzdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zM3RyYW5zZmVyLnB5Cj4gICBGOglzdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zZGJ1cy5weQo+ICAgRjoJc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fc2RidXNfbmV0d29ya21hbmFnZXIu
cHkKPiArRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fdXJsbGli
My5weQo+ICAgCj4gICBOOglSYXBoYWVsIFBhdmxpZGlzIDxyYXBoYWVsLnBhdmxpZGlzQGdtYWls
LmNvbT4KPiAgIEY6CXBhY2thZ2UvbnZpZGlhLXBlcnNpc3RlbmNlZC8KPiBkaWZmIC0tZ2l0IGEv
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl91cmxsaWIzLnB5IGIv
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl91cmxsaWIzLnB5Cj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi45ZTBjZjhjMTdhCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9w
eXRob25fdXJsbGliMy5weQo+IEBAIC0wLDAgKzEsOSBAQAo+ICsjIENoZWNrIHRoYXQgd2UgY2Fu
IGltcG9ydCB1cmxsaWIzIGV2ZW4gaWYgd2UgZG9uJ3QgdXNlIGFsbCBvZiBpdDoKPiAraW1wb3J0
IHVybGxpYjMKPiArCj4gKyMgSnVzdCBjaGVjayB0aGF0IHdlIGNhbiBjcmVhdGUgYSBQb29sTWFu
YWdlcjoKPiAraHR0cCA9IHVybGxpYjMuUG9vbE1hbmFnZXIoKQo+ICsKPiArIyBDaGVjayBpZiB3
ZSBjYW4gbm9ybWFsaXplIFVSTHM6Cj4gK2Fzc2VydCB1cmxsaWIzLnV0aWwudXJsLnBhcnNlX3Vy
bCgiSFRUUFM6Ly9FeGFtcGxlLkNvbS8/S2V5PVZhbHVlIikudXJsIFwKPiArICAgID09ICJodHRw
czovL2V4YW1wbGUuY29tLz9LZXk9VmFsdWUiCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3VybGxpYjMucHkgYi9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl91cmxsaWIzLnB5Cj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwLi41NGE5NGQ1ZTY1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3VybGxpYjMucHkKPiBA
QCAtMCwwICsxLDEyIEBACj4gK2Zyb20gdGVzdHMucGFja2FnZS50ZXN0X3B5dGhvbiBpbXBvcnQg
VGVzdFB5dGhvblBhY2thZ2VCYXNlCj4gKwo+ICsKPiArY2xhc3MgVGVzdFB5dGhvblB5M1VybGxp
YjMoVGVzdFB5dGhvblBhY2thZ2VCYXNlKToKPiArICAgIF9fdGVzdF9fID0gVHJ1ZQo+ICsgICAg
Y29uZmlnID0gVGVzdFB5dGhvblBhY2thZ2VCYXNlLmNvbmZpZyArIFwKPiArICAgICAgICAiIiIK
PiArICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkKPiArICAgICAgICBCUjJfUEFDS0FHRV9Q
WVRIT05fVVJMTElCMz15Cj4gKyAgICAgICAgIiIiCj4gKyAgICBzYW1wbGVfc2NyaXB0cyA9IFsi
dGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3VybGxpYjMucHkiXQo+ICsgICAgdGltZW91dCA9
IDIwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
