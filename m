Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074A5C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A779682033;
	Sat, 13 Jul 2024 20:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtldQCmKZujh; Sat, 13 Jul 2024 20:38:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF6B881F52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF6B881F52;
	Sat, 13 Jul 2024 20:38:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1B1F1BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE636404C1
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNkYeMLux9Cr for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:38:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D33EB404BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D33EB404BF
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D33EB404BF
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:38:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05C0CFF803;
 Sat, 13 Jul 2024 20:38:23 +0000 (UTC)
Date: Sat, 13 Jul 2024 22:38:23 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= via buildroot
 <buildroot@buildroot.org>
Message-ID: <20240713223823.06f7a5dc@windsurf>
In-Reply-To: <20240607163208.1445715-5-raphael.melotte@mind.be>
References: <20240216211344.1807353-2-raphael.melotte@mind.be>
 <20240607163208.1445715-1-raphael.melotte@mind.be>
 <20240607163208.1445715-5-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720903104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ITQ1cZNHlGLr3jZAR1d26ZGUtnBCdaIYXnpWfXYJQzw=;
 b=mj1nTMVT1JBOYEsEFJ4XwG+vGuNFCdBSdKFegvO4kqPp0ciJIDV6+sBL5wS/tYKsoI5+LC
 na98lG91xm2zNfFk3OGnHVPGKx7irRuv9K6oWjqjAgMoYGLymXOew3vX4raTBm087qahRL
 FeQ0ZSJZa5x8nQupVouadckh6PD5cuETENRdcX4YI52vZfPnnP2VctAq6STbcuQ1Z/Wv3c
 Ic+/UomKUS/9bFXknCoeOz48EfdI9fGAZLSgqNsJEGL2+2c8AZ8S/lDor5dEoVqiSrhPN4
 CU1PfOQObeeRSbbjBUE8VmIhwqVywW2trCIytSpdMFppmhxc3A77yhHGLq7dyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mj1nTMVT
