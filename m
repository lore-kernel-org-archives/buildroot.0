Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BF4C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1430560E50;
	Wed,  4 Jun 2025 18:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3ECBnKkzoxT; Wed,  4 Jun 2025 18:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24C6C60C14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24C6C60C14;
	Wed,  4 Jun 2025 18:21:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 214D41A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1212E4005B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j68F2rvLqjaj for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:21:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2121C40050
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2121C40050
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2121C40050
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:21:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 29CE51C0D4C; Wed,  4 Jun 2025 20:21:52 +0200 (CEST)
Message-ID: <beff6d7a-66e4-42cf-a2e3-cd7ffc1e123b@rnout.be>
Date: Wed, 4 Jun 2025 20:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20250518132419.4171795-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250518132419.4171795-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061312; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=826DmR3OND+LrGMw+ayKOwY8pJsOHcOwwzATUNsJmQE=;
 b=NEOGMBpXj05QsDyt7xj+wWMxbWg7egNqKIhp01oi1lkezgX4K/xpGmHnflVafaT5LSlfU8
 c3JbMawOv9sOUFain3fMQzTqJ7kFqTLfXGawQzJxTJi/GHDXarak8/Emxykg9gDQNutUYy
 oD5EyzbFiHUn7/bNBOWy3RBypVej6Ly/HVs/ZriimlTcQkvP/P/2JyqQR/OaK6Xsy2NgE/
 k2VLu0wZ5UW8buSw8nrRy11cX4r8hLxYB9A+/TdzzYQ0gz7vh7mITzIaihlm2e4wpGoBM/
 ReprQtrFpqCSnJ6SoTcmyHP8qH9b26MlJeNTkhCR/R8hpkwahuZCqfjwO7v2pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=NEOGMBpX
