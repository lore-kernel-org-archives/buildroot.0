Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9D1D5B169
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 14:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 045E68120D;
	Sun, 14 Dec 2025 14:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5eFixiCMhDvV; Sun, 14 Dec 2025 14:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85AD381202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765723824;
	bh=Wtu0v3ieB35GrBjPcS+hxeMymGK0YxJdxTKVfHCIWw4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FrgAN9DEgEYpl55azh2lL5hnCqM/8xeGH9hRGAC0YM0SpYFIaLqet+HjmEihteNyH
	 SWRwNs2DS/3owRI/Rmw1yVjmqxlkxgiVPSCyBILVbL3Mx/6hfrkVA9AoYI36vCucHq
	 n8KaZwP9xd4o78tWmAu2vF7vXOoE3E1uxNGZ3j6cS2mOHgSzM58DATo9gq1lMyDaG6
	 BARfIjHKA+Y7YsUnoh1Gf8bQSbWQPXCQ8wbt7Je99Z+Vz4j9N4nqznmtyFMm5Dbcmd
	 TOOEq1T7R1Tu8pqI4x7bvnOw46Br8zOkOgxxFdnu565jDtMKvksBBmXH4dmy+/tL9I
	 Cw0dJsfcxoTgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85AD381202;
	Sun, 14 Dec 2025 14:50:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE5A0117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 14:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF71B60D79
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 14:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OkS7N2ftcNhD for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 14:50:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 938CA607AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 938CA607AB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 938CA607AB
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 14:50:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8DE332003B4;
 Sun, 14 Dec 2025 15:50:16 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Dec 2025 15:50:16 +0100
MIME-Version: 1.0
Date: Sun, 14 Dec 2025 15:50:16 +0100
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
In-Reply-To: <5a4160cf-a95b-4238-a899-05f0c1abd71c@smile.fr>
References: <20250824092952.289402-1-thomas.petazzoni@bootlin.com>
 <5a4160cf-a95b-4238-a899-05f0c1abd71c@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <54a20490b138d56d3810afb2ecea5bdc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765723818;
 bh=6Q0HVe08/1G+ZO9DRTo6h88MtKoyFrOHHLqPDQF0j2w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u0eX9eJZrPlQez/UAkslKXtLd4jOFV8ilyt9UcTOchnFmfWhgJjWmBF5sgzTaHYEe
 HsqU4e8VN9SVNpw2j7SN5FGvvgj/pJdDzFkI3gwkT2Y5UCQAo23DZskUYKQBcrxjlj
 ffGq9l66IrJf9yAUHZV5xwZMq30NneoBFjzB2b4TuDOyY5dh+iQ5YiBA4Hd626Jnu2
 YunMpAAKmX1kRV3toupB0gt2/kQEAMSibXvpNyxbPqSAANlZ2CgZ7d6oBJrol7f1sK
 YCgEh2v/QAtNOSl+/DmIfqAWAx97hNGOofJR0Cg4t/x+DUIAyCve/0OkIiCGR9P67h
 +nCQppF5JAgug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=u0eX9eJZ
Subject: Re: [Buildroot] [PATCH] linux: select host-openssl for all
 architectures when building latest version
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

