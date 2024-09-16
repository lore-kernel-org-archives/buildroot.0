Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304ADC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 11:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9322240B3B;
	Mon, 16 Sep 2024 11:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDJZdzLpgobv; Mon, 16 Sep 2024 11:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C77640B3A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C77640B3A;
	Mon, 16 Sep 2024 11:31:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5D9C1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EDA0403DE
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQdmfacvjj0M for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 11:31:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30A33403D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30A33403D6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30A33403D6
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 11:31:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.102.118])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A8A612003E8;
 Mon, 16 Sep 2024 13:30:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 13:30:56 +0200
Date: Mon, 16 Sep 2024 13:30:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <ZugW8GmgdWxAelIF@landeda>
References: <20240705091409.3370272-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240705091409.3370272-1-raphael.melotte@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726486264;
 bh=y0OdWpqXahIBMVLBcQo/KensrLx5m93b/4tuWx4olAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y+RuMqU5Vl4pXe9pEAkwDxzvVH87D5AMOdpqha08eArbf2o4MwCkUT0d8ROH8PL+e
 Md7H4RYB0nA7/gq7/S/ZPxA4G7dEf43PSag1rSFdfi7nzW9JjNmhLePRFGLW0qS7aQ
 M+fQE5mYOBDhKVNbW4UbDevZ+hBS8d+zlAFLOlHoCR6IlVitjieBX2RlcI3iUe7CX0
 4In1zdXPb6WcYXRciLGIhBIh4JRMOMmaXDJhXvXPcq3iRDJuhT1o9/QswsADPQpbzJ
 xx6HnFnM1HkD/ggJQY1LzADuVKAlGtQoQVz7VeMpoLF9/BvSM8kGX6f4hraxLuI5F6
 cO41moEnAVRPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y+RuMqU5
