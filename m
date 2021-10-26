Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B07C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:02:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACD0060F9B
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACD0060F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7093D60ACA;
	Tue, 26 Oct 2021 20:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lpNHzWGftc0v; Tue, 26 Oct 2021 20:01:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFAD0607AE;
	Tue, 26 Oct 2021 20:01:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8914A1BF20D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83B204011F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:01:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z42GyteABJRc for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 20:01:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77082400ED
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 20:01:54 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w15so1068280edc.9
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 13:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=huwBeyVC2cQv+4KDVw3kja+7ZO9XK1Qf2IZTf4FxRDY=;
 b=UaP91rIY2Nyy/+NARuNBLlnDOhok85rrt11ekBye/CKDXNc2BUQYSjpQWQNsSVxB9I
 5F4IhVGS5kybkin6j066X+OjVQjSxF+RE8BqocPJij+XKrku4pWg18yocgMmywMsDhBx
 zhPSWKbC6T+82SXA8Ihg1prSZjOoY77cBYSZ9yE+K/q0Fo47ei92B6xkp8nOBMh53c44
 F29U/3CsekoWj3MwDAlqWGS9qA2lP/m95b9b05TCQSsbcmncGxFOvwU/GF/5ws1dp8Cu
 29LDnCjRmdK0laA9zYM1WkdxiI9ejCkpcVhpuHUJOIbI4Klma/HUfWohtrA1HOzvArfI
 Sb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=huwBeyVC2cQv+4KDVw3kja+7ZO9XK1Qf2IZTf4FxRDY=;
 b=Y7L+cd68azx2919UqKAIuWSpZuZvLgKHNEuWqlE4tJX/BjqGAE+8WdECb1xkmPQDgT
 viRWGbxUy5NHQPgEPXCrw4GKmmkAst6a0rCULLZtBEl59nhG24BLGlU6vGihpnUliIJP
 kSaabqdflhXI+ZfwbG6CrReXSpBvfyUXKEqw7ugWLl6EOT3VgpC868eBG2faVclN9182
 fz70i8efGK55b3BJS+wZGV42gIpRHY6Pb/AXEORzlKZlqskRtl38N6un4n4axIN87Ukd
 3qguQdfTXIZmzyea3lFXKHxI0b+oAPOt/cHQ254PrTv8VfkW0mmAnkS31M9py04UC/u+
 QLsA==
X-Gm-Message-State: AOAM530M251mSSvLJ0gKhaG+TkRX6mDLkgObPhAE6bwuuMJvFCvCdTvm
 JPe6PsYueZIpI+xyo2I90AxK5w==
X-Google-Smtp-Source: ABdhPJz5HhZphyVyJU4F+XTwqdKWgL1+3gK0lTMMCsDezMiJt1fx9q+8kG3MEJLOVplvc7RZFFYC0Q==
X-Received: by 2002:a05:6402:50d4:: with SMTP id
 h20mr38492347edb.112.1635278512609; 
 Tue, 26 Oct 2021 13:01:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b2sm9776965ejj.124.2021.10.26.13.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:01:52 -0700 (PDT)
Message-ID: <305a05bc-403d-fd28-8579-4d20fe5053a2@mind.be>
Date: Tue, 26 Oct 2021 22:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20211025081955.1215401-1-jose.pekkarinen@unikie.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025081955.1215401-1-jose.pekkarinen@unikie.com>
Subject: Re: [Buildroot] [PATCH v3] package/softhsm2: new package
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

