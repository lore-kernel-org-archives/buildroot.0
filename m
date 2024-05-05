Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D793CC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 13:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B60F404E5;
	Sun,  5 May 2024 13:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xP4CylaPTY-I; Sun,  5 May 2024 13:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96F3040544
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96F3040544;
	Sun,  5 May 2024 13:02:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1047E1BF4E6
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 13:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F077282112
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 13:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlAoiMpaIkGA for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 13:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 91FE982111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91FE982111
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91FE982111
 for <buildroot@busybox.net>; Sun,  5 May 2024 13:02:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6559113F86A;
 Sun,  5 May 2024 15:02:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 15:02:17 +0200
Date: Sun, 5 May 2024 15:02:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <ZjeDWeQ-Jnutgk0G@landeda>
References: <20240505115152.24857-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240505115152.24857-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714914139;
 bh=NK045klYZ58IX4d0oU64Cuc7lmwOtdtu2+AiGlSm4yI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=On7sT4IDBLUFgA12oUIPTxn1ss5N0Cc4mykW/zv0dl3QSGxfG0OMUKYDP7ESe5nGX
 wlBQfs9v+Yh9Ls5o//oWynnanNCH5PnoGbELPhwDV9ijPL+dv7/GYqHuRJfHdlw6/V
 fAvN8xutwFlKTAPJoIY2GBO+AqZAM1SPJsLhPVDQ+RalOJIiU8zK8WYkB3Bh5DbNBY
 ubC/+y5du2AFLip93+flQaueK9V+P69fb5HPbcJ9z3lFxJoGuFkIJJk+PNt3jCmfu1
 26DzrW43+FKPTu+qVcg30WHENZdfB/OtkdDyZ/o4kwikForUPtnmfsGsJeIFBk/kHo
 o0OzYXkRXegGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=On7sT4ID
