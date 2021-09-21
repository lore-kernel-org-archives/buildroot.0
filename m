Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BD6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:42:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FEA961156
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FEA961156
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4597E83E4A;
	Tue, 21 Sep 2021 20:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VV7DIPaxgKO9; Tue, 21 Sep 2021 20:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FD1B83E4B;
	Tue, 21 Sep 2021 20:42:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E57A81BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D317B83E4B
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8juW03l0o78 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:42:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8E8683E4A
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:42:53 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id u27so1177461edi.9
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UgHv+99yikIBwG6S9jsnoZ3BR4AummLba9k2OOPvtI4=;
 b=ZLY3ovo/moBRosGREmup7ZPTSybwPMxmabcpxRsd/b1QkwER3Na2qUAnfAXd+J+3os
 bVkVyq1fNQ/skMNfhNf9AMjEJwyyc0mTG1PhQnQOyg+9o4TTDOoOHPOEOPEXJekmWAPK
 xGkuPDGY+n0RbR0pFczJ7dLhPl8qH1hkh6oBsoqgBzW5r1m0WCMEudXxFxtSzxkgsqFL
 rEvw9yrwCHntz6JiTphq1zb2vDRUZ2qV60VTh4L4ONqNG0I/4X88SV4NJKCvLToVsPhz
 vrJvviHhVUREPVlpd0TfKbVohdJKI8MGoiqrcXTTcPBxyd03BTZnvIvjdrQOgEtg8ONo
 uKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UgHv+99yikIBwG6S9jsnoZ3BR4AummLba9k2OOPvtI4=;
 b=jt4nhxdCYKo/0xedzfAh0u1sNIFqWw0Nt5YnpKYw4SNr41nr+ZdcshOh5mPf/CAhrY
 3bD4AJTT8jWEZQ9s9l2JIuVhM5yum5H0vYp3KbbT89V59Q0g/V4zPEvA6+MOVtr8MCVI
 HXaLJMlipU+rhfLa9esKeVv0G4NvqlEmgakEj9Gye1iUnlbr/i0wE+allMKAuj3cjntp
 DKaPytiAq0J52jkKYmiKrbNZnr01/4EmCBMC/wudooVTKHoDlg9MHXM6j7vRkOmB7Y1v
 Ip/OmqFjTZ9KZeFzZH0oNQW5AadSC5AInFIkbH/gJM5ihIdBqImUZJvhw00aAgOZpFi6
 U21Q==
X-Gm-Message-State: AOAM530WBVd2RW/9JlJ5TSsrDpfVwesoCqLApd/4fjsGg0sYpNVU0mtB
 Rcgw5X+EN0OZlqE1o9HCayNFTw==
X-Google-Smtp-Source: ABdhPJyaTjchW/FW3tCGIlXT6FI4gqLpI5Rjs/l5uDim9FigOJpvpif2ufnNEGeixFeAcp1YvSCa8A==
X-Received: by 2002:a05:6402:5250:: with SMTP id
 t16mr38199357edd.227.1632256971853; 
 Tue, 21 Sep 2021 13:42:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 10sm13839eju.12.2021.09.21.13.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 13:42:51 -0700 (PDT)
Message-ID: <c4fe9dcd-54c7-80bf-3327-ca071eb01ac1@mind.be>
Date: Tue, 21 Sep 2021 22:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210912220457.1007342-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210912220457.1007342-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wireplumber: new package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

