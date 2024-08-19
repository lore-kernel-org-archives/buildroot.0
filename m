Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82E1C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 22:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23EA460868;
	Mon, 19 Aug 2024 22:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wr9MqMvFCTiX; Mon, 19 Aug 2024 22:46:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0981760861
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0981760861;
	Mon, 19 Aug 2024 22:46:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB4441BF3C8
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6EB080DDD
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-6b4mjKcqas for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 22:46:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B7CC280DE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7CC280DE2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7CC280DE2
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 22:46:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AB72813F86A;
 Tue, 20 Aug 2024 00:46:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Aug 2024 00:46:08 +0200
Date: Tue, 20 Aug 2024 00:46:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsPLMBDhPZ-5Uqnf@landeda>
References: <20240819220456.1894189-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240819220456.1894189-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724107573;
 bh=k0wFJR2XwRljU/X8SX8f0J4ZvNhrJTf0Cc6A7dgw2Jg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZqC+qz5ipcA7ChiekVK0/atp3CDLL5xjegL1a5++j8B8u75YE7OdHR0FkEOW1gyHW
 /Wx4aO33k8GPTWYQQk0kuCKFcuZikEAcir54YqsWI5mJnTpZ8HH9tb4Qm1bFeeEYzd
 IBK8wiBkT/f87FY2GLWRysEBVwN/22uL/YZo+0ADanKXhtRcwZRhAXUdHT6MM25Xjo
 lDdV7HTGJ4ozpOG9sRB2oGgqhbrUpPWQ5w9wDlhKQ7BfqB/R3B3uAK3JAUG4IoYjOW
 nSVP4lj5Jk6wVvRxJpgLwNveXK5ROazxnnK8kTqqjDlA5OkJUbljXTA7HX1ljHNAK1
 Rxwc3Yr29E09Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZqC+qz5i
