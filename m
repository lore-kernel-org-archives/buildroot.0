Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7848C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 11:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74FCC407CB;
	Tue, 14 Jul 2026 11:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTHZbG_OJYG9; Tue, 14 Jul 2026 11:34:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CC9740855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784028889;
	bh=CuG3MmozVy2iM54ZVV2NReIrtKTb14u2HK4YKvmK6S4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ksqZ+jrQioJUgfrXT0rY1h0HDn0OFaPRTBwGfhPWwHMd79wA+afha9z5Xme9Jm/OE
	 El5VTfe5g74jxlCcUepNJy39tqC5AGS8s+VJ2apzHY/7Z2W/fBI01n+Y4KSIL4MZBy
	 F/ZnDRoH9axBJ/5n2qGlK4HVgLLolvAhLxkqw6DKKQqB8fm/vrFKiXv5NQkYyDIB4/
	 RiFNBHQT05ldFuN3Vd6D4ukzpeu2zdU1CRzjZVL+k1jpf8sm0cs6w6KE3FEFwamPSS
	 sAoRAnmLtQv1yYRlH1XbAGk+MbhcyChJRBaR5Na9DkOH929SUagZyJm4iZWR8b1uZy
	 qKhqxCpNpC1YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CC9740855;
	Tue, 14 Jul 2026 11:34:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A8B249CF
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DFCA40855
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnFhtDp6jA-h for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 11:34:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D4294407CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4294407CB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4294407CB
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:34:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7EC2F2003C8;
 Tue, 14 Jul 2026 13:34:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 13:34:42 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 13:34:42 +0200
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Bernard Gautier
 <bernard.gautier@nav-timing.safrangroup.com>
In-Reply-To: <20260618-libgpg-error-gawk-v1-1-d6ac9f962f1f@bootlin.com>
References: <20260618-libgpg-error-gawk-v1-1-d6ac9f962f1f@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <09d3e819f570608806122b57c96ab83b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784028885;
 bh=9+qZXFhU33c8aVI3twdFE0qdNbZHnQPnGPu9hvAwhLU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pHzN8miQKKtVw+2A8Zrj2yx6Wzx2iRpEsr6C+q9uhkXf0E8Oyil1MmUBQkBfnS0U/
 OteO1+fM71zagKt08g0R+TTfv49TAER3/l+bxnJXqWxIhvPeydDc8/3IUUJknXIaPy
 Nfx5hIH3KKGlGJAFIjugwCGwlS6+0ZisPBAAC/LiAVYnxg8my3HLmL9GbTxtSGD5KC
 NMjfyHJesww9/eWEynLlRZxlEbJV+nhS4hW1KGMtBWzJArCp71qJfc3p9yyFGao/JO
 TxB83bzUo44G8St7KI5SYR4QWeUxuVqF7YM0VIJkBNSLySDT0vZPl8S5jxVnKCl4kV
 KSJvM2GC/P3aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pHzN8miQ
Subject: Re: [Buildroot] [PATCH] package: libgpg-error: make sure to use
 host-gawk
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

