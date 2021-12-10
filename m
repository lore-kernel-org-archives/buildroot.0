Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68771C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 14:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFACC40251;
	Fri, 10 Dec 2021 14:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDPBxiQhYULx; Fri, 10 Dec 2021 14:56:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFC534028A;
	Fri, 10 Dec 2021 14:56:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03BF91BF4DB
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E752C4264D
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vo9WxI-AmNBi for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 14:56:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4CE14264A
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 14:56:15 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vhJlmWn7rYYTXvhJlmGpDJ; Fri, 10 Dec 2021 15:56:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639148174; bh=T+TQOgvPZEzJPPUP7KV3v3/DsmYSNSX1QP9p5yi+BQI=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=ZSbcJn9bZB+KPqLpseyYf+p0bcXIvOfntU20cUnOKwbRnHVpDVr8Tk2JzKvRcHlMC
 5XRtWxWy7kc+ZjgtL6zbjQKVXOr8smiN8o1E8IizTi4HvRVfL6Df7Wa9FxpqRNKugl
 FWRAJ1mkZTPVlFbnnBYDMouGnrk5w/mUufsNj2SWDLMiFG7VRHGjVxwBeR9O9yexBl
 h1/ukahcVHCv18GIL2yeI0UP4qBHoa1n74J8zregn7GqFFUKxN836ak82jHLvAPnD1
 vbAdzaNPXhLDHOBh7Sf4sxiQx4CwnlAajmw3QiE+uQPo/hnoeD0kuUC4x5rp88y8Jq
 vRm/qV7JkuZJQ==
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-5-jose.pekkarinen@unikie.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <a417c319-6d34-1b82-800d-fe57d3e09863@benettiengineering.com>
Date: Fri, 10 Dec 2021 15:56:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210141209.1812043-5-jose.pekkarinen@unikie.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfHHNqVuRiADSTfDpudleqgusrfY2ywG6frkhzSjUNPnXNqHF7I2n1HvY9jFidTA6kKYvx0diPJjh8UVu05gKKbP4UJYpjYKW/CGgHQH+H/LEnpXfeQR/
 D/x+BpAOvTqZoLH9nya3RoUURhgOuTdiE/X5fIK7zEgD3z4swEjBYqINyHMx+p/TMy4J4COM4r8ERcu4qKh8lRgbJajDPC3FVxJ8M+mCOjY6sDnkRueFwaPF
 MUvGp1p48vYltMbGXfSa6Q==
