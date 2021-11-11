Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95504C433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 21:11:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 296A861078
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 21:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 296A861078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB1D160B74;
	Thu, 11 Nov 2021 21:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-b6fWSBVhCL; Thu, 11 Nov 2021 21:11:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 288CF60657;
	Thu, 11 Nov 2021 21:11:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DD381BF388
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 21:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A7D881C71
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 21:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fgy-XgE4XY4s for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 21:11:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A78881B10
 for <buildroot@busybox.net>; Thu, 11 Nov 2021 21:11:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2dfd:466c:d080:8051])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 146AC19F4F8;
 Thu, 11 Nov 2021 22:11:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636665082;
 bh=K3lqkBSj6aiGzyq5SYBnn9dCXed20u7vnPeVUukSeEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aD7QmCEy1d1YoCufz//sUkO8j9D5A4+AcL9+KJGL+b7EbH2MiUhKL4XBwgWFTTYAP
 s00vdu5POjW3r1ruIgH3Ko3Gx8Bfi4p9zC3n5vMkwYgwgnKvzLt65UA5dcWO5SwzNh
 o3Rv22NdVLaCCfzgWQ6Fz2HMj0mhitttNWj0gzAAqJbPt5XCPNYRh3zQzDrdSeiREW
 csM+V2xssp/1YaOarMJMteS4fDHwFM+dCo0bXYzRtJZnN0KLL2+zyip80HgYB790md
 xITpfZclFjsR9nG3ttlO7JoifVTwbEVn08fMK36UmvyH5Vsl7JkaiS68sV7zcsW1mN
 eAiEzA09OYNMw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Nov 2021 22:11:13 +0100