CgpPbiAyNS8xMC8yMDIxIDEwOjE5LCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+IFRoZSBwYXRj
aCBhZGRzIGEgcGFja2FnZSBmb3Igc29mdGhzbTIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kg
UGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Cj4gLS0tCj4gWyB2MSAtPiB2
MiBdCj4gICAgLSBBZGRlZCBoYXNoIGZpbGUgYW5kIGxpY2Vuc2UgaW5mb3JtYXRpb24KPiAgICAt
IE1vdmVkIHJlY2lwZSB0byB1c2UgdGFyYmFsbAo+ICAgIC0gUHJvdmlkZWQgc3VwcG9ydCB0byBi
dWlsZCBhZ2FpbnN0IGRpZmZlcmVudCBzc2wgbGlicmFyaWVzCj4gICAgLSBGaXhlZCB0b29sY2hh
aW4gZGVwZW5kZW5jaWVzIGFuZCBzc2wgc2VsZWN0Cj4gICAgLSBSZWZlcmVuY2VkIHRoZSBwYWNr
YWdlIGluIHBhY2thZ2UvQ29uZmlnLmluCj4gICAgLSBBZGRlZCBteXNlbGYgYXMgZGV2ZWxvcGVy
Cj4gWyB2MiAtPiB2MyBdCj4gICAgLSBGaXggaW5kZW50YXRpb24gaW4gQ29uZmlnLmluIGFuZCBo
YXNoIGZpbGUKPiAgICAtIFJlbW92ZWQgY2hvaWNlIGluIENvbmZpZy5pbgo+ICAgIC0gQWRkZWQg
ZGVwZW5kZW5jaWVzIHRvIHRvb2xjaGFpbiBjb21tZW50Cj4gICAgLSBSZW1vdmVkIGF1dG9yZWNv
bmYgZmxhZyBpbiByZWNpcGUKPiAKPiAgIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICB8
ICAzICsrKwo+ICAgcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgIHwgIDEgKwo+ICAgcGFj
a2FnZS9zb2Z0aHNtMi9Db25maWcuaW4gICAgIHwgMTggKysrKysrKysrKysrKysrKysrCj4gICBw
YWNrYWdlL3NvZnRoc20yL3NvZnRoc20yLmhhc2ggfCAgNCArKysrCj4gICBwYWNrYWdlL3NvZnRo
c20yL3NvZnRoc20yLm1rICAgfCAxNSArKysrKysrKysrKysrKysKPiAgIDUgZmlsZXMgY2hhbmdl
ZCwgNDEgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc29mdGhz
bTIvQ29uZmlnLmluCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zb2Z0aHNtMi9zb2Z0
aHNtMi5oYXNoCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zb2Z0aHNtMi9zb2Z0aHNt
Mi5tawo+IAo+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IGY2
YzM5NTE2YjUuLjgzZDIwZDU2Y2MgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RF
VkVMT1BFUlMKPiBAQCAtMjkyNywzICsyOTI3LDYgQEAgRjoJcGFja2FnZS9xanNvbi8KPiAgIEY6
CXBhY2thZ2UvcXVhemlwLwo+ICAgRjoJcGFja2FnZS9zaGFwZWxpYi8KPiAgIEY6CXBhY2thZ2Uv
dGluYy8KPiArCj4gK046CUpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUu
Y29tPgoKICBJJ3ZlIHB1dCB5b3UgYWxwaGFiZXRpY2FsbHkgd2l0aCB0aGUgb3RoZXIgSm9zZcyB
LgoKICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKCj4g
K0Y6CXBhY2thZ2Uvc29mdGhzbTIvCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIv
cGFja2FnZS9Db25maWcuaW4KPiBpbmRleCA3OTcxNzI2ODc1Li40ZjljZDM4YTk3IDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAt
MjAxOSw2ICsyMDE5LDcgQEAgbWVudSAiU2VjdXJpdHkiCj4gICAJc291cmNlICJwYWNrYWdlL2xp
YnNlbWFuYWdlL0NvbmZpZy5pbiIKPiAgIAlzb3VyY2UgInBhY2thZ2UvbGlic2Vwb2wvQ29uZmln
LmluIgo+ICAgCXNvdXJjZSAicGFja2FnZS9zYWZlY2xpYi9Db25maWcuaW4iCj4gKwlzb3VyY2Ug
InBhY2thZ2Uvc29mdGhzbTIvQ29uZmlnLmluIgo+ICAgZW5kbWVudQo+ICAgCj4gICBtZW51ICJU
ZXh0IGFuZCB0ZXJtaW5hbCBoYW5kbGluZyIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zb2Z0aHNt
Mi9Db25maWcuaW4gYi9wYWNrYWdlL3NvZnRoc20yL0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNWQ4NDk5N2MwNwo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9wYWNrYWdlL3NvZnRoc20yL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMTggQEAKPiArY29u
ZmlnIEJSMl9QQUNLQUdFX1NPRlRIU00yCj4gKwlib29sICJzb2Z0aHNtMiIKPiArCWRlcGVuZHMg
b24gQlIyX0lOU1RBTExfTElCU1REQ1BQCj4gKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0ND
X0FUX0xFQVNUXzRfOCAjIEMrKzExCj4gKwlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBk
bG9wZW4oKQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5TU0wKPiArCXNlbGVjdCBCUjJfUEFD
S0FHRV9PUEVOU1NMX0ZPUkNFX0xJQk9QRU5TU0wKPiArCWhlbHAKPiArCSAgU29mdEhTTSBpcyBh
biBpbXBsZW1lbnRhdGlvbiBvZiBhIGNyeXB0b2dyYXBoaWMgc3RvcmUKPiArCSAgYWNjZXNzaWJs
ZSB0aHJvdWdoIGEgUEtDUyMxMSBpbnRlcmZhY2UuIFlvdSBjYW4gdXNlIGl0Cj4gKwkgIHRvIGV4
cGxvcmUgUEtDUyMxMSB3aXRob3V0IGhhdmluZyBhIEhhcmR3YXJlIFNlY3VyaXR5Cj4gKwkgIE1v
ZHVsZS4KPiArCj4gKwkgIGh0dHBzOi8vd3d3Lm9wZW5kbnNzZWMub3JnL3NvZnRoc20KPiArCj4g
K2NvbW1lbnQgInNvZmhzbTIgbmVlZHMgYSB0b29sY2hhaW4gdy8gQysrLCBnY2MgPj0gNC44IGFu
ZCBkeW5hbWljIGxpYnJhcnkgc3VwcG9ydCIKPiArCWRlcGVuZHMgb24gIUJSMl9JTlNUQUxMX0xJ
QlNURENQUCB8fCBCUjJfU1RBVElDX0xJQlMgfHwgXAo+ICsJCSFCUjJfVE9PTENIQUlOX0dDQ19B
VF9MRUFTVF80XzgKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zb2Z0aHNtMi9zb2Z0aHNtMi5oYXNo
IGIvcGFja2FnZS9zb2Z0aHNtMi9zb2Z0aHNtMi5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwLi5mNTlmMGJmMDI4Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Bh
Y2thZ2Uvc29mdGhzbTIvc29mdGhzbTIuaGFzaAo+IEBAIC0wLDAgKzEsNCBAQAo+ICsjIEZyb20g
aHR0cHM6Ly93d3cub3BlbmRuc3NlYy5vcmcvMjAyMC8wNC8xNjAyLwo+ICtzaGEyNTYgIDYxMjQ5
NDczMDU0YmNkMTgxMTUxOWVmOWE5ODlhODgwYTdiZGNjMzZkMzE3YzljMjU0NTdmYzYxNGRmNDc1
ZjIgIHNvZnRoc20tMi42LjEudGFyLmd6Cj4gKyMgTG9jYWxseSBjb21wdXRlZAo+ICtzaGEyNTYg
IDIzMGNhYjcxMDI4MTZlOTlmN2NlMDNlZjQ3NjM1MmZjYWQwOWQ3NDJmY2JjNjU4MGQ0NDM5M2Ri
NjI4MGI2NGMgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zb2Z0aHNtMi9zb2Z0aHNt
Mi5tayBiL3BhY2thZ2Uvc29mdGhzbTIvc29mdGhzbTIubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAuLmM0MThlMzY0OGUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
cGFja2FnZS9zb2Z0aHNtMi9zb2Z0aHNtMi5tawo+IEBAIC0wLDAgKzEsMTUgQEAKPiArIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIHNvZnRoc20yCj4gKyMKPiArIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiArCj4gK1NPRlRIU00yX1ZFUlNJT04gPSAyLjYuMQo+ICtTT0ZUSFNNMl9T
T1VSQ0UgPSBzb2Z0aHNtLSQoU09GVEhTTTJfVkVSU0lPTikudGFyLmd6Cj4gK1NPRlRIU00yX1NJ
VEUgPSBodHRwczovL2Rpc3Qub3BlbmRuc3NlYy5vcmcvc291cmNlCj4gK1NPRlRIU00yX0xJQ0VO
U0UgPSBCU0QtMi1DbGF1c2UKPiArU09GVEhTTTJfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiAr
U09GVEhTTTJfREVQRU5ERU5DSUVTID0gb3BlbnNzbAo+ICtTT0ZUSFNNMl9JTlNUQUxMX1NUQUdJ
TkcgPSBZRVMKPiArCj4gKyQoZXZhbCAkKGF1dG90b29scy1wYWNrYWdlKSkKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