CgpPbiAxMy8wOS8yMDIxIDAwOjA0LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KCiAgQXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gLS0tCj4gICBwYWNr
YWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gICBwYWNrYWdlL3dpcmVw
bHVtYmVyL0NvbmZpZy5pbiAgICAgICAgfCAyMiArKysrKysrKysrKysrKysrCj4gICBwYWNrYWdl
L3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLmhhc2ggfCAgMyArKysKPiAgIHBhY2thZ2Uvd2lyZXBs
dW1iZXIvd2lyZXBsdW1iZXIubWsgICB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgIDQgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2Uvd2lyZXBsdW1iZXIvQ29uZmlnLmluCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS93aXJlcGx1bWJlci93aXJlcGx1bWJlci5oYXNoCj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS93aXJlcGx1bWJlci93aXJlcGx1bWJlci5tawo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5kZXggODk5YjQ5MzE4MC4u
ZjJmODBkYTNmZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2th
Z2UvQ29uZmlnLmluCj4gQEAgLTE1MzksNiArMTUzOSw3IEBAIG1lbnUgIkdyYXBoaWNzIgo+ICAg
CXNvdXJjZSAicGFja2FnZS93YXlsYW5kcHAvQ29uZmlnLmluIgo+ICAgCXNvdXJjZSAicGFja2Fn
ZS93ZWJraXRndGsvQ29uZmlnLmluIgo+ICAgCXNvdXJjZSAicGFja2FnZS93ZWJwL0NvbmZpZy5p
biIKPiArCXNvdXJjZSAicGFja2FnZS93aXJlcGx1bWJlci9Db25maWcuaW4iCj4gICAJc291cmNl
ICJwYWNrYWdlL3dscm9vdHMvQ29uZmlnLmluIgo+ICAgCXNvdXJjZSAicGFja2FnZS93b2ZmMi9D
b25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL3dwZWJhY2tlbmQtZmRvL0NvbmZpZy5pbiIK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93aXJlcGx1bWJlci9Db25maWcuaW4gYi9wYWNrYWdlL3dp
cmVwbHVtYmVyL0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMC4uNjUyOGEyZTEwMgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3dpcmVwbHVt
YmVyL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMjIgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1dJ
UkVQTFVNQkVSCj4gKwlib29sICJ3aXJlcGx1bWJlciIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tB
R0VfUElQRVdJUkUKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTFVBXzVfMyB8fCBCUjJfUEFD
S0FHRV9MVUFfNV80Cj4gKwlkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBsaWJnbGliMgo+ICsJ
ZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgbGliZ2xpYjIKPiArCWRlcGVu
ZHMgb24gQlIyX1VTRV9NTVUgIyBsaWJnbGliMgo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkdM
SUIyCj4gKwloZWxwCj4gKwkgIFdpcmVQbHVtYmVyIGlzIGEgbW9kdWxhciBzZXNzaW9uIC8gcG9s
aWN5IG1hbmFnZXIgZm9yCj4gKwkgIFBpcGVXaXJlIGFuZCBhIEdPYmplY3QtYmFzZWQgaGlnaC1s
ZXZlbCBsaWJyYXJ5IHRoYXQKPiArCSAgd3JhcHMgUGlwZVdpcmXigJlzIEFQSSwgcHJvdmlkaW5n
IGNvbnZlbmllbmNlIGZvciB3cml0aW5nCj4gKwkgIHRoZSBkYWVtb27igJlzIG1vZHVsZXMgYXMg
d2VsbCBhcyBleHRlcm5hbCB0b29scyBmb3IKPiArCSAgbWFuYWdpbmcgUGlwZVdpcmUuCj4gKwo+
ICsJICBodHRwczovL3BpcGV3aXJlLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy93aXJlcGx1bWJlci8K
PiArCj4gK2NvbW1lbnQgIndpcmVwbHVtYmVyIG5lZWRzIGEgdG9vbGNoYWluIHcvIHdjaGFyLCB0
aHJlYWRzIGFuZCBMdWEgPj0gNS4zIgo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9QSVBFV0lS
RQo+ICsJZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+ICsJZGVwZW5kcyBvbiAhQlIyX1VTRV9XQ0hB
UiB8fCAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyB8fCBcCj4gKwkJKCFCUjJfUEFDS0FHRV9M
VUFfNV8zICYmICFCUjJfUEFDS0FHRV9MVUFfNV80KQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dp
cmVwbHVtYmVyL3dpcmVwbHVtYmVyLmhhc2ggYi9wYWNrYWdlL3dpcmVwbHVtYmVyL3dpcmVwbHVt
YmVyLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjU2MWZj
YzJlNWUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS93aXJlcGx1bWJlci93aXJlcGx1
bWJlci5oYXNoCj4gQEAgLTAsMCArMSwzIEBACj4gKyMgTG9jYWxseSBjYWxjdWxhdGVkCj4gK3No
YTI1NiAgNDFmMTc0ZWFhZTVhNjMwZTE5NTAwMWZkZDU4MDkxOGZhNTE0M2E3MWVkY2ViMDUwYjMy
MGY4NWE4ZTY1ZTUzYiAgd2lyZXBsdW1iZXItMC40LjIudGFyLmJ6Mgo+ICtzaGEyNTYgIGZmMmVi
OWFmNWIwNWQ5MmFjM2EzOGNmZmNhZDI3NTgyZWY1NTVhMzFmZjE3ODFlMWMxZDRlMDg3Zjc3Yzlj
ODEgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93aXJlcGx1bWJlci93aXJlcGx1bWJl
ci5tayBiL3BhY2thZ2Uvd2lyZXBsdW1iZXIvd2lyZXBsdW1iZXIubWsKPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjJkYWI2MDQyZWEKPiAtLS0gL2Rldi9udWxsCj4g
KysrIGIvcGFja2FnZS93aXJlcGx1bWJlci93aXJlcGx1bWJlci5tawo+IEBAIC0wLDAgKzEsMzkg
QEAKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIHdpcmVwbHVtYmVyCj4gKyMK
PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK1dJUkVQTFVNQkVSX1ZFUlNJT04gPSAw
LjQuMgo+ICtXSVJFUExVTUJFUl9TT1VSQ0UgPSB3aXJlcGx1bWJlci0kKFdJUkVQTFVNQkVSX1ZF
UlNJT04pLnRhci5iejIKPiArV0lSRVBMVU1CRVJfU0lURSA9IGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9waXBld2lyZS93aXJlcGx1bWJlci8tL2FyY2hpdmUvJChXSVJFUExVTUJFUl9W
RVJTSU9OKQo+ICtXSVJFUExVTUJFUl9MSUNFTlNFID0gTUlUCj4gK1dJUkVQTFVNQkVSX0xJQ0VO
U0VfRklMRVMgPSBMSUNFTlNFCj4gK1dJUkVQTFVNQkVSX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtn
Y29uZiBkYnVzIHBpcGV3aXJlIGxpYmdsaWIyIGx1YQo+ICsKPiArV0lSRVBMVU1CRVJfQ09ORl9P
UFRTID0gXAo+ICsJLURkb2M9ZGlzYWJsZWQgXAo+ICsJLURzeXN0ZW0tbHVhPXRydWUgXAo+ICsJ
LURzeXN0ZW0tbHVhLXZlcnNpb249Cj4gKwo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0dPQkpFQ1Rf
SU5UUk9TUEVDVElPTikseSkKPiArV0lSRVBMVU1CRVJfREVQRU5ERU5DSUVTICs9IGdvYmplY3Qt
aW50cm9zcGVjdGlvbgo+ICtXSVJFUExVTUJFUl9DT05GX09QVFMgKz0gLURpbnRyb3NwZWN0aW9u
PWVuYWJsZWQKPiArZWxzZQo+ICtXSVJFUExVTUJFUl9DT05GX09QVFMgKz0gLURpbnRyb3NwZWN0
aW9uPWRpc2FibGVkCj4gK2VuZGlmCj4gKwo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1NZU1RFTUQp
LHkpCj4gK1dJUkVQTFVNQkVSX0RFUEVOREVOQ0lFUyArPSBzeXN0ZW1kCj4gK1dJUkVQTFVNQkVS
X0NPTkZfT1BUUyArPSBcCj4gKwktRHN5c3RlbWQ9ZW5hYmxlZCBcCj4gKwktRHN5c3RlbWQtc3lz
dGVtLXNlcnZpY2U9dHJ1ZSBcCj4gKwktRHN5c3RlbWQtdXNlci1zZXJ2aWNlPXRydWUKPiArZWxz
ZQo+ICtXSVJFUExVTUJFUl9DT05GX09QVFMgKz0gXAo+ICsJLURzeXN0ZW1kPWRpc2FibGVkIFwK
PiArCS1Ec3lzdGVtZC1zeXN0ZW0tc2VydmljZT1mYWxzZSBcCj4gKwktRHN5c3RlbWQtdXNlci1z
ZXJ2aWNlPWZhbHNlCj4gK2VuZGlmCj4gKwo+ICskKGV2YWwgJChtZXNvbi1wYWNrYWdlKSkKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