Date: Thu, 11 Nov 2021 22:11:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20211111211113.GE2609@scaer>
References: <67639c1e1d0f8d008160744cf8a056fe9eedfd06.1636612338.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67639c1e1d0f8d008160744cf8a056fe9eedfd06.1636612338.git.baruch@tkos.co.il>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] iperf: fix build with musl
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
Cc: buildroot@busybox.net, Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmFydWNoLCBBbGwsCgpPbiAyMDIxLTExLTExIDA4OjMyICswMjAwLCBCYXJ1Y2ggU2lhY2ggdmlh
IGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gQWRkIGEgcGF0Y2ggY2hhbmdpbmcgaGVhZGVycyBp
bmNsdWRlIG9yZGVyIHRvIGZpeCAnc3RydWN0IGV0aGhkcicKPiBjb25mbGljdCBiZXR3ZWVuIGtl
cm5lbCBoZWFkZXJzIGFuZCBtdXNsIGxpYmMuCj4gCj4gRml4ZXM6Cj4gaHR0cDovL2F1dG9idWls
ZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMjNhZGE2OWY5YjdkYzQ0NjAzMTVkOTE3NWQzMDY0ZDhk
YjE4MmY4ZS8KPiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8zZDljOTg1
MGRlOGRhNWIxMGJlYzRmMjViZTA3ZDllY2JjOGUwOTMxLwo+IGh0dHA6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm5ldC9yZXN1bHRzLzI1MTE2YWY3NzBjZjk0MjI3MzAyY2ZjMWNmZjRkZWQwN2U4NWZl
NDkvCj4gCj4gQ2M6IE1hdHQgV2ViZXIgPG1hdHRoZXcud2ViZXJAY29sbGlucy5jb20+Cj4gQ2M6
IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IEJhcnVjaCBTaWFjaCA8YmFydWNoQHRrb3MuY28uaWw+CgpBcHBsaWVkIHRvIG1hc3Rl
ciwgdGhhbmtzIQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIC4uLi9pcGVyZi8w
MDAxLUZpeC1idWlsZC13aXRoLW11c2wtbGliYy5wYXRjaCB8IDY3ICsrKysrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvaXBlcmYvMDAwMS1GaXgtYnVpbGQtd2l0aC1tdXNsLWxpYmMucGF0Y2gKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9pcGVyZi8wMDAxLUZpeC1idWlsZC13aXRoLW11c2wtbGli
Yy5wYXRjaCBiL3BhY2thZ2UvaXBlcmYvMDAwMS1GaXgtYnVpbGQtd2l0aC1tdXNsLWxpYmMucGF0
Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjY5MDc5ZWUx
ZTc3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvaXBlcmYvMDAwMS1GaXgtYnVpbGQt
d2l0aC1tdXNsLWxpYmMucGF0Y2gKPiBAQCAtMCwwICsxLDY3IEBACj4gK0Zyb20gNjc2NmFiMzIy
YTllYjhjNzNmODI3NmJlOWNkZWEzNTZlYjEyNGRlMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
PiArRnJvbTogQmFydWNoIFNpYWNoIDxiYXJ1Y2hAdGtvcy5jby5pbD4KPiArRGF0ZTogVGh1LCAx
MSBOb3YgMjAyMSAwNzo1ODoxMCArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIEZpeCBidWlsZCB3
aXRoIG11c2wgbGliYwo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQv
cGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+
ICsKPiArbXVzbCBsaWJjIGRlZmluZXMgaXRzIG93biBzdHJ1Y3QgZXRoaGRyIHRoYXQgY29uZmxp
Y3RzIHdpdGggdGhlIGtlcm5lbAo+ICtkZWZpbmUgb25lLiBUaGUga2VybmVsIGhlYWRlcnMgcHJv
dmlkZSBhIHdheSB0byBzdXBwcmVzcyBpdHMgc3RydWN0Cj4gK2V0aGhkci4gRm9yIHRoYXQgdG8g
d29yayB0aGUgbGliYyBoZWFkZXJzIG11c3QgcHJlY2VkZSB0aGUga2VybmVsLiBNb3ZlCj4gK3Ro
ZSBrZXJuZWwgbGludXgvaWZfdHVuLmggaW5jbHVkZSBiZWxvdyBsaWJjIG5ldC9ldGhlcm5ldC5o
LiBUaGF0IGZpeGVzCj4gK3RoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZToKPiArCj4gK0luIGZp
bGUgaW5jbHVkZWQgZnJvbSAuLi4vYXJtLWJ1aWxkcm9vdC1saW51eC1tdXNsZWFiaWhmL3N5c3Jv
b3QvdXNyL2luY2x1ZGUvbmV0L2V0aGVybmV0Lmg6MTAsCj4gKyAgICAgICAgICAgICAgICAgZnJv
bSAuLi9pbmNsdWRlL2hlYWRlcnMuaDoxMTcsCj4gKyAgICAgICAgICAgICAgICAgZnJvbSBUaHJl
YWQuYzo3MjoKPiArLi4uL2FybS1idWlsZHJvb3QtbGludXgtbXVzbGVhYmloZi9zeXNyb290L3Vz
ci9pbmNsdWRlL25ldGluZXQvaWZfZXRoZXIuaDoxMTY6ODogZXJyb3I6IHJlZGVmaW5pdGlvbiBv
ZiDigJhzdHJ1Y3QgZXRoaGRy4oCZCj4gKyAgMTE2IHwgc3RydWN0IGV0aGhkciB7Cj4gKyAgICAg
IHwgICAgICAgIF5+fn5+fgo+ICtJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4uL2FybS1idWlsZHJv
b3QtbGludXgtbXVzbGVhYmloZi9zeXNyb290L3Vzci9pbmNsdWRlL2xpbnV4L2lmX3R1bi5oOjIw
LAo+ICsgICAgICAgICAgICAgICAgIGZyb20gLi4vaW5jbHVkZS9oZWFkZXJzLmg6MTEwLAo+ICsg
ICAgICAgICAgICAgICAgIGZyb20gVGhyZWFkLmM6NzI6Cj4gKy4uLi9hcm0tYnVpbGRyb290LWxp
bnV4LW11c2xlYWJpaGYvc3lzcm9vdC91c3IvaW5jbHVkZS9saW51eC9pZl9ldGhlci5oOjE0ODo4
OiBub3RlOiBvcmlnaW5hbGx5IGRlZmluZWQgaGVyZQo+ICsgIDE0OCB8IHN0cnVjdCBldGhoZHIg
ewo+ICsgICAgICB8ICAgICAgICBefn5+fn4KPiArCj4gK0ZpeGVzIGJ1ZyAjMTU3Lgo+ICsKPiAr
U2lnbmVkLW9mZi1ieTogQmFydWNoIFNpYWNoIDxiYXJ1Y2hAdGtvcy5jby5pbD4KPiArLS0tCj4g
K1Vwc3RyZWFtIHN0YXR1czogc2VudCB0byBSb2JlcnQgTWNNYWhvbiA8cmptY21haG9uQHJqbWNt
YWhvbi5jb20+Cj4gKwo+ICsgaW5jbHVkZS9oZWFkZXJzLmggfCAxMCArKysrKy0tLS0tCj4gKyAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ICsKPiArZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvaGVhZGVycy5oIGIvaW5jbHVkZS9oZWFkZXJzLmgKPiAraW5kZXgg
MDBlMGVhMGRiYTQyLi44ODc0OTA0NzUzODEgMTAwNjQ0Cj4gKy0tLSBhL2luY2x1ZGUvaGVhZGVy
cy5oCj4gKysrKyBiL2luY2x1ZGUvaGVhZGVycy5oCj4gK0BAIC0xMDYsMTEgKzEwNiw2IEBAIHR5
cGVkZWYgYm9vbCBfQm9vbDsKPiArICNpbmNsdWRlIDxuZXQvaWYuaD4KPiArICNlbmRpZgo+ICsg
Cj4gKy0jaWYgKChIQVZFX1RVTlRBUF9UQVApIHx8IChIQVZFX1RVTlRBUF9UVU4pKQo+ICstI2lu
Y2x1ZGUgPGxpbnV4L2lmX3R1bi5oPgo+ICstI2luY2x1ZGUgPHN5cy9pb2N0bC5oPgo+ICstI2Vu
ZGlmCj4gKy0KPiArIAo+ICsgLy8gQUZfUEFDS0VUIEhFQURFUlMKPiArICNpZiBkZWZpbmVkKEhB
VkVfTElOVVhfRklMVEVSX0gpICYmIGRlZmluZWQoSEFWRV9BRl9QQUNLRVQpCj4gK0BAIC0xNDYs
NiArMTQxLDExIEBAIHR5cGVkZWYgYm9vbCBfQm9vbDsKPiArICNkZWZpbmUgIElQVjZIRFJMRU4g
NDAKPiArICNlbmRpZiAvLyBIQVZFX0FGX1BBQ0tFVAo+ICsgCj4gKysjaWYgKChIQVZFX1RVTlRB
UF9UQVApIHx8IChIQVZFX1RVTlRBUF9UVU4pKQo+ICsrI2luY2x1ZGUgPGxpbnV4L2lmX3R1bi5o
Pgo+ICsrI2luY2x1ZGUgPHN5cy9pb2N0bC5oPgo+ICsrI2VuZGlmCj4gKysKPiArICNpZmRlZiBX
SU4zMgo+ICsgCj4gKyAvKiBXaW5kb3dzIGNvbmZpZyBmaWxlICovCj4gKy0tIAo+ICsyLjMzLjAK
PiArCj4gLS0gCj4gMi4zMy4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8
IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFj
eTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlH
TiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0t
LS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0
dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAg
IHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
