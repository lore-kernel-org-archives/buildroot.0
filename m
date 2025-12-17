Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EA0D6554F
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 12:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD6EA80AF6;
	Wed, 17 Dec 2025 12:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RjQ1pLYmARLI; Wed, 17 Dec 2025 12:10:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAE7B80B0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765973438;
	bh=l6v+YnuWdraoVLBTedbeTuRTCde2784SEIrz94RQwLk=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XkMgDlfREfCVn0TsafBwr69mFTk9a7KznH8LtYoi8SrwdW/Sneb3iPs70mP7PXYA7
	 DHV2f36L6xP9L5d5dgGMjN5qB0KFfENz2IQI4yN3vpbF9SEZQqD9D9eO/XCrspI/+/
	 ZWLbWMu4FqMOdRvlUXe0q8QjGjZj1qxRWmTeKXJ3iNKRuaQbvWIrD6CzDfJyb2BPLd
	 Q8roFqgLRxRToyfFfcCiop6Nm+h7/A9I745YS+pkrdufR7Hfea08R46l+AU/Kj3bXI
	 3faQMv98S7xEgQjURODECRLfEVIFTlJj6GyXsFajsgCel8N4xWQ/R6prpJh+BX38Ne
	 +Z0rwBrDKB5Ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAE7B80B0A;
	Wed, 17 Dec 2025 12:10:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C4E4364
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 12:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E33940538
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 12:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XM9CdXpWCnLR for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 12:10:37 +0000 (UTC)
X-Greylist: delayed 855 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 17 Dec 2025 12:10:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34AE340349
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34AE340349
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.63.121;
 helo=1.mo560.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 1.mo560.mail-out.ovh.net (1.mo560.mail-out.ovh.net
 [46.105.63.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34AE340349
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 12:10:36 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.254.66])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4dWVnZ33KkzBJQy
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 10:45:38 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-xpcbt (unknown [10.110.164.113])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 162C480406
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 10:45:38 +0000 (UTC)
Received: from armadeus.com ([37.59.142.111])
 by ghost-submission-7d8d68f679-xpcbt with ESMTPSA
 id iX6EN9GJQmn3vwgAKSUYtg
 (envelope-from <sebastien.szymanski@armadeus.com>)
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 10:45:38 +0000
X-OVh-ClientIp: 90.11.244.6
Message-ID: <6f08087e-f460-4646-86d8-397b3489864b@armadeus.com>
Date: Wed, 17 Dec 2025 11:45:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot <buildroot@buildroot.org>
References: <20251217-pixman-aarch64-neon-fix-v1-1-3a6aa820097e@armadeus.com>
Content-Language: en-US
From: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Autocrypt: addr=sebastien.szymanski@armadeus.com; keydata=
 xsBNBFNfZLEBCACv1lqSePHJNpRgcnER+3emy+Arjz84zFax3XkogjY/e3ZneihIgWrVKe5M
 ql16pX4KTkzNgMUKz4bG/XwT3kjcrXshxFLlg7KrHMl287C+W+QOUjnjVeRi/su+SPmjz8VD
 yr11h+ZkVLAWhS+uQJ93jy1NwG8M4t1kBLAVHHD5Vw4FJ+3ouaVYIp1X1Cr8bVKQw33Q1aTd
 ro0kMBb96B9vNu7ciJZ3gvlaBzUEKOgNnq9KaywuLnqrqr4HUIn5JuxZjCjJzt9kTAKcTfp2
 cJM8qpp+2FF5qtbkse9fZ6M64qozgOPr9Tk4Amf9fZEUQ6UNw14mmBZuXSzoHe75gI7TABEB
 AAHNN1PDqWJhc3RpZW4gU1pZTUFOU0tJIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
 LmNvbT7CwJAEEwEIADoCGyMHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgBYhBJwGygpYm/1C
 /GCmwbCaKeiBMmTiBQJdhIHLAAoJELCaKeiBMmTixXIH/2W3kbzRG0UF81jtRRnp0H83rjDT
 v0H+8fgFMRL/7HCJ1QPArkfRJlM2wlJkN+ChP09CCarYfUEHfRCHlTb7At6Yyrz1jziD7ZwX
 8IWHYRXnZkY5eZc5DsiUgq6JH49kt+GPzK8UVP9MTa6zkBpPCUf7LzZ4pD3FihdkT52BU3gI
 d9P49fSI0TYySlb/VKn815aOhvwEr7+Dh3mZUjSh7saofbRmVUOr7p+R3MvvGI19/IJZjeOE
 ZWliODDOt6HnBOtoGSXMcNIFF6snH52D5N5gY88njZjTwhgGGUBix1bsgf/EY0v4R5itZBXB
 B/Ze4Tm++YHaB75hZK6PQu/YRv7OwE0EU19ksQEIALo7jhXddrXBTRu5SAjelV53jyHBJTX/
 vN4nL/VbbW/saca+NJjDSxx5DBmotZbQdWIyZiSIjU/xnTREvtDrl6ZeSsKWd7ZqiuiY4fSR
 zwuQp9rd0yqRuxesrWeyJB1zCSdEvLyKASERt+nxkOA+IzJ4y1qLtvnWr+SL1AXgTMw+Tkyw
 KIDCRWHTIYas11ldGj82gOIpYeXnapeNLHfT4EQwg0NeWYHynJxAQWiX5aPlw0uSpAQSsBXQ
 FIe3fpoveMSnXK+PG2BBOzexYv7r4S70a6sF9sgTTPpfKqUaqqC+u1+bUX6alTAKhGKJywaF
 6ViqLlgY8PfwohSyAlqlTRMAEQEAAcLAdgQYAQgAIAIbDBYhBJwGygpYm/1C/GCmwbCaKeiB
 MmTiBQJdhIHSAAoJELCaKeiBMmTitU8IAK7NQM3fEwaF5XaKtepYWsVka44CD8A9e4r7NVK9
 ugirKvXirIxBSDmN/Db862NmVpITsZ6ERNSNZLm/7k55N+TexKYiFZeU7G92TEfAM6qPElvx
 DLEcrkNMq9r08YZeUloacsq31AL5fK4LW+xdvXudkdiKRMJsdTpmff3x5kIziGOHjwFP9wve
 ZgEH52gpbRsP8Whx/Z2lNX/BBRmFM8OnEXFsjjqDzYThdxTq85wGPpkgvvUGyPNRD7TpbB1C
 pajOUUkPxgj5LKt77HD1afeZNudWhgcdkbtT5PMQTT0WY6wvMEj9S1+bGPeXRGWLYB7gHQ+L
 JNoSD7Kz6Y9qnKo=
