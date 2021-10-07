Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042C0C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:53:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90E5D6117A
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90E5D6117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31FC940143;
	Thu,  7 Oct 2021 09:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0E87xVNolKtQ; Thu,  7 Oct 2021 09:53:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B5CF40399;
	Thu,  7 Oct 2021 09:53:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E83111BF873
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7A3440498
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mVVt4KtzJNaf for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 09:53:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86C3D40476
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 09:53:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a11c:d3e8:9e5:2853])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D540778031A;
 Thu,  7 Oct 2021 11:53:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633600415;
 bh=B/F5QTf/U042NnbAKXIbeWg2mVN9u6nR8V1U5BNzzq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gf5PI8KLrJ9ogqi3Bbf9vtxaFWv6AW1q7jfWN9cUGDJdSMnfs/nCyjgiWt5WzkxSL
 OW5C+m2/ijrQIu5ZFMBI2hLjRxKr7Kvx/Gs8xgm1mAwn3VYCTQUef6fbhIox8b64SF
 86aH4TcgpzLV3Dmok0yOU+p47hZNPQLIpdZEore8sZLHhIejmLAkhjVvKfkNseMRcp
 LOASzTNDQXAP23tbq86xl1IwSrEyP33q0xgQlmkxyYn/qzd5qQPigIiNRDVHkP/ZNE
 ZIEkb8dFxs8AaqJRmnMc7OvFS5l7kJUzqk8RjmwnhGZ7jxeigVKpMHYrPOAHwZTlXC
 YFWI1skpCeZYA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 07 Oct 2021 11:53:26 +0200