Subject: Re: [Buildroot] [PATCH 1/2] configs/olimex_imx233_olinuxino: bump
 Linux and U-Boot
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpUaGFua3MgZm9yIHRoaXMgcGF0Y2guCgpXZSd2ZSBzdGFydGVkIHRv
IGFkZCBoYXNoZXMgZm9yIGN1c3RvbSB2ZXJzaW9ucywgaW4gYW4gYXR0ZW1wdHMgdG8gY2xvc2UK
b2ZmIENWRS0yMDIzLTQzNjA4LgoKU2VlIHJlY2VudCBjaGFuZ2VzIGZvciBpbnNwaXJhdGlvbjoK
ICAgIDVlZmE1ZTkwMjMgY29uZmlncy9hcm1hZGV1c19hcGYyNzogYWRkIGhhc2hlcyBmb3IgTGlu
dXgvVS1Cb290CiAgICA5OWEzNjk4NzI5IGNvbmZpZ3MvbmV6aGFfZGVmY29uZmlnOiBhZGQgaGFz
aGVzIGZvciBMaW51eC9vcGVuc2JpL3UtYm9vdAogICAgMjkxNTg3OWMxNSBjb25maWdzL3RpX2Ft
NjJ4X3NrX2RlZmNvbmZpZzogYnVtcCBMaW51eCB2ZXJzaW9uIHRvIDYuNi4xOAogICAgZGRlODlm
ZTcwMyBjb25maWdzL2xhZnJpdGVfZGVmY29uZmlnOiBidW1wIGtlcm5lbCB0byA2LjYuMjIKICAg
IDllYmJmZWZmMzggY29uZmlncy9yb2NrNWI6IGFkZCBoYXNoIGZvciBjdXN0b20ga2VybmVsCgpU
aGlzIGlzIGEgcmVsYXRpdmVseSBuZXcgcmVxdWlyZW1lbnQsIHRob3VnaCwgYW5kIHdlJ3JlIG5v
dCB5ZXQgYWxsIHNvCmNhcmVmdWwgdG8gY2hlY2sgZm9yIHRoYXQgd2hlbiB3ZSBhcHBseSBkZWZj
b25maWcgdXBkYXRlcywgYnV0IHdlIGRvCmhhdmUgYSBuZXcgY2hlY2sgZm9yIHRoYXQsIHNlZToK
ICAgIDc5MzFmNzhjMTYgdXRpbHMvY2hlY2stcGFja2FnZTogbmV3IGNoZWNrIGZvciBCdWlsZHJv
b3QncyBkZWZjb25maWcgZmlsZXMKCkhvd2V2ZXIsIHNpbmNlIHRoZXJlIGN1cnJlbnRseSBhcmUg
ZXhwbGljaXQgZXhjbHVzaW9ucywganVzdCBydW5uaW5nCiJtYWtlIGNoZWNrLXBhY2thZ2UiIHdp
bGwgbm90IGNhdGNoIHRoZSBpc3N1ZSB3aGVuIHVwZGF0aW5nIGV4aXN0aW5nCmRlZmNvbmZpZ3Ms
IGp1c3Qgd2hlbiBhZGRpbmcgbmV3IG9uZXMuCgpDb3VsZCB5b3UgbG9vayBpbnRvIHByb3ZpZGlu
ZyBzdWNoIGhhc2ggZmlsZXMgZm9yIHRoaXMgZGVmY29uZmlnLCBwbGVhc2U/CgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKT24gMjAyNC0wNS0wNSAxMzo1MSArMDIwMCwgRnJhbmNvaXMgUGVycmFk
IHNwYWtlIHRodXNseToKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lz
LnBlcnJhZEBnYWR6Lm9yZz4KPiAtLS0KPiAgY29uZmlncy9vbGltZXhfaW14MjMzX29saW51eGlu
b19kZWZjb25maWcgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mvb2xpbWV4X2lteDIz
M19vbGludXhpbm9fZGVmY29uZmlnIGIvY29uZmlncy9vbGltZXhfaW14MjMzX29saW51eGlub19k
ZWZjb25maWcKPiBpbmRleCAyNzVkZDk4YWYuLjY0NzI5Mjg5OSAxMDA2NDQKPiAtLS0gYS9jb25m
aWdzL29saW1leF9pbXgyMzNfb2xpbnV4aW5vX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3Mvb2xp
bWV4X2lteDIzM19vbGludXhpbm9fZGVmY29uZmlnCj4gQEAgLTIsOCArMiw4IEBACj4gIEJSMl9h
cm09eQo+ICBCUjJfYXJtOTI2dD15Cj4gIAo+IC0jIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJu
ZWwsIGEgNS40IHNlcmllcwo+IC1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9N
XzVfND15Cj4gKyMgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgYSA2LjEgc2VyaWVzCj4g
K0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8xPXkKPiAgCj4gICMgU3lz
dGVtCj4gIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJ0dHlBTUEwIgo+IEBAIC0xNCw3
ICsxNCw3IEBAIEJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFNSUNfTURFVj15Cj4gICMg
S2VybmVsCj4gIEJSMl9MSU5VWF9LRVJORUw9eQo+ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9W
RVJTSU9OPXkKPiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS40Ljgi
Cj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMS44MyIKPiAgQlIy
X0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9Im14cyIKPiAgQlIyX0xJTlVYX0tFUk5FTF9DT05GSUdf
RlJBR01FTlRfRklMRVM9ImJvYXJkL29saW1leC9pbXgyMzNfb2xpbnV4aW5vL2xpbnV4LXdpZmku
ZnJhZ21lbnQiCj4gIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+IEBAIC00MCw3ICs0
MCw3IEBAIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Cj4gIEJSMl9UQVJHRVRfVUJPT1Q9eQo+
ICBCUjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkKPiAgQlIyX1RBUkdFVF9V
Qk9PVF9DVVNUT01fVkVSU0lPTj15Cj4gLUJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05f
VkFMVUU9IjIwMTcuMTEiCj4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9
IjIwMjQuMDQiCj4gIEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJteDIzX29saW51
eGlubyIKPiAgQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfU0Q9eQo+ICAgCj4gLS0gCj4gMi40MC4x
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBB
R0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1n
ZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAg
fAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