Subject: Re: [Buildroot] [PATCH] package/net-tools: add upstream security
 fix for CVE-2025-46836
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOC8wNS8yMDI1IDE1OjI0LCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4gRml4ZXMgdGhl
IGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZToKPiAKPiBDVkUtMjAyNS00NjgzNjogU3RhY2stYmFz
ZWQgQnVmZmVyIE92ZXJmbG93IGluIG5ldC10b29scyAoZ2V0X25hbWUpCj4gCj4gaHR0cHM6Ly9n
aXRodWIuY29tL2Vja2kvbmV0LXRvb2xzL3NlY3VyaXR5L2Fkdmlzb3JpZXMvR0hTQS1wZndmLWg2
bTMtNjN3Zgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dh
YXJkLmNvbT4KCiAgQXBwbGllZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBB
cm5vdXQKCj4gLS0tCj4gICAuLi5udGVyZmFjZS5jLVN0YWNrLWJhc2VkLUJ1ZmZlci1PdmVyZmwu
cGF0Y2ggfCA5MyArKysrKysrKysrKysrKysrKysrCj4gICBwYWNrYWdlL25ldC10b29scy9uZXQt
dG9vbHMubWsgICAgICAgICAgICAgICAgfCAgMyArCj4gICAyIGZpbGVzIGNoYW5nZWQsIDk2IGlu
c2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL25ldC10b29scy8wMDAx
LUNWRS0yMDI1LTQ2ODM2LWludGVyZmFjZS5jLVN0YWNrLWJhc2VkLUJ1ZmZlci1PdmVyZmwucGF0
Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZXQtdG9vbHMvMDAwMS1DVkUtMjAyNS00Njgz
Ni1pbnRlcmZhY2UuYy1TdGFjay1iYXNlZC1CdWZmZXItT3ZlcmZsLnBhdGNoIGIvcGFja2FnZS9u
ZXQtdG9vbHMvMDAwMS1DVkUtMjAyNS00NjgzNi1pbnRlcmZhY2UuYy1TdGFjay1iYXNlZC1CdWZm
ZXItT3ZlcmZsLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
Li4wYTAyNzg1ZjM4Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbmV0LXRvb2xzLzAw
MDEtQ1ZFLTIwMjUtNDY4MzYtaW50ZXJmYWNlLmMtU3RhY2stYmFzZWQtQnVmZmVyLU92ZXJmbC5w
YXRjaAo+IEBAIC0wLDAgKzEsOTMgQEAKPiArRnJvbSA3YThmNDJmYjIwMDEzYTE0OTNkOGNhZTFj
NDM0MzZmODVlNjU2ZjJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBaZXBoa2Vr
cyA8emVwaHlyb2ZmaWNpYWxkaXNjb3JkQGdtYWlsLmNvbT4KPiArRGF0ZTogVHVlLCAxMyBNYXkg
MjAyNSAxMTowNDoxNyArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIENWRS0yMDI1LTQ2ODM2OiBp
bnRlcmZhY2UuYzogU3RhY2stYmFzZWQgQnVmZmVyIE92ZXJmbG93IGluCj4gKyBnZXRfbmFtZSgp
Cj4gKwo+ICtDb29yZGluYXRlZCBhcyBHSFNBLXBmd2YtaDZtMy02M3dmCj4gKwo+ICtVcHN0cmVh
bTogaHR0cHM6Ly9naXRodWIuY29tL2Vja2kvbmV0LXRvb2xzL2NvbW1pdC83YThmNDJmYjIwMDEz
YTE0OTNkOGNhZTFjNDM0MzZmODVlNjU2ZjJkCj4gK1NpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNn
YWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KPiArLS0tCj4gKyBsaWIvaW50ZXJmYWNlLmMgfCA2
MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gKyAx
IGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4gKwo+ICtk
aWZmIC0tZ2l0IGEvbGliL2ludGVyZmFjZS5jIGIvbGliL2ludGVyZmFjZS5jCj4gK2luZGV4IDcx
ZDQxNjMuLmEwNTRmMTIgMTAwNjQ0Cj4gKy0tLSBhL2xpYi9pbnRlcmZhY2UuYwo+ICsrKysgYi9s
aWIvaW50ZXJmYWNlLmMKPiArQEAgLTIxMSwzMiArMjExLDQ3IEBAIG91dDoKPiArIH0KPiArCj4g
KyBzdGF0aWMgY29uc3QgY2hhciAqZ2V0X25hbWUoY2hhciAqbmFtZSwgY29uc3QgY2hhciAqcCkK
PiArKy8qIFNhZmUgdmVyc2lvbiDigJQgZ3VhcmFudGVlcyBhdCBtb3N0IElGTkFNU0la4oCRMSBi
eXRlcyBhcmUgY29waWVkCj4gKysgICBhbmQgdGhlIGRlc3RpbmF0aW9uIGJ1ZmZlciBpcyBhbHdh
eXMgTlVM4oCRdGVybWluYXRlZC4gICAgICAgICAgICAgKi8KPiArIHsKPiArLSAgICB3aGlsZSAo
aXNzcGFjZSgqcCkpCj4gKy0JcCsrOwo+ICstICAgIHdoaWxlICgqcCkgewo+ICstCWlmIChpc3Nw
YWNlKCpwKSkKPiArLQkgICAgYnJlYWs7Cj4gKy0JaWYgKCpwID09ICc6JykgewkvKiBjb3VsZCBi
ZSBhbiBhbGlhcyAqLwo+ICstCQljb25zdCBjaGFyICpkb3QgPSBwKys7Cj4gKy0gCQl3aGlsZSAo
KnAgJiYgaXNkaWdpdCgqcCkpIHArKzsKPiArLQkJaWYgKCpwID09ICc6Jykgewo+ICstCQkJLyog
WWVzIGl0IGlzLCBiYWNrdXAgYW5kIGNvcHkgaXQuICovCj4gKy0JCQlwID0gZG90Owo+ICstCQkJ
Km5hbWUrKyA9ICpwKys7Cj4gKy0JCQl3aGlsZSAoKnAgJiYgaXNkaWdpdCgqcCkpIHsKPiArLQkJ
CQkqbmFtZSsrID0gKnArKzsKPiArLQkJCX0KPiArLQkJfSBlbHNlIHsKPiArLQkJCS8qIE5vLCBp
dCBpc24ndCAqLwo+ICstCQkJcCA9IGRvdDsKPiArLQkgICAgfQo+ICstCSAgICBwKys7Cj4gKy0J
ICAgIGJyZWFrOwo+ICstCX0KPiArLQkqbmFtZSsrID0gKnArKzsKPiArKyAgICBjaGFyICAgICAg
ICpkc3QgPSBuYW1lOyAgICAgICAgICAgICAgICAgLyogY3VycmVudCB3cml0ZSBwdHIgICAgICAg
ICAgKi8KPiArKyAgICBjb25zdCBjaGFyICplbmQgPSBuYW1lICsgSUZOQU1TSVogLSAxOyAgLyog
bGFzdCBieXRlIHdlIG1heSB3cml0ZSAgICAgKi8KPiArKwo+ICsrICAgIC8qIFNraXAgbGVhZGlu
ZyB3aGl0ZeKAkXNwYWNlLiAqLwo+ICsrICAgIHdoaWxlIChpc3NwYWNlKCh1bnNpZ25lZCBjaGFy
KSpwKSkKPiArKyAgICAgICAgKytwOwo+ICsrCj4gKysgICAgLyogQ29weSB1bnRpbCB3aGl0ZeKA
kXNwYWNlLCBlbmQgb2Ygc3RyaW5nLCBvciBidWZmZXIgZnVsbC4gKi8KPiArKyAgICB3aGlsZSAo
KnAgJiYgIWlzc3BhY2UoKHVuc2lnbmVkIGNoYXIpKnApICYmIGRzdCA8IGVuZCkgewo+ICsrICAg
ICAgICBpZiAoKnAgPT0gJzonKSB7ICAgICAgICAgICAgICAgICAgICAvKiBwb3NzaWJsZSBhbGlh
cyB2ZXRoMDoxMjM6ICAqLwo+ICsrICAgICAgICAgICAgY29uc3QgY2hhciAqZG90ID0gcDsgICAg
ICAgICAgICAvKiByZW1lbWJlciB0aGUgY29sb24gICAgICAgICAqLwo+ICsrICAgICAgICAgICAg
KytwOwo+ICsrICAgICAgICAgICAgd2hpbGUgKCpwICYmIGlzZGlnaXQoKHVuc2lnbmVkIGNoYXIp
KnApKQo+ICsrICAgICAgICAgICAgICAgICsrcDsKPiArKwo+ICsrICAgICAgICAgICAgaWYgKCpw
ID09ICc6JykgeyAgICAgICAgICAgICAgICAvKiBjb25maXJtZWQgYWxpYXMgICAgICAgICAgICAq
Lwo+ICsrICAgICAgICAgICAgICAgIHAgPSBkb3Q7ICAgICAgICAgICAgICAgICAgICAvKiByZXdp
bmQgYW5kIGNvcHkgaXQgYWxsICAgICAqLwo+ICsrCj4gKysgICAgICAgICAgICAgICAgLyogY29w
eSB0aGUgY29sb24gKi8KPiArKyAgICAgICAgICAgICAgICBpZiAoZHN0IDwgZW5kKQo+ICsrICAg
ICAgICAgICAgICAgICAgICAqZHN0KysgPSAqcCsrOwo+ICsrCj4gKysgICAgICAgICAgICAgICAg
LyogY29weSB0aGUgZGlnaXRzICovCj4gKysgICAgICAgICAgICAgICAgd2hpbGUgKCpwICYmIGlz
ZGlnaXQoKHVuc2lnbmVkIGNoYXIpKnApICYmIGRzdCA8IGVuZCkKPiArKyAgICAgICAgICAgICAg
ICAgICAgKmRzdCsrID0gKnArKzsKPiArKwo+ICsrICAgICAgICAgICAgICAgIGlmICgqcCA9PSAn
OicpICAgICAgICAgICAgICAvKiBjb25zdW1lIHRyYWlsaW5nIGNvbG9uICAgICAqLwo+ICsrICAg
ICAgICAgICAgICAgICAgICArK3A7Cj4gKysgICAgICAgICAgICB9IGVsc2UgeyAgICAgICAgICAg
ICAgLyogaWYgc28gdHJlYXQgYXMgbm9ybWFsICovCj4gKysgICAgICAgICAgICAgICAgcCA9IGRv
dDsKPiArKyAgICAgICAgICAgIH0KPiArKyAgICAgICAgICAgIGJyZWFrOyAgICAgICAgICAgICAg
ICAgICAgICAgICAgLyogaW50ZXJmYWNlIG5hbWUgZW5kcyBoZXJlICAgKi8KPiArKyAgICAgICAg
fQo+ICsrCj4gKysgICAgICAgICpkc3QrKyA9ICpwKys7ICAgICAgICAgICAgICAgICAgICAgIC8q
IG9yZGluYXJ5IGNoYXJhY3RlciBjb3B5ICAgICovCj4gKyAgICAgfQo+ICstICAgICpuYW1lKysg
PSAnXDAnOwo+ICsrCj4gKysgICAgKmRzdCA9ICdcMCc7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIGFsd2F5cyBOVUzigJF0ZXJtaW5hdGUgICAgICAgKi8KPiArICAgICByZXR1cm4gcDsK
PiArIH0KPiArCj4gKy0tCj4gKzIuMzkuNQo+ICsKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZXQt
dG9vbHMvbmV0LXRvb2xzLm1rIGIvcGFja2FnZS9uZXQtdG9vbHMvbmV0LXRvb2xzLm1rCj4gaW5k
ZXggMDNlMWM3MzQwNi4uYTIyN2Q2NDc3ZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL25ldC10b29s
cy9uZXQtdG9vbHMubWsKPiArKysgYi9wYWNrYWdlL25ldC10b29scy9uZXQtdG9vbHMubWsKPiBA
QCAtMTIsNiArMTIsOSBAQCBORVRfVE9PTFNfTElDRU5TRSA9IEdQTC0yLjArCj4gICBORVRfVE9P
TFNfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiAgIE5FVF9UT09MU19DUEVfSURfVkFMSUQgPSBZ
RVMKPiAgIAo+ICsjIDAwMDEtQ1ZFLTIwMjUtNDY4MzYtaW50ZXJmYWNlLmMtU3RhY2stYmFzZWQt
QnVmZmVyLU92ZXJmbC5wYXRjaAo+ICtORVRfVE9PTFNfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjUt
NDY4MzYKPiArCj4gICBkZWZpbmUgTkVUX1RPT0xTX0NPTkZJR1VSRV9DTURTCj4gICAJKGNkICQo
QEQpOyB5ZXMgIiIgfCAuL2NvbmZpZ3VyZS5zaCBjb25maWcuaW4gKQo+ICAgZW5kZWYKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
