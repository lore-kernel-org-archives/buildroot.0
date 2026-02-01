Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9BFE65298
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 21:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDECA82446;
	Sun,  1 Feb 2026 21:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-_giQrNpKok; Sun,  1 Feb 2026 21:53:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6EC081498
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769982810;
	bh=bRymfqUX62xiS44kvTipabaDvG/NFxDesoXONjjfu5k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qmYu8Pp2DkaBD90t0v0Qxqp5OL+RErtRvqY/5GRiGjQipdh/sP6P4RtxLwnKhHMwz
	 rCbQ/rZrO5mv/EVgFmgC+ZHvjpWw3oc1tw6bqb+et1W4P3LSo3rr5VxUq0bB4kHhfd
	 4EXCcVGuHwMrR7tpP8K6VMiEirUh6kCPzmohf8nTAcVtxgyuxu6ggNWYq2FBN7lK57
	 0Qkuz6fIxqr9UV6k1zhl63XaNc4ElgkPqZ+kvuugIqHA8rk0dJJzu43yLw9DQOEs6x
	 at8kObzH4xHKxzExKWinmkDNdJAnn1kpINrHiIh1JgtnYiJtYjlE3wbWSHisAAS5ry
	 siSK5yc0igYiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6EC081498;
	Sun,  1 Feb 2026 21:53:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20A9334C
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F116D60638
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Guy_1Sk5ZpYp for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 21:53:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7510F6060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7510F6060A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7510F6060A
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:53:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B9F3F19F5B2;
 Sun,  1 Feb 2026 22:53:19 +0100 (CET)
Received: from 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251:60817])
 via 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Feb 2026 22:53:19 +0100
MIME-Version: 1.0
Date: Sun, 01 Feb 2026 22:53:19 +0100
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Vincent_Stehl=C3=A9?=
 <vincent.stehle@arm.com>
In-Reply-To: <82fffd9a-dcd8-4dc6-8f33-c85e8d3f836c@smile.fr>
References: <20260124131337.1022030-1-ju.o@free.fr>
 <20260124131337.1022030-3-ju.o@free.fr>
 <82fffd9a-dcd8-4dc6-8f33-c85e8d3f836c@smile.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <a3c30c525a648b03b3ee9755fdcd6a4d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769982804;
 bh=0Gn0i/9ylgjNE0/eXvTWtXvZ5Pnf0rtmCX9TGWw2fi8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LL6iKTfrjIOZxaZsIo3mK7iovvIZcsgCewu7UryVTzwdaHzQ6hij6+GRAH0A5cB5v
 RMtnkgmPq24f7tagfm7MRIOMnlrXS+GxwxhsemAEnUXgw49by+VtEhFqOnO4UtI8qA
 YrAcA1PEqQbBMxPDqVvpXBIgOXXN9fLVjTS+1MslCK1cK1kNzrhGOI8z0rAJQNwkZa
 sSKnW9MY1qEymRMrlZ2w4KNPk1zK+LcmbhVqDQNb1lOSzWOaOrwbPK3gDGbWmPgwdt
 XV68/VfcCd+uapFLL0Y5+wGhEJfk0PvrZESbI7r3IuiX7lLYyOJ4gCwfnrtjU2sFQW
 VEyVv3TMjPLLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LL6iKTfr
Subject: Re: [Buildroot] [PATCH 3/3] boot/edk2: bump to version
 edk2-stable202511
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

