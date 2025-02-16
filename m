Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90553C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 13:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0314F41292;
	Sun, 16 Feb 2025 13:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFwH9qq27sW2; Sun, 16 Feb 2025 13:53:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D89E0410C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D89E0410C2;
	Sun, 16 Feb 2025 13:53:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CB03DE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D01B81B9A
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgWqAuwFrJLJ for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 13:53:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 104BB81959
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 104BB81959
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 104BB81959
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:53:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C09EC780375;
 Sun, 16 Feb 2025 14:53:27 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 14:53:27 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 14:53:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org
In-Reply-To: <20250213181552.966148-1-alex.bennee@linaro.org>
References: <20250213181552.966148-1-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.9
Message-ID: <4ba0807457c978a21fb6b77c8d767c4e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739714008;
 bh=vp2WBXqmFL1xcz0emfd8YmaxIydEa9TDoq1WLA52fac=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NADXA/kbrc9hpcSSFkYHVwpsEnnqeRxSubYAPPcG1zdOu23QT+41SwBb+kjt4MutE
 MxEYxo/4VWOvsPm/iF5AEOIgJSAhypuapdeN1PaCMLxx60LaC7Aq9lr/NWnbjS7nfg
 EVjVlgrkVv86vAJOpjjd+RbshVcD82mJNM+loRp6tvYUH4ZVpcJ5VtIomEJDBwlVy1
 HnVM83iYRnGEeHbrtc5hF4i91SdaTWLV6bLaMs47w11Ifb3I9zhu32ZfhKtuR4DKA9
 6ZAoQNG2WByzrhN90JYuBHx9qWUCCaeBxisWYB0+ciekVAJZ11GsUosa2OAP1WeGcz
 4YowVkqdydDwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NADXA/kb
Subject: Re: [Buildroot] [PATCH] package/elfutils: ensure we have 5.0 kernel
 headers
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

SGkgQWxleCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoISAgSSBoYXZlIGZldyBjb21tZW50cyBvbiBp
dC4KCkNvdWxkIHJlZmluZSB0aGUgcGF0Y2ggdGl0bGUgd2l0aDoKInBhY2thZ2UvZWxmdXRpbHM6
IGVuc3VyZSB3ZSBoYXZlIDUuMCBrZXJuZWwgaGVhZGVycyBmb3IgYWFyY2g2NCIKdG8gYmV0dGVy
IHJlZmxlY3Qgd2hhdCBpdCBpcyBjaGFuZ2luZy4KCk9uIDEzLzAyLzIwMjUgMTk6MTUsIEFsZXgg
QmVubsOpZSB3cm90ZToKPiBJdCBzZWVtcyBzb21lIG9mIHRoZSBleHRlcm5hbCB0b29sY2hhaW5z
IGhhdmUgZmFpcmx5IG9sZCBoZWFkZXJzLiBUaGlzCj4gY2FuIGNhdXNlIGEgYnVpbGQgZmFpbHVy
ZSBvZiBlbGZ1dGlscyBvbiBBYXJjaDY0IGR1ZSB0byBhIG1pc3NpbmcKPiBkZWZpbml0aW9uIG9m
IHN0cnVjdCB1c2VyX3BhY19tYXNrLgo+IAo+IFByZXZlbnQgdGhlIHVzZXIgc2VsZWN0aW5nIGVs
ZnV0aWxzIHVubGVzcyB0aGUga2VybmVsIGhlYWRlcnMgd2lsbAo+IGFsbG93IGl0IHRvIGJ1aWxk
LgoKQ291bGQgeW91IGFkZCBtb3JlIGluZm9ybWF0aW9uIGluIHRoZSBjb21taXQgbG9nOgotIHdo
ZW4gdGhlIHJlcXVpcmVtZW50IHdhcyBpbnRyb2R1Y2VkIHVwc3RyZWFtLAotIHdoZW4gaXQgc3Rh
cnRlZCB0byBmYWlsIGluIEJ1aWxkcm9vdCwKLSBkZXRhaWwgb2YgdGhlIGVycm9yLAotIGxpbmtz
IHRvIHJlc29sdmVkIGF1dG9idWlsZCBmYWlsdXJlcyBpZiBhbnkuCgpGb3IgZXhhbXBsZToKCiIi
IgpTaW5jZSBCdWlsZHJvb3QgY29tbWl0IFsxXSAicGFja2FnZS9lbGZ1dGlsczogYnVtcCB0byB2
ZXJzaW9uIDAuMTkyIgplbGZ1dGlscyBmYWlscyB0byBidWlsZCBvbiBBYXJjaDY0IHdpdGggdG9v
bGNoYWluIGluY2x1ZGluZyBLZXJuZWwgb2xkZXIKdGhhbiB2ZXJzaW9uIDUuMC4gRXJyb3Igc2hv
d3M6CgogICAgIGFhcmNoNjRfaW5pdHJlZy5jOiBJbiBmdW5jdGlvbiAnYWFyY2g2NF9zZXRfaW5p
dGlhbF9yZWdpc3RlcnNfdGlkJzoKICAgICBhYXJjaDY0X2luaXRyZWcuYzo2MToyNDogZXJyb3I6
IHN0b3JhZ2Ugc2l6ZSBvZiAncGFjX21hc2snIGlzbid0IAprbm93bgogICAgICAgIDYxIHwgICBz
dHJ1Y3QgdXNlcl9wYWNfbWFzayBwYWNfbWFzazsKICAgICAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgXn5+fn5+fn4KCmVsZnV0aWxzIDAuMTkyIGludHJvZHVjZWQgYSBBYXJjaDY0IHBv
aW50ZXIgYXV0aGVudGljYXRpb24gc3VwcG9ydCBpbgp1cHN0cmVhbSBjb21taXQgWzJdLgoKRm9y
IHJlZmVyZW5jZSwgdGhlIHVzZXJfcGFjX21hc2sgc3RydWN0dXJlIHdhcyBpbnRyb2R1Y2VkIGlu
IEtlcm5lbAp1cHN0cmVhbSBjb21taXQgWzNdLCBpbmNsdWRlZCBpbiBLZXJuZWwgdjUuMC4KCkZp
eGVzOgotIApodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNTE1NjkwMWE3
M2JlNTJjZThmZmJmMTA3MjllNjg1MjQ5OWEzMDBiZS8KLSBhbmQgbWFueSBvdGhlcnMuLi4KClsx
XSAKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzVl
YjczNDc2NmIyNGRlNWZjZTZlNTg2ODk3Y2Q0ODI3Zjg4NTU0NDIKWzJdIApodHRwczovL3NvdXJj
ZXdhcmUub3JnL2dpdC8/cD1lbGZ1dGlscy5naXQ7YT1jb21taXRkaWZmO2g9NjRlM2I0NTFhZDJj
ZWM4ZDQ1NjYxYjE4MTZlM2QyZGM0NDMxZjNjYQpbM10gCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0Lz9pZD1lYzZl
ODIyZDFhMjJkMGVlZjFkMWZhMjYwZGZmNzUxZGJhOWE0MjU4CiIiIgoKPiBTaWduZWQtb2ZmLWJ5
OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4gLS0tCj4gIHBhY2thZ2Uv
ZWxmdXRpbHMvQ29uZmlnLmluIHwgNiArKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9lbGZ1dGls
cy9Db25maWcuaW4gYi9wYWNrYWdlL2VsZnV0aWxzL0NvbmZpZy5pbgo+IGluZGV4IGMzNTUwNDhj
NmQuLjQ5OTViNGYwZDIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9lbGZ1dGlscy9Db25maWcuaW4K
PiArKysgYi9wYWNrYWdlL2VsZnV0aWxzL0NvbmZpZy5pbgo+IEBAIC0xLDEyICsxLDE0IEBACj4g
LWNvbW1lbnQgImVsZnV0aWxzIG5lZWRzIGEgdG9vbGNoYWluIHcvIHdjaGFyLCBkeW5hbWljIGxp
YnJhcnksIAo+IHRocmVhZHMiCj4gK2NvbW1lbnQgImVsZnV0aWxzIG5lZWRzIGEgdG9vbGNoYWlu
IHcvIHdjaGFyLCBkeW5hbWljIGxpYnJhcnksIAo+IHRocmVhZHMsIChrZXJuZWwgaGVhZGVycyA+
NS4wIGZvciBBQXJjaDY0KSIKCkhlcmUsIHRoZSBzaG93biBjb25kaXRpb24gc2hvdWxkIGJlOgoi
a2VybmVsIGhlYWRlcnMgPj0gNS4wIGZvciBBQXJjaDY0Ii4KCj4gIAlkZXBlbmRzIG9uICFCUjJf
VVNFX1dDSEFSIHx8IEJSMl9TVEFUSUNfTElCUyBcCj4gLQkJfHwgIUJSMl9UT09MQ0hBSU5fSEFT
X1RIUkVBRFMKPiArCQl8fCAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyBcCj4gKwkJJiYgKEJS
Ml9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF81XzAgfHwgIUJSMl9hYXJjaDY0KQoKV2Ugd2Fu
dCB0byBkaXNwbGF5IHRoZSBjb21tZW50IHdoZW4gdGhlIGNvbmRpdGlvbiBpcyBub3QgbWV0LiBT
bwp0aGUgY29uZGl0aW9uIHNob3VsZCBiZSByZXZlcnNlZCB0bzoKCiAgICAgfHwgKCFCUjJfVE9P
TENIQUlOX0hFQURFUlNfQVRfTEVBU1RfNV8wICYmIEJSMl9hYXJjaDY0KQoKPiAKPiAgY29uZmln
IEJSMl9QQUNLQUdFX0VMRlVUSUxTCj4gIAlib29sICJlbGZ1dGlscyIKPiAgCWRlcGVuZHMgb24g
QlIyX1VTRV9XQ0hBUgo+ICAJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTCj4gIAlkZXBlbmRz
IG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKPiArCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJ
Tl9IRUFERVJTX0FUX0xFQVNUXzVfMCB8fCAhQlIyX2FhcmNoNjQgIyAKPiB1c2VyX3BhY19tYXNr
CgpUaGVyZSBpcyBzZXZlcmFsIHBhY2thZ2VzIHNlbGVjdGluZyBlbGZ1dGlscy4gU28gdGhpcyBw
YXRjaCBzaG91bGQKcHJvcGFnYXRlIHRoaXMgY29uZGl0aW9uIG9uIHRoZW0uIFNlZSB0aGUgb3V0
cHV0IG9mIHRoZSBjb21tYW5kOgoKICAgICBnaXQgZ3JlcCAnc2VsZWN0IEJSMl9QQUNLQUdFX0VM
RlVUSUxTJyBwYWNrYWdlLyovQ29uZmlnLmluCgpUaGlzIG1lYW5zIHRob3NlIHBhY2thZ2Ugc2hv
dWxkIGhhdmUgYSBsaW5lOgoKICAgICBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEVBREVSU19B
VF9MRUFTVF81XzAgfHwgIUJSMl9hYXJjaDY0ICMgCmVsZnV0aWxzCgppbiB0aGVpciBDb25maWcu
aW4uCgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1pMSUIKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9B
UkdQX1NUQU5EQUxPTkUgaWYgIUJSMl9UT09MQ0hBSU5fVVNFU19HTElCQwo+ICAJc2VsZWN0IEJS
Ml9QQUNLQUdFX01VU0xfRlRTIGlmICFCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMKPiAtLQo+IDIu
MzkuNQoKQ291bGQgeW91IHNlbmQgYSB2MiBhZGRyZXNzaW5nIHRob3NlIGNvbW1lbnRzLCBwbGVh
c2U/CgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