In-Reply-To: <20251217-pixman-aarch64-neon-fix-v1-1-3a6aa820097e@armadeus.com>
X-Ovh-Tracer-Id: 9931000130843175797
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFI76TxJUv0X5MbFZrqeIcqWA8XH8nqYjqK9oBeCOtJ1J6JQpIqyfWzRd6RU4VUJxlEP6tsl51lONmv+mITRpy1itdP7fYT/7C5WGSHxfc0jTy1tA6zmlfdbHBbtmBvleV5LLSRefDgV/J2aYEyKzbeTSlpa1fRMv2mKyfk37wrtuHGD847zF1SJKjAszFtkL9hhdEYxlkufdwWwO8jER4e0op0B3RcnXwLKSU08EmTRpv3nDNrSYtCxMnsCWD4R1miNcy+2WMcXyZv7OxyaJuisxSISxLxPmBI0kyuzcjYcQbZwc1R+DI/IOPZyz1zaUrDh/pUlHGriegqFBxwDm/JHQz9K+wgOu9eWMDLIGq2LNFrirY8rthkTMcL7wZ0RSWLVwXPJPGxStj2T4PkSjy0stdlHok+4f3AoHEOnW3DS2RFrQ0FOvmiKc8DdTcbtb330NoibaKzIgVeSOYOgTSGx2VMwj7xguD9LvvhqosBOl++f2WfghDeU7OaJB58BUH2ka/uQhtMy8MzS/QYzI13BX5KD2KMldE/FUvENTDVGnaDvm8UsXhu/FnNsMS1xgkuZzW8T/RDYGxNC+qVFkpYUES0nL4Y1PaaI961PmG2FgF+HXYguWotG9yLRK19jfk6pEJLJrLz4hbmtDNeLBFmuEpU7OakXOMqS7dX0cE9cQ
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=Gs/RIcRi5nOkwcSSEB/u1c2Mm8UyTVqDaz0pjaD3Yck=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1765968338; v=1;
 b=SAsl1I9+ajADD6r8YIvyYLi979rikqG2yRS6EGfLcZUB1dw+sB8ZHYsKx3eHCFuYS07zcKnW
 lMWAUf569C7kO8pUW0cKJQbBBIyZuivXz5COviLxZxzR3rU4OuhWc/MM28WNu9z/Hy2pU/82jU3
 kb9zwvRFoVvBgxeaHjeS+j8LBTku7sUa1lfAFcqNs7SbKhL5jUBgtKiYtU8+FIPDOmK1Nx0eo0I
 AZn3VEgqUsG2w7ffTtskYndnsU0X8nv/Cdm2MGPYX5d+cUxCUpwpTNUua8ihiuh8a+rUOuYnks0
 QK0HfGhEk6n0N2WQ2JAZ006C6efy9uS8062VgT2UNOw9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=SAsl1I9+
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-111S0059929cad9-4b5c-4a02-a115-9d8c0510cd04,
 4C433822E3DABC298646871AECD04F63782792CD)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH] pixman: fix NEON support on AArch64
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiAxMi8xNy8yNSAxMTozOSBBTSwgU8OpYmFzdGllbiBTenltYW5za2kgd3JvdGU6
Cj4gVGhlIHRlc3QgdG8gZW5hYmxlIE5FT04gb24gQUFyY2g2NCBpcyBhcyBmb2xsb3dpbmc6Cj4g
Cj4gaWZlcSAoJChCUjJfYWFyY2g2NCkkKEJSMl9BUk1fQ1BVX0hBU19ORU9OKSx5eSkKPiAKPiBJ
dCBjYW5ub3QgYmUgdG8gdHJ1ZSBhcyAkKEJSMl9hYXJjaDY0KSBhbmQgJChCUjJfQVJNX0NQVV9I
QVNfTkVPTikgYXJlCj4gbXV0dWFsbHkgZXhjbHVzaXZlLiBORU9OIGlzIGNvbXB1bHNvcnkgb24g
QUFyY2g2NCBzbyByZW1vdmUKPiAkKEJSMl9BUk1fQ1BVX0hBU19ORU9OKSBmcm9tIHRoZSB0ZXN0
Lgo+IAo+IChjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDMyZmU0NzMyY2E0NDFiNzEzNjliZTBh
NWU5YWM2OTcwZjQ5YjBjNTUpCgpJZ25vcmUgdGhpcyBwYXRjaCBwbGVhc2UuLi4gSSB3aWxsIHNl
bmQgYSB2Mi4KClJlZ2FyZHMsCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFu
c2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiAtLS0KPiAgIHBhY2thZ2Uv
cGl4bWFuL3BpeG1hbi5tayB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BpeG1hbi9waXhtYW4u
bWsgYi9wYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsKPiBpbmRleCAxYjY2YjQxNzE5MjUuLjg3ZDk3
MzIzMGY3OCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsKPiArKysgYi9w
YWNrYWdlL3BpeG1hbi9waXhtYW4ubWsKPiBAQCAtNjgsNyArNjgsNyBAQCBlbHNlCj4gICBQSVhN
QU5fQ09ORl9PUFRTICs9IC1EbmVvbj1kaXNhYmxlZAo+ICAgZW5kaWYKPiAgIAo+IC1pZmVxICgk
KEJSMl9hYXJjaDY0KSQoQlIyX0FSTV9DUFVfSEFTX05FT04pLHl5KQo+ICtpZmVxICgkKEJSMl9h
YXJjaDY0KSx5KQo+ICAgUElYTUFOX0NPTkZfT1BUUyArPSAtRGE2NC1uZW9uPWVuYWJsZWQKPiAg
IGVsc2UKPiAgIFBJWE1BTl9DT05GX09QVFMgKz0gLURhNjQtbmVvbj1kaXNhYmxlZAo+IAo+IC0t
LQo+IGJhc2UtY29tbWl0OiAxN2Q4MzkyNjAzMmJmYTY5MjkzYjk5NDQ3M2U1OTkxNTlhMGZjOGNi
Cj4gY2hhbmdlLWlkOiAyMDI1MTIxNy1waXhtYW4tYWFyY2g2NC1uZW9uLWZpeC0xNmZlYzZiN2Iw
ZmYKPiAKPiBCZXN0IHJlZ2FyZHMsCgoKLS0gClPDqWJhc3RpZW4gU3p5bWFuc2tpLCBBcm1hZGV1
cyBTeXN0ZW1zClNvZnR3YXJlIGVuZ2luZWVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