Date: Thu, 7 Oct 2021 11:53:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Message-ID: <20211007095326.GA2814782@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-3-kory.maincent@bootlin.com>
 <20211006181104.GD2081069@scaer>
 <20211007102318.556f7fc2@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211007102318.556f7fc2@kmaincent-XPS-13-7390>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 2/7] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
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
Cc: Adam Duskett <aduskett@gmail.com>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMTAtMDcgMTA6MjMgKzAyMDAsIEvDtnJ5IE1haW5jZW50IHNw
YWtlIHRodXNseToKPiBPbiBXZWQsIDYgT2N0IDIwMjEgMjA6MTE6MDQgKzAyMDAKPiAiWWFubiBF
LiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiA+IE9uIDIwMjEtMDkt
MjMgMTc6NTcgKzAyMDAsIEtvcnkgTWFpbmNlbnQgc3Bha2UgdGh1c2x5Ogo+ID4gWy0tU05JUC0t
XQo+ID4gPiBXZSBjYW4gbm8gbG9uZ2VyIHVzZSBhdXRvdG9vbHMtcGFja2FnZSBhcyBhIGNvbnNl
cXVlbmNlIG9mIHRoaXMKPiA+ID4gbXVsdGktYnVpbGQsIGFuZCB3ZSBoYXZlIHRvIHJlc29ydCB0
byBnZW5lcmljLXBhY2thZ2UgYW5kIGEgcGFydGlhbAo+ID4gPiBkdXBsaWNhdGlvbiBvZiB0aGUg
YXV0b3Rvb2xzLWluZnJhLiBHcnViMiB3YXMgYWxyZWFkeSB1c2luZyBjdXN0b20gb3B0aW9uCj4g
PiA+IGxpa2UgLS1wcmVmaXggb3IgLS1leGVjLXByZWZpeCBzbyB0aGlzIHdvbid0IGFkZCBtdWNo
IG1vcmUgd2VpcmRuZXNzLiAgCj4gPiBCdXQgdGhpcyBoYWQgYW4gdW5mb3J0dW5hdGUgc2lkZSBl
ZmZlY3Q6IHRoZSBncnViMiB0b29scywgbGlrZQo+ID4gZ3J1Yi1lZGl0ZW52LCBlbmFibGVkIHdp
dGggQlIyX1RBUkdFVF9HUlVCMl9JTlNUQUxMX1RPT0xTLCBhcmUgbm8KPiA+IGxvbmdlciBpbnN0
YWxsZWQgaW4gdGhlIHRhcmdldCBub3cuCj4gRG9oLCBkaWRuJ3QgdGhvdWdodCBvZiB0aGF0IQoK
TmVpdGhlciBkaWQgSS4uLgoKWy0tU05JUC0tXQo+ID4gQ2FyZSB0byBsb29rIGludG8gdGhhdCwg
cGxlYXNlPwo+IAo+IG1taCB0aGF0J3MgdHJpY2t5LCBiZWNhdXNlIGluIHRoZSBjYXNlIHdlIHdh
bnQgdG8gdXNlIHRoZSBHcnViIG1vZHVsZXMgaXQgbmVlZAo+IHRvIGJlIGdlbmVyYXRlZCBmb3Ig
ZWFjaCBwbGF0Zm9ybXMuCj4gRm9yIGV4YW1wbGUgd2UgY2FuIGZhY2UgYSBjYXNlIHdoZXJlIHdl
IHdpbGwgaGF2ZSB0aGVzZSB0aHJlZSBHcnViIG1vZHVsZXMKPiByZXBvc2l0b3JpZXMgZm9yIGVh
Y2ggcGxhdGZvcm06Cj4gdGFyZ2V0L2xpYi9ncnViL2kzODYtcGMvCj4gdGFyZ2V0L2xpYi9ncnVi
L2kzODYtZWZpLwo+IHRhcmdldC9saWIvZ3J1Yi94ODZfNjQtZWZpLwo+IAo+IFdoYXQgYWJvdXQg
anVzdCBhZGRpbmcgdGhlICJtYWtlIGluc3RhbGwiIGNvbW1hbmQgaW4gdGhlIGZvcmVhY2ggbG9v
cD8KPiBUaGlzIHdpbGwgb3ZlcndyaXRlIHRoZSBiaW5hcmllcywgdGhlIGxvY2FsZSBhbmQgdGhl
IC9ldGMgY29uZmlndXJhdGlvbnMgZm9yCj4gZWFjaCAibWFrZSIgbG9vcCBidXQgd2Ugd2lsbCBo
YXZlIGFsbCB0aGUgR3J1YiBtb2R1bGVzIHJlcG9zaXRvcmllcy4gSSBkb24ndAo+IHRoaW5rIHRo
ZSBvdmVyd3JpdGVzIHdpbGwgY2F1c2UgaXNzdWVzIGJlY2F1c2UgaXQgaXMganVzdCB0b29scy4K
Ckkgd2FzIHRoaW5raW5nIGFib3V0IHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMgb2Y6CgogICAg
ZGlmZiAtLWdpdCBhL2Jvb3QvZ3J1YjIvZ3J1YjIubWsgYi9ib290L2dydWIyL2dydWIyLm1rCiAg
ICBpbmRleCBlMDFlYmIyZWRiLi5iYjg1M2NhY2U2IDEwMDY0NAogICAgLS0tIGEvYm9vdC9ncnVi
Mi9ncnViMi5tawogICAgKysrIGIvYm9vdC9ncnViMi9ncnViMi5tawogICAgQEAgLTEyNyw2ICsx
MjcsOSBAQCBHUlVCMl9UVVBMRVMtJChCUjJfVEFSR0VUX0dSVUIyX0FSTTY0X0VGSSkgKz0KICAg
IGFybTY0LWVmaQogICAgIEhPU1RfR1JVQjJfQ09ORl9FTlYgPSBcCiAgICAgICAgQ1BQPSIkKEhP
U1RDQykgLUUiCiAgICAgCiAgICArIyBNYWluIGJ1aWxkOiBvbmx5IGJ1aWxkIHRvb2xzCiAgICAr
R1JVQjJfQ09ORl9PUFRTID0gLS13aXRoLXBsYXRmb3JtPW5vbmUgLS1ibGFibGEuLi4KICAgICsK
ICAgICBHUlVCMl9DT05GX0VOViA9IFwKICAgICAgICBDUFA9IiQoVEFSR0VUX0NDKSAtRSIgXAog
ICAgICAgIFRBUkdFVF9DQz0iJChUQVJHRVRfQ0MpIiBcCiAgICBAQCAtMTQ3LDcgKzE1MCw3IEBA
IEhPU1RfR1JVQjJfQ09ORl9PUFRTID0gXAogICAgICAgIC0tZW5hYmxlLWxpYnpmcz1ubyBcCiAg
ICAgICAgLS1kaXNhYmxlLXdlcnJvcgogICAgIAogICAgLWRlZmluZSBHUlVCMl9DT05GSUdVUkVf
Q01EUwogICAgK2RlZmluZSBHUlVCMl9DT05GSUdVUkVfQ01EU19QVEYKICAgICAgICAkKGZvcmVh
Y2ggdHVwbGUsICQoR1JVQjJfVFVQTEVTLXkpLCBcCiAgICAgICAgICAgIG1rZGlyIC1wICQoQEQp
L2J1aWxkLSQodHVwbGUpIDsgXAogICAgICAgICAgICBjZCAkKEBEKS9idWlsZC0kKHR1cGxlKSA7
IFwKICAgIEBAIC0xNjksMTQgKzE3MiwxNiBAQCBkZWZpbmUgR1JVQjJfQ09ORklHVVJFX0NNRFMK
ICAgICAgICAgICAgICAgIC0tZGlzYWJsZS13ZXJyb3IKICAgICAgICApCiAgICAgZW5kZWYKICAg
ICtHUlVCMl9QT1NUX0NPTkZJR1VSRV9IT09LUyArPSBHUlVCMl9DT05GSUdVUkVfQ01EU19QVEYK
ICAgICAKICAgIC1kZWZpbmUgR1JVQjJfQlVJTERfQ01EUwogICAgK2RlZmluZSBHUlVCMl9CVUlM
RF9DTURTX1BURgogICAgICAgICQoZm9yZWFjaCB0dXBsZSwgJChHUlVCMl9UVVBMRVMteSksIFwK
ICAgICAgICAgICAgJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgLUMgJChARCkvYnVpbGQtJCh0
dXBsZSkKICAgICAgICApCiAgICAgZW5kZWYKICAgICtHUlVCMl9QT1NUX0JVSUxEX0hPT0tTICs9
IEdSVUIyX0JVSUxEX0NNRFNfUFRGCiAgICAgCiAgICAtZGVmaW5lIEdSVUIyX0lOU1RBTExfSU1B
R0VTX0NNRFMKICAgICtkZWZpbmUgR1JVQjJfSU5TVEFMTF9JTUFHRVNfQ01EU19QVEYKICAgICAg
ICAkKGZvcmVhY2ggdHVwbGUsICQoR1JVQjJfVFVQTEVTLXkpLCBcCiAgICAgICAgICAgIG1rZGly
IC1wICQoZGlyICQoR1JVQjJfSU1BR0VfJCh0dXBsZSkpKSA7IFwKICAgICAgICAgICAgJChIT1NU
X0RJUikvdXNyL2Jpbi9ncnViLW1raW1hZ2UgXAogICAgQEAgLTE5NCw2ICsxOTksNyBAQCBkZWZp
bmUgR1JVQjJfSU5TVEFMTF9JTUFHRVNfQ01EUwogICAgICAgICAgICApIFwKICAgICAgICApCiAg
ICAgZW5kZWYKICAgICtHUlVCMl9QT1NUX0lOU1RBTExfSU1BR0VTX0hPT0tTICs9IEdSVUIyX0lO
U1RBTExfSU1BR0VTX0NNRFNfUFRGCiAgICAgCiAgICAtJChldmFsICQoZ2VuZXJpYy1wYWNrYWdl
KSkKICAgICskKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCiAgICAgJChldmFsICQoaG9zdC1h
dXRvdG9vbHMtcGFja2FnZSkpCgpCeSB1c2luZyAtLXdpdGgtcGxhdGZvcm09bm9uZSBpbiB0aGUg
bWFpbiBDT05GX09QVFMsIHdlIHNob3VsZCBiZSBhYmxlCnRvIGRpc2FibGUgYnVpbGRpbmcgYW55
IG9mIHRoZSAiaW1hZ2VzIiwgYW5kIGp1c3QgYnVpbGQgdGhlIHRvb2xzLgoKVG90YWxseSB1bnRl
c3RlZCwgb2YgY291cnNlLi4uCgpBbHRlcm5hdGl2ZWx5LCB3ZSBjb3VsZCBpbnRyb2R1Y2UgYSBu
ZXcgcGFja2FnZSwgZ3J1YjItdG9vbHMsIG5vdCB1bmxpa2UKdWJvb3QtdG9vbHMsIHdoaWNoIHNv
bGUgcmVzcG9uc2liaWxpdHkgd291bGQgYmUgdG8gYnVpbGQgYW5kIGluc3RhbGwKdGhvc2UgdG9v
bHMuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBSZWdhcmRzLAo+IAo+IEvDtnJ5CgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
