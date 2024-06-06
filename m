Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A41FC27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 09:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A826607AD;
	Thu,  6 Jun 2024 09:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vV40tpQPG1es; Thu,  6 Jun 2024 09:47:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1630E6081D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1630E6081D;
	Thu,  6 Jun 2024 09:47:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 338B11BF23C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F57C4037E
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id US6rWUD-7XP3 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 09:46:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D80E401F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D80E401F1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D80E401F1
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 09:46:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 27A1513FA3C;
 Thu,  6 Jun 2024 11:46:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 11:46:48 +0200
Date: Thu, 6 Jun 2024 11:46:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kadir Yilmaz <kadir.c.yilmaz@gmail.com>
Message-ID: <ZmGFiPF5Ceosd7NF@landeda>
References: <20231025205233.1925727-1-kadir.c.yilmaz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025205233.1925727-1-kadir.c.yilmaz@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717667213;
 bh=F7L5WKevycRYFDoFMbop/GfvUaTZEIndk6nIQv/7Wbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tWPI9Dqu0NEjh4hkVYnWtiHeYDCzFvyrWXsviVjXavb6rcgeL0ooDNBaNcEWXBZ/0
 Nu9J9v47YfHB/fKs1pSNTanNRLg4VgV5z/HFd3eRmq3JoPJ0FqH6ys1k9W+9sO8+xL
 RBsKO8SOy6y3kMxtrXoX2fRfm/qR1bTIBGiJGx8OSmyMiqFx2LkETMa3W2SmbzjXmE
 rQtqTdg30ba2wElV/lTR7/6Y02D8s5WlMn0NZe6if4y1nuC+RJv+84eJyWWFhPf9Av
 uG0JVQ/r13hzH59JD2/y/nETL8ndUOwIeKAPwPlWCqqI8hW4m+41kbDPlloSuVmOJH
 v9xssnjdz58tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tWPI9Dqu
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5webengine-chromium: fix
 python3.11 build errors
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S2FkaXIsIEFsbCwKClRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaDsgc29ycnkgdG8gY2hpbWUgaW4g
c28gbGF0ZS4uLgoKK0phbWVzLCB3aG8gYWRkZWQgdGhlIHBhY2thZ2UgaW4gdGhlIGZpcnN0IHBs
YWNlCgpPbiAyMDIzLTEwLTI1IDIyOjUyICswMjAwLCBLYWRpciBZaWxtYXogc3Bha2UgdGh1c2x5
Ogo+IHF0NXdlYmVuZ2luZSBmYWlscyB0byBidWlsZCBkdWUgdG8gY2hhbmdlcyBpbnRyb2R1Y2Vk
IGluIHB5dGhvbjMuMTE6ClstLVNOSVAtLV0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xdDUvcXQ1
d2ViZW5naW5lLWNocm9taXVtLzAwMDMtRml4LWJ1aWxkLXRvb2xzLXRvLXJ1bi13aXRoLXB5dGhv
bjMuMTEucGF0Y2ggYi9wYWNrYWdlL3F0NS9xdDV3ZWJlbmdpbmUtY2hyb21pdW0vMDAwMy1GaXgt
YnVpbGQtdG9vbHMtdG8tcnVuLXdpdGgtcHl0aG9uMy4xMS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNDRjODMzN2Y4MAo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9wYWNrYWdlL3F0NS9xdDV3ZWJlbmdpbmUtY2hyb21pdW0vMDAwMy1GaXgtYnVpbGQtdG9v
bHMtdG8tcnVuLXdpdGgtcHl0aG9uMy4xMS5wYXRjaAo+IEBAIC0wLDAgKzEsNzIgQEAKPiArRnJv
bSA4MmM5YjFkM2Y0MzgzY2Q4MDU5NjkwYmQzNGM5ZDdmYTg2Mzk4Yjc4IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQo+ICtGcm9tOiBLYWRpciBZaWxtYXogPGthZGlyLmMueWlsbWF6QGdtYWlsLmNv
bT4KPiArRGF0ZTogU2F0LCAyMSBPY3QgMjAyMyAyMjo0NTowMyArMDIwMAo+ICtTdWJqZWN0OiBb
UEFUQ0hdIEZpeCBidWlsZCB0b29scyB0byBydW4gd2l0aCBweXRob24zLjExCj4gK01JTUUtVmVy
c2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtD
b250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gKwo+ICtVcHN0cmVhbTogTi9BIGJ1aWxk
cm9vdCB1c2VzIHB5dGhvbjMuMTEgd2hpY2ggYXBwYXJlbnRseSBpcyBub3QgeWV0Cj4gK3N1cHBv
cnRlZCBieSB1cHN0cmVhbQoKRXZlbiB0aGVuLCB0aGUgZG9jdW1lbnRhdGlvbiBmb3IgcHl0aG9u
IHNpbmNlIDMuNiBbMF0gYW5kIHVudGlsIDMuMTAgWzFdCmFsc28gc3RhdGVzOgoKICAgICg/YWlM
bXN1eCkKICAgICAgICBbLi4uXSBGbGFncyBzaG91bGQgYmUgdXNlZCBmaXJzdCBpbiB0aGUgZXhw
cmVzc2lvbiBzdHJpbmcuCgpTbywgaW4gcHl0aG9uIDMuMTEgdGhleSBqdXN0IGFyZSBub3cgZW5m
b3JjaW5nIHRoZSBydWxlLCB3aGlsZQpwcmV2aW91c2x5IHRoZSBjb25zdHJ1Y3Qgd2FzIChzaWxl
bnRseT8pIGFjY2VwdGVkLgoKWW91IHNob3VsZCBzdGlsbCB0cnkgYW5kIHNlbmQgdGhhdCBwYXRj
aCB1cHN0cmVhbS4KClswXSBodHRwczovL2RvY3MucHl0aG9uLm9yZy8zLjYvbGlicmFyeS9yZS5o
dG1sClsxXSBodHRwczovL2RvY3MucHl0aG9uLm9yZy8zLjEwL2xpYnJhcnkvcmUuaHRtbAoKUmVn
YXJkcywKWWFubiBFLiBNT1JJTi4KCj4gKy0gcmUgZXJyb3I6IGdsb2JhbCBmbGFncyBub3QgYXQg
dGhlIHN0YXJ0Cj4gKwo+ICsgICAgaHR0cHM6Ly9kb2NzLnB5dGhvbi5vcmcvMy9saWJyYXJ5L3Jl
Lmh0bWwjcmUtc3ludGF4Cj4gKyAgICAoP2FpTG1zdXgpCj4gKyAgICAuLi4uCj4gKyAgICBDaGFu
Z2VkIGluIHZlcnNpb24gMy4xMTogVGhpcyBjb25zdHJ1Y3Rpb24gY2FuIG9ubHkgYmUgdXNlZCBh
dCB0aGUKPiArICAgIHN0YXJ0IG9mIHRoZSBleHByZXNzaW9uCj4gKwo+ICstIFZhbHVlRXJyb3I6
IGludmFsaWQgbW9kZTogJ3JVJwo+ICsKPiArICAgIG9wZW4oKSwgaW8ub3BlbigpLCBjb2RlY3Mu
b3BlbigpIGFuZCBmaWxlaW5wdXQuRmlsZUlucHV0IG5vIGxvbmdlcgo+ICsgICAgYWNjZXB0ICdV
JyAo4oCcdW5pdmVyc2FsIG5ld2xpbmXigJ0pIGluIHRoZSBmaWxlIG1vZGUuIEluIFB5dGhvbiAz
LAo+ICsgICAg4oCcdW5pdmVyc2FsIG5ld2xpbmXigJ0gbW9kZSBpcyB1c2VkIGJ5IGRlZmF1bHQg
d2hlbmV2ZXIgYSBmaWxlIGlzCj4gKyAgICBvcGVuZWQgaW4gdGV4dCBtb2RlLCBhbmQgdGhlICdV
JyBmbGFnIGhhcyBiZWVuIGRlcHJlY2F0ZWQgc2luY2UKPiArICAgIFB5dGhvbiAzLjMuIFRoZSBu
ZXdsaW5lIHBhcmFtZXRlciB0byB0aGVzZSBmdW5jdGlvbnMgY29udHJvbHMgaG93Cj4gKyAgICB1
bml2ZXJzYWwgbmV3bGluZXMgd29yay4gKENvbnRyaWJ1dGVkIGJ5IFZpY3RvciBTdGlubmVyIGlu
IGJwby0zNzMzMC4pCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBLYWRpciBZaWxtYXogPGthZGlyLmMu
eWlsbWF6QGdtYWlsLmNvbT4KPiArLS0tCj4gKyBjaHJvbWl1bS90b29scy9ncml0L2dyaXQvdXRp
bC5weSAgICAgICAgfCAyICstCj4gKyBjaHJvbWl1bS90b29scy9tZXRyaWNzL3VrbS91a21fbW9k
ZWwucHkgfCA0ICsrLS0KPiArIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL2Nocm9taXVtL3Rvb2xzL2dyaXQvZ3JpdC91
dGlsLnB5IGIvY2hyb21pdW0vdG9vbHMvZ3JpdC9ncml0L3V0aWwucHkKPiAraW5kZXggNTI4ZDc2
NmFkNmIuLjZlOGNkYjBlYmZhIDEwMDY0NAo+ICstLS0gYS9jaHJvbWl1bS90b29scy9ncml0L2dy
aXQvdXRpbC5weQo+ICsrKysgYi9jaHJvbWl1bS90b29scy9ncml0L2dyaXQvdXRpbC5weQo+ICtA
QCAtMjExLDcgKzIxMSw3IEBAIGRlZiBSZWFkRmlsZShmaWxlbmFtZSwgZW5jb2RpbmcpOgo+ICsg
ICAgIG1vZGUgPSAncmInCj4gKyAgICAgZW5jb2RpbmcgPSBOb25lCj4gKyAgIGVsc2U6Cj4gKy0g
ICAgbW9kZSA9ICdyVScKPiArKyAgICBtb2RlID0gJ3InCj4gKyAKPiArICAgd2l0aCBpby5vcGVu
KGFicyhmaWxlbmFtZSksIG1vZGUsIGVuY29kaW5nPWVuY29kaW5nKSBhcyBmOgo+ICsgICAgIHJl
dHVybiBmLnJlYWQoKQo+ICtkaWZmIC0tZ2l0IGEvY2hyb21pdW0vdG9vbHMvbWV0cmljcy91a20v
dWttX21vZGVsLnB5IGIvY2hyb21pdW0vdG9vbHMvbWV0cmljcy91a20vdWttX21vZGVsLnB5Cj4g
K2luZGV4IGVjMjRkZDU3MzYwLi41N2RlY2FiM2NjYyAxMDA2NDQKPiArLS0tIGEvY2hyb21pdW0v
dG9vbHMvbWV0cmljcy91a20vdWttX21vZGVsLnB5Cj4gKysrKyBiL2Nocm9taXVtL3Rvb2xzL21l
dHJpY3MvdWttL3VrbV9tb2RlbC5weQo+ICtAQCAtNDIsNyArNDIsNyBAQCBfSU5ERVhfVFlQRSA9
IG1vZGVscy5PYmplY3ROb2RlVHlwZSgKPiArIF9TVEFUSVNUSUNTX1RZUEUgPSAgbW9kZWxzLk9i
amVjdE5vZGVUeXBlKAo+ICsgICAgICdzdGF0aXN0aWNzJywKPiArICAgICBhdHRyaWJ1dGVzPVsK
PiArLSAgICAgICgnZXhwb3J0Jywgc3RyLCByJ14oP2kpKHx0cnVlfGZhbHNlKSQnKSwKPiArKyAg
ICAgICgnZXhwb3J0Jywgc3RyLCByJyg/aSleKHx0cnVlfGZhbHNlKSQnKSwKPiArICAgICBdLAo+
ICsgICAgIGNoaWxkcmVuPVsKPiArICAgICAgICAgbW9kZWxzLkNoaWxkVHlwZShfUVVBTlRJTEVT
X1RZUEUudGFnLCBfUVVBTlRJTEVTX1RZUEUsIG11bHRpcGxlPUZhbHNlKSwKPiArQEAgLTk0LDcg
Kzk0LDcgQEAgX0VWRU5UX1RZUEUgPSAgbW9kZWxzLk9iamVjdE5vZGVUeXBlKAo+ICsgICAgICdl
dmVudCcsCj4gKyAgICAgYXR0cmlidXRlcz1bCj4gKyAgICAgICAoJ25hbWUnLCBzdHIsIHInXltB
LVphLXowLTkuXSskJyksCj4gKy0gICAgICAoJ3Npbmd1bGFyJywgc3RyLCByJ14oP2kpKHx0cnVl
fGZhbHNlKSQnKSwKPiArKyAgICAgICgnc2luZ3VsYXInLCBzdHIsIHInKD9pKV4ofHRydWV8ZmFs
c2UpJCcpLAo+ICsgICAgIF0sCj4gKyAgICAgYWxwaGFiZXRpemF0aW9uPVsKPiArICAgICAgICAg
KF9PQlNPTEVURV9UWVBFLnRhZywgX0tFRVBfT1JERVIpLAo+ICstLSAKPiArMi4yNS4xCj4gKwo+
IC0tIAo+IDIuMjUuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFs
LVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwK
fCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAg
IHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4t
LS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8v
eW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAg
Y29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
