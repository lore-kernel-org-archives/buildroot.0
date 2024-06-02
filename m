Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502AFC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 21:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0627381F75;
	Sun,  2 Jun 2024 21:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guAD0yqSiG10; Sun,  2 Jun 2024 21:15:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7D5381F76
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7D5381F76;
	Sun,  2 Jun 2024 21:15:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A67D1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 21:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0419340340
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 21:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXN_9Y0wrbSx for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 21:15:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B23C84031B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B23C84031B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B23C84031B
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 21:15:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1D63613F88F;
 Sun,  2 Jun 2024 23:15:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 02 Jun 2024 23:15:28 +0200
Date: Sun, 2 Jun 2024 23:15:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zlzg8I5r7cd8yTz5@landeda>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
 <1f9ee4bc875b559abde9a4746ab55fa4ca62dc85.1717360788.git.yann.morin.1998@free.fr>
 <CADvTj4qfHg9=mC_OweMCpfNNBDMweBreqDo_bT=t=m339oLBWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4qfHg9=mC_OweMCpfNNBDMweBreqDo_bT=t=m339oLBWQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717362931;
 bh=sL+boOH2c+6hV18/RsANPyH0pdpIxnUe4Z5YN/5HpvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J+I2dZhN5FSvScWVANO4lExVnSlU9d81PvefBhOkpecLhV6NGsO9KHeWtXsNCwk8A
 4tc/Hcpkh9sWRU7Mz6MdQtDAR+agVr7n9TK2AZb9maXREhZ3Q1OP2nHfaiJdlmvrme
 SY5B7zGQq5QmIlBZD0prKW5WnY9OWTnmJJWvFtIWWAjNvf2V9e7tMWKu/sgSyViz6Y
 X1jlemFKV67QIu4tr7LvKkfjLp1F6B62rpsk4bMLkRzoo1gQqxEuPVGwh7G8O+dhe/
 1vty2YCN0jxmIvzlA0mPLBjG6U3h8XNkF5EBOwLnB7ZRsSfcNBqOVdDFwHpGKrlwlM
 Cj3DbjkoWKIxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=J+I2dZhN