Subject: Re: [Buildroot] [PATCH] package/systemd: now needs target and host
 gcc >= 8
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
Cc: Sen Hastings <sen@hastings.org>, James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpPbiAyMDI0LTA4LTIwIDAwOjA0ICswMjAwLCBUaG9tYXMgUGV0YXp6b25p
IHNwYWtlIHRodXNseToKPiBTaW5jZSB0aGUgYnVtcCBvZiBzeXN0ZW1kIGZyb20gMjU0LjEzIHRv
IDI1Ni40LCBzeXN0ZW1kIG5vIGxvbmdlcgo+IGJ1aWxkcyB3aXRoIGdjYyA8PSA3Ogo+IAo+IC4u
L3NyYy9iYXNpYy9tb3VudHBvaW50LXV0aWwuYzogSW4gZnVuY3Rpb24g4oCYZnN0eXBlX2lzX2Fw
aV92ZnPigJk6Cj4gLi4vc3JjL2Jhc2ljL21hY3JvLmg6Mzg1Ojc5OiBlcnJvcjogZXhwZWN0ZWQg
4oCYfeKAmSBiZWZvcmUg4oCYX19WQV9PUFRfX+KAmQo+ICAgICAgICAgIGZvciAodHlwZW9mKGVu
dHJ5KSBfdmFfc2VudGluZWxfWzFdID0ge30sIF9lbnRyaWVzX1tdID0geyBfX1ZBX0FSR1NfXyBf
X1ZBX09QVF9fKCwpIF92YV9zZW50aW5lbF9bMF0gfSwgKl9jdXJyZW50XyA9IF9lbnRyaWVzXzsg
XAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gCj4gVGhpcyBmaXJzdCBlcnJvciBpcyBkdWUg
dG8gdXBzdHJlYW0gY29tbWl0Cj4gZGM1NzFjY2NkNzVkYjdiZTQ5YjJhYWRhNjRiYWY5MmUzYTQ5
OGMzOSAoIm1hY3JvOiB0ZXJtaW5hdGUgdGhlCj4gdGVtcG9yYXJ5IFZBX0FSR1NfRk9SRUFDSCgp
IGFycmF5IHdpdGggYSBzZW50aW5lbCIpLCB3aGljaCB3YXMgbWFkZSB0bwo+IHN1cHBvcnQgR0ND
IDE0LnguIElmIHdlIHJldmVydCB0aGlzIGNvbW1pdCwgdGhlbiB0aGlzIHBhcnRpY3VsYXIgaXNz
dWUKPiBnb2VzIGF3YXkgd2l0aCBHQ0MgNy54LCBidXQgdGhlbiBpdCBmYWlscyB3aXRoIGFub3Ro
ZXIgZmFpcmx5IHNpbWlsYXIKPiBpc3N1ZSBlbHNld2hlcmU6Cj4gCj4gLi4vc3JjL3NoYXJlZC92
YXJsaW5rLWlkbC5oOjExMDo0MTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0
aW9uIOKAmF9fVkFfT1BUX1/igJk7IGRpZCB5b3UgbWVhbiDigJhfX1RBX0lCSVRfX+KAmT8gWy1X
ZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjCj4gbGFyYXRpb25dCj4gICAgICAgICAgICAgICAg
ICAuZmllbGRzID0geyBfX1ZBX0FSR1NfXyBfX1ZBX09QVF9fKCwpIHt9fSwgICAgICAgICAgICAg
IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiAKPiBUaGlz
IGNvZGUgd2FzIGFkZGVkIGJ5IHVwc3RyZWFtIGNvbW1pdAo+IGU1MGIyYTkzZDY2ZWZmOWI0MTk5
OWQzOGI4ZWQ1ZWI2NDdlMmQ3NGMgKCJ2YXJsaW5rOiBhZGQKPiBJREwvaW50cm9zcGVjdGlvbiBs
b2dpYyIpLgo+IAo+IFVwc3RyZWFtIGNvbW1pdCBkYzU3MWNjY2Q3NWRiN2JlNDliMmFhZGE2NGJh
ZjkyZTNhNDk4YzM5IGZpcnN0Cj4gYXBwZWFyZWQgaW4gdjI1Niwgd2hpbGUgZTUwYjJhOTNkNjZl
ZmY5YjQxOTk5ZDM4YjhlZDVlYjY0N2UyZDc0YyBmaXJzdAo+IGFwcGVhcmVkIGluIHYyNTUuCj4g
Cj4gQ29uc2lkZXJpbmcgc3lzdGVtZCB1c3VhbCBwb2xpY2llcyB3aXRoIHRoZSBzdXBwb3J0IG9m
ICJvbGQiIHRoaW5ncywKPiBpdCdzIGZhaXJseSB1bmxpa2VseSB0aGF0IHRoZXkgd2lsbCBjYXJl
IGFib3V0IGJ1aWxkaW5nIHdpdGggb2xkZXIgZ2NjCj4gdmVyc2lvbnMuIFRoZXkgZXZlbiBkb2N1
bWVudCBpbgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvYmxvYi9tYWluL1JF
QURNRSB0aGF0IHRoZXkgbmVlZCBnY2MKPiA+PSA4LjQsIHNvIGxldCdzIGZvbGxvdyB0aGF0Lgo+
IAo+IEZpeGVzOgo+IAo+ICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMv
NTNjMWE3OWMzOTFlM2NjN2MyMzAwMTc4NTNiYTkzNTIwMmM4ZDIwZC8KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+
ICBwYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluICAgICAgfCAgNCArKy0tCj4gIHBhY2thZ2Uvc3lz
dGVtZC9Db25maWcuaW4uaG9zdCB8ICAyICstCj4gIHN5c3RlbS9Db25maWcuaW4gICAgICAgICAg
ICAgICB8IDEwICsrKysrLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3lzdGVtZC9Db25maWcu
aW4gYi9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluCj4gaW5kZXggMTEzYTgwOTNjNC4uMzQ1ZjA4
NTkwZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluCj4gKysrIGIvcGFj
a2FnZS9zeXN0ZW1kL0NvbmZpZy5pbgo+IEBAIC0yMyw4ICsyMyw4IEBAIG1lbnVjb25maWcgQlIy
X1BBQ0tBR0VfU1lTVEVNRAo+ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMK
PiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1NQCj4gIAlkZXBlbmRzIG9uIEJSMl9U
T09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF8zXzE1Cj4gLQlkZXBlbmRzIG9uIEJSMl9UT09MQ0hB
SU5fR0NDX0FUX0xFQVNUXzUKPiAtCWRlcGVuZHMgb24gQlIyX0hPU1RfR0NDX0FUX0xFQVNUXzUg
IyBob3N0LXN5c3RlbWQKPiArCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1Rf
OAo+ICsJZGVwZW5kcyBvbiBCUjJfSE9TVF9HQ0NfQVRfTEVBU1RfOCAjIGhvc3Qtc3lzdGVtZAo+
ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0hBU19VREVWCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfREJV
UyBpZiAhQlIyX1BBQ0tBR0VfREJVU19CUk9LRVIgIyBydW50aW1lCj4gIAlzZWxlY3QgQlIyX1BB
Q0tBR0VfTElCQ0FQCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3lzdGVtZC9Db25maWcuaW4uaG9z
dCBiL3BhY2thZ2Uvc3lzdGVtZC9Db25maWcuaW4uaG9zdAo+IGluZGV4IDhlMDBiY2Y1YzEuLmZk
YmViYWVlN2EgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zeXN0ZW1kL0NvbmZpZy5pbi5ob3N0Cj4g
KysrIGIvcGFja2FnZS9zeXN0ZW1kL0NvbmZpZy5pbi5ob3N0Cj4gQEAgLTEsNCArMSw0IEBACj4g
ICMgU2VsZWN0IHRoaXMgaWYgeW91IG5lZWQgaG9zdCBzeXN0ZW1kIHRvb2xzIChlLmcuIHN5c3Rl
bWN0bCkKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfU1lTVEVNRAo+ICAJYm9vbAo+IC0JZGVw
ZW5kcyBvbiBCUjJfSE9TVF9HQ0NfQVRfTEVBU1RfNQo+ICsJZGVwZW5kcyBvbiBCUjJfSE9TVF9H
Q0NfQVRfTEVBU1RfOAo+IGRpZmYgLS1naXQgYS9zeXN0ZW0vQ29uZmlnLmluIGIvc3lzdGVtL0Nv
bmZpZy5pbgo+IGluZGV4IGJjMGM2ZWI2YmMuLjMxOGM1MzhlZjEgMTAwNjQ0Cj4gLS0tIGEvc3lz
dGVtL0NvbmZpZy5pbgo+ICsrKyBiL3N5c3RlbS9Db25maWcuaW4KPiBAQCAtMTI2LDIwICsxMjYs
MjAgQEAgY29uZmlnIEJSMl9JTklUX1NZU1RFTUQKPiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJ
Tl9IQVNfU1NQCj4gIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKPiAgCWRl
cGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzNfMTUKPiAtCWRlcGVuZHMg
b24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNQo+IC0JZGVwZW5kcyBvbiBCUjJfSE9TVF9H
Q0NfQVRfTEVBU1RfNQo+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF84
Cj4gKwlkZXBlbmRzIG9uIEJSMl9IT1NUX0dDQ19BVF9MRUFTVF84Cj4gIAlzZWxlY3QgQlIyX1JP
T1RGU19NRVJHRURfVVNSCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfU1lTVEVNRAo+ICAJc2VsZWN0
IEJSMl9QQUNLQUdFX1NLRUxFVE9OX0lOSVRfU1lTVEVNRCBpZiBCUjJfUk9PVEZTX1NLRUxFVE9O
X0RFRkFVTFQKPiAgCj4gLWNvbW1lbnQgInN5c3RlbWQgbmVlZHMgYSBnbGliYyB0b29sY2hhaW4g
dy8gU1NQLCBoZWFkZXJzID49IDMuMTUsIGhvc3QgYW5kIHRhcmdldCBnY2MgPj0gNSIKPiArY29t
bWVudCAic3lzdGVtZCBuZWVkcyBhIGdsaWJjIHRvb2xjaGFpbiB3LyBTU1AsIGhlYWRlcnMgPj0g
My4xNSwgaG9zdCBhbmQgdGFyZ2V0IGdjYyA+PSA4Igo+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FH
RV9TWVNURU1EX0FSQ0hfU1VQUE9SVFMKPiAgCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKPiAgCWRl
cGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fVVNFU19HTElCQyB8fCBcCj4gIAkJIUJSMl9UT09MQ0hB
SU5fSEFTX1NTUCB8fCBcCj4gIAkJIUJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF8zXzE1
IHx8IFwKPiAtCQkhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNSB8fCBcCj4gLQkJIUJSMl9I
T1NUX0dDQ19BVF9MRUFTVF81Cj4gKwkJIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzggfHwg
XAo+ICsJCSFCUjJfSE9TVF9HQ0NfQVRfTEVBU1RfOAo+ICAKPiAgY29tbWVudCAic3lzdGVtZCBo
aWdobHkgcmVjb21tZW5kcyBMaW51eCA+PSA0LjE1Igo+ICAJZGVwZW5kcyBvbiBCUjJfSU5JVF9T
WVNURU1ECj4gLS0gCj4gMi40Ni4wCj4gCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAg
WWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwg
RXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5
OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhl
cmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0t
LScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
