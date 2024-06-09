Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638E5C27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 15:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBADB6077A;
	Sun,  9 Jun 2024 15:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MoSQLwGTRc78; Sun,  9 Jun 2024 15:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A10D6067C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A10D6067C;
	Sun,  9 Jun 2024 15:51:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84BD71BF3EC
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 15:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 727BF6067C
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 15:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HkBqfFku5wUn for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 15:51:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF2BD6066F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF2BD6066F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF2BD6066F
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 15:51:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6384913F81D;
 Sun,  9 Jun 2024 17:51:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jun 2024 17:51:40 +0200
Date: Sun, 9 Jun 2024 17:51:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <ZmXPjI6Mb9KVrqQj@landeda>
References: <20240609032509.8939-1-vfazio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240609032509.8939-1-vfazio@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717948305;
 bh=3NXg5tBbAQ/hExXo/Frif6erEt8v9BDd+dTv0JJANNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ED99ISUM2chBhX68MSglreDtjXIp3oFdQp9tLOOuiPcfNG/qjl/cALC5Mxquwtbjf
 dGnemMKJQDOKnmHaWLVVMCMmmvPXkIv6TUuiI7M8rgP6tVzqCQT998c+T4+0ZGh4Dt
 aK7KRjx+UfQjoSSUeCeJAoQaXhuyZUMJcOzeQXo8V1I+6fe3tWmfqgK8qhWXs23gFJ
 V8pE23S733EGGBtCT9Kh+iaj+UDY8hzDaGHtXkSohfiWj1VWlyc2ZBmqs9QWNjx7k4
 n/xzkzWvQS3UxXo/VxbzdojgNJSkrEWaYJZaSqoQlUvh0NIsW/fAaniSJ4EUoYbQFG
 LAzv84qFwb2Tg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ED99ISUM
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: fix config directory
 pattern
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VmluY2VudCwgQWxsLAoKT24gMjAyNC0wNi0wOCAyMjoyNSAtMDUwMCwgVmluY2VudCBGYXppbyBz
cGFrZSB0aHVzbHk6Cj4gSWYgYSBwbGF0Zm9ybSB0cmlwbGV0IGlzIG5vdCBkZXRlY3RlZCBkdXJp
bmcgdGhlIGNvbmZpZ3VyZSBzdGFnZSwgdGhlCj4gY29uZmlnIGRpcmVjdG9yeSAoTElCUEwpIGRl
ZmF1bHRzIHRvIGBjb25maWctJExEVkVSU0lPTmAuCgpJIGZvdW5kIHRoZSAkTERWRVJTSU9OIHRv
IGJlIGEgYml0IHN0cmFuZ2UsIGV2ZW4gdGhvdWdoIHRoYXQgaXMgYWN0dWFsbHkKd2hhdCB0aGUg
Y29kZSB1c2VzLCBidXQgaGVyZSwgaW4gdGhlIGNvbnRlY3Qgb2YgYSBCdWlsZHJvdCBjb21taXQg
bG9nLAppdCBkb2VzIG5vdCBsb29rIHJpZ2h0LCBhcyBpdCByYXRoZXIgaGludHMgYXQgdGhlIHZl
cnNpb24gb2YgbGQsIHdoaWNoCmRvZXMgbm90IG1ha2Ugc2Vuc2UuLi4KClNvIEkganVzdCBkcm9w
cGVkIHRoZSBMRCB0byBrZWVwICRWRVJTSU9OLCB3aGljaCBtYWtlcyBtb3IgZXNlbnNlIEkKYmVs
aWV2ZS4KCj4gSW4gdGhpcyBzY2VuYXJpbywgdGhlIGBQWVRIT04zX1JFTU9WRV9VU0VMRVNTX0ZJ
TEVTYCBob29rIHdvdWxkIGZhaWwgZHVlCj4gdG8gYGZpbmRgIGluY29ycmVjdGx5IGV4cGVjdGlu
ZyBhIHNlY29uZCBkYXNoIGFuZCB0aGVuIHRoZSB0cmlwbGV0Lgo+IAo+IE5vdywgd2UgZ2xvYiBh
bnl0aGluZyBhZnRlciB0aGUgdmVyc2lvbiB3aGljaCB3aWxsIG1hdGNoIGluIGJvdGggY2FzZXMu
CgpXb290LCAxMU1pQiBkcm9wcGVkIGhlcmUhIPCfkY0KCj4gRml4ZXM6IDU0ZDQ4YzhjYWQgKCJw
YWNrYWdlL3B5dGhvbjM6IG1pc2NlbGxhbmVvdXMgZml4dXBzIikKCkluIGZhY3QsIGl0IHdhcyBh
bHJlYWR5IGJyb2tlbiBiZWZvcmUgdGhhdDogbWFzdGVyLCB3aGljaCBkb2VzIG5vdCBoYXZlCjU0
ZDQ4YzhjYWQsIGFscmFkeSBzdWZmZXJlZCBmcm9tIHRoYXQgaXNzdWUsIGV4Y2VwdCB0aGUgZXJy
b3IgaXMgaWdub3JlLAphcyB0ZSBmaW5kIGlzIGluIGEgc3ViLXNoZWxsIGV2YWx1YXRlZCBhcyB0
aGUgbGlzdCBmb3IgYSBmb3ItbG9vcC4KCldvdWxkIHlvdSBjYXJlIHRvIHNlbmQgdGhlIHNhbWUg
Zml4IGZvciBtYXN0ZXIsIHBsZWFzZT8KCj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBGYXppbyA8
dmZhemlvQGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gbmV4dCwgdGhhbmtzLgoKUmVnYXJkcywKWWFu
biBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvcHl0aG9uMy9weXRob24zLm1rIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9weXRob24zL3B5dGhvbjMubWsgYi9wYWNrYWdlL3B5dGhvbjMvcHl0
aG9uMy5tawo+IGluZGV4IGEwYjllZDQ0MzcuLmE4MmJjNDdhNTcgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9weXRob24zL3B5dGhvbjMubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5t
awo+IEBAIC0yMDQsNyArMjA0LDcgQEAgUFlUSE9OM19DT05GX09QVFMgKz0gXAo+ICBkZWZpbmUg
UFlUSE9OM19SRU1PVkVfVVNFTEVTU19GSUxFUwo+ICAJcm0gLWYgJChUQVJHRVRfRElSKS91c3Iv
YmluL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKS1jb25maWcKPiAgCXJtIC1mICQoVEFS
R0VUX0RJUikvdXNyL2Jpbi9weXRob24zLWNvbmZpZwo+IC0JZmluZCAkKFRBUkdFVF9ESVIpL3Vz
ci9saWIvcHl0aG9uJChQWVRIT04zX1ZFUlNJT05fTUFKT1IpL2NvbmZpZy0kKFBZVEhPTjNfVkVS
U0lPTl9NQUpPUiktKi8gXAo+ICsJZmluZCAkKFRBUkdFVF9ESVIpL3Vzci9saWIvcHl0aG9uJChQ
WVRIT04zX1ZFUlNJT05fTUFKT1IpL2NvbmZpZy0kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikqLyBc
Cj4gIAkJLXR5cGUgZiAtbm90IC1uYW1lIE1ha2VmaWxlIC1leGVjIHJtIC1yZiB7fSBcOwo+ICAJ
ZmluZCAkKFRBUkdFVF9ESVIpL3Vzci9saWIvcHl0aG9uJChQWVRIT04zX1ZFUlNJT05fTUFKT1Ip
LyAtdHlwZSBkIFwKPiAgCQktbmFtZSBfX3B5Y2FjaGVfXyAtZXhlYyBybSAtcmYge30gXDsKPiAt
LSAKPiAyLjM0LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cnwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