Subject: Re: [Buildroot] [PATCH v2 1/4] package/python-sdbus: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmFwaGHDq2wsIEFsbCwKCk9uIDIwMjQtMDctMDUgMTE6MTQgKzAyMDAsIFJhcGhhw6tsIE3DqWxv
dHRlIHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6ts
IE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KClNlcmllcyBvZiA0IHBhdGNoZXMg
YXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0t
LQo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gICAtIEZpeCBsaWNlbnNlLgo+ICAgLSBBZGQgY29tbWVu
dCB3aGVuIHN5c3RlbWQgaXMgbm90IGF2YWlsYWJsZS4KPiAKPiAgREVWRUxPUEVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL3B5dGhvbi1zZGJ1cy9Db25maWcuaW4gICAg
ICAgICB8IDExICsrKysrKysrKysrCj4gIHBhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1
cy5oYXNoIHwgIDUgKysrKysKPiAgcGFja2FnZS9weXRob24tc2RidXMvcHl0aG9uLXNkYnVzLm1r
ICAgfCAxOSArKysrKysrKysrKysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0
aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tc2RidXMvQ29uZmln
LmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2Ri
dXMuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tc2RidXMvcHl0aG9u
LXNkYnVzLm1rCj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5k
ZXggOGE1Y2NlYmE3OC4uMGQ1OGRmN2Q1MCAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysr
IGIvREVWRUxPUEVSUwo+IEBAIC0yNjY4LDYgKzI2NjgsNyBAQCBGOglwYWNrYWdlL3B5dGhvbi1q
bWVzcGF0aC8KPiAgRjoJcGFja2FnZS9weXRob24tcHltdXBkZi8KPiAgRjoJcGFja2FnZS9weXRo
b24tcnNhLwo+ICBGOglwYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVyLwo+ICtGOglwYWNrYWdlL3B5
dGhvbi1zZGJ1cy8KPiAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5
dGhvbl9qbWVzcGF0aC5weQo+ICBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1w
bGVfcHl0aG9uX3JzYS5weQo+ICBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1w
bGVfcHl0aG9uX3MzdHJhbnNmZXIucHkKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4g
Yi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IDU1MGZkYzFmNDEuLjQ1ZDhhOGM3ZWMgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBA
IC0xMzM0LDYgKzEzMzQsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9kdWxlcyIKPiAgCXNv
dXJjZSAicGFja2FnZS9weXRob24tc2NhcHkvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdl
L3B5dGhvbi1zY2hlZHVsZS9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXNj
aXB5L0NvbmZpZy5pbiIKPiArCXNvdXJjZSAicGFja2FnZS9weXRob24tc2RidXMvQ29uZmlnLmlu
Igo+ICAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1zZG5vdGlmeS9Db25maWcuaW4iCj4gIAlzb3Vy
Y2UgInBhY2thZ2UvcHl0aG9uLXNlY3JldHN0b3JhZ2UvQ29uZmlnLmluIgo+ICAJc291cmNlICJw
YWNrYWdlL3B5dGhvbi1zZWUvQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhv
bi1zZGJ1cy9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1zZGJ1cy9Db25maWcuaW4KPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmIyZDM5OTBhYjQKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvcGFja2FnZS9weXRob24tc2RidXMvQ29uZmlnLmluCj4gQEAgLTAsMCAr
MSwxMSBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX1NEQlVTCj4gKwlib29sICJweXRo
b24tc2RidXMiCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1NZU1RFTUQgIyByZXF1aXJlZCB0
byBnZXQgc2QtYnVzCj4gKwloZWxwCj4gKwkgIE1vZGVybiBQeXRob24gRC1CdXMgbGlicmFyeS4g
QmFzZWQgb24gc2QtYnVzIGZyb20KPiArCSAgbGlic3lzdGVtZC4KPiArCj4gKwkgIGh0dHBzOi8v
Z2l0aHViLmNvbS9pZ285NTg2Mi9weXRob24tc2RidXMKPiArCj4gK2NvbW1lbnQgInB5dGhvbi1z
ZGJ1cyBuZWVkcyBzeXN0ZW1kIgo+ICsJZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfU1lTVEVNRAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMuaGFzaCBiL3Bh
Y2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cy5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4xM2M4YzJiYjVmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3BhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cy5oYXNoCj4gQEAgLTAsMCArMSw1IEBA
Cj4gKyMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvc2RidXMvanNvbgo+
ICttZDUgIDQ2ZDNlYTAwYTQ5MWMyZWVjMmEyNWNjZjYxYjhhNzdhICBzZGJ1cy0wLjEyLjAudGFy
Lmd6Cj4gK3NoYTI1NiAgYzM2OTJkNzU3MDQ0MzhhNzhhZGMxNDM5MzUwYmMzMmYzMGQ2YjM4YWQz
NDRjZmM5NDc3M2RiODljNmNlNGE4OSAgc2RidXMtMC4xMi4wLnRhci5nego+ICsjIExvY2FsbHkg
Y29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+ICtzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJj
ZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIENPUFlJTkcKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc2RidXMvcHl0aG9uLXNkYnVzLm1rIGIvcGFja2Fn
ZS9weXRob24tc2RidXMvcHl0aG9uLXNkYnVzLm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwLi4wYjNlYTM3YjMwCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2th
Z2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cy5tawo+IEBAIC0wLDAgKzEsMTkgQEAKPiArIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIHB5dGhvbi1zZGJ1cwo+ICsjCj4gKyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtQWVRIT05fU0RCVVNfVkVSU0lPTiA9IDAuMTIuMAo+
ICtQWVRIT05fU0RCVVNfU09VUkNFID0gc2RidXMtJChQWVRIT05fU0RCVVNfVkVSU0lPTikudGFy
Lmd6Cj4gK1BZVEhPTl9TREJVU19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3Jn
L3BhY2thZ2VzLzhlLzM5LzNkNDlmMGQxOGRjYmEzMzQ0YWY3NTZmMzFlNDQwOGU3ZGU1MGIzZGY4
NmZhM2YzZWE2ZjYwNDQwMmYxNgo+ICtQWVRIT05fU0RCVVNfU0VUVVBfVFlQRSA9IHNldHVwdG9v
bHMKPiArUFlUSE9OX1NEQlVTX0xJQ0VOU0UgPSBMR1BMLTIuMSsKPiArUFlUSE9OX1NEQlVTX0xJ
Q0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gK1BZVEhPTl9TREJVU19ERVBFTkRFTkNJRVMgPSBzeXN0
ZW1kCj4gKwo+ICtpZmVxICgkKEJSMl9TVEFUSUNfTElCUykseSkKPiArUFlUSE9OX1NEQlVTX0VO
ViArPSBQWVRIT05fU0RCVVNfVVNFX1NUQVRJQ19MSU5LPTEKPiArZW5kaWYKPiArCj4gKyQoZXZh
bCAkKHB5dGhvbi1wYWNrYWdlKSkKPiAtLSAKPiAyLjM3LjMKPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwg
IFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8
IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2ln
bmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAw
OTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRo
ZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBc
IEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
LS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
