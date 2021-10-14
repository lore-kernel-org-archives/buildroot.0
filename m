Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD654C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:02:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71E8B60F23
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71E8B60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 042594012A;
	Thu, 14 Oct 2021 21:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EbtEQv2UZ20M; Thu, 14 Oct 2021 21:02:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E410A4014E;
	Thu, 14 Oct 2021 21:02:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 993441BF343
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93F274014E
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R7mZpeyuAIZ8 for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:02:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DC8A4012A
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:02:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cd49:1327:25a7:1fb2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 486055FF27;
 Thu, 14 Oct 2021 23:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634245346;
 bh=tmXPjupp0Dbsmhi8dYko65uET3fj1uAlzhslnkHCVBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gPCyZQAGCVV6xg7jM0EPQ3qKK4BRG7H/Rn9W4QwgjDPH5SEZhnYOhNAhIKivEO8nc
 mC/UxcyNBlIgBeSUDm/7fzllo5YBk+1D0NJTUnKxtqKT+3MTNAuAz6AMPINbSaRsNv
 dihv+rpRJbYcWPzwK4OG57bVude7D3EwAh3v6ofYDeWg0v+rRzKEk5pvMzyfj4xf/Y
 uxxsakkrc/RDKNTocVkwO9mwro+vqfn1CBgh7QM2obrqzvM+bTbT+ONEactZUNACJS
 rr+O8wMqxlwaiS1/dCY1EBUlJ5t/qrxG53b7TRugWJqptrEhhZBnksgV5iEjE0JGjS
 4Q+rtzOnwUUlA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 14 Oct 2021 23:02:17 +0200
