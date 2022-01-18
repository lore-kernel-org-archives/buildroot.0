Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975FEC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 17:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06A59405D3;
	Tue, 18 Jan 2022 17:53:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Icpvk9HzgtjW; Tue, 18 Jan 2022 17:53:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0E3240106;
	Tue, 18 Jan 2022 17:53:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 453281BF59D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 17:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 410AA408FB
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 17:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ByjoSOZ9Lc3D for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 17:53:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B66F408F6
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 17:53:48 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9sfznl6CZX0z79sfznkeGA; Tue, 18 Jan 2022 18:53:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642528427; bh=y+BQmPl09FG/UcCRA6cHf5eIuRS9JSOs6duP7886Khc=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=W50L/RRZ6H3n7tL/OrP0VmJfBi/Xqe1VicUcfJ348iK5R/O/8nUHkx1gljQMhZcnp
 KuZQSGrG19lAYpwqdCktGhjqjfwqHu7LBVoU3aTHfn1EunB9cVlxhW4r/9YBAx94dG
 zgDPFxURYO2RI7YU3M2zQn7o8PnYilYIl9DogWrVkj42nowmenn7FcXpX0dwOGX/28
 mrFjuboynfESJGHNliwdu/tftuqlN1yYBxAxPF+6Krb6VxhEg7iyq7y8ha14G7B2pM
 FuaoJF7VAjtVXM5T5tPZBSbdFhUXrBwK/JQvBHTIYQsVlkPWLRkc0e+cScp0kqUbom
 VbH5el8uHRB4w==
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>, buildroot@buildroot.org
References: <70BDD76B-E7F2-44C0-A90B-0FABCFD8755D@benettiengineering.com>
 <20220118063531.2039729-1-giulio.benetti@benettiengineering.com>
 <834ad33f-d02f-4663-8e99-4bc939cbb9f6@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <d938c62f-58f6-4b53-3d47-a4dd4617b533@benettiengineering.com>
Date: Tue, 18 Jan 2022 18:53:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <834ad33f-d02f-4663-8e99-4bc939cbb9f6@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfAnnqc+n/oFT8pUx9bHSzYZhjQ0e2ud6N7TpwtuSESo3Qs9HwmhuPmTFB4XhDCqbvLFmbwc7wIPt8PoyVUsEeNYepQE/hEBXLznoHKKt9IdFsjzNCFmE
 lPDrNhDN02RhY6YCko5Ud7NBtJwMgG66MB1BI/6bDn00fOM6ujjlszPc1t1RhRvIxc8CVWCfRurKrgsbOkef8GJCwGofQb+DADzUd+A8P4u67K/Ypr3j3L4E
 OYO+y416TwwkqCulHsUR6w==
Subject: Re: [Buildroot] [PATCH v2] package/xr819-xradio: add patch to build
 with Linux >= 5.13
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