Subject: Re: [Buildroot] [PATCH 5/7] package/aexpect: new package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTAvMTIvMjEgMTU6MTIsIEpvc8OpIFBla2thcmluZW4gd3JvdGU6Cj4gQWRkIHBhY2thZ2Ug
dG8gYXZvY2FkbyBmcmFtZXdvcmsncyBhZXhwZWN0LgoKUmV3b3JkCgo+IFNpZ25lZC1vZmYtYnk6
IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgo+IC0tLQo+ICAg
REVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgIHBhY2thZ2UvQ29uZmlnLmlu
ICAgICAgICAgICAgfCAgMSArCj4gICBwYWNrYWdlL2FleHBlY3QvQ29uZmlnLmluICAgIHwgMTIg
KysrKysrKysrKysrCj4gICBwYWNrYWdlL2FleHBlY3QvYWV4cGVjdC5oYXNoIHwgIDQgKysrKwo+
ICAgcGFja2FnZS9hZXhwZWN0L2FleHBlY3QubWsgICB8IDEzICsrKysrKysrKysrKysKPiAgIDUg
ZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvYWV4cGVjdC9Db25maWcuaW4KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Fl
eHBlY3QvYWV4cGVjdC5oYXNoCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9hZXhwZWN0
L2FleHBlY3QubWsKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBp
bmRleCAwZTRkYjgzNWQzLi5iODA5NzU1NmY4IDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiAr
KysgYi9ERVZFTE9QRVJTCj4gQEAgLTE0NjQsNiArMTQ2NCw3IEBAIEY6CXBhY2thZ2UvemZzLwo+
ICAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKPiAgIAo+ICAg
TjoJSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Cj4gK0Y6CXBh
Y2thZ2UvYWV4cGVjdC8KPiAgIEY6CXBhY2thZ2UvYWxmcmVkLwo+ICAgRjoJcGFja2FnZS9ibXg3
Lwo+ICAgRjoJcGFja2FnZS9taW5pamFpbC8KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcu
aW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IGI4NTdlMTg5NzYuLjUzOTVkOGRkNDkgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+
IEBAIC0xNTQsNiArMTU0LDcgQEAgbWVudSAiRGVidWdnaW5nLCBwcm9maWxpbmcgYW5kIGJlbmNo
bWFyayIKPiAgIGVuZG1lbnUKPiAgIAo+ICAgbWVudSAiRGV2ZWxvcG1lbnQgdG9vbHMiCj4gKwlz
b3VyY2UgInBhY2thZ2UvYWV4cGVjdC9Db25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL2Jh
dHMtY29yZS9Db25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL2JpbnV0aWxzL0NvbmZpZy5p
biIKPiAgIAlzb3VyY2UgInBhY2thZ2UvYml0d2lzZS9Db25maWcuaW4iCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvYWV4cGVjdC9Db25maWcuaW4gYi9wYWNrYWdlL2FleHBlY3QvQ29uZmlnLmluCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5lZmEyYmU4YjkxCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvYWV4cGVjdC9Db25maWcuaW4KPiBAQCAtMCwwICsx
LDEyIEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9BRVhQRUNUCj4gKwlib29sICJhZXhwZWN0Igo+
ICsJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTICMgZGxvcGVuKCkKPiArCXNlbGVjdCBCUjJf
UEFDS0FHRV9QWVRIT04KPiArCWhlbHAKPiArCSAgVGhpcyBtb2R1bGUgcHJvdmlkZXMgc2Vydmlj
ZXMgc2ltaWxhciB0bwo+ICsJICB0aGUgcGV4cGVjdCBweXRob24gbGlicmFyeSwgc28gdG8gc3Bl
YWssCj4gKwkgIHNwYXduIGFuZCBjb250cm9sIGludGVyYWN0aXZlIGFwcGxpY2F0aW9ucywKPiAr
CSAgc3VjaCBhcyBzc2gsIHNmdHAgYW5kIG90aGVycy4KPiArCj4gK2NvbW1lbnQgImFleHBlY3Qg
bmVlZHMgYSB0b29sY2hhaW4gd2l0aCBkeW5hbWljIGxpYnJhcnkgc3VwcG9ydCIKPiArCWRlcGVu
ZHMgb24gQlIyX1NUQVRJQ19MSUJTCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYWV4cGVjdC9hZXhw
ZWN0Lmhhc2ggYi9wYWNrYWdlL2FleHBlY3QvYWV4cGVjdC5oYXNoCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi40YTQ3ZGE0MTIxCj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL3BhY2thZ2UvYWV4cGVjdC9hZXhwZWN0Lmhhc2gKPiBAQCAtMCwwICsxLDQgQEAKPiArIyBG
cm9tIGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9kMC9mYS81YmExNmNh
MTdhNzA5ODBjN2MwOWVhMWM4ZDc0OGFhY2UxZWU4NzcyZDAzMmM0ODNhZGQwZTE3ZDBjZjYKCnNo
YTI1NiBmaWxlIF5eXgoKPiArc2hhMjU2ICA1NGFiYWUzMWU3ZDNiN2FmYmZiN2EwMTk3NTY5MDdh
ODFkNDBiZTQ0MjI3ODhiY2NmMjBkMmU4MmFkNmVmOGM4ICBhZXhwZWN0LTEuNi4zLnRhci5nego+
ICsjIExvY2FsbHkgY29tcHV0ZWQKPiArc2hhMjU2ICA3YmUyNmFiZjM1ZTUzMWEyMjZkYzc0MmQy
Mzc5ZDQyZDM3MmNiNjFmMDI3YTZlMjY0NzdjMGUyZjFhMDNiZmNiICBMSUNFTlNFCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvYWV4cGVjdC9hZXhwZWN0Lm1rIGIvcGFja2FnZS9hZXhwZWN0L2FleHBl
Y3QubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmNhMjA5NzMy
OGEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9hZXhwZWN0L2FleHBlY3QubWsKPiBA
QCAtMCwwICsxLDEzIEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBhZXhw
ZWN0Cj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK0FFWFBFQ1RfVkVSU0lP
TiA9IDEuNi4zCj4gK0FFWFBFQ1RfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9y
Zy9wYWNrYWdlcy9kMC9mYS81YmExNmNhMTdhNzA5ODBjN2MwOWVhMWM4ZDc0OGFhY2UxZWU4Nzcy
ZDAzMmM0ODNhZGQwZTE3ZDBjZjYKPiArQUVYUEVDVF9TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+
ICtBRVhQRUNUX0xJQ0VOU0UgPSBHUEwtMi4wCj4gK0FFWFBFQ1RfTElDRU5TRV9GSUxFUyA9IExJ
Q0VOU0UKPiArCj4gKyQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKPiAKCkJlc3QgcmVnYXJkcwot
LSAKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
