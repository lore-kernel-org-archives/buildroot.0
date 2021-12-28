Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC90BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 09:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DB31400FE;
	Tue, 28 Dec 2021 09:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Adw5ori10wn; Tue, 28 Dec 2021 09:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87FA040305;
	Tue, 28 Dec 2021 09:52:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C2491BF5A2
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 09:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65D38400B5
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 09:52:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 18FvDO7_eKUu for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 09:52:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTP id E08D3400AF
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 09:52:47 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 299xn3KTRYYTX299ynpwex; Tue, 28 Dec 2021 10:52:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640685166; bh=chBfW7REJpZdIqzHJedZw5Tjspku2ZypomKCPvnoAOU=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=aLPWAgbRD+g/B6NUo7f2lUleyCVaDAQn3IpICaxk9F+eueB8J0owDNIJRRQ0lgVSq
 flNp1XhU2yv4Y2+XOV7fxnbA6TZsrJG9oof5cFBzCLZGINBAYan/eQyb9AUDjXxxuw
 u7w8j3422uCgu/33/jp1uaGlCf4tvBsAZUUdd8gOvKfrAaJr2iIUGZth530qnBYzDT
 oI+Giz0bE9hn0IulPGb9jkc2zNwgaUCe5FC/ED1DoZmnCO8Q6LMA7cGpNrICBshgKu
 7XxFqCKXNMcgM8TillGcyHx6X9/jI1wlkXkC3469LXTmI6Tcv7VNqusYEXMRYCQ8T3
 PZ9EzHTvKPPFg==
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211218231155.666025-1-fontaine.fabrice@gmail.com>
 <20211219091016.GE2603@scaer>
 <aab3aac5-1077-b8c7-ff22-8be756e73b61@benettiengineering.com>
 <CAPi7W81m=9hUf3qyJ7FNNK5R6cc41A_FV8DXtxAKo6yfCpKwDg@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <9e0f56e6-5877-c91a-8e98-38fcadfa9fda@benettiengineering.com>
Date: Tue, 28 Dec 2021 10:52:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAPi7W81m=9hUf3qyJ7FNNK5R6cc41A_FV8DXtxAKo6yfCpKwDg@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPgGkptBXUcsJF5chjhCkRXRJIx6ob2sKaJvfkE2MKe72fH8LrdjIf94lwMRm6d/IsAoACN2O1zA8UisIZgQB3qPXt8utEfx3/2hPrK49rPfEnNIvpZc
 8CfUAAl9j22Oy6nbgkRZkOHy3e3Wg1LE40PPOrFQPLMzBigfkwB6zqZRfsUEZEQ2K+tzx/KrNctuE9OBYWTGwcGUiDkZk2+h1fLtpPzligMyoh9RP55DRzes
 DtXV8p4/IrvPaUxXPncUdQoHoG+XdqWBQPXveAnKTaU=
