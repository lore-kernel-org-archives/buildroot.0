Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A09FCD4F59
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 09:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D64FC400C9;
	Thu,  5 Sep 2024 09:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJw9RJVCrZjG; Thu,  5 Sep 2024 09:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74395400DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74395400DF;
	Thu,  5 Sep 2024 09:00:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BA7F1BF476
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 09:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69578808A5
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 09:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGmM2Nw6lx9U for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 09:00:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 11C6880841
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11C6880841
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11C6880841
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 09:00:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DD7E413FAF8
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 11:00:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 05 Sep 2024 11:00:03 +0200
Date: Thu, 5 Sep 2024 11:00:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZtlzExLTPGV04J5D@landeda>
References: <20240904204234.498396-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240904204234.498396-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725526804;
 bh=KSoxIx1sBYqcqy//4HdBWJTVPgaW2iKtW+GTINeZqaE=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=rr0npZCxUXf+wsw2B0wyY97RczpxlDmCCrdRV/oq14N0Iv8KGWifQtPe8MuJYGwhC
 pbKlMaoHF071+BTCrlF2gw3bt2/T/OxHQZNkEpjJRx3eolyjCk+SPcDQODnn8aUoz7
 5T/LswPd0YhXTGoZE7NmTlX4PiVaAAud7xWx+p3CuyiNto1675A/b43z8+wPEiIn3C
 G6Fa89JcQRyoB+Ze6pmAiUQYExAtuVoPG4OBeaZADEXXSpKfPnMV5MIoNB3eauCwjM
 YDokfjCy4UosS9ICVkJ103XUvYFT35f7ggJPpw4Cyhbh9ih+ereHGovN7mNfPaenxt
 //rR4J7KYUjLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rr0npZCx