Subject: Re: [Buildroot] [PATCH 14/16] package/pkg-cargo: add support for
 unlocked packages
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjQtMDYtMDIgMTQ6NTMgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBTdW4sIEp1biAyLCAyMDI0IGF0IDI6NDLigK9QTSBZYW5uIEUuIE1P
UklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6ClstLVNOSVAtLV0KPiA+ICtXaGVu
IGEgcGFja2FnZSBzb3VyY2UgdHJlZSBjb250YWlucyBhICtDYXJnby5sb2NrKyBmaWxlLCB0aGUg
cGFja2FnZSBoYXMKPiA+ICtiZWVuIF9sb2NrZWRfOiBjYXJnbyBkaWQgc3RvcmUgdGhlIHZlcnNp
b25zIGZvciB0aGUgY29tcGxldGUgZGVwZW5kZW5jeQo+ID4gK2NoYWluIGluIHRoZSArQ2FyZ28u
bG9jaysgZmlsZTsgdGhhdCBpcyB0aGVuIHJldXNlZCBieSBjYXJnbyBkdXJpbmcgdGhlCj4gPiAr
dmVuZG9yaW5nLCB3aGljaCB5aWVsZHMgYSByZXByb2R1Y2libGUgZGVwZW5kZW5jeSBjaGFpbiwg
YW5kIHRodXMgYQo+ID4gK3JlcHJvZHVjaWJsZSB0YXJiYWxsOyB0aGVyZWZvcmUsIGl0IGlzIHBv
c3NpYmxlIHRvIGNvbXB1dGUgYSBoYXNoIGZvcgo+ID4gK3RoYXQgYXJjaGl2ZS4gSWYgYSBwYWNr
YWdlIHdhcyBob3dldmVyIG5vdCBsb2NrZWQsIHRoZW4gdGhlIHZlcnNpb25zIGZvcgo+ID4gK3Ro
ZSBkZXBlbmRlbmNpZXMgYXJlIHVua25vd24sIHRoZSBkZXBlbmRlbmN5IGNoYWluIGlzIG5vdCBy
ZXByb2R1Y2libGUsCj4gPiArYW5kIHRoZSBhcmNoaXZlIGlzIHRoZW4gbm90IHJlcHJvZHVjaWJs
ZSwgd2hpY2ggaW1wbGllcyB0aGVyZSBjYW4gYmUgbm8KPiA+ICtoYXNoIGZvciB0aGF0IGFyY2hp
dmUuCj4gCj4gSG1tLCBmb3IgdGhlc2UgY2FzZXMgc2hvdWxkbid0IHdlIGdlbmVyYXRlIGFuZCBj
b21taXQgdGhlIGxvY2tmaWxlIHRvCj4gdGhlIGJ1aWxkcm9vdCBwYWNrYWdlIHNvIHRoYXQgd2Ug
Y2FuIHRoZW4gZ2VuZXJhdGUgYSBkZXRlcm1pbmlzdGljIGFyY2hpdmUKPiBhbmQgYXJjaGl2ZSBo
YXNoPwoKVGhhbmtzIGZvciB0aGUgcXVpY2sgZmVlZGJhY2shIDotKQpUaGF0J3MgYSBnb29kIGlk
ZWEsIGluZGVlZCEKCkluc3RlYWQgb2YgaW50cm9kdWNpbmcgdGhlIC11IG9wdGlvbiwgd2UnZCBk
byBzb21ldGhpbmcgbGlrZToKCkluIGZvby5tazoKCiAgICBGT09fQ0FSR09fTE9DS0VEID0gYnVp
bGRyb290ICAob3Igd2hhdGV2ZXIgbm1lYW5zICJub3QgdXB0cmVhbSIpCgppbiBwa2ctY2FyZ28u
bWs6CgogICAgJCgyKV9DQVJHT19MT0NLRUQgPz0gdXBzdHJlYW0gIChvciBhbnl0aGluZyB0aGF0
IG1lYW5zICJPSyEhISIpCgppbiBwa2ctZG93bmxvYWQubWs6CgogICAgZGwtd3JhcHBlciBcCiAg
ICAgICAgWy4uLl0gXAogICAgICAgICQoaWYgJChmaWx0ZXIgYnVpbGRyb290LCQoJChQS0cpX0NB
UkdPX0xPQ0tFRCkpLC1MICQoJChQS0cpX1BLR0RJUikvQ2FyZ28ubG9jayBcCiAgICAgICAgWy4u
Ll0KCmFuZCBpbiBjYXJnby1wb3N0LXByb2Nlc3MgKHBzZXVkbyBjb2RlKToKCiAgICBpZiBvcHRp
b24gLUwgaXMgZ2l2ZW46CiAgICAgICAgY29weSAtTCBhcmcgdG8gLi9DYXJnby5sb2NrCiAgICBl
bmRpZgoKICAgIFsgLWYgQ2FyZ28ubG9jayBdIHx8IGRpZSAnTm8gd2F5IScKCldhcyB0aGF0IHdo
YXQgeW91IGhhZCBpbiBtaW5kPwoKPiBJIHRoaW5rIHdlIHdhbnQgdG8gaGF2ZSB0aGUgYWJpbGl0
eSB0byBtYWtlIHRoZXNlIHBhY2thZ2VzIGRldGVybWluaXN0aWMKPiBldmVuIGlmIHVwc3RyZWFt
IGZhaWxzIHRvIHByb3ZpZGUgYSBDYXJnby5sb2NrIGZpbGUuCgpZZXMsIHRoZSBsYWNrIG9mIHJl
cHJvZHVjaWJpbGl0eSB3YXMgcmVhbGx5IGJvdGhlcmluZyBtZS4gQnV0IGlmIHdlIGNhbgplYXNp
bHkgY3JlYXRlIGEgQ2FyZ28ubG9jayB3aXRob3V0IHRvbyBtdWNoIGlzc3VlLCB0aGVuIHlvdXIg
c3VnZ2VzdGlvbgp3b3VsZCBiZSBncmVhdCEKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAK
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