Subject: Re: [Buildroot] [PATCH v2 5/5] package/python-pymupdf: bump to
 version 1.23.22
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBGcmksICA3IEp1biAyMDI0IDE4OjMyOjA2ICswMjAwClJhcGhhw6tsIE3DqWxv
dHRlIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gVGhp
cyBuZXcgcHl0aG9uLXB5bXVwZGYgdmVyc2lvbiBmYWlscyBhdCBydW50aW1lIHdoZW4gbXVwZGYg
YnVpbGRzCj4gc3RhdGljIGxpYnJhcmllcy4gVGhpcyBzaG91bGQgbm90IGJlIHBvc3NpYmxlIGFz
IHhvcmcgYW55d2F5IGRlcGVuZHMKPiBvbiAhQlIyX1NUQVRJQ19MSUJTLCBidXQgbGV0J3MgYmUg
ZXhwbGljaXQgYW5kIGZvcmJpZCBweXRob24tcHltdXBkZgo+IHRvIGJlIGJ1aWx0IHdpdGggQlIy
X1NUQVRJQ19MSUJTIGFzIHdlbGwuCgpJIGRyb3BwZWQgdGhlIGxhc3Qgc2VudGVuY2UgYmVjYXVz
ZSBYLm9yZyBpcyBubyBsb25nZXIgYSBkZXBlbmRlbmN5LgoKCj4gLSMgcHl0aG9uLXB5bXVwZGYn
cyB2ZXJzaW9uIG11c3QgbWF0Y2ggbXVwZGYncyB2ZXJzaW9uCj4gKyMgcHl0aG9uLXB5bXVwZGYn
cyB2ZXJzaW9uIGJlIGNvbXBhdGlibGUgd2l0aCBtdXBkZidzIHZlcnNpb24KCiptdXN0IGJlKgoK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcHltdXBkZi8wMDAxLXBpcGNsLnB5LWFsbG93
LXByb3ZpZGluZy1weXRob24tY29uZmlnLWV4dGVybmFsbHkucGF0Y2ggYi9wYWNrYWdlL3B5dGhv
bi1weW11cGRmLzAwMDEtcGlwY2wucHktYWxsb3ctcHJvdmlkaW5nLXB5dGhvbi1jb25maWctZXh0
ZXJuYWxseS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4u
MmZkNzJjNzExZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1weW11cGRm
LzAwMDEtcGlwY2wucHktYWxsb3ctcHJvdmlkaW5nLXB5dGhvbi1jb25maWctZXh0ZXJuYWxseS5w
YXRjaAo+IEBAIC0wLDAgKzEsMTI1IEBACj4gK0Zyb20gY2EzNDE3YjhkNjA1Y2NkYjJlNmM1MTZj
NWUwYzc5MTgwMzgxNjI3YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogPT9VVEYt
OD9xP1JhcGhhPUMzPUFCbD0yME09QzM9QTlsb3R0ZT89IDxyYXBoYWVsLm1lbG90dGVAbWluZC5i
ZT4KPiArRGF0ZTogU3VuLCA0IEZlYiAyMDI0IDE2OjEzOjQ1ICswMTAwCj4gK1N1YmplY3Q6IFtQ
QVRDSF0gcGlwY2wucHk6IGFsbG93IHByb3ZpZGluZyBweXRob24tY29uZmlnIGV4dGVybmFsbHkK
PiArTUlNRS1WZXJzaW9uOiAxLjAKPiArQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0
PVVURi04Cj4gK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiArCj4gK1doZW4gY3Jv
c3MtY29tcGlsaW5nIChlLmcuIHVzaW5nIEJ1aWxkcm9vdCksIHRoZSBweXRob24tY29uZmlnCj4g
K2V4ZWN1dGFibGUgdGhhdCByZXNpZGVzIG5leHQgdG8gdGhlIGhvc3QgcHl0aG9uIGV4ZWN1dGFi
bGUgcHJvdmlkZXMKPiAraW5jb3JyZWN0IGluY2x1ZGVzICh0aGUgb25lcyBmb3IgdGhlIGhvc3Qp
Lgo+ICsKPiArU2luY2UgdGhlIGNvcnJlY3QgcGF0aCB0byBweXRob24tY29uZmlnIGNhbm5vdCBi
ZSBndWVzc2VkLCBhZGQgYW4KPiArYWRkaXRpb25hbCBlbnZpcm9ubWVudCB2YXJpYWJsZSB0byBh
bGxvdyBzZXR0aW5nIHRoZSBwYXRoIHRvIHRoZQo+ICtjb3JyZWN0IHB5dGhvbi1jb25maWcgZXhl
Y3V0YWJsZSBleHRlcm5hbGx5Lgo+ICsKPiArU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90
dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIu
Y29tL3B5bXVwZGYvUHlNdVBERi9wdWxsLzMxNzMKCkkgY2hhbmdlZCB0aGlzIHRvIHRoZSBmaW5h
bCBjb21taXQsIHNpbmNlIGl0IGdvdCBtZXJnZWQgdXBzdHJlYW0hCgoKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9weXRob24tcHltdXBkZi9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1weW11cGRm
L0NvbmZpZy5pbgo+IGluZGV4IDM4MzFhMjU0NTEuLmNmZGQzOGViZTQgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9weXRob24tcHltdXBkZi9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3B5dGhvbi1w
eW11cGRmL0NvbmZpZy5pbgo+IEBAIC00LDYgKzQsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfUFlU
SE9OX1BZTVVQREYKPiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ180ICMgbXVw
ZGYgLT4gaGFyZmJ1enoKPiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1Rf
NF85ICMgbXVwZGYgLT4gaGFyZmJ1enoKPiAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfWE9SRzcK
PiArCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUwo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0hP
U1RfU1dJRwo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0ZSRUVUWVBFCj4gIAlzZWxlY3QgQlIyX1BB
Q0tBR0VfTVVQREYKCkNvbmZpZy5pbiBjb21tZW50IHVwZGF0ZSB3YXMgbWlzc2luZyBmb3IgdGhl
ICFCUjJfU1RBVElDX0xJQlMgZGVwZW5kZW5jeS4KCj4gLSMgcHl0aG9uLXB5bXVwZGYncyB2ZXJz
aW9uIG11c3QgbWF0Y2ggbXVwZGYncyB2ZXJzaW9uCj4gLVBZVEhPTl9QWU1VUERGX1ZFUlNJT04g
PSAxLjIyLjAKPiArIyBweXRob24tcHltdXBkZidzIHZlcnNpb24gYmUgY29tcGF0aWJsZSB3aXRo
IG11cGRmJ3MgdmVyc2lvbgo+ICtQWVRIT05fUFlNVVBERl9WRVJTSU9OID0gMS4yMy4yMgo+ICBQ
WVRIT05fUFlNVVBERl9TT1VSQ0UgPSBQeU11UERGLSQoUFlUSE9OX1BZTVVQREZfVkVSU0lPTiku
dGFyLmd6Cj4gLVBZVEhPTl9QWU1VUERGX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3Rl
ZC5vcmcvcGFja2FnZXMvMjgvYmEvZDZiYjZmZDY3OGU4Mzk2ZDdiOTQ0ODcwMjg2ZmIyNWZkNmY0
OTliOGNiNTk5YjU0MzZjOGY3MjVhZGJmCj4gLVBZVEhPTl9QWU1VUERGX1NFVFVQX1RZUEUgPSBz
ZXR1cHRvb2xzCj4gK1BZVEhPTl9QWU1VUERGX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhv
c3RlZC5vcmcvcGFja2FnZXMvMDUvMjAvYTBkMTIyMWQ4ZjM3OWFmY2MxMmI0ZDE2ODdhOGY0YWRi
NjllZWY2NTllODM1ZDc4MWMzZmEzMzFmZjQ2Cj4gK1BZVEhPTl9QWU1VUERGX1NFVFVQX1RZUEUg
PSBwZXA1MTcKClRoaXMgY2hhbmdlIHdhcyBhY3R1YWxseSB3cm9uZy4gS2VlcCAic2V0dXB0b29s
cyIgaXMgdGhlIHNhbWUgYXMKcGVwNTE3LCBleGNlcHQgdGhhdCB3ZSBkb24ndCBoYXZlIHRvIG1h
bnVhbGx5IGFkZCB0aGUgZGVwZW5kZW5jeSBvbgpob3N0LXB5dGhvbi1zZXR1cHRvb2xzLiBPZiBj
b3Vyc2UgYXNzdW1pbmcgSSBkaWQgbm90IG1pc3VuZGVyc3RhbmQgdGhlClB5dGhvbiBpbmZyYXN0
cnVjdHVyZSA6LSkKCkFwcGxpZWQgd2l0aCB0aG9zZSBjaGFuZ2VzLiBUaGFua3MgYSBsb3QgZm9y
IHRoaXMgc2VyaWVzLCBhbmQgc29ycnkgZm9yCnRoZSB0aW1lIGl0IHRvb2sgdG8gZ2V0IGl0IG1l
cmdlZCEKCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3du
ZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
IGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