Date: Thu, 14 Oct 2021 23:02:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Message-ID: <20211014210217.GE368016@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-3-kory.maincent@bootlin.com>
 <20211006181104.GD2081069@scaer>
 <20211007102318.556f7fc2@kmaincent-XPS-13-7390>
 <20211007095326.GA2814782@scaer>
 <20211007144351.629d2de0@kmaincent-XPS-13-7390>
 <20211007162931.GH2081069@scaer>
 <20211011122736.3b0df127@kmaincent-XPS-13-7390>
 <20211014200207.GC368016@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014200207.GC368016@scaer>
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
Cc: thomas.petazzoni@bootlin.com, Adam Duskett <aduskett@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMTAtMTQgMjI6MDIgKzAyMDAsIFlhbm4gRS4gTU9SSU4gc3Bh
a2UgdGh1c2x5Ogo+IFNvLCBpbiB0aGUgZW5kLCB5b3VyIG9yaWdpbmFsIHByb3Bvc2FsLCB0byBp
bnN0YWxsIGVhY2ggYW5kIGV2ZXJ5IHR1cGxlcwo+IGludG8gdGFyZ2V0LywgaXMgcHJvYmFibHkg
dGhlIGJlc3Qgb3B0aW9uIHdlIGhhdmUsIFsuLi5dCgpBZGRpdGlvbmFsbHksIHRvIHRlc3Qgd2hh
dCB3YXMgZmFpbGluZywgSSBoYWQgaW5zdHJ1bWVudGVkIHRoZSBidWlsZAp3aXRoIHRoZSBmb2xs
b3dpbmcgcGF0Y2ggKG5vdGUgdGhhdCBpdCBtaXhlcyBmaXhlcywgbGlrZSBubyBzZW1pLWNvbG9u
cwpidXQgc2VwYXJhdGUgbGluZXMsIG9yIHVzaW5nICYmIG5vdCBzaW1lLWNvbG9uLCB3aXRoIHRo
ZSBhY3R1YWwgY2FsbHMKdG8gTUVTU0FHRSk6CgogICAgZGlmZiAtLWdpdCBhL2Jvb3QvZ3J1YjIv
Z3J1YjIubWsgYi9ib290L2dydWIyL2dydWIyLm1rCiAgICBpbmRleCBlMDFlYmIyZWRiLi41NDAw
NTM4ODM3IDEwMDY0NAogICAgLS0tIGEvYm9vdC9ncnViMi9ncnViMi5tawogICAgKysrIGIvYm9v
dC9ncnViMi9ncnViMi5tawogICAgQEAgLTE0OSw4ICsxNDksOSBAQCBIT1NUX0dSVUIyX0NPTkZf
T1BUUyA9IFwKICAgICAKICAgICBkZWZpbmUgR1JVQjJfQ09ORklHVVJFX0NNRFMKICAgICAJJChm
b3JlYWNoIHR1cGxlLCAkKEdSVUIyX1RVUExFUy15KSwgXAogICAgLQkJbWtkaXIgLXAgJChARCkv
YnVpbGQtJCh0dXBsZSkgOyBcCiAgICAtCQljZCAkKEBEKS9idWlsZC0kKHR1cGxlKSA7IFwKICAg
ICsJCUAkKGNhbGwgTUVTU0FHRSxDb25maWd1cmluZyAkKHR1cGxlKSkKICAgICsJCW1rZGlyIC1w
ICQoQEQpL2J1aWxkLSQodHVwbGUpCiAgICArCQljZCAkKEBEKS9idWlsZC0kKHR1cGxlKSAmJiBc
CiAgICAgCQkkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgXAogICAgIAkJCQkkKFRBUkdFVF9DT05G
SUdVUkVfQVJHUykgXAogICAgIAkJJChHUlVCMl9DT05GX0VOVikgXAogICAgQEAgLTE3MiwxMyAr
MTczLDE1IEBAIGVuZGVmCiAgICAgCiAgICAgZGVmaW5lIEdSVUIyX0JVSUxEX0NNRFMKICAgICAJ
JChmb3JlYWNoIHR1cGxlLCAkKEdSVUIyX1RVUExFUy15KSwgXAogICAgKwkJQCQoY2FsbCBNRVNT
QUdFLEJ1aWxkaW5nICQodHVwbGUpKQogICAgIAkJJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkg
LUMgJChARCkvYnVpbGQtJCh0dXBsZSkKICAgICAJKQogICAgIGVuZGVmCiAgICAgCiAgICAgZGVm
aW5lIEdSVUIyX0lOU1RBTExfSU1BR0VTX0NNRFMKICAgICAJJChmb3JlYWNoIHR1cGxlLCAkKEdS
VUIyX1RVUExFUy15KSwgXAogICAgLQkJbWtkaXIgLXAgJChkaXIgJChHUlVCMl9JTUFHRV8kKHR1
cGxlKSkpIDsgXAogICAgKwkJQCQoY2FsbCBNRVNTQUdFLEluc3RhbGxpbmcgJCh0dXBsZSkgdG8g
aW1hZ2VzIGRpcmVjdG9yeSkKICAgICsJCW1rZGlyIC1wICQoZGlyICQoR1JVQjJfSU1BR0VfJCh0
dXBsZSkpKQogICAgIAkJJChIT1NUX0RJUikvdXNyL2Jpbi9ncnViLW1raW1hZ2UgXAogICAgIAkJ
CS1kICQoQEQpL2J1aWxkLSQodHVwbGUpL2dydWItY29yZS8gXAogICAgIAkJCS1PICQodHVwbGUp
IFwKICAgIEBAIC0xODYsMTIgKzE4OSwxMiBAQCBkZWZpbmUgR1JVQjJfSU5TVEFMTF9JTUFHRVNf
Q01EUwogICAgIAkJCS1wICIkKEdSVUIyX1BSRUZJWF8kKHR1cGxlKSkiIFwKICAgICAJCQkkKGlm
ICQoR1JVQjJfQlVJTFRJTl9DT05GSUdfJCh0dXBsZSkpLCBcCiAgICAgCQkJCS1jICQoR1JVQjJf
QlVJTFRJTl9DT05GSUdfJCh0dXBsZSkpKSBcCiAgICAtCQkJCSQoR1JVQjJfQlVJTFRJTl9NT0RV
TEVTXyQodHVwbGUpKSA7IFwKICAgIC0JCSQoSU5TVEFMTCkgLUQgLW0gMDY0NCBib290L2dydWIy
L2dydWIuY2ZnICQoR1JVQjJfQ0ZHXyQodHVwbGUpKSA7IFwKICAgICsJCQkJJChHUlVCMl9CVUlM
VElOX01PRFVMRVNfJCh0dXBsZSkpCiAgICArCQkkKElOU1RBTEwpIC1EIC1tIDA2NDQgYm9vdC9n
cnViMi9ncnViLmNmZyAkKEdSVUIyX0NGR18kKHR1cGxlKSkKICAgICAJCSQoaWYgJChmaW5kc3Ry
aW5nICQoR1JVQjJfUExBVEZPUk1fJCh0dXBsZSkpLCBwYyksIFwKICAgICAJCQljYXQgJChIT1NU
X0RJUikvbGliL2dydWIvJCh0dXBsZSkvY2Rib290LmltZyAkKEdSVUIyX0lNQUdFXyQodHVwbGUp
KSA+IFwKICAgIC0JCQkJJChCSU5BUklFU19ESVIpL2dydWItZWx0b3JpdG8uaW1nIDsgXAogICAg
LQkJKSBcCiAgICArCQkJCSQoQklOQVJJRVNfRElSKS9ncnViLWVsdG9yaXRvLmltZyBcCiAgICAr
CQkpCiAgICAgCSkKICAgICBlbmRlZgogICAgIAoKVGhhdCB3YXksIGl0IGlzIGVhc2llciB0byBz
ZWUgd2hhdCBpcyBnb2luZyBvbiwgYW5kIHRoZSBvdXRwdXQgd2hlbgpmaWx0ZXJlZCB3aXRoIGJy
bWFrZSwgbG9va3MgbmljZSA7LSkKCjIwMjEtMTAtMTQgMjI6NTI6MzYgPj4+IGdydWIyIDIuMDQg
RXh0cmFjdGluZwoyMDIxLTEwLTE0IDIyOjUyOjM2ID4+PiBncnViMiAyLjA0IFBhdGNoaW5nCjIw
MjEtMTAtMTQgMjI6NTI6MzkgPj4+IGdydWIyIDIuMDQgQ29uZmlndXJpbmcKMjAyMS0xMC0xNCAy
Mjo1MjozOSA+Pj4gZ3J1YjIgMi4wNCBDb25maWd1cmluZyBpMzg2LXBjCjIwMjEtMTAtMTQgMjI6
NTI6NTYgPj4+IGdydWIyIDIuMDQgQ29uZmlndXJpbmcgaTM4Ni1lZmkKMjAyMS0xMC0xNCAyMjo1
MzoxMyA+Pj4gZ3J1YjIgMi4wNCBCdWlsZGluZwoyMDIxLTEwLTE0IDIyOjUzOjEzID4+PiBncnVi
MiAyLjA0IEJ1aWxkaW5nIGkzODYtcGMKMjAyMS0xMC0xNCAyMjo1Mzo1MSA+Pj4gZ3J1YjIgMi4w
NCBCdWlsZGluZyBpMzg2LWVmaQoyMDIxLTEwLTE0IDIyOjU0OjI4ID4+PiBncnViMiAyLjA0IElu
c3RhbGxpbmcgdG8gdGFyZ2V0CjIwMjEtMTAtMTQgMjI6NTQ6MjggPj4+IGdydWIyIDIuMDQgSW5z
dGFsbGluZyBpMzg2LXBjIHRvIHRhcmdldAoyMDIxLTEwLTE0IDIyOjU0OjMxID4+PiBncnViMiAy
LjA0IEluc3RhbGxpbmcgaTM4Ni1lZmkgdG8gdGFyZ2V0CjIwMjEtMTAtMTQgMjI6NTQ6MzQgPj4+
IGdydWIyIDIuMDQgSW5zdGFsbGluZyB0byBpbWFnZXMgZGlyZWN0b3J5CjIwMjEtMTAtMTQgMjI6
NTQ6MzQgPj4+IGdydWIyIDIuMDQgSW5zdGFsbGluZyBpMzg2LXBjIHRvIGltYWdlcyBkaXJlY3Rv
cnkKMjAyMS0xMC0xNCAyMjo1NDozNCA+Pj4gZ3J1YjIgMi4wNCBJbnN0YWxsaW5nIGkzODYtZWZp
IHRvIGltYWdlcyBkaXJlY3RvcnkKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQg
fCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAw
NTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAg
ICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdB
SU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vl
ay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwK
Jy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