SGkgU2VyZ2V5LAoKT24gMTgvMDEvMjIgMTg6NDUsIFNlcmdleSBLdXptaW5vdiB3cm90ZToKPiBI
aSBBbGwsIEdpdWxpby4KPiBJIGNoZWNrZWQgdGhlIHBhdGNoLCBldmVyeXRoaW5nIHdvcmtzLgoK
Q2FuIHlvdSBwbGVhc2UgcGxhY2UgeW91cjoKVGVzdGVkLWJ5OiBOYW1lIFN1cm5hbWUgPGUtbWFp
bD4KPwoKLS0gCkdpdWxpbyBCZW5ldHRpCkJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCgo+IDE4LjAx
LjIwMjIgMDk6MzUsIEdpdWxpbyBCZW5ldHRpINC/0LjRiNC10YI6Cj4+IEFzIGV4cGxhaW5lZCBp
biB0aGUgbG9jYWwgcGF0Y2ggaXRzZWxmIG9mX2dldF9tYWNfYWRkcmVzcygpIGhhcyBjaGFuZ2Vk
LCBzbwo+PiB3ZSBuZWVkIHRvIGNoZWNrIGFnYWluc3QgTGludXggdmVyc2lvbiBhbmQgdXNlIGl0
IHNsaWdodGx5IGRpZmZlcmVudGx5Lgo+Pgo+PiBQYXRjaCBpcyBwZW5kaW5nIHVwc3RyZWFtOgo+
PiBodHRwczovL2dpdGh1Yi5jb20vZmlmdGVlbmhleC94cmFkaW8vcHVsbC8xNQo+PiBJJ3ZlIHJl
YWxpemVkIG9ubHkgbGF0ZXIgdGhlcmUgd2FzIGFscmVhZHkgYW4gb3BlbmVkIFBSIGZvciB0aGlz
LCBhbnl3YXkKPj4gSU1ITyBJIHRoaW5rIG15IHBhdGNoIGlzIHdyaXR0ZW4gYSBsaXR0bGUgYmV0
dGVyLCBzbyBwbGVhc2UgYWNjZXB0IGl0Lgo+PiBBbmQgbW9zdCBvZiBhbGwgU2VyZ2V5IGFscmVh
ZHkgdGVzdGVkIGl0IGFuZCBpdCB3b3JrczoKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMi1KYW51YXJ5LzYzNDA4NC5odG1sCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJp
bmcuY29tPgo+PiAtLS0KPj4gVjEtPlYyOgo+PiAqIHVwZGF0ZSBsb2NhbCBwYXRjaCB0byBidWls
ZCBjb3JyZWN0bHkgYWxzbyB3aXRoIExpbnV4ID49IDUuMTIuMSA8IDUuMTMuMAo+PiAtLS0KPj4g
ICAgLi4uZml4LWJ1aWxkaW5nLXdpdGgtTGludXgtdmVyc2lvbi01LjEzLnBhdGNoIHwgNjggKysr
KysrKysrKysrKysrKysrKwo+PiAgICAxIGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQo+
PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS94cjgxOS14cmFkaW8vMDAwMS1tYWluLmMt
Zml4LWJ1aWxkaW5nLXdpdGgtTGludXgtdmVyc2lvbi01LjEzLnBhdGNoCj4+Cj4+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3hyODE5LXhyYWRpby8wMDAxLW1haW4uYy1maXgtYnVpbGRpbmctd2l0aC1M
aW51eC12ZXJzaW9uLTUuMTMucGF0Y2ggYi9wYWNrYWdlL3hyODE5LXhyYWRpby8wMDAxLW1haW4u
Yy1maXgtYnVpbGRpbmctd2l0aC1MaW51eC12ZXJzaW9uLTUuMTMucGF0Y2gKPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uM2I5NzQyMDEyZQo+PiAtLS0gL2Rldi9u
dWxsCj4+ICsrKyBiL3BhY2thZ2UveHI4MTkteHJhZGlvLzAwMDEtbWFpbi5jLWZpeC1idWlsZGlu
Zy13aXRoLUxpbnV4LXZlcnNpb24tNS4xMy5wYXRjaAo+PiBAQCAtMCwwICsxLDY4IEBACj4+ICtG
cm9tIDQ4NzM3NDZmYTlkNDJhOGVkYmMxZTE5Mjg5OWUwMGMyOWVkM2QzMmEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCj4+ICtGcm9tOiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVu
ZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4gK0RhdGU6IE1vbiwgMTcgSmFuIDIwMjIgMTI6MjY6MDAg
KzAxMDAKPj4gK1N1YmplY3Q6IFtQQVRDSF0gbWFpbi5jOiBmaXggYnVpbGRpbmcgd2l0aCBMaW51
eCB2ZXJzaW9uID49IDUuMTMKPj4gKwo+PiArb2ZfZ2V0X21hY19hZGRyZXNzKCkgb24gTGludXgg
dmVyc2lvbiA+PSA1LjEzIHJlcXVpcmVzIG1hYyBwb2ludGVyIGFzCj4+ICtzZWNvbmQgYXJndW1l
bnQgYW5kIHJldHVybiBhbiBpbnQuIFNvIGxldCdzIGRlYWwgd2l0aCBpdCBieSBjaGVja2luZyBs
aW51eAo+PiArdmVyc2lvbiB0byBtYWtlIGl0IGNvbXBhdGlibGUgd2l0aCBib3RoIExpbnV4IHZl
cnNpb24gPj0gNS4xMyBhbmQgbm90Lgo+PiArCj4+ICtTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVu
ZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4gKy0tLQo+PiAr
IG1haW4uYyB8IDE3ICsrKysrKysrKysrKysrKysrCj4+ICsgMSBmaWxlIGNoYW5nZWQsIDE3IGlu
c2VydGlvbnMoKykKPj4gKwo+PiArZGlmZiAtLWdpdCBhL21haW4uYyBiL21haW4uYwo+PiAraW5k
ZXggYjYwZTE4ZC4uMDZjYjFmNiAxMDA2NDQKPj4gKy0tLSBhL21haW4uYwo+PiArKysrIGIvbWFp
bi5jCj4+ICtAQCAtMTMsNiArMTMsNyBAQAo+PiArICNpbmNsdWRlIDxuZXQvY2ZnODAyMTEuaD4K
Pj4gKyAjaW5jbHVkZSA8bGludXgvb2ZfbmV0Lmg+Cj4+ICsgI2luY2x1ZGUgPGxpbnV4L21tYy9z
ZGlvX2Z1bmMuaD4KPj4gKysjaW5jbHVkZSA8bGludXgvdmVyc2lvbi5oPgo+PiArCj4+ICsgI2lu
Y2x1ZGUgInhyYWRpby5oIgo+PiArICNpbmNsdWRlICJmd2lvLmgiCj4+ICtAQCAtNDk5LDggKzUw
MCwxMiBAQCBpbnQgeHJhZGlvX2NvcmVfaW5pdChzdHJ1Y3Qgc2Rpb19mdW5jKiBmdW5jKQo+PiAr
IAlpbnQgaWZfaWQ7Cj4+ICsgCXN0cnVjdCBpZWVlODAyMTFfaHcgKmRldjsKPj4gKyAJc3RydWN0
IHhyYWRpb19jb21tb24gKmh3X3ByaXY7Cj4+ICsrI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA+PSBL
RVJORUxfVkVSU0lPTig1LCAxMywgMCkKPj4gKysJdW5zaWduZWQgY2hhciBhZGRyW0VUSF9BTEVO
XTsKPj4gKysjZWxzZQo+PiArIAl1bnNpZ25lZCBjaGFyIHJhbmRvbWFkZHJbRVRIX0FMRU5dOwo+
PiArIAljb25zdCB1bnNpZ25lZCBjaGFyICphZGRyID0gTlVMTDsKPj4gKysjZW5kaWYKPj4gKwo+
PiArIAkvL2luaXQgeHJhZGlvX2NvbW1vbgo+PiArIAlkZXYgPSB4cmFkaW9faW5pdF9jb21tb24o
c2l6ZW9mKHN0cnVjdCB4cmFkaW9fY29tbW9uKSk7Cj4+ICtAQCAtNTEzLDYgKzUxOCwxNiBAQCBp
bnQgeHJhZGlvX2NvcmVfaW5pdChzdHJ1Y3Qgc2Rpb19mdW5jKiBmdW5jKQo+PiArIAlod19wcml2
LT5zZGlvX2Z1bmMgPSBmdW5jOwo+PiArIAlzZGlvX3NldF9kcnZkYXRhKGZ1bmMsIGh3X3ByaXYp
Owo+PiArCj4+ICsrI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA+PSBLRVJORUxfVkVSU0lPTig1LCAx
MywgMCkKPj4gKysJLy8gZmlsbCBpbiBtYWMgYWRkcmVzc2VzCj4+ICsrCWlmIChod19wcml2LT5w
ZGV2LT5vZl9ub2RlKSB7Cj4+ICsrCQllcnIgPSBvZl9nZXRfbWFjX2FkZHJlc3MoaHdfcHJpdi0+
cGRldi0+b2Zfbm9kZSwgYWRkcik7Cj4+ICsrCX0KPj4gKysJaWYgKGVyciA8IDApIHsKPj4gKysJ
CWRldl93YXJuKGh3X3ByaXYtPnBkZXYsICJubyBtYWMgYWRkcmVzcyBwcm92aWRlZCwgdXNpbmcg
cmFuZG9tXG4iKTsKPj4gKysJCWV0aF9yYW5kb21fYWRkcihhZGRyKTsKPj4gKysJfQo+PiArKyNl
bHNlCj4+ICsgCS8vIGZpbGwgaW4gbWFjIGFkZHJlc3Nlcwo+PiArIAlpZiAoaHdfcHJpdi0+cGRl
di0+b2Zfbm9kZSkgewo+PiArIAkJYWRkciA9IG9mX2dldF9tYWNfYWRkcmVzcyhod19wcml2LT5w
ZGV2LT5vZl9ub2RlKTsKPj4gK0BAIC01MjIsNiArNTM3LDggQEAgaW50IHhyYWRpb19jb3JlX2lu
aXQoc3RydWN0IHNkaW9fZnVuYyogZnVuYykKPj4gKyAJCWV0aF9yYW5kb21fYWRkcihyYW5kb21h
ZGRyKTsKPj4gKyAJCWFkZHIgPSByYW5kb21hZGRyOwo+PiArIAl9Cj4+ICsrI2VuZGlmCj4+ICsr
Cj4+ICsgCW1lbWNweShod19wcml2LT5hZGRyZXNzZXNbMF0uYWRkciwgYWRkciwgRVRIX0FMRU4p
Owo+PiArIAltZW1jcHkoaHdfcHJpdi0+YWRkcmVzc2VzWzFdLmFkZHIsIGFkZHIsIEVUSF9BTEVO
KTsKPj4gKyAJaHdfcHJpdi0+YWRkcmVzc2VzWzFdLmFkZHJbNV0gKz0gMHgwMTsKPj4gKy0tCj4+
ICsyLjI1LjEKPj4gKwo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