T24gMTgvMDYvMjAyNiAxNjo0OSwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gRnJvbTogQmVybmFyZCBHYXV0aWVyIDxiZXJuYXJkLmdhdXRpZXJAbmF2LXRpbWluZy5zYWZy
YW5ncm91cC5jb20+Cj4gCj4gRHVyaW5nIGl0cyBjb25maWd1cmUgc3RlcCwgbGliZ3BnLWVycm9y
IG5lZWRzIGF3azoKPiAKPiAgIGNvbmZpZ3VyZSAtPiBzcmMvZ2VuLWxvY2stb2JqLnNoIC0+IG9i
amR1bXAgKyBhd2sgb24gdGVzdCBiaW5hcnkKPiAKPiBUaGlzIGNhbGwgaXMgdXNlZCBvbiB0aGUg
b3V0cHV0IGZyb20gb2JqZHVtcCBvbiBhIHRlc3QgYmluYXJ5IHRvCj4gcmV0cmlldmUgdGhlIHNp
emUgb2Ygc29tZSBkYXRhIHN0cnVjdHVyZSwgYW5kIGdlbmVyYXRlIGFjY29yZGluZ2x5IGFuCj4g
aW50ZXJuYWwgaGVhZGVyIChsb2NrLW9iai1wdWIubmF0aXZlLmgpLiBIb3dldmVyLCBsaWJncGct
ZXJyb3IgCj4gYnVpbGRyb290Cj4gcGFja2FnZSBkb2VzIG5vdCBkZXBlbmQgZXhwbGljaXRlbHkg
b24gaG9zdC1nYXdrOiBpZiBob3N0LWdhd2sgaXMgbm90Cj4gcGFydCBvZiB0aGUgYnVpbGQsIG9y
IGlmIGl0IGlzIGJ1aWx0IGxhdGVyIHRoYW4gbGliZ3BnLWVycm9yLAo+IGxpYmdwZy1lcnJvciBh
dXRvdG9vbCB0b29saW5nIHdpbGwgZXZlbnR1YWxseSBwaWNrIHRoZSBidWlsZCBtYWNoaW5lCj4g
YXdrLiBPbiB0b3Agb2YgdGhpcyBpc3N1ZSwgZGVzcGl0ZSB0aGUgY29uZmlndXJlLmFjIHN1Z2dl
c3RpbmcgdGhhdCBpdAo+IHN1cHBvcnRzIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMgb2YgYXdr
LCBsaWJncGctZXJyb3IgY29uZmlndXJlIHN0ZXAKPiB3aWxsIG5vdCBwYXJzZSBjb3JyZWN0bHkg
dGhlIG91dHB1dCBmcm9tIG9iamR1bXAgd2hlbiB1c2luZyBtYXdrLAo+IGxlYWRpbmcgdG8gYSB3
cm9uZyBsb2NrLW9iai1wdWIubmF0aXZlLmggaGVhZGVyIGJlaW5nIGdlbmVyYXRlZDoKPiAKPiBX
aXRoIGdhd2s6Cj4gCj4gICB0eXBlZGVmIHN0cnVjdAo+ICAgewo+ICAgICBsb25nIF92ZXJzOwo+
ICAgICB1bmlvbiB7Cj4gICAgICAgdm9sYXRpbGUgY2hhciBfcHJpdlsyNF07Cj4gICAgICAgbG9u
ZyBfeF9hbGlnbjsKPiAgICAgICBsb25nICpfeHBfYWxpZ247Cj4gICAgIH0gdTsKPiAgIH0gZ3Bn
cnRfbG9ja190Owo+IAo+ICAgI2RlZmluZSBHUEdSVF9MT0NLX0lOSVRJQUxJWkVSIHsxLHt7MCww
LDAsMCwwLDAsMCwwLCBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAw
LDAsMCwwLDAsMCwwLDAsIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDAsMCwwLDAsMCwwLDAsMH19fQo+IAo+IFdpdGggbWF3azoKPiAKPiAgIHR5cGVkZWYgc3RydWN0
Cj4gICB7Cj4gICAgIGxvbmcgX3ZlcnM7Cj4gICAgIHVuaW9uIHsKPiAgICAgICB2b2xhdGlsZSBj
aGFyIF9wcml2WzBdOwo+ICAgICAgIGxvbmcgX3hfYWxpZ247Cj4gICAgICAgbG9uZyAqX3hwX2Fs
aWduOwo+ICAgICB9IHU7Cj4gICB9IGdwZ3J0X2xvY2tfdDsKPiAKPiAgICNkZWZpbmUgR1BHUlRf
TE9DS19JTklUSUFMSVpFUiB7MSx7e319fQo+IAo+IFRoaXMgaXNzdWUgaGFzIGJlZW4gb2JzZXJ2
ZWQgZm9yIGV4YW1wbGUgb24gRGViaWFuIDEzIHdpdGggbWF3awo+IGluc3RhbGxlZDogaXQgZmFp
bHMgdG8gcGFyc2UgbXR4X3NpemUsIGxlYWRpbmcgdG8gYSBzaXplIDAsIGFuZCBzbwo+IGdlbmVy
YXRpbmcgY3Jhc2hlcyBhdCBydW50aW1lIGJlY2F1c2Ugb2YgdGhlIGludmFsaWQgc2l6ZSBlbWJl
ZGRlZCBpbgo+IGxpYmdwZy1lcnJvci4KPiAKPiBsaWJncGctZXJyb3Igc2hvdWxkIGJlIGZpeGVk
IHVwc3RyZWFtIHRvIHByb3Blcmx5IGhhbmRsZSB0aGlzIGRhdGEKPiBzdHJ1Y3R1cmUgc2l6ZSBn
dWVzc2luZyBldmVuIHdoZW4gdXNpbmcgbWF3aywgYnV0IGFueXdheSB0aGUKPiBjb3JyZXNwb25k
aW5nIGJ1aWxkcm9vdCBwYWNrYWdlIHNob3VsZCBub3QgcmFuZG9tbHkgdXNlIHRoZSBidWlsZAo+
IG1hY2hpbmUgaG9zdCB0b29saW5nIG9yIGJ1aWxkcm9vdC1wcm92aWRlZCBob3N0IHRvb2xpbmcg
ZGVwZW5kaW5nIG9uCj4gd2hldGhlciBob3N0LWdhd2sgaGFzIGJlZW4gc2VsZWN0ZWQgYW5kIGJ1
aWx0IGJlZm9yZSBpdC4KPiAKPiBFbmZvcmNlIGFuIGV4cGxpY2l0IGRlcGVuZGVuY3kgb24gaG9z
dC1nYXdrIGZvciBsaWJncGctZXJyb3IgdG8gbWFrZQo+IHN1cmUgdGhhdCBpdCBzeXN0ZW1hdGlj
YWxseSB1c2VzIHRoZSBidWlsZHJvb3QtcHJvdmlkZWQgYXdrLgo+IAo+IENvLWRldmVsb3BwZWQt
Ynk6IEJlcm5hcmQgR2F1dGllciAKPiA8YmVybmFyZC5nYXV0aWVyQG5hdi10aW1pbmcuc2FmcmFu
Z3JvdXAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEJlcm5hcmQgR2F1dGllciAKPiA8YmVybmFyZC5n
YXV0aWVyQG5hdi10aW1pbmcuc2FmcmFuZ3JvdXAuY29tPgo+IENvLWRldmVsb3BwZWQtYnk6IEFs
ZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgpXaGlsZSByZXZpZXdpbmcsIEkgb2JzZXJ2ZWQgdGhlIG1hd2sg
dmVyc2lvbiBmcm9tIERlYmlhbiAxMiBpcyB3b3JraW5nIAphcwpleHBlY3RlZC4gT25seSB0aGUg
dmVyc2lvbiBpbiBEZWJpYW4gMTMgc2hvd3MgdGhlIGlzc3VlLiBJIGFkZGVkIHRoaXMgCnNpZGUK
bm90ZSBpbiB0aGUgY29tbWl0IGxvZywgd2hlbiBhcHBseWluZy4KCkJlc3QgcmVnYXJkcywKCkp1
bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