Subject: Re: [Buildroot] [PATCH 2/2] package/imagemagick: host SVG support
 needs host gcc >= 4.9
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjgvMTIvMjEgMTA6NDYsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4gSGkgR2l1bGlvLAo+
IAo+IExlIG1hci4gMjggZMOpYy4gMjAyMSDDoCAxMDo0NCwgR2l1bGlvIEJlbmV0dGkKPiA8Z2l1
bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gYSDDqWNyaXQgOgo+Pgo+PiBIaSBG
YWJyaWNlLCBZYW5uLAo+Pgo+PiBPbiAxOS8xMi8yMSAxMDoxMCwgWWFubiBFLiBNT1JJTiB3cm90
ZToKPj4+IEZhYnJpY2UsIEFsbCwKPj4+Cj4+PiBPbiAyMDIxLTEyLTE5IDAwOjExICswMTAwLCBG
YWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPj4+PiBob3N0IGdjYyA+PSA0LjkgaXMgbmVl
ZGVkIHNpbmNlIGJ1bXAgb2YgaGFyZmJ1enogdG8gdmVyc2lvbiAzLjEuMiBpbgo+Pj4+IGNvbW1p
dCA2ODYxOTMzZDIyMDA2ZmJlOGM5NjFhNDE1MDZiZWFjODI2ODgxZjMzIHRvIGF2b2lkIHRoZSBm
b2xsb3dpbmcKPj4+PiBidWlsZCBmYWlsdXJlOgo+Pj4+Cj4+Pj4gSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIC4uL3NyYy9oYi1zZXJpYWxpemUuaGg6MzY6MCwKPj4+PiAgICAgICAgICAgICAgICAgICAg
ZnJvbSAuLi9zcmMvaGItbWFjaGluZXJ5LmhoOjM3LAo+Pj4+ICAgICAgICAgICAgICAgICAgICBm
cm9tIC4uL3NyYy9oYi1jb21tb24uY2M6MzA6Cj4+Pj4gLi4vc3JjL2hiLW1hcC5oaDo2NzoxODog
ZXJyb3I6ICdpc190cml2aWFsbHlfY29weWFibGUnIGlzIG5vdCBhIG1lbWJlciBvZiAnc3RkJwo+
Pj4+ICAgICAgc3RhdGljX2Fzc2VydCAoc3RkOjppc190cml2aWFsbHlfY29weWFibGU8Sz46OnZh
bHVlLCAiIik7Cj4+Pj4gICAgICAgICAgICAgICAgICAgICBeCj4+Pgo+Pj4gSSByZXBsaWVkIHRv
IHRoZSB3cm9uZyBtYWlsIGVhcmxpZXIsIHNvIEZUUiBJJ2xsIHBhc3RlIGl0IGFnYWluIGJlbG93
Lgo+Pj4gU29ycnkgZm9yIHRoZSBub2lzZS4uLgo+Pj4KPj4+IFdoZXJlIGRpZCB5b3Ugc2VlIHRo
YXQgZ2NjIDQuOSBoYWQgaXQ/IEkgbG9va2VkIGF0IHRoZSBnY2MtNF85XzAtcmVsZWFzZQo+Pj4g
dGFnIGluIHRoZSBnY2MgdHJlZSwgYW5kIGl0IHN0YXRlczoKPj4+Cj4+PiAgICAgICAkIGdpdCBn
cmVwIGlzX3RyaXZpYWxseV9jb3B5YWJsZQo+Pj4gICAgICAgWy4uLl0KPj4+ICAgICAgIGxpYnN0
ZGMrKy12My9pbmNsdWRlL3N0ZC90eXBlX3RyYWl0czogIC8vIGlzX3RyaXZpYWxseV9jb3B5YWJs
ZQo+Pj4gKHN0aWxsIHVuaW1wbGVtZW50ZWQpCj4+Pgo+Pj4gV2hlcmVhcyBnY2MgNSBoYXMgYSBw
cm9wZXIgaW1wbGVtZW50YXRpb246Cj4+Pgo+Pj4gICAgICAgJCBnaXQgZ3JlcCAtQTEgJ2lzX3Ry
aXZpYWxseV9jb3B5YWJsZScgbGlic3RkYysrLXYzL2luY2x1ZGUvc3RkL3R5cGVfdHJhaXRzCj4+
PiAgICAgICBsaWJzdGRjKystdjMvaW5jbHVkZS9zdGQvdHlwZV90cmFpdHM6ICAvLyBpc190cml2
aWFsbHlfY29weWFibGUKPj4+ICAgICAgIGxpYnN0ZGMrKy12My9pbmNsdWRlL3N0ZC90eXBlX3Ry
YWl0cy0gIHRlbXBsYXRlPHR5cGVuYW1lIF9UcD4KPj4+ICAgICAgIGxpYnN0ZGMrKy12My9pbmNs
dWRlL3N0ZC90eXBlX3RyYWl0czogICAgc3RydWN0IGlzX3RyaXZpYWxseV9jb3B5YWJsZQo+Pj4g
ICAgICAgbGlic3RkYysrLXYzL2luY2x1ZGUvc3RkL3R5cGVfdHJhaXRzOiAgICA6IHB1YmxpYyBp
bnRlZ3JhbF9jb25zdGFudDxib29sLCBfX2lzX3RyaXZpYWxseV9jb3B5YWJsZShfVHApPgo+Pj4g
ICAgICAgbGlic3RkYysrLXYzL2luY2x1ZGUvc3RkL3R5cGVfdHJhaXRzLSAgICB7IH07Cj4+Pgo+
Pj4gSSBzZWUgdGhhdCA2ODYxOTMzZDIyMDAgKHBhY2thZ2UvaGFyZmJ1eno6IGJ1bXAgdG8gdmVy
c2lvbiAzLjEuMikgc3RhdGVkCj4+PiB0aGF0IHRoZSByZXF1aXJlbWVudCBvbiB0aGUgZ2NjIHZl
cnNpb24gd2FzIGJ1bXBlZCB0byA0LjkgZnJvbSA0LjgsIGJ1dAo+Pj4gSSBhbSBub3Qgc3VyZSBo
b3cgdGhhdCBjYW4gYmUuLi4KPj4KPj4gSW5kZWVkIG5vdyBpdCBjYW1lIG91dCBnY2MgNSBpcyBu
ZWVkZWQuCj4+Cj4+PiBHaXVsaW8sIHdoZXJlIGRpZCB5b3UgZ2V0IHRoZSBpbmZvIHRoYXQgZ2Nj
IDQuOSB3YXMgcmVxdWlyZWQgKGFuZCBub3QgYQo+Pj4gaGlnaGVyIHZlcnNpb24pPwo+Pgo+PiBI
b25lc3RseSBvbiB0cmlhbCBhbmQgZXJyb3Igd2l0aCB0YXJnZXQgdG9vbGNoYWluLCBiZWNhdXNl
IHdpdGggaGFyZmJ1enoKPj4gMy4xLjIgY2FzZSBpdCB3YXMgb25seSB0YXJnZXQgcmVsYXRlZC4g
QW5kIG5vdyBJIGtub3cgSSBuZWVkIHRvIGNoZWNrCj4+IGxpYnN0ZGMrKyBnaXQgaW5zdGVhZCh0
aGFuayB5b3UgZm9yIHBvaW50aW5nIG1lKS4KPj4KPj4gU28gSSd2ZSBzZW50IHRoZSBwYXRjaCBm
b3IgaGFyZmJ1enogMy4yLjAgd2l0aCBib3RoIGhvc3QgYW5kIHRhcmdldCBnY2MKPj4gNSBkZXBl
bmRlbmN5Ogo+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290
L3BhdGNoLzIwMjExMjI4MDAyMjI3LjE1NzQ3LTEtZ2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2lu
ZWVyaW5nLmNvbS8KPj4KPj4gVGhhdCBzaG91bGQgZml4IHRoZSBwcm9ibGVtLgo+IEkgYXNzdW1l
IHRoYXQgeW91J2xsIHNlbmQgYSB2MyBvZiB0aGUgYWJvdmUgcGF0Y2ggYXMgdGhlIHYyIGRvZXNu
J3QKPiB1cGRhdGUgaW1hZ2VtYWdpY2suIEFtIEkgcmlnaHQ/CgpJIHdhcyBqdXN0IHdyaXRpbmcg
eW91IGV4YWN0bHkgdGhhdCA6LSkhCkkgZGlkbid0IHRoaW5rIGFib3V0IHRoZSByZXZlcnNlIGRl
cGVuZGVuY2llcyBvZiBob3N0LWhhcmZidXp6LiBOb3cgSSAKa25vdyB0aGF0IHRvby4KClRoYW5r
cyBhIGxvdCBmb3IgcG9pbnRpbmcgOi0pCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2lu
ZWVyaW5nIHNhcwoKPj4KPj4gQmVzdCByZWdhcmRzCj4+IC0tCj4+IEdpdWxpbyBCZW5ldHRpCj4+
IEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCj4+Cj4+PiBSZWdhcmRzLAo+Pj4gWWFubiBFLiBNT1JJ
Ti4KPj4+Cj4+Pj4gRml4ZXM6Cj4+Pj4gICAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5v
cmcvcmVzdWx0cy84OWUxMTk0YzE2NTlkN2UxYWY5ZGI4ZmZlNWZlZWU3NzBjNDQ4Zjc2Cj4+Pj4K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdt
YWlsLmNvbT4KPj4+PiAtLS0KPj4+PiAgICBwYWNrYWdlL2ltYWdlbWFnaWNrL0NvbmZpZy5pbi5o
b3N0IHwgNCArKysrCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4+
Cj4+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvaW1hZ2VtYWdpY2svQ29uZmlnLmluLmhvc3QgYi9w
YWNrYWdlL2ltYWdlbWFnaWNrL0NvbmZpZy5pbi5ob3N0Cj4+Pj4gaW5kZXggNjcxYjA5OTVkYy4u
ZmUwYWQ5YTc0OCAxMDA2NDQKPj4+PiAtLS0gYS9wYWNrYWdlL2ltYWdlbWFnaWNrL0NvbmZpZy5p
bi5ob3N0Cj4+Pj4gKysrIGIvcGFja2FnZS9pbWFnZW1hZ2ljay9Db25maWcuaW4uaG9zdAo+Pj4+
IEBAIC0xNyw2ICsxNyw3IEBAIGlmIEJSMl9QQUNLQUdFX0hPU1RfSU1BR0VNQUdJQ0sKPj4+PiAg
ICBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9JTUFHRU1BR0lDS19TVkcKPj4+PiAgICAgICBib29s
ICJTVkcgc3VwcG9ydCIKPj4+PiAgICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVT
VENfQVJDSF9TVVBQT1JUUyAjIGhvc3QtbGlicnN2Zwo+Pj4+ICsgICAgZGVwZW5kcyBvbiBCUjJf
SE9TVF9HQ0NfQVRfTEVBU1RfNF85ICMgaG9zdC1wYW5nbyAtPiBob3N0LWhhcmZidXp6Cj4+Pj4g
ICAgICAgaGVscAo+Pj4+ICAgICAgICAgU2F5ICd5JyBoZXJlIGlzIHlvdSBuZWVkIEltYWdlTWFn
aWNrIHRvb2xzIChsaWtlIGNvbnZlcnQpCj4+Pj4gICAgICAgICB0byBzdXBwb3J0IFNWRy4KPj4+
PiBAQCAtMjQsNCArMjUsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9JTUFHRU1BR0lDS19T
VkcKPj4+PiAgICAgICAgIFRoaXMgaXMgbm90IGVuYWJsZWQgYnkgZGVmYXVsdCwgYXMgaXQgYnJp
bmdzIHF1aXRlIGEgZmV3Cj4+Pj4gICAgICAgICBleHRyYSBkZXBlbmRlbmNpZXMsIGFuZCB0aHVz
IGV4dHJhIGJ1aWxkIHRpbWUuCj4+Pj4KPj4+PiArY29tbWVudCAiU1ZHIHN1cHBvcnQgbmVlZHMg
YSB0b29sY2hhaW4gdy8gaG9zdCBnY2MgPj0gNC45Igo+Pj4+ICsgICAgZGVwZW5kcyBvbiAhQlIy
X0hPU1RfR0NDX0FUX0xFQVNUXzRfOQo+Pj4+ICsKPj4+PiAgICBlbmRpZgo+Pj4+IC0tCj4+Pj4g
Mi4zMy4wCj4+Pj4KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+Pj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4+PiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+Pj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo+Pj4KPj4KPiBCZXN0IFJlZ2FyZHMsCj4gCj4gRmFicmljZQo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