SGkgUm9tYWluLAoKT24gMDEvMDIvMjAyNiAyMjoyMSwgUm9tYWluIE5hb3VyIHZpYSBidWlsZHJv
b3Qgd3JvdGU6Cj4gSGVsbG8gSnVsaWVuLAo+IAo+IExlIDI0LzAxLzIwMjYgw6AgMTQ6MTMsIEp1
bGllbiBPbGl2YWluIGEgw6ljcml0wqA6Cj4+IEZvciByZWxlYXNlIG5vdGVzIHNpbmNlIGVkazIt
c3RhYmxlMjAyNTA4LCBzZWU6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9y
ZWxlYXNlcy90YWcvZWRrMi1zdGFibGUyMDI1MTEKPj4gCj4+IFRoaXMgY29tbWl0IGFsc28gdXBk
YXRlcyB0aGUgZWRrMi1wbGF0Zm9ybXMgcGFja2FnZXMgd2l0aCB0aGUgbGFzdAo+PiBjb21taXQg
bWVyZ2VkIGF0IHRoZSBlZGsyIHJlbGVhc2UgZGF0ZSAoMjAyNS0xMS0xOSksIHdoaWNoIGNvcnJl
c3BvbmRzCj4+IHRvIGNvbW1pdCBbMV0uCj4+IFRoZSBlZGsyLW5vbi1vc2kgcGFja2FnZSBpcyBh
bHNvIHVwZGF0ZWQgdGhlIHNhbWUgd2F5LCB3aGljaAo+PiBjb3JyZXNwb25kcyB0byBjb21taXQg
WzJdLgo+PiAKPj4gVGhpcyBjb21taXQgYWxzbyBhZGRzIGFuIGVkazItcGxhdGZvcm1zIHBhY2th
Z2UgcGF0Y2ggdG8gZml4IGEgTWFydmVsbAo+PiBidWlsZCBmYWlsdXJlIHNlZW4gd2l0aCB0aGUg
U29saWRSdW4gTWFjY2hpYXRvQmluIHBsYXRmb3JtLgo+PiAKPj4gVGhpcyBjb21taXQgaGFzIGJl
ZW4gcnVudGltZSB0ZXN0ZWQgd2l0aCB0ZXN0cyB1c2luZyBFREsyIHBhY2thZ2UsCj4+IHdpdGgg
Y29tbWFuZHM6Cj4+IAo+PiAgICAgc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyBcCj4+ICAgICAg
ICAgLWQgZGwgLW8gb3V0cHV0X2ZvbGRlciBcCj4+ICAgICAgICAgICAgIHRlc3RzLmJvb3QudGVz
dF9lZGsyIFwKPj4gICAgICAgICAgICAgdGVzdHMuYm9vdC50ZXN0X2dydWIuVGVzdEdydWJBQXJj
aDY0RUZJIFwKPj4gICAgICAgICAgICAgdGVzdHMuYm9vdC50ZXN0X2dydWIuVGVzdEdydWJSaXNj
VjY0RUZJIFwKPj4gICAgICAgICAgICAgdGVzdHMuYm9vdC50ZXN0X2dydWIuVGVzdEdydWJYODY2
NEVGSSBcCj4+ICAgICAgICAgICAgIHRlc3RzLnBhY2thZ2UudGVzdF9md3RzCj4+IAo+PiBJdCBo
YXMgYWxzbyBiZWVuIHJ1bnRpbWUgdGVzdGVkIChieSBib290aW5nIGluIHFlbXUpIHdpdGggZGVm
Y29uZmlncwo+PiB1c2luZyBFREsyIHBhY2thZ2U6Cj4+IHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNv
bmZpZwo+PiBxZW11X2xvb25nYXJjaDY0X3ZpcnRfZWZpX2RlZmNvbmZpZwo+PiBxZW11X3Jpc2N2
NjRfdmlydF9lZmlfZGVmY29uZmlnCj4+IHFlbXVfeDg2XzY0X2VmaV9kZWZjb25maWcKPj4gCj4+
IFsxXSAKPj4gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyLXBsYXRmb3Jtcy9jb21t
aXQvMWU2NGMxMTA5YWUyYWMwMTg1MzUxZThkMGMxOTczMjk3MGQ0ZmVjZgo+PiBbMl0gCj4+IGh0
dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi1ub24tb3NpL2NvbW1pdC85NGQwNDg5ODEx
MTZlMmUzZWRhNTJkYWQxYTg5OTU4ZWU0MDQwOThkCj4+IAo+PiBDYzogRGljayBPbHNzb24gPGhp
QHNlbnppbGxhLmlvPgo+PiBDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+
Cj4+IENjOiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4+IC0tLQo+PiBUaGUgZWRr
Mi1wbGF0Zm9ybXMgcGF0Y2ggY29udGFpbnMgQ1ItTEYgbGluZSBlbmRpbmdzLCB3aGljaCBtaWdo
dCBiZSAKPj4gY2hhbmdlZAo+PiBieSB0aGUgbWFpbGluZyBsaXN0IHRvIExGLiBUaGlzIGNhbiBt
YWtlIHRoZSBwYXRjaCBub3QgYXBwbHkgY2xlYW5seS4gCj4+IEZvcgo+PiBjb252ZW5pZW5jZSwg
SSBhbHNvIHB1Ymxpc2hlZCB0aG9zZSBwYXRjaGVzIGF0Ogo+PiBodHRwczovL2dpdGxhYi5jb20v
am9saXZhaW4vYnVpbGRyb290Ly0vY29tbWl0cy9idW1wX2VkazItc3RhYmxlMjAyNTExCj4+IC0t
LQo+PiAgQ29uZmlnLmluLmxlZ2FjeSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcg
KysKPj4gIGJvb3QvZWRrMi9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEy
ICstLQo+PiAgYm9vdC9lZGsyL2VkazIuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KPj4gIGJvb3QvZWRrMi9lZGsyLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDE1ICstLS0KPj4gIHBhY2thZ2UvZWRrMi1ub24tb3NpL2VkazItbm9uLW9zaS5oYXNoICAgICAg
ICB8ICAyICstCj4+ICBwYWNrYWdlL2VkazItbm9uLW9zaS9lZGsyLW5vbi1vc2kubWsgICAgICAg
ICAgfCAgMiArLQo+PiAgLi4uTWFydmVsbC1maXgtU01CSU9TLXR5cGUtNy1zdHJ1Y3R1cmVzLnBh
dGNoIHwgODAgCj4+ICsrKysrKysrKysrKysrKysrKysKPj4gIHBhY2thZ2UvZWRrMi1wbGF0Zm9y
bXMvZWRrMi1wbGF0Zm9ybXMuaGFzaCAgICB8ICAyICstCj4+ICBwYWNrYWdlL2VkazItcGxhdGZv
cm1zL2VkazItcGxhdGZvcm1zLm1rICAgICAgfCAgMiArLQo+PiAgOSBmaWxlcyBjaGFuZ2VkLCA5
NyBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCAK
Pj4gcGFja2FnZS9lZGsyLXBsYXRmb3Jtcy8wMDAxLVNpbGljb24tTWFydmVsbC1maXgtU01CSU9T
LXR5cGUtNy1zdHJ1Y3R1cmVzLnBhdGNoCj4+IAo+IAo+IC4uLgo+IAo+PiBkaWZmIC0tZ2l0IGEv
Ym9vdC9lZGsyL2VkazIubWsgYi9ib290L2VkazIvZWRrMi5tawo+PiBpbmRleCAyYzA4OWFlZmNh
Li5kYmE0YWVkNTEzIDEwMDY0NAo+PiAtLS0gYS9ib290L2VkazIvZWRrMi5tawo+PiArKysgYi9i
b290L2VkazIvZWRrMi5tawo+PiBAQCAtNCw3ICs0LDcgQEAKPj4gICMKPj4gIAo+PiAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwo+PiAKPj4gLUVESzJfVkVSU0lPTiA9IGVkazItc3RhYmxlMjAyNTA4
Cj4+ICtFREsyX1ZFUlNJT04gPSBlZGsyLXN0YWJsZTIwMjUxMQo+PiAgRURLMl9TSVRFID0gaHR0
cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyCj4+ICBFREsyX1NJVEVfTUVUSE9EID0gZ2l0
Cj4+ICBFREsyX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UtUGF0ZW50Cj4+IEBAIC01NiwxNCArNTYs
NyBAQCBFREsyX0dJVF9TVUJNT0RVTEVTID0gWUVTCj4+ICBFREsyX0JVSUxEX1BBQ0tBR0VTID0g
JChARCkvQnVpbGQvQnVpbGRyb290Cj4+ICBFREsyX1BBQ0tBR0VTX1BBVEhTID0gJChARCkgJChF
REsyX0JVSUxEX1BBQ0tBR0VTKSAKPj4gJChTVEFHSU5HX0RJUikvdXNyL3NoYXJlL2VkazItcGxh
dGZvcm1zCj4+IAo+PiAtaWZlcSAoJChCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1fT1ZNRl9JMzg2
KSx5KQo+PiAtRURLMl9BUkNIID0gSUEzMgo+PiAtRURLMl9ERVBFTkRFTkNJRVMgKz0gaG9zdC1u
YXNtCj4+IC1FREsyX1BBQ0tBR0VfTkFNRSA9IE92bWZQa2cKPj4gLUVESzJfUExBVEZPUk1fTkFN
RSA9IE92bWZQa2dJYTMyCj4+IC1FREsyX0JVSUxEX0RJUiA9IE92bWZJYTMyCj4+IC0KPj4gLWVs
c2UgaWZlcSAoJChCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1fT1ZNRl9YNjQpLHkpCj4+ICtpZmVx
ICgkKEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9PVk1GX1g2NCkseSkKPj4gIEVESzJfQVJDSCA9
IFg2NAo+PiAgRURLMl9ERVBFTkRFTkNJRVMgKz0gaG9zdC1uYXNtCj4+ICBFREsyX1BBQ0tBR0Vf
TkFNRSA9IE92bWZQa2cKPj4gQEAgLTc0LDEzICs2NywxMyBAQCBlbHNlIGlmZXEgCj4+ICgkKEJS
Ml9UQVJHRVRfRURLMl9QTEFURk9STV9BUk1fVklSVF9RRU1VKSx5KQo+PiAgRURLMl9BUkNIID0g
QUFSQ0g2NAo+PiAgRURLMl9QQUNLQUdFX05BTUUgPSBBcm1WaXJ0UGtnCj4+ICBFREsyX1BMQVRG
T1JNX05BTUUgPSBBcm1WaXJ0UWVtdQo+PiAtRURLMl9CVUlMRF9ESVIgPSAkKEVESzJfUExBVEZP
Uk1fTkFNRSktJChFREsyX0FSQ0gpCj4+ICtFREsyX0JVSUxEX0RJUiA9ICQoRURLMl9QTEFURk9S
TV9OQU1FKS1BQXJjaDY0Cj4+IAo+PiAgZWxzZSBpZmVxICgkKEJSMl9UQVJHRVRfRURLMl9QTEFU
Rk9STV9BUk1fVklSVF9RRU1VX0tFUk5FTCkseSkKPj4gIEVESzJfQVJDSCA9IEFBUkNINjQKPj4g
IEVESzJfUEFDS0FHRV9OQU1FID0gQXJtVmlydFBrZwo+PiAgRURLMl9QTEFURk9STV9OQU1FID0g
QXJtVmlydFFlbXVLZXJuZWwKPj4gLUVESzJfQlVJTERfRElSID0gJChFREsyX1BMQVRGT1JNX05B
TUUpLSQoRURLMl9BUkNIKQo+PiArRURLMl9CVUlMRF9ESVIgPSAkKEVESzJfUExBVEZPUk1fTkFN
RSktQUFyY2g2NAo+IAo+IEl0IHNlZW1zIHRoZSBjb21taXQgbG9nIGRvZXNuJ3QgZXhwbGFpbiB0
aGlzIGNoYW5nZS4KCllvdSBhcmUgY29ycmVjdC4gSSBmb3Jnb3QgdG8gaW5jbHVkZSB0aGUgZXhw
bGFuYXRpb24uCgpUaGUgZm9sbG93aW5nIHRleHQgc2hvdWxkIGJlIGFkZGVkIGluIHRoZSBjb21t
aXQgbG9nOgoKIiIiClVwc3RyZWFtIGNvbW1pdCBbM10gcmVtb3ZlZCB0aGUgMzJiaXQgQVJNIFZp
cnR1YWwgUGxhdGZvcm1zLiBUaGUKc3BlY2lmaWMgY2hhbmdlIFs0XSBjaGFuZ2VkIGEgIiQoQVJD
SCkiIHRvICJBQXJjaDY0Ii4gUG9zc2libGUKdmFsdWVzIGZvciAiJChBUkNIKSIgd2VyZSAiQUFS
Q0g2NCIgb3IgIkFSTSIuIFNpbmNlIExpbnV4IGhhcwphIGNhc2Ugc2Vuc2l0aXZlIGZpbGVzeXN0
ZW0sIHRoZSBFREsyX0JVSUxEX0RJUiB2YWx1ZXMgbmVlZHMgdG8gYmUKdXBkYXRlZCBhY2NvcmRp
bmdseS4KClszXSAKaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL2NvbW1pdC9iNDcx
ZWQyOTY5NGMzNzVlYTFiNmI0ODRlYjcxYWY3M2VkNjFmZWNlCls0XSAKaHR0cHM6Ly9naXRodWIu
Y29tL3RpYW5vY29yZS9lZGsyL2NvbW1pdC9iNDcxZWQyOTY5NGMzNzVlYTFiNmI0ODRlYjcxYWY3
M2VkNjFmZWNlI2RpZmYtNTUyMDBhYzkzNGJiZTZlODFiYjQxNThiZmZmNDc5Nzk5MmIxM2ZiMWFm
Yjk1ZmU5ODI4NTMwMjRjNjAxODQzMEwyMC1SMjEKIiIiCgpGb3IgY29udmVuaWVuY2UsIEkndmUg
YWxzbyBwdWJsaXNoZWQgdGhpcyB1cGRhdGVkIGNvbW1pdCBsb2cgYXQ6Cmh0dHBzOi8vZ2l0bGFi
LmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9jb21taXRzL2J1bXBfZWRrMi1zdGFibGUyMDI1MTFf
djIKClRlbGwgbWUgaWYgeW91IHdhbnQgbWUgdG8gc2VuZCBhIHYyIG9uIHRoZSBsaXN0LgoKPiBC
ZXN0IHJlZ2FyZHMsCj4gUm9tYWluCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