T24gMjQvMDgvMjAyNSAxMjoxMywgUm9tYWluIE5hb3VyIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4g
SGVsbG8gVGhvbWFzLCBBbGwsCj4gCj4gTGUgMjQvMDgvMjAyNSDDoCAxMToyOSwgVGhvbWFzIFBl
dGF6em9uaSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4+IFNpbmNlIGF0IGxlYXN0IExpbnV4
IDYuMTYsIGJ1dCBwb3NzaWJseSBlYXJsaWVyLCBob3N0LW9wZW5zc2wgaXMgbm93Cj4+IG5lZWRl
ZCBvbiB0aGUgdmFzdCBtYWpvcml0eSAoaWYgbm90IGFsbD8pIENQVSBhcmNoaXRlY3R1cmVzLgo+
IAo+IEl0IHNlZW1zIHJlbGF0ZWQgdG8gc2lnbmF0dXJlIHRvb2xzIGJ1aWxkIGZvciB0aGUgaG9z
dCB0aGF0IGFyZSBub3cgCj4gZW5hYmxlZCBieQo+IGRlZmF1bHQ6IENPTkZJR19NT0RVTEVfU0lH
X0tFWSBhbmQgQ09ORklHX01PRFVMRV9TSUdfRk9STUFUOgo+IAo+ICQob2JqKS9zaWduaW5nX2tl
eS54NTA5OiAkKGZpbHRlci1vdXQgCj4gJChQS0NTMTFfVVJJKSwkKENPTkZJR19NT0RVTEVfU0lH
X0tFWSkpCj4gJChvYmopL2V4dHJhY3QtY2VydCBGT1JDRQo+IGNlcnRzL2V4dHJhY3QtY2VydC5j
OjIxOiNpbmNsdWRlIDxvcGVuc3NsL2Jpby5oPgo+IAo+IGhvc3Rwcm9ncy1hbHdheXMtJChDT05G
SUdfTU9EVUxFX1NJR19GT1JNQVQpICs9IHNpZ24tZmlsZQo+IHNjcmlwdHMvc2lnbi1maWxlLmM6
MjU6I2luY2x1ZGUgPG9wZW5zc2wKPiAKPj4gCj4+IEluZGVlZCwgaW4gb3JkZXIgdG8gZml4IGJ1
aWxkIGlzc3Vlcywgd2Ugd291bGQgaGF2ZSB0byBhZGQ6IGFybWViLAo+PiBtaWNyb2JsYXplLCBs
b29uZ2FyY2gsIG02OGssIG1pcHMsIG1pcHNlbCwgbWlwczY0LCBtaXBzNjRlbCwgcG93ZXJwYywK
Pj4gcG93ZXJwYzY0LCBwb3dlcnBjNjRlbCwgcmlzY3YsIHMzOTAsIGFuZCBwb3NzaWJseSBvdGhl
cnMuCj4+IAo+PiBTbyBpbnRlYWQsIHdoZW4gImxhdGVzdCBrZXJuZWwiIGlzIHVzZWQgd2l0aCB0
aGUgZGVmYXVsdCBhcmNoaXRlY3R1cmUKPj4gY29uZmlndXJhdGlvbiwgYWx3YXlzIHNlbGVjdCBo
b3N0LW9wZW5zc2wgaW5kZXBlbmRlbnRseSBvZiB0aGUKPj4gc2VsZWN0ZWQgYXJjaGl0ZWN0dXJl
cy4KPiAKPiBOb3dhZGF5cywgZXZlbiBib290bG9hZGVycyAodS1ib290KSBuZWVkcyBob3N0LW9w
ZW5zc2wKPiAoQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU1NMKQo+IAo+IFJldmlld2VkLWJ5
OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCkFwcGxpZWQgdG8gbWFzdGVy
LiBUaGFua3MuCgpGb3IgaW5mbywgSSBhZGRlZCBleHRyYSBpbmZvIChpbmNsdWRpbmcgd2hhdCBS
b21haW4gcG9pbnRlZCBvdXQpIGluIHRoZSAKY29tbWl0IGxvZzoKaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2JiYTg2MzA0YjBhYzRhZTI2NmNmYjUy
ZTU0YTIzOWIwODUwYjEwY2EKCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+PiAKPj4g
Rml4ZXM6Cj4+IAo+PiAgIAo+PiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3Vs
dHMvOWEzMTRlNzU5Zjc2NDBkNzYwMDAzZTQ2Zjg2MTUzMzAwNDc4ZWM2MC8gCj4+IChtaXBzZWwp
Cj4+ICAgCj4+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8zYmNjNjc0
ZWE1YTdjZGYwMzEyMDBiMGNkMmY5ZjcxNDAwYmEzOTFjLyAKPj4gKG1pcHM2NGVsKQo+PiAgIAo+
PiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYjI0OTgzZmQ5MWY0MDhk
ZTU2NDc5YjdkN2Q1N2ZjOWZkMzMzM2Q3ZC8gCj4+IChzMzkwKQo+PiAgIAo+PiBodHRwczovL2F1
dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYjI2MmZjNmY2N2E5ZmVkNTVmYWZmY2RkNTgw
ZDg5ZjQ2NjRlMWUxNi8gCj4+IChwb3dlcnBjNjQpCj4+ICAgCj4+IGh0dHBzOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy80NWRhMTUzODQ1N2IxODY3MWZhMThlZmUzZTFhYTU3YTE1
NTYxMzcwLyAKPj4gKG02OGspCj4+ICAgCj4+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5u
ZXQvcmVzdWx0cy8wYTQ1NzM3NWQyNTA5ZjFiMjlhNDQ5ZGZhNTBmMjlmYzdlNTZlNTY4LyAKPj4g
KGFybWViKQo+PiAgIAo+PiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMv
ODE0Y2E1ZjA0ODgyN2E2MzVkZWEwMTk5ODc4ZmE4MmQ1MDEyYjY0OS8gCj4+IChsb29uZ2FyY2g2
NCkKPj4gICAKPj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2I2ODRk
MGIzN2U1MTg3YWE5YjMxNjkzMzU2Zjg1MTU4NTdkMTlmN2EvIAo+PiAobWljcm9ibGF6ZSkKPj4g
Cj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9v
dGxpbi5jb20+Cj4+IC0tLQo+PiAgbGludXgvQ29uZmlnLmluIHwgNSArKy0tLQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1n
aXQgYS9saW51eC9Db25maWcuaW4gYi9saW51eC9Db25maWcuaW4KPj4gaW5kZXggYjRiMDI5NWRm
ZS4uNTY0NzNkMWIwMyAxMDA2NDQKPj4gLS0tIGEvbGludXgvQ29uZmlnLmluCj4+ICsrKyBiL2xp
bnV4L0NvbmZpZy5pbgo+PiBAQCAtMTc1LDEyICsxNzUsMTEgQEAgY29uZmlnIEJSMl9MSU5VWF9L
RVJORUxfVVNFX0RFRkNPTkZJRwo+PiAKPj4gIGNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX1VTRV9B
UkNIX0RFRkFVTFRfQ09ORklHCj4+ICAJYm9vbCAiVXNlIHRoZSBhcmNoaXRlY3R1cmUgZGVmYXVs
dCBjb25maWd1cmF0aW9uIgo+PiAtCSMgV2Uga25vdyB0aGF0IHRoZSBkZWZhdWx0IGNvbmZpZ3Vy
YXRpb24gb24gc29tZSBhcmNoaXRlY3R1cmVzCj4+ICsJIyBXZSBrbm93IHRoYXQgdGhlIGRlZmF1
bHQgY29uZmlndXJhdGlvbiBvbiBtYW55IGFyY2hpdGVjdHVyZXMKPj4gIAkjIHJlcXVpcmVzIGhv
c3Qtb3BlbnNzbCwgc28gc2VsZWN0IGl0IGZvciB0aGUgbGF0ZXN0IGtlcm5lbAo+PiAgCSMgdmVy
c2lvbi4gVGhpcyBpcyBtYWlubHkgbmVlZGVkIHRvIGZpeCBhdXRvYnVpbGRlciB0ZXN0aW5nLgo+
PiAgCXNlbGVjdCBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTCBpZiBcCj4+IC0J
ICAgICAgIEJSMl9MSU5VWF9LRVJORUxfTEFURVNUX1ZFUlNJT04gJiYgXAo+PiAtCSAgICAgICAo
QlIyX2FhcmNoNjQgfHwgQlIyX2FhcmNoNjRfYmUgfHwgQlIyX2FyY2xlIHx8IEJSMl9hcmNlYiB8
fCAKPj4gQlIyX3NwYXJjIHx8IEJSMl94ODZfNjQpCj4+ICsJICAgICAgIEJSMl9MSU5VWF9LRVJO
RUxfTEFURVNUX1ZFUlNJT04KPj4gIAloZWxwCj4+ICAJICBUaGlzIG9wdGlvbiB3aWxsIHVzZSB0
aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uIGZvciB0aGUKPj4gIAkgIHNlbGVjdGVkIGFyY2hpdGVj
dHVyZS4gSS5lLCBpdCBpcyBlcXVpdmFsZW50IHRvIHJ1bm5pbmcKCkJlc3QgcmVnYXJkcywKCkp1
bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