Subject: Re: [Buildroot] [PATCH] package/pkg-cargo: don't install crates
 tracking
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLAoKT24gMjAyNC0wOS0wNCAyMjo0MiArMDIwMCwgWWFubiBFLiBNT1JJTiBzcGFrZSB0aHVz
bHk6Cj4gQnkgZGVmYXVsdCwgJ2NhcmdvIGluc3RhbGwnIGFsc28gaW5zdGFsbHMgYSBraW5kIG9m
ICJyZWdpc3RyeSIgaW4KPiAvdXNyLy5jcmF0ZXMyLmpzb24gYW5kIC91c3IvLmNyYXRlcy50b21s
IFswXToKPiAgICAgVG8gdHJhY2sgaW5mb3JtYXRpb24gb2YgaW5zdGFsbGVkIGV4ZWN1dGFibGVz
LCBzb21lIGV4dHJhIGZpbGVzLAo+ICAgICBzdWNoIGFzIC5jcmF0ZXMudG9tbCBhbmQgLmNyYXRl
czIuanNvbiwgYXJlIGFsc28gY3JlYXRlZCB1bmRlciB0aGlzCj4gICAgIHJvb3QuCj4gCj4gUHJl
c3VtYWJseSwgdGhpcyB3b3VsZCBiZSB1c2VkIGJ5ICJjYXJnbyB1bmluc3RhbGwiIHRvIHByb3Bl
cmx5IGNsZWFudXAKPiB0aGUgcGFja2FnZSBbMV06Cj4gICAgIEJ5IGRlZmF1bHQgYWxsIGJpbmFy
aWVzIGFyZSByZW1vdmVkIGZvciBhIGNyYXRlIFsuLi5dLgo+IAo+IEhvd2V2ZXIsIGluIHRoZSBj
b250ZXh0IG9mIEJ1aWxkcm9vdCwgdGhpcyBpcyB1c2VsZXNzLCBhcyB3ZSBkbyBub3QKPiB1bmlu
c3RhbGwgcGFja2FnZXMsIGFuZCB0aHVzIHRob3NlIGZpbGVzIGFyZSBzdXBlcmZsdW91cy4KPiAK
PiBUZWxsIGNhcmdvIHRvIG5vdCBjcmVhdGUgdGhhdCB0cmFja2luZyBpbmZvcm1hdGlvbiwgYnkg
dXNpbmcgLS1uby10cmFjawo+IHRvICJjYXJnbyBpbnN0YWxsIi4KPiAKPiBOb3RlIHRoYXQgdGhp
cyB3b3VsZCBjYXVzZSBjYXJnbyB0byBmYWlsIHRvIGluc3RhbGwgYSBmaWxlIHRoYXQgYWxyZWFk
eQo+IGV4aXN0cyBbMl0sIGxpa2Ugd291bGQgYmUgdGhlIGNhc2Ugd2hlbiBydW5uaW5nIGZvby1y
ZWluc3RhbGwgZm9yIGV4YW1wbGU6Cj4gICAgIC0tbm8tdHJhY2sKPiAgICAgQnkgZGVmYXVsdCwg
Q2FyZ28ga2VlcHMgdHJhY2sgb2YgdGhlIGluc3RhbGxlZCBwYWNrYWdlcyB3aXRoIGEKPiAgICAg
bWV0YWRhdGEgZmlsZSBzdG9yZWQgaW4gdGhlIGluc3RhbGxhdGlvbiByb290IGRpcmVjdG9yeS4g
VGhpcyBmbGFnCj4gICAgIHRlbGxzIENhcmdvIG5vdCB0byB1c2Ugb3IgY3JlYXRlIHRoYXQgZmls
ZS4gV2l0aCB0aGlzIGZsYWcsIENhcmdvCj4gICAgIHdpbGwgcmVmdXNlIHRvIG92ZXJ3cml0ZSBh
bnkgZXhpc3RpbmcgZmlsZXMgdW5sZXNzIHRoZSAtLWZvcmNlIGZsYWcKPiAgICAgaXMgdXNlZC4g
VGhpcyBhbHNvIGRpc2FibGVzIENhcmdv4oCZcyBhYmlsaXR5IHRvIHByb3RlY3QgYWdhaW5zdAo+
ICAgICBtdWx0aXBsZSBjb25jdXJyZW50IGludm9jYXRpb25zIG9mIENhcmdvIGluc3RhbGxpbmcg
YXQgdGhlIHNhbWUKPiAgICAgdGltZS4KPiAKPiBIb3dldmVyLCB3ZSBkbyBhbHJlYWR5IHVzZSAt
LWZvcmNlIHdoaWNoIGFsbG93cyBjYXJnbyB0byBvdmVyd3JpdGUKPiBleGlzdGluZyBmaWxlcyB3
aXRob3V0IGFueSBmdXJ0aGVyIGFkbywgc28gaW4gb3VyIGNhc2UsIC0tbm8tdHJhY2sgd2lsbAo+
IG9ubHkgZGlzYWJsZSB0aGUgdHJhY2tpbmcgaW5mb3JtYXRpb24uCj4gCj4gQWxzbywgaW4gQnVp
bGRyb290LCB3ZSBkbyBub3QgaGF2ZSBjb25jdXJyZW50IGluc3RhbGxhdGlvbiBfdG8gdGhlIHNh
bWUKPiBsb2NhdGlvbl86IGVpdGhlciBQUEQgaXMgZGlzYWJsZWQsIGluIHdoaWNoIGNhc2Ugb25s
eSBvbmUgcGFja2FnZSB3aWxsCj4gYmUgaW5zdGFsbGVkIHRvIHRoZSBjb21tb24gdGFyZ2V0LyBh
dCBhIHRpbWUsIG9yIHdlJ3JlIHVzaW5nIFBQRCwgc28KPiBlYWNoIHBhY2thZ2Ugd2lsbCBnZXQg
aW5zdGFsbGVkIGludG8gaXRzIG93biB0YXJnZXQvLiBUaHVzLCAtLW5vLXRyYWNrCj4gaGFzIG5v
IGFkdmVyc2Ugc2lkZSBlZmZlY3QgZm9yIHVzLgo+IAo+IENsb3NlczogIzE3Cj4gCj4gWzBdIGh0
dHBzOi8vZG9jLnJ1c3QtbGFuZy5vcmcvY2FyZ28vcmVmZXJlbmNlL2NvbmZpZy5odG1sI2luc3Rh
bGxyb290Cj4gWzFdIGh0dHBzOi8vZG9jLnJ1c3QtbGFuZy5vcmcvY2FyZ28vY29tbWFuZHMvY2Fy
Z28tdW5pbnN0YWxsLmh0bWwKPiBbMl0gaHR0cHM6Ly9kb2MucnVzdC1sYW5nLm9yZy9jYXJnby9j
b21tYW5kcy9jYXJnby1pbnN0YWxsLmh0bWwKPiAKPiBSZXBvcnRlZC1ieTogVGhvbWFzIEtpbmRs
ZXIgQHRob21hc2s3Nwo+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4u
MTk5OEBmcmVlLmZyPgoKVGhvbWFzIHRlc3RlZCBpdCBmb3hlcyBpdCBmb3IgdGhlbSB0b286CiAg
ICBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9pc3N1ZXMvMTcj
bm90ZV8yMDkxNDk2NjgxCgpUZXN0ZWQtYnk6IFRob21hcyBLaW5kbGVyIEB0aG9tYXNrNzcKClJl
Z2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL3BrZy1jYXJnby5tayB8IDIg
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3BrZy1jYXJnby5tayBiL3BhY2thZ2UvcGtnLWNhcmdvLm1rCj4gaW5kZXggNDFkZmNi
ZDA5Ni4uZDk0YTE5MDI0ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BrZy1jYXJnby5tawo+ICsr
KyBiL3BhY2thZ2UvcGtnLWNhcmdvLm1rCj4gQEAgLTI3OSw2ICsyNzksNyBAQCBkZWZpbmUgJCgy
KV9JTlNUQUxMX1RBUkdFVF9DTURTCj4gIAkJCS0tcm9vdCAkJChUQVJHRVRfRElSKS91c3IvIFwK
PiAgCQkJLS1iaW5zIFwKPiAgCQkJLS1wYXRoIC4vIFwKPiArCQkJLS1uby10cmFjayBcCj4gIAkJ
CS0tZm9yY2UgXAo+ICAJCQktLWxvY2tlZCBcCj4gIAkJCS1aIHRhcmdldC1hcHBsaWVzLXRvLWhv
c3QgXAo+IEBAIC0yOTgsNiArMjk5LDcgQEAgZGVmaW5lICQoMilfSU5TVEFMTF9DTURTCj4gIAkJ
CS0tcm9vdCAkJChIT1NUX0RJUikgXAo+ICAJCQktLWJpbnMgXAo+ICAJCQktLXBhdGggLi8gXAo+
ICsJCQktLW5vLXRyYWNrIFwKPiAgCQkJLS1mb3JjZSBcCj4gIAkJCS0tbG9ja2VkIFwKPiAgCQkJ
JCQoJCgyKV9DQVJHT19JTlNUQUxMX09QVFMpCj4gLS0gCj4gMi40Ni4wCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBS
SUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJl
ICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICsz
MyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAg
XGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypc
XyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
